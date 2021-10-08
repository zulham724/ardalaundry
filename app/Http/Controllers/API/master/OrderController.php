<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Shop;
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
        $res = Order::whereHas('shop', fn ($query) => $query->where('id', $shopId))->count();

        return response()->json($res);
    }

    public function getTotalPriceByShop($shopId)
    {
        $res = DB::table('orders')
            ->selectRaw('sum(order_services.quantity*services.price) as total_price')
            ->join('order_services', 'order_services.order_id', '=', 'orders.id')
            ->join('services', 'order_services.service_id', '=', 'services.id')
            ->where('orders.shop_id', $shopId)->first();
        return $res->total_price;
    }

    public function getCurrentProfitByShop($shopId)
    {

        $thismonth = DB::table('orders')
            ->selectRaw('sum(order_services.quantity*services.price) as total_price')
            ->join('order_services', 'order_services.order_id', '=', 'orders.id')
            ->join('services', 'order_services.service_id', '=', 'services.id')
            ->where('orders.shop_id', $shopId)
            ->whereMonth('orders.created_at', date("n"))
            ->first()->total_price??0;


        $lastmonth =
            DB::table('orders')
            ->selectRaw('sum(order_services.quantity*services.price) as total_price')
            ->join('order_services', 'order_services.order_id', '=', 'orders.id')
            ->join('services', 'order_services.service_id', '=', 'services.id')
            ->where('orders.shop_id', $shopId)
            ->whereMonth('orders.created_at', date("n", strtotime("-1 month")))
            ->first()->total_price??0;

        if ($lastmonth == 0) {
            return 100;
        }else{
            return ($thismonth / $lastmonth) * 100;
        }

        
    }

    public function payment(Request $request,$orderid){
        // return $request->all();
        $res = $request->user()->shop()->firstOrFail()->orders()->findOrFail($orderid)->payments()->save(new Payment($request->all()));
        return $res;
    }
}
