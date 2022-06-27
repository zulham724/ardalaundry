<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }

    public function getOrdersBySlave($shopId)
    {
        $res = Order::with('customer', 'employee', 'shop')->whereHas('shop', function ($query) use ($shopId) {
            $query->where('id', $shopId);
        })->get();

        return response()->json($res);
    }

    public function geOrderCountByShop($shopId)
    {
        $res = Order::whereHas('shop', fn($query) => $query->where('id', $shopId))->count();

        return response()->json($res);
    }

    public function getTotalPriceByShop($shopId)
    {
        // $res = DB::table('orders')
        //     ->join('order_services', 'order_services.order_id', '=', 'orders.id')
        //     ->join('services', 'order_services.service_id', '=', 'services.id')
        //     ->selectRaw('sum(order_services.quantity*services.price) as total_price')
        //     ->where('orders.shop_id', $shopId)->first();

        $res = Payment::select(
            DB::raw('sum(value) as `total`'),
        )
            ->whereHas('order.shop', function ($query) use ($shopId) {
                $query->where('id', $shopId);
            })->first();

        return $res->total;
    }

    public function getCurrentProfitByShop($shopId)
    {

        $thismonth = Payment::whereHas('order.shop', function ($query) use ($shopId) {
            $query->where('id', $shopId);
        })
            ->whereMonth('created_at', date('n'))
            ->sum('value');

        $lastmonth = Payment::whereHas('order.shop', function ($query) use ($shopId) {
            $query->where('id', $shopId);
        })
            ->whereMonth('created_at', date("n", strtotime("-1 month")))
            ->sum('value');

        if ((int) $thismonth == 0 && (int) $lastmonth == 0) {
            return 0;
        } else if ((int) $lastmonth == 0) {
            return 100;
        } else {
            return ((int) $thismonth / (int) $lastmonth) * 100;
        }
    }

    public function payment(Request $request, $orderid)
    {
        (int) $total_price = DB::table('orders')
            ->selectRaw('sum(order_services.quantity*services.price) as total_price')
            ->join('order_services', 'order_services.order_id', '=', 'orders.id')
            ->join('services', 'order_services.service_id', '=', 'services.id')
            ->where('orders.id', $orderid)->first()->total_price;
        // 2 itung total payment yg masuk
        (int) $pay = $request->value;
        (int) $payments = Payment::whereHas('order', function ($query) use ($orderid) {
            $query->where('id', $orderid);
        })->sum('value');
        // return [(int)$payments,(int)$pay];
        $total_payment = $payments + $pay;

        // 3 bandingkan nilai yg masuk + payment yg sudah masuk dengan total
        $payment = new Payment();
        if ($total_price > $total_payment) {
            // kalau masih kurang nama = DP. count total payment yg masuk ditambah satu
            $DP = Payment::whereHas('order', function ($query) use ($orderid) {
                $query->where('id', $orderid);
            })->count();
            $payment->name = 'Pembayaran ' . ($DP + 1);
            $total_price = $total_price - $payments;
            $payment->value = $pay;
            $payment->status = 'success';
        } else if ($total_payment == $total_price) {
            // kalau hasil jumlah nya sama dengan total nama nya == pelunasan
            $payment->name = 'Pelunasan';
            $payment->value = $pay;
            $payment->status = 'success';
        }
        $res = $request->user()->shop()->firstOrFail()->orders()->findOrFail($orderid)->payments()->save($payment);
        return $res;
    }

    public function totalOrders()
    {
        $res = Order::whereHas('shop.user.master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })
            ->count();
        return $res;
    }

    public function getProfit()
    {
        $res = Payment::whereHas('order.shop.user.master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })->sum('value');
        return $res;
    }

    public function getGrowth()
    {
        $thismonth = Payment::whereHas('order.shop.user.master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })
            ->whereMonth('created_at', date('n'))
            ->sum('value');

        $lastmonth = Payment::whereHas('order.shop.user.master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })
            ->whereMonth('created_at', date("n", strtotime("-1 month")))
            ->sum('value');

        // return response()->json([(int)$thismonth,$lastmonth]);
        if ((int) $thismonth == 0 && (int) $lastmonth == 0) {
            return 0;
        } else if ((int) $lastmonth == 0) {
            return 100;
        } else {
            return ((int) $thismonth / (int) $lastmonth) * 100;
        }
    }

    public function orderCountByMonths()
    {
        $res = Order::select(
            DB::raw('count(id) as `orders`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )

            ->whereHas('shop.user.master', function ($query) {
                $query->where('branches.master_id', auth('api')->user()->id);
            })
            ->whereYear('created_at', date('Y'))
            ->groupby('year', 'month')
            ->get();
        return $res;
    }

    public function orderCountBranchByMonth($shop_id)
    {
        $res = Order::select(
            DB::raw('count(id) as `orders`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )
            ->whereHas('shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->whereYear('created_at', date('Y'))
            ->groupby('year', 'month')
            ->get();
        return $res;
    }
    public function paymentCountByMonths()
    {
        $res = Payment::select(
            DB::raw('sum(value) as `total`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )
            ->whereHas('order.shop.user.master', function ($query) {
                $query->where('branches.master_id', auth('api')->user()->id);
            })
            ->whereYear('created_at', date('Y'))
            ->groupby('year', 'month')
            ->get();
        return $res;
    }

    public function branchPaymentCountByMonth($shop_id)
    {
        $res = Payment::select(
            DB::raw('sum(value) as `total_sum`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )
            ->whereHas('order.shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->whereYear('created_at', date('Y'))
            ->groupby('year', 'month')
            ->get();
        return $res;
    }

    public function orderCountByMonthsEachBranches()
    {
        $res = User::whereHas('master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })
            ->select('name')
            ->withCount(['shop as shop_name' => function ($query) {
                $query->select('name');
            }])
            ->withCount(['orders as value'])
            ->get();
        return $res;
    }

    public function paymentCountByMonthsEachBranches()
    {
        $res = User::whereHas('master', function ($query) {
            $query->where('branches.master_id', auth('api')->user()->id);
        })
            ->select('name')
            ->withCount(['shop as shop_name' => function ($query) {
                $query->select('name');
            }])
            ->withCount(['orders as total' => function ($query) {
                $query
                    ->join('payments', 'orders.id', '=', 'payments.payment_id')
                    ->where('payments.payment_type', 'App\Models\Order')
                    ->select(
                        DB::raw("SUM(payments.value) as total"),
                        DB::raw('DATE_FORMAT(payments.created_at, "%b %Y") time_period'),
                        DB::raw('YEAR(payments.created_at) year, MONTH(payments.created_at) month'),
                    );
            }])
            ->get();
        return $res;
    }

    public function order_product(Request $request)
    {
        // return response()->json($request->all());
        $order = new Order($request->all());
        $order->order_status_id = 1;
        $order->save();

        $order->products()->attach($request->product_id, ['quantity' => $request->quantity]);

        if ($request->has('payment')) {
            $label = "";
            if ($request->payment > $request->total_price) {
                $label = "DP 1";
            } else {
                $label = "Pelunasan";
            }
            $payment = new Payment();
            $payment->name = $label;
            $payment->value = $request->payment;
            $payment->status = 'success';
            $payment->type = 'in';
            $order->payments()->save($payment);
        }

        return response()->json($order->load('payments', 'products'));
    }
}
