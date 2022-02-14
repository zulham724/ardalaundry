<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Like;
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

        $product = Product::with('shop.user', 'images')
        ->withCount('liked')
        ->findOrFail($productId);

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
        //$produk = Product:findOrFail($id);

        
    }

    public function updatetest(Request $request, $id)
    {
        $produk = Product::findOrFail($id);

        $produk->tittle = $request->name;
        $produk->price = $request->price;
        $produk->description = $request->description;
        $produk->weight = $request->weight;
        $produk->is_new = $request->is_new;
        $produk->save();

        return response()->json($produk);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($Id)
    {
        //
        return Product::where('id', $Id)->delete();
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

    public function like($productId) {
        $product = Product::findOrFail($productId);

        $like = new Like(); 
        $like->user_id = auth('api')->user()->id;
        $product->liked()->save($like);

        return response()->json($product->loadCount(["liked", "likes"]));
    }

    public function dislike($productId) {
        $product = Product::findOrFail($productId);
        $like = Like::where('user_id', auth('api')->user()->id)
                ->where('likeable_id', $productId)->first();
        $like->delete();
        return response()->json($product->loadCount(["liked", "likes"]));
    }

    public function deleteImage($Id)
    {
        //return Product::where('id', $Id)->delete();
    }
}
