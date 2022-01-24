<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
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
        $res = User::whereHas('role', fn ($query) => $query->where('id', 5))
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
        ]);

        $employee =  new User();
        $employee->role_id = 5;
        $employee->name = $request->name;
        $employee->email = $request->email;
        if($request->has("password")){
            $employee->password = bcrypt($request->password);
        }
        $employee->home_address = $request->home_address;
        $employee->contact_number = $request->contact_number;
        $employee->save();

        return $request->user()->shop()->firstOrFail()->employees()->save($employee);

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
        return User::where('id', $id)->firstOrFail();

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
        // return response()->json($request->all());
        return $request->user()->shop()->firstOrFail()->employees()->findOrFail($id)->update($request->employee);
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

    public function searchEmployee(Request $request)
    {
        // return $request->all();
        $res = User::
        whereHas('role', fn ($query) => $query->where('id', 5))
        ->whereHas('employee_shops', fn ($query) => $query->where('shop_id', $request->user()->shop()->firstOrFail()->id))
            ->where('name', 'like', '%' . $request->name . '%')
            ->get();
        return response()->json($res);
    }

    public function attendance(Request $request){
        // return response()->json($request->all());
        $attendance = Attendance::where('created_at', \Carbon\Carbon::today())->exists();
        if($attendance){
            return response()->json("Sudah absen",403);
        }else{
            $res = new Attendance();
            $res->user_id = $request->id;
            $res->shop_id = auth('api')->user()->shop->id;
            $res->in_at = \Carbon\Carbon::now();
            $res->save();
            return ;
        }
        
    }
}
