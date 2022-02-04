<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModuleContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('module_contents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('module_id')
            ->constrained()
            ->onUpdate('cascade')
            ->onDelete('cascade');
            $table->string('tittle');
            $table->text('description');
            $table->bigInteger('duration')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('module_contents');
    }
}
