<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UserController extends Controller
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }

    public function register(Request $request)
    {
        return response()->json($request->all());
        $user = new User($request->all());
        $user->password = bcrypt($request->password);
        $user->role_id = 3;
        $user->affiliate_code = Str::random(5);
       

        if ($request->has('affiliate_code')) {
            $affiliate_code = $request->affiliate_code;
            $affiliate = User::where('affiliate_code', $affiliate_code)->firstOrFail();
            $user->save();
            if ($affiliate) {
                $user->affiliate_by()->associate($affiliate); // dicoba2 kalau ngga ya pakai sync atau attach
                $user->save();
            }
        } else {
            $user->save();
        }

        // $freePackage = Package::where('id', 1)->firstOrFail();

        // $package_user = new PackageUser();
        // $package_user->user_id = $user->id;
        // $package_user->package_id = $freePackage->id;
        // $package_user->expired_date = Carbon::now()->addDays(7);
        // $package_user->save();

        // $payment = new Payment();
        // $payment->value = $freePackage->price;
        // $payment->name = "Register";
        // $payment->status = "success";

        // $package_user->payment()->save($payment);

        return response()->json($user->load('active_package_user.payment', 'package_users.payment'));
    }

    public function branches()
    {
        // return 'asd';
        $res = User::with('shop')
            ->has('shop')
            ->whereHas('role', fn ($query) => $query->where('id', 4))
            ->whereHas('master', fn ($query) => $query->where('master_id', auth('api')->user()->id))
            ->withCount(['orders'])
            ->withCount(['orders as payment_count' => function ($query) {
                $query
                    ->join('payments', 'orders.id', '=', 'payments.payment_id')->where('payments.payment_type', 'App\Models\Order')
                    ->select(DB::raw("SUM(payments.value) as total"));
            }])
            ->get();
        return response()->json($res);
    }

    public function slaves()
    {
        $res = User::with('shop')->whereHas('master', function ($query) {
            $query->where('master_id', auth('api')->user()->id);
        })->get();
        return response()->json($res);
    }

    public function getCustomersBySlave($slaiveId)
    {
        $res = User::with('customer')->whereHas('shop.user', function ($query) use ($slaiveId) {
            $query->where('id', $slaiveId);
        })->get();
        return response()->json($res);
    }

    public function getEmployeesBySlave($slaiveId)
    {
        $res = User::with('employee')->whereHas('shop.user', function ($query) use ($slaiveId) {
            $query->where('id', $slaiveId);
        })->get();
        return response()->json($res);
    }

    public function login(Request $request)
    {
        // return response()->json($request->all());
        $res = $request->user()
            ->loadCount(['slaves', 'orders'])
            ->load(['packages', 'active_package_user' => function ($query) {
                $query->with('payment', 'package.package_limits', 'package.package_contents');
            }]);

        if ($res->active_package_user !== null) {
            foreach ($res->active_package_user->package->package_limits as $limit) {
                if ($res->{$limit->entity} > $limit->limit) {
                    $res->apiStatus = "Mati";
                } else {
                    $res->apiStatus = "Hidup";
                }
            }
            if ($res->active_package_user) {
                if (new \DateTime($res->active_package_user->expired_date) > new \DateTime() && $res->{$limit->entity} < $limit->limit) {
                    $res->apiStatus = "Hidup";
                } else {
                    $res->apiStatus = "Mati";
                }
            } else {
                $res->apiStatus = "Mati";
            }
        } else {
            $res->apiStatus = "Mati";
        }

        return response()->json($res);
    }
}
