<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeStatusInOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasColumn('orders', 'status')) {
            Schema::table('orders', function (Blueprint $table) {
                //
                $table->dropColumn('status');
            });
        }
        if (!Schema::hasColumn('orders', 'order_status_id')) {
            Schema::table('orders', function (Blueprint $table) {
                $table->unsignedBigInteger('order_status_id')->nullable();
                $table->foreign('order_status_id')->references('id')->on('order_statuses')->onDelete('cascade')->onUpdate('cascade');
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
        if (Schema::hasColumn('orders', 'order_status_id')) {
            Schema::table('orders', function (Blueprint $table) {
                //
                $table->dropForeign(['order_status_id']);
                $table->dropColumn('order_status_id');
            });
        }
        if (!Schema::hasColumn('orders', 'status')) {
            Schema::table('orders', function (Blueprint $table) {
                $table->string('status');
            });
        }
    }
}
