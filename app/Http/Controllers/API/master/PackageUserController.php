<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\PackageUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Package;
use App\Models\User;

class PackageUserController extends Controller
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
     * @param  \App\Models\PackageUser  $packageUser
     * @return \Illuminate\Http\Response
     */
    public function show(PackageUser $packageUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\PackageUser  $packageUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PackageUser $packageUser)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PackageUser  $packageUser
     * @return \Illuminate\Http\Response
     */
    public function destroy(PackageUser $packageUser)
    {
        //
    }

    public function getsubscribestatus(){
        // return \App\Models\User::with('packages')->find(2);
        $res = PackageUser::with('package')->where('user_id',Auth::user()->id)->orderBy('created_at')->first();
        return response()->json($res);
    }
}
