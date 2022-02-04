<?php

use App\Http\Controllers\API\master\OrderController as MasterOrderController;
use App\Http\Controllers\API\slave\AttendanceController;
use App\Http\Controllers\API\slave\BranchController;
use App\Http\Controllers\API\slave\CommentController;
use App\Http\Controllers\API\slave\OrderController;
use App\Http\Controllers\API\slave\PackageUserController;
use App\Http\Controllers\API\slave\ServiceController;
use App\Http\Controllers\API\slave\ShopController;
use App\Http\Controllers\API\slave\UserController;
use App\Http\Controllers\API\slave\ServiceCategoryController;
use App\Http\Controllers\API\slave\CustomerController;
use App\Http\Controllers\API\slave\EmployeeController;
use App\Http\Controllers\API\slave\LikeController;
use App\Http\Controllers\API\slave\OrderStatusController;
use App\Http\Controllers\API\slave\PaymentController;
use App\Http\Controllers\API\slave\PostController;
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
Route::post('/user/order/{orderid}/payment', [OrderController::class, 'user_payment']);
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

Route::get('/filterOrdersIn/{datefrom}/{dateto}', [OrderController::class, 'filter_orders_in']);
Route::get('/filterOrdersOut/{datefrom}/{dateto}', [OrderController::class, 'filter_orders_out']);
Route::post('shop/order/{orderid}/payment', [MasterOrderController::class, 'payment']);
Route::post('/shop/order/report', [OrderController::class, 'order_report']);
Route::get('/shop/{shopid}/getOrdersReportByShop', [OrderController::class, 'getOrdersReportByShop']);
Route::get('/shop/{shopid}/queueorder', [OrderController::class, 'getQueueOrderByShop']);
Route::get('/getorder', [OrderController::class, 'get_order']);
Route::post('/shop/searchAttendances', [AttendanceController::class, 'searchAttendance']);
//chart
Route::get('shop/orderscountbymonth/{shopid}', [OrderController::class, 'getOrdersCountByMonth']);
Route::get('shop/paymentscountbymonth/{shopid}', [OrderController::class, 'getPaymentsCountByMonth']);

//service
Route::get('/services', [ServiceController::class, 'index']);
Route::post('/deleteservices', [ServiceController::class, 'delete_service']);
Route::get('/getservices/{categoryid}', [ServiceController::class, 'getServicesBycategory']);
Route::post('/getOrderServiceStatus', [OrderController::class, 'getServiceStatusByOrder']);
Route::post('/updateStatusService', [ServiceController::class, 'updateStatus']);

Route::post('/deletecategories', [ServiceCategoryController::class, 'delete_categories']);
Route::post('/updatecustomer', [CustomerController::class, 'update']);
Route::post('/updateclothesname/{categoryid}', [ServiceCategoryController::class, 'updateName']);
Route::post('/updatepackagesname/{paketid}', [ServiceController::class, 'updateName']);


// Route::post('/update_employee', [EmployeeController::class, 'update']);
Route::post('/searchOrders', [OrderController::class, 'searchOrders']);
Route::post('/updateorderstatus', [OrderController::class, 'updateStatusOrder']);
//Income
Route::get('/getorderbymonth/{shopid}', [OrderController::class, 'getOrdersShopByMonth']);
Route::get('/getorderbyweek/{shopid}', [OrderController::class, 'getOrdersShopByWeek']);
Route::get('/getorderbyday/{shopid}', [OrderController::class, 'getOrdersShopByDay']);
Route::get('/getCountProfitOrdersByDay/{shopid}', [OrderController:: class, 'CountProfitOrdersShopByDay']);
Route::get('/getCountProfitOrdersByWeek/{shopid}', [OrderController::class, 'CountProfitOrdersShopByWeek']);
Route::get('/getCountProfitOrdersByMonth/{shopid}', [OrderController::class, 'CountProfitOrdersShopByMonth']);
Route::post('/attendance/out', [AttendanceController::class, 'attendanceOut']);
Route::post('/deletecustomers', [CustomerController::class, 'destroy']);
Route::get('/detailattendance/{userid}', [AttendanceController::class, 'detailAttendance']);
// route ini untuk memberikan data array attendances berdasarkan di karyawan
Route::get('attendance/getemployeeattendances/{employeeid}',[AttendanceController::class, 'getEmployeeAttendances']);

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
    'post' => PostController::class,
]);


//customer
Route::get('/customer/{customerid}/order', [OrderController::class, 'getOrdersCustomer']);

// Attendance
Route::get('/attendance/monthlyattendancereport1/{shopId}', [AttendanceController::class, 'monthlyAttendanceReport1']);

//Post
Route::get('/post/{id}/like', [PostController::class, 'like']);
Route::get('/post/{id}/dislike', [PostController::class, 'dislike']);
    //CommentPost
Route::post('/addcomment', [CommentController::class, 'store']);
Route::get('/comment/{commentid}/like', [CommentController::class, 'like']);
Route::get('/comment/{commentid}/dislike', [CommentController::class, 'dislike']);