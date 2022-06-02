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
        $request->validate([
            'email' => 'required|email|unique:users',
        ]);
        if ($request->user()->shop()->firstOrFail()->customers()->where('email', $request->email)->first()) {
            return response(['message' => 'Password berhasil diubah'], 200);
        } else {
            $customer = new User();
            $customer->name = $request->name;
            $customer->role_id = 6;
            $customer->email = $request->email;
            $customer->contact_number = $request->contact_number;
            $customer->home_address = $request->home_address;
            if ($request->has('password')) {
                $customer->password = bcrypt($request->password);
            }
            return $request->user()->shop()->firstOrFail()->customers()->save($customer);
            return response(['message' => 'Password lama tidak sesuai'], 422);
        }
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
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'customer'))
            ->whereHas('customer_shops', fn ($query) => $query->where('shop_id', $request->user()->shop()->firstOrFail()->id))
            ->where('name', 'like', '%' . $request->name . '%')
            ->get();
        return response()->json($res);
    }
}
