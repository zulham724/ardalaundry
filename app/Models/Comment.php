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
}
