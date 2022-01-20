<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddServiceStatusIdInOrderServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_services', function (Blueprint $table) {
            //
            $table->foreignId('service_status_id')->nullable()
                ->constrained()
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_services', function (Blueprint $table) {
            //
            $table->dropForeign(['service_status_id']);
            $table->dropColumn('service_status_id');
        });
    }
}
