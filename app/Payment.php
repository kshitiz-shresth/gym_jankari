<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Payment extends Model
{
    public $timestamps = false;
    public function package(){
        return $this->belongsTo(Package::class,'package_id');
    }
}
