<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\PackageUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

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
        //
        $packageuser = new PackageUser();
        $packageuser->user_id = Auth::user()->id;
        $packageuser->package_id = $request->id; 
        $packageuser->expired_date = Carbon::now()->addDays(30);
        $packageuser->save();

        $payment = new Payment();
        $payment->value = $request->price;
        $payment->status = "pending";
        $payment->name = "Lunas";
        
      $res = $request->user()->package_users()->findOrFail($packageuser->id)->payment()->save($payment);

      return $res;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        //
        $res = PackageUser::with('package', 'payment')->whereHas('payment', function($query){
            $query->where('user_id', Auth::user()->id);
        })->orderBy('created_at', 'desc')->get();

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
}
