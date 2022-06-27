<?php

namespace App\Http\Controllers\API\master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ShopServiceCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($shopId)
    {
        $shop = \App\Models\Shop::findOrFail($shopId);
        $res = $shop->service_categories;
        return response()->json($res);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $shopId)
    {
        //
        $request->validate([
            'name' => 'required|string|max:255',
            'shop_id' => function ($attribute, $value, $fail) use ($shopId) {

                $exists = \App\Models\Shop::where('id', $shopId)->whereHas('user', function ($query) {
                    $query->whereHas('master', function ($query) {
                        $query->where('branches.master_id', '=', auth('api')->user()->id);
                    });
                })->exists();

                if (!$exists) {
                    return $fail('You are not authorized to create service category for this shop');
                }

            },
        ]);

        $shop = \App\Models\Shop::findOrFail($shopId);

        $shop->service_categories()->create([
            'name' => $request->name,
            'description' => $request->description,
            'service_unit_id' => $request->service_unit_id,
            'shop_id' => $shopId,
        ]);

        return response()->json([
            'message' => 'Service category created',
            'data' => $shop->service_categories()->latest()->first(),
        ]);
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
