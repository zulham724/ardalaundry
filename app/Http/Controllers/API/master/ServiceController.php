<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Models\Shop;
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
        $request->validate([
            'name' => 'required',
            'service_category_id' => 'required',
            'price' => 'required',
            'process_time' => 'required'

        ]);
        
        return Shop::whereHas('user.master',function($query){
            $query->where('master_id', Auth::user()->id);
        })->findOrFail($request->shop_id)->services()->save(new Service($request->all()));
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
        return Service::with('category')->findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        return Service::findOrFail($id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Service  $service
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $res = Service::findOrFail($id)->delete();
        return $res;

    }

    public function getServiceBySlave($shopId){
        $res = Service::with('category')->whereHas('shop',function($query)use($shopId){
            $query->where('id',$shopId);
        })->get();
        return response()->json($res);
    }
}
