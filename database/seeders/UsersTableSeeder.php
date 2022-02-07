<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        // if (User::count() == 0) {
        //     $role = Role::where('name', 'admin')->firstOrFail();

        //     User::create([
        //         'name'           => 'Admin',
        //         'email'          => 'admin@admin.com',
        //         'password'       => bcrypt('password'),
        //         'remember_token' => Str::random(60),
        //         'role_id'        => $role->id,
        //     ]);
        // }

        $user = User::firstOrNew(['name' => 'admin']);
        if (!$user->exists) {
            $user->fill([
                'email'          => 'admin@admin.com',
                'password'       => bcrypt('password'),
                'remember_token' => Str::random(60),
                'role_id'        => 1,
            ])->save();
        }

        $user = User::firstOrNew(['name' => 'master1']);
        if (!$user->exists) {
            $user->fill([
                'email' => 'master1@master1.com',
                'password' => bcrypt('password'),
                'remember_token' => Str::random(60),
                'role_id' => 3,
            ])->save();
        }

        $user = User::firstOrNew(['name' => 'Slave 1']);
        if (!$user->exists) {
            $user->fill([
                'email' => 'slave1@slave1.com',
                'password' => bcrypt('password'),
                'remember_token' => Str::random(60),
                'role_id' => 4,
            ])->save();
        }
    }
}
