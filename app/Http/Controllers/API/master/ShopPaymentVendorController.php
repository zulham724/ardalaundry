<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\PaymentVendor;
use App\Models\Shop;
use Illuminate\Http\Request;

class ShopPaymentVendorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($shopId)
    {

        // return response(['message' => 'bisaa']);
        //
        $shop = Shop::where('user_id', auth('api')->user()->id)->findOrFail($shopId)->payment_vendors()->get();

        return response()->json($shop);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store($shopId, Request $request)
    {
        //
        // return response(['message' => 'bisaa']);
        $request->validate([
            'name' => 'required',
            'account_number' => 'required',
            'account_name' => 'required',
        ]);

        $shop = Shop::where('user_id', auth('api')->user()->id)->findOrFail($shopId);
        $payment_vendor = new PaymentVendor($request->all());
        $shop->payment_vendors()->save($payment_vendor);

        return response()->json($shop);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($shopId, $id)
    {
        //
        $shop = Shop::where('user_id', auth('api')->user()->id)->findOrFail($shopId);
        $payment_vendor = $shop->payment_vendors()->findOrFail($id);

        return response()->json($payment_vendor);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($shopId, $id)
    {
        //
        $res = PaymentVendor::findOrFail($id);
        $res->delete();
        return response()->json($res);
    }
}
