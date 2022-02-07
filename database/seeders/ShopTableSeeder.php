<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Shop;

class ShopTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $shop = Shop::firstOrNew(['user_id' => 3]);

        if(!$shop->exists){
            $shop->fill([
                'name' => 'Laundry Sukses',
            ])->save();
        }
    }
}
