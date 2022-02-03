<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function replies_comment(){
        return $this->morphMany("App\Models\Comment", "commentable");
    }

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function likes(){
        return $this->morphMany('App\Models\Like', 'likeable');
    }

    public function liked(){
        $user = auth('api')->user();

        return $this->morphMany('App\Models\Like', 'likeable')->where('user_id', $user->id);
    }
}
