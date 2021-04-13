<?php

namespace App\Models;

use App\Package;
use App\Payment;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends \TCG\Voyager\Models\User
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public function package(){
        return $this->belongsTo(Package::class,'package_id');
    }

    protected $fillable = [
        'name',
        'email',
        'password',
        'dob',
        'gender',
        'address',
        'contact',
        'emergency_contact',
        'health_condition',
        'package_id',
        'schedule_id',
        'image'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public static function firstPaymentDate($id){
        return Payment::where('user_id',$id)->orderBy('payment_date')->first();
    }
}
