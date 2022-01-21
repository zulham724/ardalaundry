<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderService extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function status()
    {
        return $this->belongsTo('App\Models\ServiceStatus', 'service_status_id', 'id');
    }

  
}
