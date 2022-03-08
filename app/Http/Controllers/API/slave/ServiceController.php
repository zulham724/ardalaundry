<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderService;
use App\Models\Service;
use Illuminate\Http\Request;

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
    public function updateName(Request $request, $id)
    {
        $paket = Service::findOrFail($id);

        $paket->name = $request->name;
        $paket->save();

        return response()->json($paket);
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
        $res = Service::with('category.service_unit')->whereHas('shop', function ($query) use ($shopId) {
            $query->where('id', $shopId);
        })->get();
        return response()->json($res);
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
        // return response()->json($request->all());
        $order_service = OrderService::findOrFail($request->id);
        $order_service->update($request->all());
        $order = Order::withCount(['order_services as belum_selesai_semua' => function ($query) {
            // hitung berapa jumlah order_services yang status nya bukan 3 atau tidak selesai
            $query->where('service_status_id', '!=', 3);
        }])->whereHas('order_services', function ($query) use ($request) {
            $query->where('id', $request->id);
        })->first();
        //-----------------
        // jika semua order services di order service status id nya 3 semua maka order_status id 3 kalau ngga ya 2
        if ($order->belum_selesai_semua) {
            $order->order_status_id = 2;
        } else {
            $order->order_status_id = 3;
        }
        //--------------
        $order->save();

        return response()->json($order_service->load('order'));
    }
}
