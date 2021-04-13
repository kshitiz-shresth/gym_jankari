<?php

namespace App\Http\Controllers;

use App\Attendance;
use App\Models\User;
use DateTime;
use Illuminate\Http\Request;

class AttendanceController extends Controller
{
    public function update(Request $request){
        $todayDate = $request->date;
        // if attendance exist of same user in same date
        if(Attendance::where('user_id',$request->id)->where('date',$todayDate)->first()==null && $request->checked==true){
            $attendance = new Attendance();
            $attendance->user_id = $request->id;
            $attendance->date = $todayDate;
            $attendance->save();
        }
        // return $request->checked;
        if($request->checked==false){
            $attendance = Attendance::where('user_id',$request->id)->where('date',$todayDate)->first();
            $attendance->delete();
        }
    }
}
