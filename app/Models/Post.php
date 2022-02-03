<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function user(){
        return $this->belongsTo('App\Models\User', 'author_id');
    }

    public function author()
    {
        return $this->belongsTo('App\Models\User', 'author_id', 'id');
    }

    public function comments_from_other(){
        return $this->morphMany('App\Models\Comment', 'commentable')->where('user_id', '!=', auth('api')->user() ? auth('api')->user()->id : -1);
    }

    public function comments(){
        return $this->morphMany('App\Models\Comment', "commentable")->withCount('likes', 'liked');
    }

    public function reports(){
        return $this->morphMany('App\Models\Report', 'reportable');
    }

    public function bookmarked(){
        $user=auth('api')->user();
        return $this->morphOne('App\Models\Bookmark', 'bookmarkable')->where('user_id', $user ? $user->id : 0);
    }

    public function bookmarks(){
        return $this->morphMany('App\Models\Bookmark', 'bookmarkable');
    }

    public function likes(){
        return $this->morphMany('App\Models\Like', 'likeable');
    }

    public function liked(){
        $user=auth('api')->user();
        return $this->morphOne('App\Models\Like', 'likeable')->where('user_id', $user->id);
    }

    public function readers(){
        return $this->morphMany('App\Models\Read', 'readable');
    }

    public function hasRead(){
        $user = auth('api')->user();

        return $this->morphOne('App\Models\Read', 'readable')->where('user_id', $user->id);
    }

    public function files(){
        return $this->morphMany('App\Models\File', "fileable");
    }

    public function images(){
        return $this->morphMany('App\Models\File', "fileable")->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);
    }

    public function videos(){
        return $this->morphMany('App\Models\File', "fileable")->whereIn('filetype', ['video/mp4']);
    }
   

}
