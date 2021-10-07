<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // $res = Auth::user()->load(['shop.employees'=>fn($query)=>$query->where('role_id',5)]);
        // return $res;
        $res = User::whereHas('role', fn ($query) => $query->where('name', 'employee'))
        ->whereHas('employee_shops', fn ($query) => $query->where('shop_id', Auth::user()->load('shop')->shop->id))
            ->get();
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
        //
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //

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
        
        return $request->user()->shop()->firstOrFail()->employees()->findOrFail($id)->update($request->all());
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
        $request->user()->shop()->firstOrFail()->employees()->findOrFail($id)->delete();
    }
}
