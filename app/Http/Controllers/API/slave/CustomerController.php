<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

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
        // return response()->json($request->all());
        // return $request->user()->shop()->firstOrFail()->customers()->get();

        $customer = new User($request->all());
        $customer->role_id = 6;

        if ($request->has('password')) {
            $customer->password = bcrypt($request->password);
        }
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
        return User::with("order.services", "order.status")->findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //
        // return response()->json($request->all());
        return $request->user()->shop()->firstOrFail()->customers()->findOrFail($request->id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
        // return response()->json($request->all());
        return $request->user()->shop()->firstOrFail()->customers()->whereIn('user_id', $request->all())->delete();
    }

    public function searchCustomer(Request $request)
    {
        $res = User::whereHas('role', fn($query) => $query->where('name', 'customer'))
            ->whereHas('customer_shops', fn($query) => $query->where('shop_id', $request->user()->shop()->firstOrFail()->id))
            ->where('name', 'like', '%' . $request->name . '%')
            ->get();
        return response()->json($res);
    }
}
