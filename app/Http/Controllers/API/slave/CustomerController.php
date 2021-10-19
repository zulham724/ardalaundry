<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
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
        // return $request->user()->shop()->firstOrFail()->customers()->get();
        $customer = new User($request->all());
        $customer->role_id = 6;
        return $request->user()->shop()->firstOrFail()->customers()->save($customer);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return User::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        return $request->user()->shop()->firstOrFail()->customers()->findOrFail($id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        //
        return $request->user()->shop()->firstOrFail()->customers()->findOrFail($id)->delete();;
    }

    public function searchCustomer(Request $request)
    {
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'customer'))
            ->whereHas('customer_shops', fn ($query) => $query->where('shop_id', $request->user()->shop()->firstOrFail()->id))
            ->where('name', 'like', '%' . $request->name . '%')
            ->get();
        return response()->json($res);
    }
}
