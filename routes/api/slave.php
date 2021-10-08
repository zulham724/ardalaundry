<?php

use App\Http\Controllers\API\master\OrderController as MasterOrderController;
use App\Http\Controllers\API\slave\BranchController;
use App\Http\Controllers\API\slave\OrderController;
use App\Http\Controllers\API\slave\PackageUserController;
use App\Http\Controllers\API\slave\ServiceController;
use App\Http\Controllers\API\slave\ShopController;
use App\Http\Controllers\API\slave\UserController;
use App\Http\Controllers\API\slave\ServiceCategoryController;
use App\Http\Controllers\API\slave\CustomerController;
use App\Http\Controllers\API\slave\EmployeeController;
use App\Http\Controllers\API\slave\OrderStatusController;
use App\Http\Controllers\API\slave\PaymentController;


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

Route::get('/user', function (Request $request) {
    return $request->user()->load('shop');
});



Route::get('/shop/{shopid}/employees', [ShopController::class, 'getEmployeesByShop']);
Route::post('/shop/addemployee', [ShopController::class, 'add_employee']);
Route::post('/shop/deleteEmployee/{employeeid}', [ShopController::class, 'delete_employee']);
Route::post('/shop/editEmployee/{employeeid}', [ShopController::class, 'edit_employee']);



Route::get('/shop/{shopid}/customers', [ShopController::class, 'getCustomersByShop']);


Route::get('/shop/{shopid}/getServicesByShop', [ServiceController::class, 'getServicesByShop']);
Route::get('/shop/getServiceCategories', [ServiceCategoryController::class, 'index']);
Route::post('/shop/addService', [ServiceController::class, 'add_service']);
Route::post('/shop/deleteService', [ServiceController::class, 'delete_service']);

Route::get('/shop/{shopid}/getOrdersByShop', [OrderController::class, 'getOrdersByShop']);

Route::post('shop/addOrder', [OrderController::class, 'store']);

Route::post('shop/order/{orderid}/payment', [MasterOrderController::class, 'payment']);

Route::apiResources([
    'service' => ServiceController::class,
    'customer' => CustomerController::class,
    'employee' => EmployeeController::class,
    'order' => OrderController::class,
    'payment' => PaymentController::class,
    'orderstatus' => OrderStatusController::class,
]);
