<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\PackageUser;
use App\Models\Payment;
use App\Models\User;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        $request->validate([
            'package_id' => [
                'required',
                function ($attribute, $value, $fail) {
                    // cek jika pembelian adalah paket trial
                    if ($value == 1) {
                        // cek jika sudah pernah beli paket trial sebelum nya
                        $userHasTrialPackageBefore = PackageUser::where('user_id', auth('api')->user()->id)->where('package_id', $value)
                            ->whereHas('payment', function ($query) {
                                $query->where('status', 'success');
                            })->exists();
                        if ($userHasTrialPackageBefore) {
                            return $fail('You have already purchased trial package');
                        }
                    }
                },
            ],
        ]);

        $user = User::findOrFail(auth('api')->user()->id);
        $package = Package::findOrFail($request->package_id);

        $packageuser = new PackageUser();
        $packageuser->user_id = auth('api')->user()->id;
        $packageuser->package_id = $package->id;
        $packageuser->expired_date = date('Y-m-d H:i:s', strtotime($package->time_period));
        $packageuser->save();

        $client = new Client();
        $json_data = ['value' => $package->price, 'payment_vendor' => 1]; // 1 dibuat langsung BNI
        $res = $client->post(env('MASTER_PAYMENT_URL') . '/createpayment', [
            'json' => $json_data,
        ]);
        $master_payment = json_decode($res->getBody());
        if (json_last_error() != JSON_ERROR_NONE) {
            return response('Format JSON salah', 422);
        }

        $payment = new Payment();
        $payment->master_payment_id = $master_payment->id;
        $payment->value = $master_payment->value;
        $payment->status = $master_payment->status;
        $payment->service_code = 1; // dibuat langsung BNI
        $payment->name = "Pembelian Paket Laundry";

        $res = $user->package_users()->findOrFail($packageuser->id)->payment()->save($payment);

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

        $res = Payment::with('package_user.package')->has('package_user.package')->where('id', $id)->first();
        if ($res->package_user->package->name == 'Paket Trial') {
            $res->status = "success";
            $res->save();
        } else if ($res->status != "success") {
            $payment = $this->getStatus($res->id);
            return $payment->load('package_user');
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

    public function getSpending($shopId)
    {
        // return response()->json($request->all());
        $payment = Payment::where('type', 'out')
            ->where('payment_id', $shopId)
            ->where('payment_type', 'App\Models\Shop')
            ->get();
        return response()->json($payment);
    }

    public function getSpendingSum($shopId)
    {
        // return response()->json($request->all());
        $payment = Payment::where('type', 'out')
            ->where('payment_id', $shopId)
            ->where('payment_type', 'App\Models\Shop')
            ->sum('value');
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

    public function getStatus($payment_id)
    {

        $payment = Payment::findOrFail($payment_id);

        $client = new Client();
        $res = $client->get(env('MASTER_PAYMENT_URL') . "/checkstatus/{$payment->master_payment_id}");
        $result_json = json_decode($res->getBody());
        if (json_last_error() != JSON_ERROR_NONE) {
            return response('Format JSON salah', 422);
        }

        $payment->status = $result_json->status;
        $payment->save();

        return $payment;

    }
}
