<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModuleContent extends Model
{
    use HasFactory;

    protected $guarded = ["id"];


    public function video(){
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['video/mp4']);
    }

    public function thumbnail(){
        return $this->morphOne('App\Models\File', 'fileable')->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);;
    }

    public function liked(){
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
}