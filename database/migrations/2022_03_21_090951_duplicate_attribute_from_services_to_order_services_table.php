<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DuplicateAttributeFromServicesToOrderServicesTable extends Migration
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
            $table->string('name')->nullable();
            $table->text('description')->nullable();
            $table->bigInteger('price')->default(0);
            $table->bigInteger('process_time')->nullable();
            $table->string('service_unit')->nullable();
            $table->string('category')->nullable();
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
            $table->dropColumn('name');
            $table->dropColumn('description');
            $table->dropColumn('price');
            $table->dropColumn('process_time');
            $table->dropColumn('service_unit');
            $table->dropColumn('category');

        });
    }
}
