<?php

use App\Http\Controllers\API\ModuleController;
use App\Http\Controllers\API\ModuleContentController;
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

Route::group(['middleware'=>'auth:api'],function(){

    Route::get('/user',function(Request $request){
        return $request->user();
    });

   Route::apiResources([
       'module' => ModuleController::class,
       'module-content' => ModuleContentController::class,
   ]);
});
