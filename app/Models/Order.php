<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{

    protected $guarded = ['id'];
    protected $appends = ['total_sum', 'paid_sum'];

    use HasFactory;

    public function customer()
    {
        return $this->belongsTo('App\Models\User', 'customer_id');
    }

    public function employee()
    {
        return $this->belongsTo('App\Models\User', 'employee_id');
    }

    public function shop()
    {
        return $this->belongsTo('App\Models\Shop');
    }

    // public function services()
    // {
    //     return $this->belongsToMany('App\Models\Service', 'order_services', 'order_id', 'service_id')
    //         ->selectRaw('services.*, (order_services.quantity*services.price) as total')
    //         ->withPivot('quantity', 'start_at', 'end_at', 'service_status_id');
    // }

    public function products()
    {
        return $this->belongsToMany('App\Models\Product', 'order_products', 'order_id', 'product_id')
            ->selectRaw('products.*, (order_products.quantity*products.price) as total')
            ->withPivot('quantity');
    }

    public function services()
    {
        return $this->hasMany('App\Models\OrderService');
    }

    public function service_status()
    {
        return $this->hasOne('App\Models\OrderService')->orderBy('id', 'desc');
    }

    public function payments()
    {
        return $this->morphMany('App\Models\Payment', 'payment');
    }

    public function status()
    {
        return $this->belongsTo('App\Models\OrderStatus', 'order_status_id');
    }

    // public function getDescriptionAttribute($value){
    //     return "Hai ".$value;
    // }

    public function getTotalSumAttribute()
    {
        $services = $this->services()->get();
        $total = 0;
        foreach ($services as $s => $service) {
            # code...
            $total += $service->price * $service->quantity;
        }
        return $total;
    }

    public function getPaidSumAttribute()
    {
        return (int) $this->payments()->sum('value');
    }

    public function photo()
    {
        return $this->morphOne('App\Models\File', 'fileable')->orderBy('id', 'desc');
    }

    // public function getIsPaidOffAttribute()
    // {
    //     if ((int) $this->total_sum - (int) $this->paid_sum == 0) {
    //         return true;
    //     } else {
    //         return false;
    //     }
    //     // return true;
    // }
}
