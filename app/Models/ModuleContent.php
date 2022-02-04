<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModuleContent extends Model
{
    use HasFactory;

    protected $guarded = ["id"];


    public function video(){
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['video/mp4']);;
    }

    public function thumbnail(){
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);;
    }
}
