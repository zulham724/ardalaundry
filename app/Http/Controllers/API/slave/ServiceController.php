<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ServiceController extends Controller
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
        $res = $request->user()->shop()->firstOrFail()->services()->save(new Service($request->all()));
        return response()->json($res);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return Service::get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Service $service)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // return true;
        $res = Service::findOrFail($id);
        $res->delete();
        return response()->json($res);
    }

    public function getServicesByShop($shopId)
    {
        $res = Service::with('category')->whereHas('shop', function ($query) use ($shopId) {
            $query->where('id', $shopId);
        })->get();
        return response()->json($res);
    }

   public function add_service(Request $request){
        $res = $request->user()->shop()->firstOrFail()->services()->save(new Service($request->all()));
        return response()->json($res);

   }

   
}
