<?php

use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\ResetController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});



Route::post('/updateUser',[UserController::class,'update']);
Route::post('/updateAttendance',[AttendanceController::class,'update']);


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});



Auth::routes();

Route::post('/custom-register',[RegisterController::class,'create']);
Route::post('/reset',[ResetController::class,'reset'])->name('reset.mypassword');
Route::get('/changepassword',[ResetController::class,'changepassword']);
Route::post('/changepassword',[ResetController::class,'password']);
Route::post('/send-email',function(){
    return redirect()->back()->with('message','Your Message is successfully sent');
});
Route::get('/', function () {
    return view('index');
});
Route::get('/dashboard', [App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard');
Route::get('/payment', [PaymentController::class, 'index'])->name('payment');
Route::get('/trainers', [App\Http\Controllers\TrainersController::class, 'index'])->name('trainers');
Route::get('/schedules', [App\Http\Controllers\SchedulesController::class, 'index'])->name('schedules');
Route::get('/packages', [App\Http\Controllers\PackagesController::class, 'index'])->name('packages');
Route::get('/blogs', [App\Http\Controllers\BlogsController::class, 'index'])->name('blogs');
Route::get('/blog/{slug}', [App\Http\Controllers\BlogsController::class, 'show']);

Route::get('/contact', [App\Http\Controllers\ContactController::class, 'index'])->name('contact');
