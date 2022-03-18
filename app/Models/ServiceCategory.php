<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ServiceCategory extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = ["id"];

    public function services()
    {
        return $this->hasMany('App\Models\Service');
    }

    public function service_unit()
    {
        return $this->belongsTo("App\Models\ServiceUnit");
    }
}
