<?php

namespace Database\Seeders;

use App\Models\Package;
use Illuminate\Database\Seeder;

class PackageTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        // Package::truncate();
        $package = Package::firstOrNew(['name' => 'Paket Trial']);
        if (!$package->exists) {
            $package->fill([
                'price' => '0',
            ])->save();
        }

        $package = Package::firstOrNew(['name' => 'Paket Bisnis']);
        if (!$package->exists) {
            $package->fill([
                'price' => '200',
            ])->save();
        }

        $package = Package::firstOrNew(['name' => 'Paket ultimate']);
        if (!$package->exists) {
            $package->fill([
                'price' => '300',
            ])->save();
        }
    }
}
