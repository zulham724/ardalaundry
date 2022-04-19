<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\User;
use App\Models\Shop;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BranchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $res = Branch::get();
        return response()->json($res);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return response()->json($request->all());
        // dd(User::orderBy('created_at','desc')->first());
        $user = auth('api')->user()->loadCount(['slaves'])->load(['active_package_user' => function ($query) {
            $query->with('payment', 'package.slave_limit');
        }]);

        if ($user->slaves_count > $user->active_package_user->package->slave_limit->limit) {
            return response('Cabang anda sudah mencapai batas', 500);
        }
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required'

        ]);

        $slave = new User();
        $slave->role_id = 4;
        $slave->name = $request->name;
        $slave->email = $request->email;
        $slave->password = bcrypt($request->password);
        $slave->save();
        $shop = new Shop();
        $shop->name = $request->shop_name;
        $shop->description = $request->shop_desc ?? null;
        $slave->shop()->save($shop);
        auth('api')->user()->slaves()->attach($slave->id);


        return auth('api')->user()->load('slaves.shop');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function show(Branch $branch)
    {
        //
        $res = Branch::where('master_id', auth('api')->user()->id);
        return response()->json($res);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Branch $branch)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Branch  $branch
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
        // return response()->json($request->all());
        // $shop = Shop::findOrFail($request->shop_id);
        // $delete = $shop->delete();

        // $user = User::findOrFail($request->user_id);
        // $delete = $user->delete();
        $slave = User::findOrFail($request->user_id);
        $slave->shop()->delete();
        $delete = $slave->delete();

        return response()->json($delete);
    }

    public function deleteBranch(Request $request){
        // return abort(500);
        // return response()->json($request->all());
        $slave = User::findOrFail($request->user_id);
        $slave->shop()->delete();
        $delete = $slave->delete();

        return response()->json($delete);
    }
}
