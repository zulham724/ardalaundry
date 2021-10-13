<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

    public function branches(){
        // return 'asd';
        $res = User::with('shop')
        ->has('shop')
        ->whereHas('role',fn($query)=>$query->where('id',4))
        ->whereHas('master',fn($query)=>$query->where('master_id',Auth::user()->id))
        ->withCount(['orders'])
        ->withCount(['orders as payment_count'=>function($query){
            $query
            ->join('payments','orders.id','=','payments.payment_id')->where('payments.payment_type','App\Models\Order')
            ->select(DB::raw("SUM(payments.value) as total"));
        }])
        ->get();
        return response()->json($res);
    }

    public function slaves(){
        $res = User::with('shop')->whereHas('master',function($query){
            $query->where('master_id',Auth::user()->id);
        })->get();
        return response()->json($res);
    }

    public function getCustomersBySlave($slaiveId){
        $res = User::with('customer')->whereHas('shop.user', function($query)use($slaiveId) {
            $query->where('id', $slaiveId);
        })->get();
        return response()->json($res);
    }

    public function getEmployeesBySlave($slaiveId)
    {
        $res = User::with('employee')->whereHas('shop.user', function($query)use($slaiveId) {
            $query->where('id', $slaiveId);
        })->get();
        return response()->json($res);
    }
}
