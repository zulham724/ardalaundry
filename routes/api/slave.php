<?php

use App\Http\Controllers\API\slave\BranchController;
use App\Http\Controllers\API\slave\OrderController;
use App\Http\Controllers\API\slave\PackageUserController;
use App\Http\Controllers\API\slave\ServiceController;
use App\Http\Controllers\API\slave\ShopController;
use App\Http\Controllers\API\slave\UserController;
use App\Http\Controllers\API\slave\ServiceCategoryController;


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
Route::get('/shop/add-customer', [ShopController::class, 'add_customer']);


Route::get('/shop/{shopid}/getServicesByShop', [ServiceController::class, 'getServicesByShop']);
Route::get('/shop/getServiceCategories', [ServiceCategoryController::class, 'index']);


