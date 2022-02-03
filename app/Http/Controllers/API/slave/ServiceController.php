<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Models\Order;
use App\Models\OrderService;
use App\Models\ServiceStatus;
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

        $res = Service::with("category.service_unit")->get();
        return $res;
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
        // return response()->json($request->all());
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
        if($shopId){
            $res = Service::with('category.service_unit')->whereHas('shop', function ($query) use ($shopId) {
                $query->where('id', $shopId);
            })->get();
            return response()->json($res);
        }else{
            $res = Service::with('category.service_unit')->whereHas('shop', function ($query) use ($shopId) {
                $query->where('id', 1);
            })->get();
            return response()->json($res);
        }
    }

    public function add_service(Request $request)
    {
        $res = $request->user()->shop()->firstOrFail()->services()->save(new Service($request->all()));
        return response()->json($res);
    }

    public function delete_service(Request $request)
    {
        $res = Service::whereIn('id', $request->all())->delete();
        return $res;
    }

    public function getServicesBycategory($id)
    {
        return Service::where('service_category_id', $id)->get();
    }

    public function updateStatus(Request $request)
    {
        //    return response()->json($request->all());
        

        $order_service = OrderService::findOrFail($request->id);
        $order_service->update($request->all());
        return $order_service;

        
    }
}
