<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function customers()
    {
        return $this->belongsToMany('App\Models\User', 'shop_customers', 'shop_id', 'user_id');
    }

    public function employees()
    {
        return $this->belongsToMany('App\Models\User', 'shop_employees', 'shop_id', 'user_id');
    }

    public function orders()
    {
        return $this->hasMany('App\Models\Order');
    }

    public function services()
    {
        return $this->hasMany('App\Models\Service');
    }

    public function service_categories()
    {
        return $this->hasMany('App\Models\ServiceCategory');
    }

    public function attendances()
    {
        return $this->belongsToMany('App\Models\User', 'attendances')->withPivot(['created_at', 'in_at', 'out_at']);
    }

    public function payments()
    {
        return $this->morphMany('App\Models\Payment', 'payment');
    }

    public function location()
    {
        return $this->morphOne('App\Models\Location', 'locationable');
    }

    public function payment_vendors()
    {
        return $this->morphMany('App\Models\PaymentVendor', 'vendorable');
    }
}
