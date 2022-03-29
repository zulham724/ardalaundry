<?php
use App\Http\Controllers\API\admin\ModuleContentController;
use App\Http\Controllers\API\admin\ModuleController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources([
    'module' => ModuleController::class,
    'module-content' => ModuleContentController::class,
]);
