<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Branch;

class BranchTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $branch = Branch::firstOrNew(['master_id' => 2, 'slave_id' => 3]);

        if(!$branch->exists){
            $branch->save();
        }
    }
}
