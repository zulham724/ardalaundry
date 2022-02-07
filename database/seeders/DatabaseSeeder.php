<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        $this->call([
            // CategoryStatusSeeder::class,
            RolesTableSeeder::class,
            UsersTableSeeder::class,
            BranchTableSeeder::class,
            ShopTableSeeder::class,
            PackageTableSeeder::class,
            PackageContentTableSeeder::class,
            PackageLimitTableSeeder::class,
            PackageUserTableSeeder::class,
            ServiceUnitTableSeeder::class,
        ]);
    }
}
