<?php

namespace App\Http\Livewire;

use App\Package;
use App\Payment as AppPayment;
use Livewire\Component;

class Payment extends Component
{
    public  $packages, $payment_amount, $package=-1, $duration = 'one_month', $price=0, $user, $days=30;

    protected $rules = [
        'package' => 'required'
    ];


    public function render()
    {
        $this->packages = Package::all();
        return view('livewire.payment');
    }

    public function updatedPackage(){
        if($this->package!=-1){
            $this->price = Package::find($this->package)->one_month_price;
        }
        else{
            $this->price = 0;
        }
    }

    public function updatedDuration(){
        switch($this->duration){
            case 'one_month':
                $this->price = Package::find($this->package)->one_month_price;
                $this->days = 30;
                break;
            case 'three_month':
                $this->price = Package::find($this->package)->three_month_price;
                $this->days = 90;
                break;
            case 'six_month':
                $this->price = Package::find($this->package)->six_month_price;
                $this->days = 180;
                break;
            case 'one_year':
                $this->price = Package::find($this->package)->one_year_price;
                $this->days = 360;
                break;
            default:
                $this->price = 0;
                $this->days = 0;
        }
    }

    public function submit(){
        $this->validate();
        date_default_timezone_set('Asia/Kathmandu');
        $todayDate = date("Y-m-d");

        // 0=>pending, 1=>ongoing, -1=>expired

        // first payment
        $onGoingUser = AppPayment::where('user_id',$this->user->id)->where('status',1)->first();
        $pendingUser = AppPayment::where('user_id',$this->user->id)->where('status',0)->first();

        // set pending to expired
        if($pendingUser){
            $pendingUser->status=-1;
            $pendingUser->update();
        }

        // set on going payment to pending and add new payment and ongoing
        if($onGoingUser){
            $onGoingUser->status=0;
            // save pending user status to 0
            $onGoingUser->update();
            // add next payment
            $payment = new AppPayment();
            $payment->package_id = $this->package;
            $payment->payment_date = $todayDate;
            $payment->user_id = $this->user->id;
            $payment->expiry_date = date('Y-m-d', strtotime($onGoingUser->expiry_date. ' + '.$this->days.' days'));
            $payment->duration = $this->duration;
            $payment->status = 1;
            $payment->save();
        }
        else{
            $payment = new AppPayment();
            $payment->package_id = $this->package;
            $payment->payment_date = $todayDate;
            $payment->user_id = $this->user->id;
            $payment->expiry_date = date('Y-m-d', strtotime($todayDate. ' + '.$this->days.' days'));
            $payment->duration = $this->duration;
            $payment->status = 1;
            $payment->save();
        }
        // second payment

        return redirect('/dashboard');
    }
}
