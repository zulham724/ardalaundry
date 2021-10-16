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
        //
        // return 'asd';
        // return $request->all();
        $order = $request->user()->shop()->firstOrFail()->orders()->save(new Order([
            'customer_id' => $request->customer_id,
            'employee_id' => $request->employee_id,
            'description' => $request->description
        ]));
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
        $shop_id = $request->user()->shop()->firstOrFail()->id;
        $order =
            Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
            ->withCount(['payments as paid_sum' => function ($query) {
                $query->select(DB::raw("SUM(value) as paidsum"));
            }])
            ->withCount(['services as total_sum' => function ($query) {
                $query->select(DB::raw("SUM(order_services.quantity*services.price) as total"));
            }])
            ->whereHas('shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->findOrFail($id);

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

    public function getOrdersByShop($shop_id)
    {

        $res = Order::with('customer', 'employee', 'shop', 'services', 'status', 'payments')
            ->withCount(['payments as paid_sum' => function ($query) {
                $query->select(DB::raw("SUM(value) as paidsum"));
            }])
            ->withCount(['services as total_sum' => function ($query) {
                $query->select(DB::raw("SUM(order_services.quantity*services.price) as total"));
            }])
            ->whereHas('shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->get();

        // if ($res->paid_sum ) {
        //     # code...
        // }

        return response()->json($res);
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
        })->where('order_status_id', 4)->get();

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

    public function getPaymentsCountByMonth($shop_id){
        $res = Payment::select(
            DB::raw('sum(value) as `total`'),
            DB::raw("DATE_FORMAT(created_at, '%b %Y') time_period"),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )
            ->whereHas('order.shop', function ($query) use ($shop_id) {
                $query->where('id', $shop_id);
            })
            ->groupby('year', 'month')
            ->get();
        return $res;
    }
}
