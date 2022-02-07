<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use TCG\Voyager\Models\Role;

class RolesTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     */
    public function run()
    {
        $role = Role::firstOrNew(['name' => 'admin']);
        if (!$role->exists) {
            $role->fill([
                'id' => 1,
                'display_name' => __('voyager::seeders.roles.admin'),
            ])->save();
        }

        $role = Role::firstOrNew(['name' => 'user']);
        if (!$role->exists) {
            $role->fill([
                'id' => 2,
                'display_name' => __('voyager::seeders.roles.user'),
            ])->save();
        }

        $role = Role::firstOrNew(['name' => 'master']);
        if (!$role->exists) {
            $role->fill([
                'id' => 3,
                'display_name' => 'Master Akun',
            ])->save();
        }

        $role = Role::firstOrNew(['name' => 'slave']);
        if (!$role->exists) {
            $role->fill([
                'id' => 4,
                'display_name' => 'Cabang',
            ])->save();
        }

        $role = Role::firstOrNew(['name' => 'employee']);
        if (!$role->exists) {
            $role->fill([
                'id' => 5,
                'display_name' => 'Akun Karyawan',
            ])->save();
        }

        $role = Role::firstOrNew(['name' => 'customer']);
        if (!$role->exists) {
            $role->fill([
                'id' => 6,
                'display_name' => 'Akun Pelanggan',
            ])->save();
        }
    }
}
