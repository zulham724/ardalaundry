<?php
use App\Http\Controllers\API\admin\ModuleContentController;
use App\Http\Controllers\API\admin\ModuleController;
use App\Http\Controllers\API\admin\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/user/{id}/get-free-package', [UserController::class, 'getFreePackage']);
Route::get('/user/{id}/rollback-package', [UserController::class, 'rollbackPackage']);

Route::apiResources([
    'module' => ModuleController::class,
    'module-content' => ModuleContentController::class,
]);
