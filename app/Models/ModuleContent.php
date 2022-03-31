<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModuleContent extends Model
{
    use HasFactory;

    protected $guarded = ["id"];
    protected $appends = ["type", 'is_read'];

    public function video()
    {
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['video/mp4']);
    }

    public function thumbnail()
    {
        return $this->morphOne('App\Models\File', 'fileable')->where('key', 'thumbnail');
    }

    public function image_content()
    {
        return $this->morphOne('App\Models\File', 'fileable')->where('key', 'image_content');
    }

    public function liked()
    {
        $user = auth('api')->user();
        return $this->morphOne('App\Models\Like', 'likeable')->where('user_id', $user->id);
    }

    public function comments_from_other()
    {
        return $this->morphMany('App\Models\Comment', 'commentable')->where('user_id', '!=', auth('api')->user() ? auth('api')->user()->id : -1);
    }

    public function comments()
    {
        return $this->morphMany('App\Models\Comment', "commentable")->withCount('likes', 'liked');
    }

    public function likes()
    {
        return $this->morphMany('App\Models\Like', 'likeable');
    }

    public function reads()
    {
        return $this->morphMany('App\Models\Read', 'readable');
    }

    public function getTypeAttribute()
    {
        if ($this->video) {
            return "Video";
        } else {
            return "Materi";
        }

    }

    public function getIsReadAttribute()
    {
        $user = auth('api')->user();
        if ($user) {
            $read = $this->reads()->where('user_id', $user->id)->first();
            if ($read) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

}
