<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;

class ShopController extends Controller
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
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function show(Shop $shop)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Shop $shop)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Shop  $shop
     * @return \Illuminate\Http\Response
     */
    public function destroy(Shop $shop)
    {
        //
    }

    //Employee
    public function getEmployeesByShop($shop_id)
    {
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'employee'))
            ->whereHas('employee_shops', fn ($query) => $query->where('shop_id', $shop_id))
            ->get();
        return response()->json($res);
    }

    public function add_employee(Request $request)
    {
     
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
        ]);

        $employee =  new User();
        $employee->role_id = 5;
        $employee->name = $request->name;
        $employee->email = $request->email;
        $employee->password = bcrypt($request->password);
        $employee->save();

        $request->user()->shop()->firstOrFail()->employees()->attach($employee->id);

        return $request->user()->shop()->firstOrFail()->employees()->findOrFail($employee->id);
    }

    public function delete_employee(Request $request,$employee_id)
    {
        $request->user()->shop()->firstOrFail()->employees()->findOrFail($employee_id)->delete();
        //   $res = \App\Models\User::findOrFail($employee_id)->delete();
    }

    public function edit_employee(Request $request,$employee_id){
        return $request->user()->shop()->firstOrFail()->employees()->findOrFail($employee_id)->update($request->all());
    }



    //Customer
    public function getCustomersByShop($shop_id)
    {

        $res = User::whereHas('role', fn ($query) => $query->where('name', 'customer'))
            ->whereHas('customer_shops', fn ($query) => $query->where('shop_id', $shop_id))
            ->get();
        return response()->json($res);
    }

    public function add_customer(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
        ]);

        $customer = new User();
        $customer->role_id = 6;
        $customer->name = $request->name;
        $customer->email = $request->email;
        $customer->password = bcrypt($request->password);
        $customer->save();
    }


    //Service
    public function getServicesByShop($shop_id){

        $res = Shop::findOrFail($shop_id)->services()->get();
        return $res;

    }
}
