<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TrainersController extends Controller
{
    /**
     * Show the application trainers.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('trainers');
    }
}
