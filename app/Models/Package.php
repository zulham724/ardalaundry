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

    public function package_contents(){
        return $this->hasMany('App\Models\PackageContents', 'package_id');
    }

    public function package_limits()
    {
        return $this->hasMany('App\Models\PackageLimit');
    }

    public function slave_limit(){
        return $this->hasOne('App\Models\PackageLimit')->where('entity', 'slaves_count');
    }
   
}
