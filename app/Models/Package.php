<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;

    public function users(){
        return $this->belongsToMany('App\Models\User','package_users')->withPivot(['expired_date']);;
    }
}
