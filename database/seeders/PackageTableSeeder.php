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
        $package = Package::firstOrNew(['name' => 'Paket Reguler']);
        if (!$package->exists) {
            $package->fill([
                'price' => '100',
            ])->save();
        }

        $package = Package::firstOrNew(['name' => 'Paket Premium']);
        if (!$package->exists) {
            $package->fill([
                'price' => '200',
            ])->save();
        }

        $package = Package::firstOrNew(['name' => 'Paket Enterpreneur']);
        if (!$package->exists) {
            $package->fill([
                'price' => '300',
            ])->save();
        }
    }
}
