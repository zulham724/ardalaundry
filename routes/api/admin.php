<?php

use App\Http\Controllers\API\admin\ModuleContentController;
use App\Http\Controllers\API\admin\ModuleController;
use App\Http\Controllers\API\admin\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

// Fungsi untuk mengambil module berdasarkan id
Route::get('/module/get-module-by-id/{id}', [ModuleController::class,  'get_module_by_id']);

// Fungsi untuk mengupdate image pada module
Route::post('/module/update-image-module/{id}', [ModuleController::class,  'update_image_module']);

// Fungsi untuk menghapus image pada module
Route::post('/module/delete-image-module/{id}', [ModuleController::class,  'delete_image_module']);

// Fungsi untuk menghapus thumbnail content pada module_content
Route::post('/module-content/delete-thumbnail-content/{id}', [ModuleContentController::class,  'delete_thumbnail_content']);

// Fungsi untuk menghapus image content pada module_content
Route::post('/module-content/delete-image-content/{id}', [ModuleContentController::class,  'delete_image_content']);

// Fungsi untuk menghapus video content pada module_content
Route::post('/module-content/delete-video-content/{id}', [ModuleContentController::class,  'delete_video_content']);

// Fungsi untuk mengambil module content berdasarkan id
Route::get('/module-content/get-module-content-by-id/{id}', [ModuleContentController::class,  'get_module_content_by_id']);

// Fungsi untuk mengupdate module content
Route::post('/module-content/update-module-content/{id}', [ModuleContentController::class,  'update']);

// Fungsi untuk membuat module content
Route::post('/module-content/add-new-module-content', [ModuleContentController::class,  'store']);

Route::apiResources([
    'module' => ModuleController::class,
    'module-content' => ModuleContentController::class,
]);
