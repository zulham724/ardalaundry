<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PackageContents extends Model
{
    use HasFactory;

    public function packages(){
        
        return $this->belongsTo('App\Models\Package', 'id', 'package_id');
    }
}
