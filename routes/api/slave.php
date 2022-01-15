<?php

use App\Http\Controllers\API\master\OrderController as MasterOrderController;
use App\Http\Controllers\API\slave\AttendanceController;
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
use App\Http\Controllers\API\slave\ServiceUnitController;
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
    if ($request->user()->hasRole('customer')) {
        return $request->user()->load('customer_shops');
    } else {
        return $request->user()->load('shop');
    }
});

Route::post('/user/register', [UserController::class, 'register_customer']);
Route::post('/user/update/{userid}', [UserController::class, 'update_customer']);
Route::post('/shop/user/{userid}', [UserController::class, 'update']);
Route::post('/user/order', [OrderController::class, 'user_orders']);
Route::post('/user/order/{orderid}/payment', [OrderController::class, 'user_payment']);
Route::get('/user/{userid}/getOrdersByCustomer', [OrderController::class, 'getOrdersByCustomer']);
Route::post('/shop/order/search', [OrderController::class, 'searchOrder']);


Route::get('/shop/{shopid}/employees', [ShopController::class, 'getEmployeesByShop']);
Route::post('/shop/addemployee', [ShopController::class, 'add_employee']);
Route::post('/shop/deleteEmployee/{employeeid}', [ShopController::class, 'delete_employee']);
Route::post('/shop/editEmployee/{employeeid}', [ShopController::class, 'edit_employee']);
Route::post('/shop/searchEmployee', [EmployeeController::class, 'searchEmployee']);



Route::get('/shop/{shopid}/customers', [ShopController::class, 'getCustomersByShop']);
Route::post('/shop/searchCustomer', [CustomerController::class, 'searchCustomer']);


Route::get('/shop/{shopid}/getServicesByShop', [ServiceController::class, 'getServicesByShop']);
Route::get('/shop/getServiceCategories', [ServiceCategoryController::class, 'index']);
Route::post('/shop/addService', [ServiceController::class, 'add_service']);
Route::post('/shop/deleteService', [ServiceController::class, 'delete_service']);

Route::get('/shop/{shopid}/getOrdersByShop', [OrderController::class, 'getOrdersByShop']);

Route::post('shop/addOrder', [OrderController::class, 'store']);

Route::post('shop/order/{orderid}/payment', [MasterOrderController::class, 'payment']);
Route::post('/shop/order/report', [OrderController::class, 'order_report']);
Route::get('/shop/{shopid}/getOrdersReportByShop', [OrderController::class, 'getOrdersReportByShop']);
Route::get('/shop/{shopid}/queueorder', [OrderController::class, 'getQueueOrderByShop']);
Route::post('/shop/order/accept', [OrderController::class, 'accept_order']);
Route::post('/shop/order/reject', [OrderController::class, 'reject_order']);

Route::post('/shop/searchAttendances', [AttendanceController::class, 'searchAttendance']);
//chart
Route::get('shop/orderscountbymonth/{shopid}', [OrderController::class, 'getOrdersCountByMonth']);
Route::get('shop/paymentscountbymonth/{shopid}', [OrderController::class, 'getPaymentsCountByMonth']);

//service
Route::get('/services/{categoryid}', [ServiceController::class, 'index']);



Route::apiResources([
    'service' => ServiceController::class,
    'customer' => CustomerController::class,
    'employee' => EmployeeController::class,
    'order' => OrderController::class,
    'payment' => PaymentController::class,
    'orderstatus' => OrderStatusController::class,
    'attendances' => AttendanceController::class,
    'serviceunits' => ServiceUnitController::class,
    'servicecategories' => ServiceCategoryController::class,
]);
