<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\Shop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
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
        $shop = Shop::findOrFail(auth('api')->user()->shop->id);
        $spend = new Payment($request->all());
        $spend->type = 'out';
        $shop->payments()->save($spend);
        // return response()->json($request->all());
        // $payment->save();

        return response()->json($shop->load('payments'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        //
    }

    public function getSpendingToday($shopid)
    {
        $payment = Payment::where('type', 'out')
            ->where('payment_id', $shopid)
            ->where('payment_type', 'App\Models\Shop')
            ->whereDate('created_at', \Carbon\Carbon::today())
            ->paginate();
        return response()->json($payment);
    }

    public function getSpendingThisWeek($shopid)
    {
        $payment = Payment::where('type', 'out')
            ->where('payment_id', $shopid)
            ->where('payment_type', 'App\Models\Shop')
        // ->where('created_at', '>', \Carbon\Carbon::now()->startOfWeek()) //updated at tadinya created at
        // ->where('created_at', '<', \Carbon\Carbon::now()->endOfWeek()) //updated at tadinya created at
            ->whereBetween('created_at', [\Carbon\Carbon::now()->startOfWeek(), \Carbon\Carbon::now()->endOfWeek()])
            ->paginate();
        return response()->json($payment);
    }

    public function getSpendingThisMonth($shopid)
    {
        $payment = Payment::
            where('type', 'out')
            ->where('payment_id', $shopid)
            ->where('payment_type', 'App\Models\Shop')
            ->whereMonth('created_at', \Carbon\Carbon::now()->month)
            ->paginate();
        return response()->json($payment);
    }

    public function getPaymentThisMonth($shopid)
    {
        $res = DB::table('payments')
            ->where('payment_type', 'App\Models\Order')
            ->join('orders as o', 'payments.payment_id', 'o.id')
            ->join('users as u', 'o.customer_id', 'u.id')
            ->where('o.shop_id', $shopid)
            ->where('type', 'in')
            ->select(
                DB::raw('payments.*'),
                DB::raw('u.name as customer')
            )
            ->whereMonth('payments.created_at', \Carbon\Carbon::now()->month)
            ->paginate();
        return response()->json($res);
    }

    public function getPaymentThisWeek($shopid)
    {
        $res = DB::table('payments')
            ->where('payment_type', 'App\Models\Order')
            ->join('orders as o', 'payments.payment_id', 'o.id')
            ->join('users as u', 'o.customer_id', 'u.id')
            ->where('o.shop_id', $shopid)
            ->where('type', 'in')
            ->select(
                DB::raw('payments.*'),
                DB::raw('u.name as customer')
            )
            ->whereBetween('payments.created_at', [\Carbon\Carbon::now()->startOfWeek(), \Carbon\Carbon::now()->endOfWeek()])
        // ->where('payments.created_at', '>', \Carbon\Carbon::now()->startOfWeek())
        // ->where('payments.created_at', '<', \Carbon\Carbon::now()->endOfWeek())
            ->paginate();
        return response()->json($res);
    }

    public function getPaymentToday($shopid)
    {
        $res = DB::table('payments')
            ->where('payment_type', 'App\Models\Order')
            ->join('orders as o', 'payments.payment_id', 'o.id')
            ->join('users as u', 'o.customer_id', 'u.id')
            ->where('o.shop_id', $shopid)
            ->where('type', 'in')
            ->select(
                DB::raw('payments.*'),
                DB::raw('u.name as customer')
            )
            ->whereDate('payments.created_at', \Carbon\Carbon::today())
            ->paginate();
        return response()->json($res);
    }
}
