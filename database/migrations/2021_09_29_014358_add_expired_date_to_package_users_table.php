<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddExpiredDateToPackageUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasColumn('package_users', 'expired_date')) {
            Schema::table('package_users', function (Blueprint $table) {
                //
                $table->timestamp('expired_date')->nullable();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        if (Schema::hasColumn('package_users', 'expired_date')) {
            Schema::table('package_users', function (Blueprint $table) {
                //
                $table->dropColumn('expired_date');
            });
        }
    }
}
