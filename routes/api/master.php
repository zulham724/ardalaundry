<?php

use App\Http\Controllers\API\master\BranchController;
use App\Http\Controllers\API\master\PackageUserController;
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
    return $request->user();
});

Route::get('/getsubscribestatus',[PackageUserController::class,'getsubscribestatus']);

Route::get('/shops',[ShopController::class,'index']);
Route::get('/branches',[UserController::class,'branches']);
