<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\ServiceCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class ServiceCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return ServiceCategory::with("service_unit")->where("shop_id", auth('api')->user()->shop->id)->get();
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
        // return response()->json(auth('api')->user()->shop);
        $categories = new ServiceCategory($request->all());
        $categories->shop_id = auth('api')->user()->shop->id;
        $categories->save();
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ServiceCategory  $serviceCategory
     * @return \Illuminate\Http\Response
     */
    public function show(ServiceCategory $serviceCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ServiceCategory  $serviceCategory
     * @return \Illuminate\Http\Response
     */
    public function updateName(Request $request, $id)
    {
        //
        //mencari data sesuai id yang dikirim
        $category = ServiceCategory::findOrFail($id);

        //untuk mengupdate data 
        $category->name = $request->name;
        $category->save();

        return response()->json($category);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ServiceCategory  $serviceCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        //
       
    }

    public function delete_categories(Request $request){
        // return response()->json($request->all());
        $res = ServiceCategory::whereIn('id', $request->all())->delete();
        return $res;
    }

    
}
