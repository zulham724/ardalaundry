<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\File;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Product::with('shop.user', 'images')->get();
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
        $product = new Product($request->all());
        $product->shop_id = auth('api')->user()->shop->id;
        $product->save();

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $i => $image) {
                # code...
                $file = new File();
                $path = $request->file('images')[$i]->store('files', 'public');
                $file->src = $path;
                $file->name = $request->file('images')[$i]->getClientOriginalName();
                $file->filetype = $request->file('images')[$i]->getClientMimeType();
                $product->images()->save($file);
            }
        }

        return response()->json($product->load("images"));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($productId)
    {
        //

        $product = Product::with('shop.user', 'images')->findOrFail($productId);

        return response()->json($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }

    public function getProductByShop()
    {
        $product = Product::with('shop.user', 'images')
            ->where('shop_id', auth('api')->user()->shop->id)
            ->get();

        return response()->json($product);
    }

    public function getAnotherProducts($shopId)
    {
        $product = Product::with('shop.user', 'images')
            ->where('shop_id', $shopId)
            ->inRandomOrder()->limit(2)->get();
        return response()->json($product);
    }
}
