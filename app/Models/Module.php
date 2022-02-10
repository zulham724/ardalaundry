<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function banner(){
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);
    }

    public function contents(){
        return $this->hasMany('App\Models\ModuleContent');
    }
}
