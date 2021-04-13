<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Illuminate\Http\Request;

class BlogsController extends Controller
{

    /**
     * Show the application blogs.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $blogs = Page::orderBy('created_at','desc')->where('status','ACTIVE')->get();
        return view('blogs.lists',compact('blogs'));
    }

    public function show($slug){
        $blog = Page::where('slug',$slug)->first();
        return view('blogs.show',compact('blog'));
    }
}
