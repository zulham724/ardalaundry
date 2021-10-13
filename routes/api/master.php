<?php

use App\Http\Controllers\API\master\BranchController;
use App\Http\Controllers\API\master\OrderController;
use App\Http\Controllers\API\master\PackageUserController;
use App\Http\Controllers\API\master\ServiceController;
use App\Http\Controllers\API\master\ShopController;
use App\Http\Controllers\API\master\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/user',function(Request $request){
    return $request->user()->load(['packages']);
});

Route::get('/totalorders',[OrderController::class,'totalOrders']);
Route::get('/profit',[OrderController::class,'getProfit']);
Route::get('/growth',[OrderController::class,'getGrowth']);
Route::get('/ordercountbymonths',[OrderController::class,'orderCountByMonths']);
Route::get('/paymentcountbymonths',[OrderController::class,'paymentCountByMonths']);

Route::get('/getsubscribestatus',[PackageUserController::class,'getsubscribestatus']);

Route::get('/slaves',[UserController::class,'slaves']);
Route::get('/shops',[ShopController::class,'index']);
Route::get('/branches',[UserController::class,'branches']);
Route::get('/slave/{shopid}/services',[ServiceController::class,'getServiceBySlave']);
//ini belum
// mirip getservuceBbyslave
Route::get('/slave/{slaveid}/orders',[OrderController::class,'getOrdersBySlave']);
Route::get('/shop/{shopid}/customers',[ShopController::class,'getCustomersByShop']);
Route::get('/shop/{shopid}/employee',[ShopController::class,'getEmployeesByShop']);
Route::get('/shop/{shopid}/orderscount', [OrderController::class, 'geOrderCountByShop']);
Route::get('/shop/{shopid}/gettotalprice', [OrderController::class, 'getTotalPriceByShop']);
Route::get('/shop/{shopid}/getcurrentprofit', [OrderController::class, 'getCurrentProfitByShop']);
// -----------
// buat cabang dari akun master lalu buat masing-masing cabang shop
Route::post('/branch',[BranchController::class,'store']);
//------------

Route::get('test',function(){
    $res = \App\Models\User::with('branches')->find(2);
    return $res;
});
