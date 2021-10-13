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
            $payment->name = 'DP '.($DP+1);
            $total_price = $total_price - $payments;
            $payment->value = $pay;
            $payment->status = 'success';
        } else if($total_payment ==  $total_price) {
            // kalau hasil jumlah nya sama dengan total nama nya == pelunasan
            $payment->name = 'Pelunasan';
            $payment->value = $pay;
            $payment->status = 'success';
        }

        $res = $request->user()->shop()->firstOrFail()->orders()->findOrFail($orderid)->payments()->save($payment);
        return $res;
    }
}
