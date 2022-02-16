<?php

namespace Database\Seeders;

use App\Models\ServiceStatus;
use Illuminate\Database\Seeder;

class ServiceStatusTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $service_status = ServiceStatus::firstOrNew(["name" => "Pending"]);

        if(!$service_status->exists){
            $service_status->fill([
                'id' => 1,
            ])->save();
        }

        $service_status = ServiceStatus::firstOrNew(["name" => "OnProcess"]);

        if (!$service_status->exists) {
            $service_status->fill([
                'id' => 2,
            ])->save();
        }

        $service_status = ServiceStatus::firstOrNew(["name" => "Completed"]);

        if (!$service_status->exists) {
            $service_status->fill([
                'id' => 3,
            ])->save();
        }
    }
}
