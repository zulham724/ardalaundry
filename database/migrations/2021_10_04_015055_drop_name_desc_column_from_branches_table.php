<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropNameDescColumnFromBranchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        if (Schema::hasColumn('branches', 'name')) {
            Schema::table('branches', function (Blueprint $table) {
                //
                $table->dropColumn('name');
            });
        }

        if (Schema::hasColumn('branches', 'description')) {
            Schema::table('branches', function (Blueprint $table) {
                //
                $table->dropColumn('description');
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
        if (!Schema::hasColumn('branches', 'name')) {
            Schema::table('branches', function (Blueprint $table) {
                //
                $table->string('name');
            });
        }

        if (!Schema::hasColumn('branches', 'description')) {
            Schema::table('branches', function (Blueprint $table) {
                //
                $table->text('description')->nullable();
            });
        }

        
    }
}
