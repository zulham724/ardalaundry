<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Sanctum\HasApiTokens;
use Laravel\Passport\HasApiTokens;


class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'home_address',
        'contact_number',
        'role_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function packages(){
        return $this->belongsToMany('App\Models\Package','package_users')->withPivot(['expired_date']);
    }

    public function shop(){
        return $this->hasOne('App\Models\Shop');
    }

    public function slaves(){
        return $this->belongsToMany('App\Models\User','branches','master_id','slave_id');
    }

    public function master(){
        return $this->belongsToMany('App\Models\User', 'branches', 'slave_id', 'master_id');
    }

    public function customer_shops(){
        return $this->belongsToMany('App\Models\Shop','shop_customers','user_id','shop_id');
    }

    public function employee_shops()
    {
        return $this->belongsToMany('App\Models\Shop', 'shop_employees', 'user_id', 'shop_id');
    }
}
