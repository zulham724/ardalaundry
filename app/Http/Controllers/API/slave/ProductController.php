<?php

namespace App\Http\Controllers\API\slave;

use App\Http\Controllers\Controller;
use App\Models\File;
use App\Models\Like;
use App\Models\Product;
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

    /**P
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        // return response()->json($request->all());
        $product = new Product($request->all());
        $product->shop_id = auth('api')->user()->shop->id;
        $product->save();

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $i => $image) {
                # code...
                $file = new File();
                $path = $request->file('images')[$i]->store('files', env('FILESYSTEM_DRIVER'));
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
            ->withCount('liked', 'likes')
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

    public function updatetest(Request $request)
    {
        $produk = Product::findOrFail($request->id);

        $produk->tittle = $request->tittle;
        $produk->price = $request->price;
        $produk->description = $request->description;
        $produk->weight = $request->weight;
        $produk->is_new = $request->is_new;
        $produk->save();

        return response()->json($produk->load('images'));
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

    public function getLikedProduct($productId)
    {
        //

        $product = Product::with('shop.user', 'images')
            ->withCount('liked', 'likes')
            ->whereHas('liked')
            ->findOrFail($productId);

        return response()->json($product);
    }

    public function getAnotherProducts($shopId)
    {
        $product = Product::with('shop.user', 'images')
            ->where('shop_id', $shopId)
            ->inRandomOrder()->limit(2)->get();
        return response()->json($product);
    }

    public function like($productId)
    {
        $product = Product::findOrFail($productId);

        $like = new Like();
        $like->user_id = auth('api')->user()->id;
        $product->liked()->save($like);

        return response()->json($product->loadCount(["liked", "likes"]));
    }

    public function dislike($productId)
    {
        $product = Product::findOrFail($productId);
        $like = Like::where('user_id', auth('api')->user()->id)
            ->where('likeable_id', $productId)->first();
        $like->delete();
        return response()->json($product->loadCount(["liked", "likes"]));
    }

    public function deleteImage(Request $request)
    {
        return response()->json($request->all());
        //  return File::findOrFail($request)->delete();

    }

    public function addImage(Request $request)
    {
        $produk = Product::findOrFail($request->product_id);

        $product = new Product($request->all());
        $product->shop_id = auth('api')->user()->shop->id;
        $product->save();

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $i => $image) {
                # code...
                $file = new File();
                $path = $request->file('images')[$i]->store('files', env('FILESYSTEM_DRIVER'));
                $file->src = $path;
                $file->name = $request->file('images')[$i]->getClientOriginalName();
                $file->filetype = $request->file('images')[$i]->getClientMimeType();
                $produk->images()->save($file);
            }
        }

        $produk->save();

        return response()->json($produk->load('images'));
    }

    public function getLikedProductByUser($userid)
    {
        $product = Product::whereHas('liked', function ($query) use ($userid) {
            $query->where('user_id', $userid);
        })->with('shop.user', 'images')
            ->withCount('liked', 'likes')
            ->get();

        return response()->json($product);
    }

    public function searchLikedProductByUser(Request $request)
    {
        // return response()->json($request->all());
        $product = Product::whereHas('liked', function ($query) use ($request) {
            $query->where('user_id', $request->id);
        })->with('shop.user', 'images')
            ->withCount('liked', 'likes')
            ->where('tittle', 'like', '%' . $request->value . '%')
            ->get();

        return response()->json($product);
    }
}
