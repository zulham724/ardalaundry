<?php

use App\Http\Controllers\API\slave\BranchController;
use App\Http\Controllers\API\slave\OrderController;
use App\Http\Controllers\API\slave\PackageUserController;
use App\Http\Controllers\API\slave\ServiceController;
use App\Http\Controllers\API\slave\ShopController;
use App\Http\Controllers\API\slave\UserController;

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

Route::get('/shop/{shopid}/employee', [ShopController::class, 'getEmployeesByShop']);
