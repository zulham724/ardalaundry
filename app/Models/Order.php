<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{

    protected $guarded = ['id'];

    use HasFactory;

    public function customer(){
        return $this->belongsTo('App\Models\User', 'customer_id');
    }

    public function employee()
    {
        return $this->belongsTo('App\Models\User', 'employee_id');
    }

    public function shop(){
        return $this->belongsTo('App\Models\Shop');
    }

    public function services(){
        return $this->belongsToMany('App\Models\Service', 'order_services', 'order_id', 'service_id')->withPivot('quantity', 'start_at', 'end_at');
    }
}
