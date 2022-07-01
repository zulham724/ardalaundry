<?php

use App\Http\Controllers\API\master\AffiliateController;
use App\Http\Controllers\API\master\AttendanceController;
use App\Http\Controllers\API\master\BranchController;
use App\Http\Controllers\API\master\CommentController;
use App\Http\Controllers\API\master\CustomerController;
use App\Http\Controllers\API\master\EmployeeController;
use App\Http\Controllers\API\master\OrderController;
use App\Http\Controllers\API\master\PackageController;
use App\Http\Controllers\API\master\PackageUserController;
use App\Http\Controllers\API\master\PaymentController;
use App\Http\Controllers\API\master\PostController;
use App\Http\Controllers\API\master\ProductController;
use App\Http\Controllers\API\master\ServiceCategoryController;
use App\Http\Controllers\API\master\ServiceController;
use App\Http\Controllers\API\master\ServiceUnitController;
use App\Http\Controllers\API\master\ShopController;
// use App\Http\Controllers\API\slave\ProductController;
use App\Http\Controllers\API\master\ShopPaymentVendorController;
use App\Http\Controllers\API\master\ShopServiceCategoryController;
use App\Http\Controllers\API\master\UserController;
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

Route::post('/register', [UserController::class, 'register']);

Route::middleware(['auth:api', 'checkifmaster'])->get('/user', [UserController::class, 'login']);

// Route untuk cek affiliate code
Route::get('/get-user-affiliate-code/{affiliate_code}', [AffiliateController::class, 'getUserByAffiliateCode']);


Route::group([
    'middleware' => ['auth:api'],
], function () {

    Route::apiResources([
        'branch' => BranchController::class,
        'branch_service' => ServiceController::class,
        'branch_employee' => EmployeeController::class,
        'branch_customer' => CustomerController::class,
        'branch_service_category' => ServiceCategoryController::class,
        'master_payment' => PaymentController::class,
        'affiliate' => AffiliateController::class,
        'attendance' => AttendanceController::class,
        'post' => PostController::class,
        'shops.payment_vendors' => ShopPaymentVendorController::class,
        'shops.servicecategories' => ShopServiceCategoryController::class,
        // 'product' => ProductController::class,
    ]);

    Route::post('/inputnumberphone', [UserController::class, 'add_wa_number']);

    Route::get('/totalorders', [OrderController::class, 'totalOrders']);
    Route::get('/profit', [OrderController::class, 'getProfit']);
    Route::get('/growth', [OrderController::class, 'getGrowth']);
    Route::get('/ordercountbymonths', [OrderController::class, 'orderCountByMonths']);
    Route::get('/ordercountbranchbymonth/{shopid}', [OrderController::class, 'orderCountBranchByMonth']);
    Route::get('/paymentcountbymonths', [OrderController::class, 'paymentCountByMonths']);
    Route::get('/branchpaymentcountbymonth/{shopid}', [OrderController::class, 'branchPaymentCountByMonth']);
    Route::get('/ordercountbymonthseachbranches', [OrderController::class, 'orderCountByMonthsEachBranches']);
    Route::get('/paymentcountbymonthseachbranches', [OrderController::class, 'paymentCountByMonthsEachBranches']);

    Route::get('/getproductbyshop', [ProductController::class, 'getProductByShop']);
    Route::get('/{shopid}/getproducts', [ProductController::class, 'getAnotherProducts']);
    Route::get('/getsubscribestatus', [PackageUserController::class, 'getsubscribestatus']);

    Route::get('product/{id}/like', [ProductController::class, 'like']);
    Route::get('product/{id}/dislike', [ProductController::class, 'dislike']);
    Route::post('/deleteimage', [ProductController::class, 'deleteImage']);
    Route::post('/addimage', [ProductController::class, 'addImage']);

    Route::get('/slaves', [UserController::class, 'slaves']);
    Route::get('/shops', [ShopController::class, 'index']);
    Route::get('/branches', [UserController::class, 'branches']);
    Route::get('/slave/{shopid}/services', [ServiceController::class, 'getServiceBySlave']);

    Route::get('/slave/{shopid}/servicecategories', [ServiceCategoryController::class, 'getServiceCategoryBySlave']);

    Route::get('/servicecategories/{id}/byid', [ServiceCategoryController::class, 'show']);

    Route::post('/servicecategories/{id}/update', [ServiceCategoryController::class, 'update']);

// ROute untuk mengambil data poduk yanng di sukai
    Route::get('/get_liked_product_by_user/{userid}', [ProductController::class, 'getLikedProductByUser']);

    Route::get('/slave/{slaveid}/orders', [OrderController::class, 'getOrdersBySlave']);
    Route::get('/shop/{shopid}/customers', [ShopController::class, 'getCustomersByShop']);
    Route::get('/shop/{shopid}/employee', [ShopController::class, 'getEmployeesByShop']);

    Route::get('/shop/{shopid}/orderscount', [OrderController::class, 'geOrderCountByShop']);
    Route::get('/shop/{shopid}/gettotalprice', [OrderController::class, 'getTotalPriceByShop']);
    Route::get('/shop/{shopid}/getcurrentprofit', [OrderController::class, 'getCurrentProfitByShop']);
// -----------
    Route::post('/branch', [BranchController::class, 'store']);
//------------

//Packages
    Route::get('/packages', [PackageController::class, 'index']);
    Route::post('/packages/payment', [PaymentController::class, 'store']);
    Route::get('/payments/history', [PaymentController::class, 'show']);

    Route::get('test', function () {
        $res = \App\Models\User::with('packages')->find(2);
        return $res;
    });

// Route untuk update avatar
    Route::post('/update-avatar/{id}', [UserController::class, 'updateAvatar']);

// Route untuk update profile
    Route::post('/update-profile/{id}', [UserController::class, 'updateProfile']);

// Route untuk ganti password
    Route::post('/change-password', [UserController::class, 'changePassword']);

// Route untuk menghapus branch
    Route::post('/branch/delete-branch', [BranchController::class, 'deleteBranch']);

// Route untuk mengambil jumlah pengeluaran cabang
    Route::get('/payment/get-spending/{shopid}', [PaymentController::class, 'getSpending']);

    Route::get('/payment/get-spending/{shopid}/sum', [PaymentController::class, 'getSpendingSum']);

// Route untuk mengambil jumlah pemasukan cabang
    Route::get('/payment/get-income/{shopid}', [PaymentController::class, 'getPayment']);

    Route::get('/payment/get-income/{shopid}/sum', [PaymentController::class, 'getPaymentSum']);

// Route untuk mengambil total sum cabang
    Route::get('/payment/get-total-sum/{shopid}', [PaymentController::class, 'getTotalSum']);

//CommentPost
    Route::post('/addcomment', [CommentController::class, 'store']);
    Route::get('/comment/{commentid}/like', [CommentController::class, 'like']);
    Route::get('/comment/{commentid}/dislike', [CommentController::class, 'dislike']);

    Route::get('/getpostbypostid/{postid}', [PostController::class, 'getPostByPostId']);

    Route::post('/updateproducts/{productid}', [ProductController::class, 'updatetest']);
    Route::get('/get_service_units', [ServiceUnitController::class, 'index']);

//Post
    Route::get('/get_profile_by_id/{userid}', [UserController::class, 'getProfileById']);
    Route::get('/post/{id}/like', [PostController::class, 'like']);
    Route::get('/post/{id}/dislike', [PostController::class, 'dislike']);

    Route::apiResource('product', ProductController::class);

    Route::get('/getlikedpostbyuser/{userid}', [PostController::class, 'getLikedPostByUser']);

    Route::get('/getpostbyuser/{userid}', [PostController::class, 'getPostByUser']);
// ROute untuk mengambil data poduk yanng di sukai
    Route::get('/get_liked_product_by_user/{userid}', [ProductController::class, 'getLikedProductByUser']);

// Route untuk search product liked
    Route::post('/search_liked_product_by_user', [ProductController::class, 'searchLikedProductByUser']);
// Route untuk ambil semua user
    Route::get('/user/get-all-user', [UserController::class, 'getAllProfile']);
// GET Route untuk search user post dengan parameter key
    Route::get('/user/search-user-post/{key}', [UserController::class, 'searchUserPostByKey']);

    Route::post('/orderproduct', [OrderController::class, 'order_product']);

});
