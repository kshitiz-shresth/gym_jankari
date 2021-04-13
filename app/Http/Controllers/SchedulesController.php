<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SchedulesController extends Controller
{
    /**
     * Show the application schedules.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('schedules');
    }
}
