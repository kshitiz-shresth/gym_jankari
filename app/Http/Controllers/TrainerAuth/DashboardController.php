<?php

namespace App\Http\Controllers\TrainerAuth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:trainer');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $schedules =  Auth::user()->schedules;
        $schedule_array = $schedules->pluck('id')->toArray();
        $users = User::whereIn('schedule_id',$schedule_array)->get();
        return view('trainers.dashboard',compact(
            'schedules',
            'users'
        ));
    }
}
