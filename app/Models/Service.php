<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    public function shop(){
        return $this->belongsTo('App\Models\Shop');
    }

    public function category(){
        return $this->belongsTo('App\Models\ServiceCategory','service_category_id');
    }
}
