<?php

use App\Http\Controllers\API\master\BranchController;
use App\Http\Controllers\API\master\OrderController;
use App\Http\Controllers\API\master\PackageController;
use App\Http\Controllers\API\master\PackageUserController;
use App\Http\Controllers\API\master\PaymentController;
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
    $res = $request->user()->load(['packages']);
    if(count($res->packages)){
        if(new \DateTime($res->packages[0]['pivot']['expired_date']) > new \DateTime()){
            $res->apiStatus = "Hidup";
        } else {
            $res->apiStatus = "Mati";
        }
    } else {
        $res->apiStatus = "Mati";
    }
    return response()->json($res);
});

Route::get('/totalorders',[OrderController::class,'totalOrders']);
Route::get('/profit',[OrderController::class,'getProfit']);
Route::get('/growth',[OrderController::class,'getGrowth']);
Route::get('/ordercountbymonths',[OrderController::class,'orderCountByMonths']);
Route::get('/ordercountbranchbymonth/{shopid}', [OrderController::class, 'orderCountBranchByMonth']);
Route::get('/paymentcountbymonths',[OrderController::class,'paymentCountByMonths']);
Route::get('/branchpaymentcountbymonth/{shopid}', [OrderController::class, 'branchPaymentCountByMonth']);
Route::get('/ordercountbymonthseachbranches',[OrderController::class,'orderCountByMonthsEachBranches']);
Route::get('/paymentcountbymonthseachbranches',[OrderController::class,'paymentCountByMonthsEachBranches']);

Route::get('/getsubscribestatus',[PackageUserController::class,'getsubscribestatus']);

Route::get('/slaves',[UserController::class,'slaves']);
Route::get('/shops',[ShopController::class,'index']);
Route::get('/branches',[UserController::class,'branches']);
Route::get('/slave/{shopid}/services',[ServiceController::class,'getServiceBySlave']);

Route::get('/slave/{slaveid}/orders',[OrderController::class,'getOrdersBySlave']);
Route::get('/shop/{shopid}/customers',[ShopController::class,'getCustomersByShop']);
Route::get('/shop/{shopid}/employee',[ShopController::class,'getEmployeesByShop']);
Route::get('/shop/{shopid}/orderscount', [OrderController::class, 'geOrderCountByShop']);
Route::get('/shop/{shopid}/gettotalprice', [OrderController::class, 'getTotalPriceByShop']);
Route::get('/shop/{shopid}/getcurrentprofit', [OrderController::class, 'getCurrentProfitByShop']);
// -----------
Route::post('/branch',[BranchController::class,'store']);
//------------


//Packages
Route::get('/packages', [PackageController::class, 'index']);
Route::post('/packages/payment', [PaymentController::class, 'store']);
Route::get('/payments/history', [PaymentController::class, 'show']);

Route::get('test',function(){
    $res = \App\Models\User::with('branches')->find(2);
    return $res;
});
