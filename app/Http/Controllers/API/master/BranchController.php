<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\User;
use App\Models\Shop;
use Illuminate\Http\Request;

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
        // dd(User::orderBy('created_at','desc')->first());
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
        $request->user()->branches()->attach($slave->id);


        return $request->user()->load('branches.shop');
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
    public function destroy(Branch $branch)
    {
        //
    }
}
