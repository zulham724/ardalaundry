<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;

    protected $guarded = ["id"];
    protected $appends = ['sum_duration', 'count_content_video', 'count_content_text', 'count_contents', 'count_content_is_read'];

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

    public function getCountContentIsReadAttribute()
    {
        return $this->contents()->whereHas('reads', function ($query) {
            $query->where('user_id', auth('api')->user()->id);
        })->count();

    }

    public function getCountContentVideoAttribute()
    {
        return $this->contents()->has('video')->count();
    }

    public function getCountContentTextAttribute()
    {
        return $this->contents()->doesntHave('video')->count();
    }

    public function getCountContentsAttribute()
    {
        return $this->contents()->count();
    }

}
