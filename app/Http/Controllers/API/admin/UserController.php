<?php

namespace App\Http\Controllers\API\admin;

use App\Http\Controllers\Controller;
use App\Models\Package;
use App\Models\PackageUser;
use App\Models\Payment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

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

    public function getFreePackage($id)
    {
        $user = User::findOrFail($id);
        if (!$user->hasRole('master')) {
            return response()->json(['message' => 'Harus Owner', 'data' => $user->load('role')], 500);
        }
        $freePackage = Package::where('id', 1)->firstOrFail();

        $package_user = new PackageUser();
        $package_user->user_id = $user->id;
        $package_user->package_id = $freePackage->id;
        $package_user->expired_date = Carbon::now()->addDays(14);
        $package_user->save();

        $payment = new Payment();
        $payment->value = $freePackage->price;
        $payment->name = "Trial";
        $payment->status = "success";

        $package_user->payment()->save($payment);
        return response()->json(['message' => 'Berhasil menambahkan package gratis', 'status' => 'success', 'data' => $user->load('active_package_user.payment', 'package_users.payment')]);

    }

    public function rollbackPackage($id)
    {
        $user = User::findOrFail($id);
        if (!$user->hasRole('master')) {
            return response()->json(['message' => 'Harus Owner', 'data' => $user->load('role')], 500);
        }

        $package_user = $user->active_package_user;
        $package_user->delete();
        return response()->json(['message' => 'Berhasil menghapus package gratis', 'status' => 'success', 'data' => $user->load('active_package_user.payment', 'package_users.payment')]);
    }
}
