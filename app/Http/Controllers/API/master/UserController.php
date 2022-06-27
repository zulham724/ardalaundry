<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
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

    public function add_wa_number(Request $request)
    {
        // return response()->json($request->all());
        $user = User::findOrFail(auth('api')->user()->id);
        $user->update($request->all());
        return response()->json($user);
    }

    public function register(Request $request)
    {

        $exist = User::where('email', $request->email)->exists();
        if ($exist) {
            return response()->json([
                'status' => 'error',
                'message' => 'Email has been taken',
            ], 500);
        }
        // return response()->json($request->all());
        $user = new User($request->all());
        $user->password = bcrypt($request->password);
        $user->role_id = 3;
        $user->affiliate_code = Str::lower(Str::random(5));

        if ($request->has('affiliate_code')) {
            $affiliate_code = $request->affiliate_code;
            $affiliate = User::where('affiliate_code', $affiliate_code)->firstOrFail();
            $user->save();
            $user->affiliate_by()->sync([$affiliate->id], false); // dicoba2 kalau ngga ya pakai sync atau attach
        } else {
            $user->save();
        }

        $shop = new Shop();
        $shop->user_id = $user->id;
        $shop->name = $user->name;
        $shop->save();

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

        return response()->json($user->load('active_package_user.payment', 'package_users.payment', 'shop'));
    }

    public function branches()
    {
        // return 'asd';
        $res = User::with('shop')
            ->has('shop')
            ->whereHas('role', fn($query) => $query->where('id', 4))
            ->whereHas('master', fn($query) => $query->where('master_id', auth('api')->user()->id))
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

    public function getProfileById($userid)
    {
        $user = User::findOrFail($userid);
        return response()->json($user->load('shop', 'master'));
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
        })

            ->get();
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

    public function updateAvatar(Request $request, $id)
    {
        // return response()->json($request->all());
        $request->validate([
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        $user = User::findOrFail($id);
        $user->fill($request->all());
        if ($request->hasFile('avatar')) {
            $path = $request->file('avatar')->store('avatar', ENV("FILESYSTEM_DRIVER"));
            // $avatar->src = $path;
            $user->avatar = $path;
        }
        $user->save();
        return response()->json($user);
    }

    public function updateProfile(Request $request, $id)
    {

        $user = User::findOrFail($id);
        $user->fill($request->all());
        $user->save();

        if ($request->has('shop')) {
            $user->shop()->firstOrFail()->update([
                'description' => $request->shop['description'],
            ]);
        }
        return response()->json($user->load('shop'));
    }

    public function changePassword(Request $request)
    {
        // return response()->json($request->all());

        $request->validate([
            'current_password' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ]);
        $user = User::findOrFail(auth('api')->user()->id);
        if (Hash::check($request->current_password, $user->password)) {
            $user->password = bcrypt($request->password);
            $user->update();
            return response(['message' => 'Password berhasil diubah'], 200);
            return response()->json(['message' => 'Password berhasil diubah'], 200);
        } else {
            return response(['message' => 'Password lama tidak sesuai'], 422);
            return response()->json(['message' => 'Password lama tidak sesuai'], 422);
        }
    }
    public function getAllProfile()
    {
        $user = User::with('shop')->has('shop')->get();
        return response()->json($user);
    }

    public function searchUserPostByKey($key)
    {
        // cari postingan user
        $res = \App\Models\Post::where('title', 'like', '%' . $key . '%')
            ->orWhere('body', 'like', '%' . $key . '%')
            ->with('author')
            ->has('author')
            ->get();
        return response()->json($res);
    }
}
