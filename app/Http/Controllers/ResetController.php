<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ResetController extends Controller
{
    public function reset(Request $request){
        $user = User::where('email',$request->email)->where('contact',$request->contact)->first();
        if($user){
            return redirect('/changepassword')->with('user',$user);
        }
        else{
            return back()->withInput()->with('error','Credentials did not matched');
        }
    }

    public function changepassword(){
        if(session('user')){
            return view('auth.passwords.reset');
        }
        abort('404');
    }

    public function password(Request $request){
        $user = User::find($request->id);
        $user->password = Hash::make($request->password);
        $user->update();
        return redirect(route('login'));
    }
}
