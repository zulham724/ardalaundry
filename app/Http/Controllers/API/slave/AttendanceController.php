<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Models\User;

class AttendanceController extends Controller
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
        // return $request->user_id;
        $exist = $request->user()->shop()->firstOrFail()->attendances()
        ->where('user_id',$request->user_id)
        ->whereDate('attendances.created_at',\Carbon\Carbon::today())
        ->exists();
        if($exist){
            return response('Anda sudah absen',200);
        } else {
            $request->user()->shop()->firstOrFail()->attendances()->attach($request->user_id);
        }
        
        $res = $request->user()->shop()->firstOrFail()->attendances()->where('user_id',$request->user_id)
        ->whereDate('attendances.created_at', \Carbon\Carbon::today())->first();
        return response()->json($res);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,$id)
    {   
        
        return $request
        ->user()
        ->shop()
        ->firstOrFail()
        ->attendances()
        ->whereDate('attendances.created_at', \Carbon\Carbon::today())
        ->get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Attendance $attendance)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function destroy(Attendance $attendance)
    {
        //
    }

    public function searchAttendance(Request $request){
        return $request
            ->user()
            ->shop()
            ->firstOrFail()
            ->attendances()
            // ->user()
            ->whereDate('attendances.created_at', \Carbon\Carbon::today())
            ->where('name', 'like', '%'.$request->name.'%')
            ->get();
    }

    public function detailAttendance($employeeid){
        $res = Attendance::where('user_id', $employeeid)->get();
        return $res;
    }
    // fungsi ini berguna untuk mengambil data array attendances berdasarkan id karyawan
    public function getEmployeeAttendances($employeeid){
        $result = Attendance::where('user_id', $employeeid)
        ->whereMonth('in_at',\Carbon\Carbon::now()->month)
        ->whereYear('in_at',\Carbon\Carbon::now()->year)
        ->get();
        return $result;
    }

    public function monthlyAttendanceReport1($shopId) {
        $res1 = User::with('employee_shops','attendances','roles')->whereHas("employee_shops", function($query) use($shopId) {
            $query->where('shop_id', $shopId);
        })
        ->whereHas("attendances", function($query) {
            $query->whereDate('in_at',\Carbon\Carbon::today());
            // $query->whereMonth('in_at',\Carbon\Carbon::now()->month)->whereYear('in_at',\Carbon\Carbon::now()->year);
        })        
        ->count();

        $res2 = User::whereHas("employee_shops", function($query) use($shopId) {
            $query->where('shops.id', $shopId);
        })
        ->count();

        return ['telah_absen'=>$res1, 'total_karyawan'=>$res2];
    }
}
