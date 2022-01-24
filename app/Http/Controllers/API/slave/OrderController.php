<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Payment;


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
        return Order::with('payments', 'status', 'customer')->where('order_status_id', 4)->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        if(auth('api')->user()->shop){
            $order = $request->user()->shop()->firstOrFail()->orders()->save(new Order([
                'customer_id' => 6,
                'employee_id' => 8,
                'order_status_id' => 1,
                'description' => $request->description
            ]));
    
         
            foreach ($request->charts as $c => $chart) {
                $order->services()->attach($chart['package']['id'], ['quantity' => $chart['quantity'], 'start_at' => \Carbon\Carbon::now(), 'end_at' => \Carbon\Carbon::now()->addHours($chart['package']['process_time']), 'service_status_id' => 1]);
            }
        }else{
            $order = new Order([
                'shop_id' => 1,
                'customer_id' => $request->customer_id,
                'employee_id' => 8,
                'order_status_id' => 1,
                'description' => $request->description
            ]);
            $order->save();

            foreach ($request->charts as $c => $chart) {
                $order->services()->attach($chart['package']['id'], ['quantity' => $chart['quantity'], 'start_at' => \Carbon\Carbon::now(), 'end_at' => \Carbon\Carbon::now()->addHours($chart['package']['process_time']), 'service_status_id' => 1]);
            }
        }

        return response()->json($order->load('services'));
    }

    public function user_orders(Request $request)
    {
        $order = new Order();
        $order->customer_id = auth('api')->user()->id;
        $order->employee_id = 8;
        $order->shop_id = $request->shop_id;
        $order->order_status_id = 1;
        $order->description = $request->description;
        $order->save();
        // $order->services()->attach($request->)
        foreach ($request->services as $service) {
            # code...
            $order->services()->attach($service['id'], ['quantity' => $service['quantity'], 'start_at' => \Carbon\Carbon::now(), 'end_at' => \Carbon\Carbon::now()->addHours($service['process_time'])]);
        }

        return response()->json($order->load('services'));
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        //
        if(auth('api')->user()->shop){
            $shop_id = $request->user()->shop()->firstOrFail()->id;
            $order =
                Order::with('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments')
                ->whereHas('shop', function ($query) use ($shop_id) {
                    $query->where('id', $shop_id);
                })
                ->findOrFail($id);
    
            foreach ($order->services as $s => $service) {
                if ($order->services->count()) {
                    $order->percentage = (($service->pivot->where('service_status_id', 3)->count() / $order->services->count()) * 100);
                }
            }
        }else{
            $order =
                Order::with('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments')
                ->whereHas('shop', function ($query){
                    $query->where('id', 1);
                })
                ->findOrFail($id);

            foreach ($order->services as $s => $service) {
                if ($order->services->count()) {
                    $order->percentage = (($service->pivot->where('service_status_id', 3)->count() / $order->services->count()) * 100);
                }
            }
        }

        return $order;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //

        return Order::findOrFail($id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        return DB::table('orders')->join('order_services', 'order_services.order_id', '=', 'orders.id')->where('orders.id', $id)->delete();
    }

    public function get_order()
    {
        return Order::with('services', 'customer')->orderBy('created_at', 'desc')->first();
    }

    public function getOrdersByShop($shop_id)
    {

        $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
            ->whereHas('shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->orderBy('id', 'desc')
            ->paginate();

        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }


        return response()->json($res);

        // ->withCount(['payments as paid_sum' => function ($query) {
        //     $query->select(DB::raw("SUM(value) as paidsum"));
        // }])
        // ->withCount(['services as total_sum' => function ($query) {
        //     $query->select(DB::raw("SUM(order_services.quantity*services.price) as total"));
        // }])
    }

    public function getServiceStatusByOrder(Request $request)
    {
        // return response()->json($request->all());
        $res = Order::with(["services" => function ($query) use ($request) {
            $query->where('services.id', $request->service_id)->with("category");
        }, "service_status" => function ($query2) use ($request) {
            $query2->with('status')
                ->where('order_id', $request->order_id)
                ->where('service_id', $request->service_id);
        }])->findOrFail($request->order_id);

        return $res;
    }

    public function searchOrders(Request $request)
    {
        $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
            ->whereHas('customer', function ($query) use ($request) {
                $query->where('name', 'like', '%' . $request->value . '%');
            })
            ->orWhere('id', (int)$request->value)
            ->paginate();
        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }
        return $res;
    }

    public function getOrdersByCustomer($userid)
    {

        $res = Order::with('shop', 'services', 'status', 'payments', 'customer')
            ->where('customer_id', $userid)
            ->orderBy('id', 'desc')->get();

        return $res;
    }
    public function order_report(Request $request)
    {
        // return $request->all();
        $d1 = $request->fromDate;
        $d2 = $request->toDate;
        return Order::with('payments', 'status', 'customer')->where('order_status_id', 3)
            ->where('created_at', '>=', $d1)
            ->where('created_at', '<=', $d2)
            ->get();
    }

    public function getOrdersReportByShop($shop_id)
    {

        $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')->whereHas('shop', function ($query) use ($shop_id) {
            $query->where('id', $shop_id);
        })
            ->where('order_status_id', 4)->get();

        return $res;
    }

    public function getOrdersCountByMonth($shop_id)
    {
        $colors = ['#193498', '#113CFC', '#1597E5', '#69DADB'];
        $res = Order::select(
            DB::raw('count(id) as `orders`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )
            ->whereHas('shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->groupby('year', 'month')
            ->get();
        foreach ($res as $index => $value) {
            $value->color = $colors[$index % 4];
        }
        return $res;
    }

    public function getPaymentsCountByMonth($shop_id)
    {
        // dd('asd');
        $res = Payment::select(
            DB::raw('order_statuses.id'),
            DB::raw('order_statuses.name'),
            DB::raw('sum(value) as `total`'),
            DB::raw("DATE_FORMAT(payments.created_at, '%b %Y') time_period"),
            DB::raw('YEAR(payments.created_at) year, MONTH(payments.created_at) month')
        )
            ->join('orders', 'orders.id', '=', 'payments.payment_id')
            ->join('order_statuses', 'order_statuses.id', '=', 'orders.order_status_id')
            ->where('payments.payment_type', 'App\\Models\\Order')
            ->whereHas('order.shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->groupby('year', 'month', 'order_statuses.id')
            ->get();
        return $res;
    }

    public function searchOrder(Request $request)
    {

        if (isset($request->data['role'])) {
            $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
                ->where('id', 'like', '%' . $request->data['id'] . '%')
                ->orderBy('id', 'desc')
                ->get();

            return $res;
        } else {
            $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
                ->whereHas('shop', function ($query) use ($request) {
                    $query->where('id', $request->user()->shop()->firstOrFail()->id);
                })
                ->where('id', 'like', '%' . $request->data['id'] . '%')
                ->orderBy('id', 'desc')
                ->get();
            return $res;
        }
    }

    public function user_payment(Request $request, $orderid)
    {
        (int) $total_price = DB::table('orders')
            ->selectRaw('sum(order_services.quantity*services.price) as total_price')
            ->join('order_services', 'order_services.order_id', '=', 'orders.id')
            ->join('services', 'order_services.service_id', '=', 'services.id')
            ->where('orders.id', $orderid)->first()->total_price;
        // 2 itung total payment yg masuk
        (int)$pay = $request->value;
        (int)$payments = Payment::whereHas('order', function ($query) use ($orderid) {
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
        } else if ($total_payment ==  $total_price) {
            // kalau hasil jumlah nya sama dengan total nama nya == pelunasan
            $payment->name = 'Pelunasan';
            $payment->value = $pay;
            $payment->status = 'success';
        }

        $order = Order::findOrFail($orderid)->payments()->save($payment);
        // $res = $request->user()->order()->findOrFail($orderid)->payments()->save($payment);
        return $order;
    }

    public function getQueueOrderByShop($shopid)
    {

        $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
            ->whereHas('shop', function ($query) use ($shopid) {
                $query->where('id', $shopid);
            })
            ->where('order_status_id', 1)
            ->get();
        return $res;
    }

    public function getOrdersShopByMonth($shopid)
    {
        $res = Order::with('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments')
            ->where('order_status_id', 4)
            ->where('shop_id', $shopid)
            ->whereMonth('created_at', \Carbon\Carbon::now()->month)
            ->get();

        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }
        return response()->json($res);
    }

    public function getOrdersShopByWeek($shopid)
    {
        $res = Order::with('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments')
            ->where('order_status_id', 4)
            ->where('shop_id', $shopid)
            ->where('created_at', '>', \Carbon\Carbon::now()->startOfWeek())
            ->where('created_at', '<', \Carbon\Carbon::now()->endOfWeek())
            ->get();

        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }
        return response()->json($res);
    }

    public function getOrdersShopByDay($shopid)
    {
        $res = Order::with('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments')
            ->where('order_status_id', 4)
            ->where('shop_id', $shopid)
            ->where('created_at', \Carbon\Carbon::today())
            ->get();

        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }
        return response()->json($res);
    }

    public function updateStatusOrder(Request $request)
    {
        $res = Order::findOrFail($request->id);
        $res->order_status_id = 4;
        $res->save();
    }

    public function accept_order(Request $request)
    {
        $order = Order::findOrFail($request->id);
        $order->order_status_id = 2;
        $order->save();

        foreach ($order->services as $s => $service) {
            if ($order->services->count()) {
                $order->percentage = (($service->pivot->where('service_status_id', 3)->count() / $order->services->count()) * 100);
            }
        }

        return response()->json($order->load('customer', 'employee', 'shop', 'services.category.service_unit',  'status', 'payments'));
    }

    public function reject_order(Request $request)
    {
        $order = Order::findOrFail($request->id)->delete();
        return $order;
    }

    public function getOrdersCustomer($customerid)
    {
        // return $customerid;
        $res = Order::with('customer', 'employee', 'shop', 'services.category.service_unit', 'status', 'payments')
            ->whereHas('customer', function ($query) use ($customerid) {
                $query->where('id', $customerid);
            })
            ->orderBy('id', 'desc')
            ->get();

        foreach ($res as $o => $order) {
            # code...
            $order->percentage = 0;
            // service status id 3 adalah yang status pekerjaan per kaet nya complete
            if ($order->services->count()) $order->percentage = (($order->services->where('pivot.service_status_id', 3)->count() / $order->services->count()) * 100);
        }
        return response()->json($res);
    }
}
