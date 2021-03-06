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

    public function order()
    {
        return $this->belongsTo('App\Models\Order');
    }

    public function service()
    {
        return $this->belongsTo('App\Models\Service');
    }

    public function pre_order_photo()
    {
        return $this->morphOne('App\Models\File', 'fileable')->where('key', 'pre_order_photo');
    }

}
