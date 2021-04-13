<?php

namespace App\Http\Controllers\TrainerAuth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    public function __construct()
    {
        return $this->middleware('guest:trainer');
    }
    
    public function showLoginForm(){
        return view('trainers.login');
    }
    public function login(Request $request){
        //  validate the form date
        $this->validate($request,[
            'email'=>'required|email',
            'password'=>'required'
        ]);
        // attemt to log the user in
        if(Auth::guard('trainer')->attempt([
            'email' => $request->email, 'password' => $request->password
        ], $request->remember)){
            // if successful, the redirect to their intended location
            return redirect()->intended(route('trainer.dashboard'));
        }
        // if unsuccessful, the redirect back to the login with the form data
        return redirect()->back()->withInput($request->only('email','remember'));
    }
}
