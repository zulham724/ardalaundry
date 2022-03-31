<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;

    protected $guarded = ["id"];
    protected $appends = ['sum_duration'];

    public function banner()
    {
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);
    }

    public function contents()
    {
        return $this->hasMany('App\Models\ModuleContent');
    }

    public function thumbnail()
    {
        return $this->morphOne('App\Models\File', 'fileable')->where('key', 'thumbnail');
    }

    public function reads()
    {
        return $this->morphMany('App\Models\Read', 'readable');
    }

    public function getSumDurationAttribute()
    {
        return $this->contents()->sum('duration');
    }
}
