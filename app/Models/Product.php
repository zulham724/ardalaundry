<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function images()
    {
        return $this->morphMany('App\Models\File', "fileable")->whereIn('filetype', ['image/jpeg', 'image/png', 'image/jpg']);
    }

    public function shop(){
        return $this->belongsTo('App\Models\Shop');
    }

    public function likes(){
        return $this->morphMany('App\Models\Like', 'likeable');
    }

    public function liked(){
        $user=auth('api')->user();
        return $this->morphOne('App\Models\Like', 'likeable')->where('user_id', $user->id);
    }
}
