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

Route::group(['middleware' => 'auth:api'], function () {

    Route::get('/user', function (Request $request) {
        if ($request->user()->role_id == 3) {
            $res = $request->user()
                ->loadCount(['slaves', 'orders'])
                ->load(['packages', 'active_package_user' => function ($query) {
                    $query->with('payment', 'package.package_limits', 'package.package_contents');
                }]);

            if ($res->active_package_user !== null) {
                foreach ($res->active_package_user->package->package_limits as $limit) {
                    if ($res->{$limit->entity} > $limit->limit) {
                        $res->apiStatus = "Mati";
                    } else {
                        $res->apiStatus = "Hidup";
                    }
                }
                if ($res->active_package_user) {
                    if (new \DateTime($res->active_package_user->expired_date) > new \DateTime() && $res->{$limit->entity} < $limit->limit) {
                        $res->apiStatus = "Hidup";
                    } else {
                        $res->apiStatus = "Mati";
                    }
                } else {
                    $res->apiStatus = "Mati";
                }
            } else {
                $res->apiStatus = "Mati";
            }

            return response()->json($res);
        } else if ($request->user()->role_id == 4) {
            return $request->user()->load(['shop', 'master', 'followers', 'following']);
        }
    });

    Route::apiResources([
        'module' => ModuleController::class,
        'module-content' => ModuleContentController::class,
    ]);
});
