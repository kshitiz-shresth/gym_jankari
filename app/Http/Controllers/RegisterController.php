<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class RegisterController extends Controller
{
    function create(Request $data)
    {
        if($file=$data['image']){
            $name = Str::random(20).'.'.$file->getClientOriginalExtension();
            $file->move('image',$name);
        }
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'dob' => $data['dob'],
            'gender' => $data['gender'],
            'address' => $data['address'],
            'contact' => $data['contact'],
            'emergency_contact' => $data['emergency_contact'],
            'health_condition' => $data['health_condition'],
            'password' => Hash::make($data['password']),
            'avatar' => $name
        ]);
        return redirect('/dashboard');
    }
}
