<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    //
    public function update(Request $request){
        $user = User::find($request->user_id);
        $user->address = $request->address;
        $user->contact = $request->contact;
        $user->email = $request->email;
        $user->emergency_contact = $request->emergency_contact;
        $user->health_condition = $request->health_condition;
        $user->update();
        return redirect('/dashboard');
    }
}
