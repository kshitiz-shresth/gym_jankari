<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Trainer extends Authenticatable
{
    protected $guard = 'trainer';

    protected $fillable=[
        'name','email', 'password'
    ];
    protected $hidden = [
        'password', 'remember_token'
    ];

    public function schedules(){
        return $this->belongsToMany('\App\Schedule','schedule_trainers');
    }
}
