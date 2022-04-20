<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $res = Shop::with('user')->get();
        return response()->json($res);
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
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function show(Shop $shop)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Shop $shop)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function destroy(Shop $shop)
    {
        //
    }

    public function getCustomersByShop($shop_id)
    {
        // $res = User::with('customers')->whereHas('shop', function ($query) use ($slaiveId) {
        //     $query->where('id', $slaiveId);
        // })->get();
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'customer'))
            ->whereHas('customer_shops', fn ($query) => $query->where('shop_id', $shop_id))
            ->withCount('order_served_by_customer')
            ->orderBy('order_served_by_customer_count', 'desc')
            ->get();
        return response()->json($res);
    }

    public function getEmployeesByShop($shop_id)
    {
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'employee'))
            ->whereHas('employee_shops', fn ($query) => $query->where('shop_id', $shop_id))
            ->withCount('order_served_by_employee')
            ->orderBy('order_served_by_employee_count', 'desc')
            ->get();
        return response()->json($res);
    }
}
