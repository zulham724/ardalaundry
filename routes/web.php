<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/employee/{employeeid}/barcode', function ($user_id) {
    return view('barcode', ['user' => \App\Models\User::findOrFail($user_id)]);
});

Route::get('/test', fn () => 'asd');

// Route::get('/command', function () {
//     $data = ['User'];
//     foreach ($data as $val) {
//         // Artisan::call("make:seeder", ['name' => $val . "TableSeeder"]);
//         // Artisan::call("make:model", ['name' => $val]);
//         // Artisan::call("make:controller", ['name' => $val . "Controller", '--resource' => true, '--model'=>$val]);
//         Artisan::call("make:controller", ['name' => "API\\master\\" . $val . "Controller", '--api' => true, '--model'=>$val]);
//         Artisan::call("make:controller", ['name' => "API\\slave\\" . $val . "Controller", '--api' => true, '--model'=>$val]);
//     }
// });

