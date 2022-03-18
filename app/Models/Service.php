<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Service extends Model
{
    use HasFactory, SoftDeletes;
    protected $guarded = ['id'];

    public function shop()
    {
        return $this->belongsTo('App\Models\Shop');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ServiceCategory', 'service_category_id');
    }

}
