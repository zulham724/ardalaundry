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

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Meter']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 3,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Pairs']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 4,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Meter Persegi']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 5,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Dudukan']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 6,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Potong']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 7,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Jasa']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 8,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Load']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 9,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Coin']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 10,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Galon']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 11,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Set']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 12,
            ])->save();
        }

        $service_unit = ServiceUnit::firstOrNew(["name" => 'Cm']);
        if (!$service_unit->exists) {
            $service_unit->fill([
                'id' => 13,
            ])->save();
        }
    }
}
