<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

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
        
        $order = $request->user()->shop()->firstOrFail()->orders()->save(new Order([
            'customer_id'=>$request->customer_id,
            'employee_id'=>$request->employee_id
        ]));
        // $order->services()->attach($request->)
        foreach ($request->services as $service) {
            # code...
            $order->services()->attach($service['id'],['quantity'=>$service['quantity'],'start_at'=>\Carbon\Carbon::now(),'end_at'=> \Carbon\Carbon::now()->addHours($service['process_time'])]);
        }

        return $order->load('services');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Order::with('payments', 'status')->findOrFail($id);
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
    public function destroy(Order $order)
    {
        //
    }

    public function getOrdersByShop($shop_id){
        
        $res = Order::with('customer', 'employee', 'shop', 'services','status')->whereHas('shop', function($query)use($shop_id){
            $query->where('id', $shop_id);
        })->get();

        return response()->json($res);
    }
}
