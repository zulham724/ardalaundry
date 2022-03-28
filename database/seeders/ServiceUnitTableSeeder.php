<?php

namespace Database\Seeders;

use App\Models\ServiceUnit;
use Illuminate\Database\Seeder;

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
        if (!$service_unit->exists) {
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

        $service_unit = ServiceUnit::firstOrNew(["name" => 'm2']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 3,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Dudukan']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 4,
            ])->save();
        }

    }
}
