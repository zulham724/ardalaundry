<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\PackageUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
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
        // $res = PackageUser::with('package', 'payment')->whereHas('payment', function ($query) {
        //     $query->where('user_id', auth('api')->user()->id);
        // })->orderBy('created_at', 'desc')->get();

        return $res = Payment::with('package_user')->whereHas('package_user.user', function ($query) {
            $query->where('user_id', auth('api')->user()->id);
        })->orderBy('created_at', 'desc')->get();

        return $res;
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
        // return response()->json($request->all());
        $packageuser = new PackageUser();
        $packageuser->user_id = auth('api')->user()->id;
        $packageuser->package_id = $request->id;
        $packageuser->expired_date = Carbon::now()->addDays(30);
        $packageuser->save();

        $payment = new Payment();
        $payment->value = $request->price;
        $payment->status = "pending";
        $payment->name = "Lunas";

        $res = auth('api')->user()->package_users()->findOrFail($packageuser->id)->payment()->save($payment);

        return $res;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //

        $res = Payment::with('package_user',)->where('id', $id)->first();
        if ($res->value < 1000) {
            $res->status = "success";
            $res->save();
        }

        return $res;
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

    public function getSpending(Request $request)
    {
        // return response()->json($request->all());
        $payment = Payment::where('type', 'out')
            ->where('payment_id', 1)
            ->where('payment_type', 'App\Models\Shop')
            ->get();
        return response()->json($payment);
    }

    public function getPayment($shopid)
    {
        // return response()->json($shopid);

        $res = DB::table('payments')
            ->where('payment_type', 'App\Models\Order')
            ->join('orders as o', 'payments.payment_id', 'o.id')
            ->join('users as u', 'o.customer_id', 'u.id')
            ->where('o.shop_id', [$shopid])
            ->where('type', 'in')
            ->select(
                DB::raw('payments.*'),
                DB::raw('u.name as customer')
            )
            ->orderBy('payments.created_at', 'desc')
            ->get();
        return response()->json($res);
    }

    public function getTotalSum($shopid)
    {
        $in = Payment::whereHas('order.shop', function ($query) use ($shopid) {
            $query->where('id', $shopid);
        })
            ->where('type', 'in')
            ->sum('value');
        $out = Payment::whereHas('shop', function ($query) use ($shopid) {
            $query->where('id', $shopid);
        })
            ->where('type', 'out')
            ->sum('value');

        $res = $in - $out;
        return response()->json($res);
    }
}
