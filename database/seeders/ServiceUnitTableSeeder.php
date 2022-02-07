<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\ServiceUnit;


class ServiceUnitTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
       $service_unit = ServiceUnit::firstOrNew(["name" => 'Kg']);
       if(!$service_unit->exists){
        $service_unit->fill([
            'id' => 1,
        ])->save();
       }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Pcs']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 2,
            ])->save();
        }
    }
}
