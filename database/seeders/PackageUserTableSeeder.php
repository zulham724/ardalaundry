<?php

namespace Database\Seeders;

use App\Models\PackageUser;
use Illuminate\Database\Seeder;

class PackageUserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $packageUser = PackageUser::firstOrNew(['user_id' => 2, 'package_id' => 1]);

        if(!$packageUser->exists){
            $packageUser->save();
        }
    }
}
