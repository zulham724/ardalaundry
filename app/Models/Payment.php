<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function order(){
        return $this->belongsTo('App\Models\Order','payment_id')->where('payment_type','App\Models\Order');
    }

    public function shop()
    {
        return $this->belongsTo('App\Models\Shop', 'payment_id')->where('payment_type', 'App\Models\Shop');
    }

    // public function paymentable(){
    //     return $this->morphTo();
    // }

    public function package_user(){
        return $this->belongsTo('App\Models\PackageUser', 'payment_id')->with('package');;
    }
}
