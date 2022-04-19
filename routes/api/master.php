<?php

use App\Http\Controllers\API\master\AffiliateController;
use App\Http\Controllers\API\master\AttendanceController;
use App\Http\Controllers\API\master\BranchController;
use App\Http\Controllers\API\master\CustomerController;
use App\Http\Controllers\API\master\OrderController;
use App\Http\Controllers\API\master\PackageController;
use App\Http\Controllers\API\master\PackageUserController;
use App\Http\Controllers\API\master\PaymentController;
use App\Http\Controllers\API\master\ServiceController;
use App\Http\Controllers\API\master\ShopController;
use App\Http\Controllers\API\master\UserController;
use App\Http\Controllers\API\master\EmployeeController;
use App\Http\Controllers\API\master\ServiceCategory;
use App\Http\Controllers\API\master\ServiceCategoryController;
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

Route::middleware(['auth:api', 'checkifmaster'])->get('/user', [UserController::class, 'login']);

Route::get('/totalorders', [OrderController::class, 'totalOrders']);
Route::get('/profit', [OrderController::class, 'getProfit']);
Route::get('/growth', [OrderController::class, 'getGrowth']);
Route::get('/ordercountbymonths', [OrderController::class, 'orderCountByMonths']);
Route::get('/ordercountbranchbymonth/{shopid}', [OrderController::class, 'orderCountBranchByMonth']);
Route::get('/paymentcountbymonths', [OrderController::class, 'paymentCountByMonths']);
Route::get('/branchpaymentcountbymonth/{shopid}', [OrderController::class, 'branchPaymentCountByMonth']);
Route::get('/ordercountbymonthseachbranches', [OrderController::class, 'orderCountByMonthsEachBranches']);
Route::get('/paymentcountbymonthseachbranches', [OrderController::class, 'paymentCountByMonthsEachBranches']);

Route::get('/getsubscribestatus', [PackageUserController::class, 'getsubscribestatus']);

Route::get('/slaves', [UserController::class, 'slaves']);
Route::get('/shops', [ShopController::class, 'index']);
Route::get('/branches', [UserController::class, 'branches']);
Route::get('/slave/{shopid}/services', [ServiceController::class, 'getServiceBySlave']);

Route::get('/slave/{slaveid}/orders', [OrderController::class, 'getOrdersBySlave']);
Route::get('/shop/{shopid}/customers', [ShopController::class, 'getCustomersByShop']);
Route::get('/shop/{shopid}/employee', [ShopController::class, 'getEmployeesByShop']);

Route::get('/shop/{shopid}/orderscount', [OrderController::class, 'geOrderCountByShop']);
Route::get('/shop/{shopid}/gettotalprice', [OrderController::class, 'getTotalPriceByShop']);
Route::get('/shop/{shopid}/getcurrentprofit', [OrderController::class, 'getCurrentProfitByShop']);
// -----------
Route::post('/branch', [BranchController::class, 'store']);
//------------
Route::post('/register', [UserController::class, 'register']);

//Packages
Route::get('/packages', [PackageController::class, 'index']);
Route::post('/packages/payment', [PaymentController::class, 'store']);
Route::get('/payments/history', [PaymentController::class, 'show']);

Route::get('test', function () {
    $res = \App\Models\User::with('packages')->find(2);
    return $res;
});

// Route untuk cek affiliate code
Route::get('/get-user-affiliate-code/{affiliate_code}', [AffiliateController::class, 'getUserByAffiliateCode']);

// Route untuk update avatar
Route::post('/update-avatar/{id}', [UserController::class, 'updateAvatar']);

// Route untuk update profile
Route::post('/update-profile/{id}', [UserController::class, 'updateProfile']);

// Route untuk ganti password
Route::post('/change-password', [UserController::class, 'changePassword']);

// Route untuk menghapus branch
Route::post('/branch/delete-branch', [BranchController::class, 'deleteBranch']);


Route::apiResources([
    'branch' => BranchController::class,
    'branch_service' => ServiceController::class,
    'branch_employee' => EmployeeController::class,
    'branch_customer' => CustomerController::class,
    'branch_service_category' => ServiceCategoryController::class,
    'master_payment' => PaymentController::class,
    'affiliate' => AffiliateController::class,
    'attendance' => AttendanceController::class,
]);
