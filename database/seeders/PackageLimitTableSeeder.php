<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PackageLimit;

class PackageLimitTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $arrays = [
            [
                'package_id' => 1,
                'entity' => 'slaves_count',
                'limit' => 1
            ],
            [
                'package_id' => 1,
                'entity' => 'services_count',
                'limit' => 3
            ]
        ];

        foreach ($arrays as $a => $array) {
            # code...
            $packageLimit = PackageLimit::firstOrNew($array);
            if(!$packageLimit->exists){
                $packageLimit->save();
            }
        }

        $arrays2 = [
            [
                'package_id' => 2,
                'entity' => 'slaves_count',
                'limit' => 5
            ],
            [
                'package_id' => 2,
                'entity' => 'services_count',
                'limit' => 10
            ]
        ];

        foreach ($arrays2 as $a => $array) {
            # code...
            $packageLimit = PackageLimit::firstOrNew($array);
            if(!$packageLimit->exists){
                $packageLimit->save();
            }
        }

         $arrays3 = [
            [
                'package_id' => 3,
                'entity' => 'slaves_count',
                'limit' => 10
            ],
        ];

        foreach ($arrays3 as $a => $array) {
            # code...
            $packageLimit = PackageLimit::firstOrNew($array);
            if(!$packageLimit->exists){
                $packageLimit->save();
            }
        }
    }
}
