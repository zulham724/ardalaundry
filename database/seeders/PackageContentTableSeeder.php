<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PackageContents;

class PackageContentTableSeeder extends Seeder
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
                'package_id' => 1, 'value' => '1 Cabang'
            ],
            [
                'package_id' => 1, 'value' => 'unlimited transaksi'
            ],
            [
                'package_id' => 1, 'value' => 'unlimited employee'
            ],
            [
                'package_id' => 1, 'value' => 'unlimited customer'
            ],
            [
                'package_id' => 1, 'value' => '3 Paket'
            ]
        ];

        foreach ($arrays as $a => $array) {
            # code...
            $packageContent = PackageContents::firstOrNew($array);
            if (!$packageContent->exists) {
                $packageContent->save();
            }
        }

        $arrays2 = [
            [
                'package_id' => 2, 'value' => '5 Cabang'
            ],
            [
                'package_id' => 2, 'value' => 'unlimited transaksi'
            ],
            [
                'package_id' => 2, 'value' => 'unlimited employee'
            ],
            [
                'package_id' => 2, 'value' => 'unlimited customer'
            ],
            [
                'package_id' => 2, 'value' => '10 Paket'
            ]
        ];

        foreach ($arrays2 as $a => $array) {
            # code...
            $packageContent = PackageContents::firstOrNew($array);
            if (!$packageContent->exists) {
                $packageContent->save();
            }
        }

        $arrays3 = [
                [
                    'package_id' => 3, 'value' => '10 Cabang'
                ],
                [
                    'package_id' => 3, 'value' => 'unlimited transaksi'
                ],
                [
                    'package_id' => 3, 'value' => 'unlimited employee'
                ],
                [
                    'package_id' => 3, 'value' => 'unlimited customer'
                ],
                [
                    'package_id' => 3, 'value' => 'unlimited paket'
                ]
            ];

        foreach ($arrays3 as $a => $array) {
            # code...
            $packageContent = PackageContents::firstOrNew($array);
            if (!$packageContent->exists) {
                $packageContent->save();
            }
        }
    }
}
