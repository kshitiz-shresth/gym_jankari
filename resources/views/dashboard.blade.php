@extends('layout.app')

@section('css')
<style>
    .my-image{
        height: 116px;
        width: 100px;
        border: 1px rgb(202, 202, 202) solid;
    }
    .my-image img{
        object-fit: cover;
        height: 100%;
        width: 100%;
    }
</style>
@endsection

@section('body')
    @php
      $user = Auth::user();
      date_default_timezone_set('Asia/Kathmandu');
        $todayDate = strtotime(date("Y-m-d"));
        $ongoing = \App\Payment::where('user_id',$user->id)->where('status',1)->first();
        if($ongoing){
            $expiryDate = strtotime($ongoing->expiry_date);
            $remainingDays = ($expiryDate - $todayDate)/60/60/24;
        }
    @endphp
    @if($ongoing)
    <div class="container">
        <div class="section-title mb-3">
            <h2><strong>TRAINEE</strong> DASHBOARD</h2>
        </div>
        <div class="row" data-masonry='{"percentPosition": true }'>
            <div class="col-3 mb-4">
                <div class="card custom-card">
                    <div class="card-body">
                        <div class="basic-details">
                            <div class="my-image mb-3">
                                <img src="{{ Voyager::image($user->avatar) }}" alt="">
                            </div>
                            <h5 class="card-title">{{ $user->name }}</h5>
                            <span>{{ isset($remainingDays) ? $remainingDays : 0 }} days remaining</span>
                            <p class="card-text">{{ $user->gender }}</p>
                            <p class="card-text">DOB: {{ $user->dob }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-9 mb-4">
                <div class="card custom-card">
                    <form action="/updateUser" method="post">
                    <div class="card-body" style="display: flex;
                    align-items: center;
                    justify-content: space-between;">
                        <h5 class="card-title">Contact Information</h5>
                        @if(!request('edit'))
                        <a href="?edit=1" class="btn btn-primary">Edit</a>
                        @else
                        <div>
                            <a href="#" class="btn btn-primary" onclick="window.history.back();">Back</a>
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                        @endif
                    </div>
                        @csrf
                        <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><div class="row">
                                <div class="col-3">
                                    <span><strong>Address: </strong></span>
                                </div>
                                <div class="col-9">
                                    @if(request('edit'))
                                    <span><input type="text" class="form-control" name="address" value="{{ $user->address }}" id=""></span>
                                    @else
                                    <span>{{ $user->address }}</span>
                                    @endif
                                </div>
                            </div></li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-3">
                                    <span><strong>Contact No.: </strong></span>
                                </div>
                                <div class="col-9">
                                    @if(request('edit'))
                                    <span><input type="text" class="form-control" name="contact" value="{{ $user->contact }}" id=""></span>
                                    @else
                                    <span>{{ $user->contact }}</span>
                                    @endif
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-3">
                                    <span><strong>E-mail: </strong></span>
                                </div>
                                <div class="col-9">
                                    @if(request('edit'))
                                    <span><input type="text" class="form-control" name="email" value="{{ $user->email }}" id=""></span>
                                    @else
                                    <span>{{ $user->email }}</span>
                                    @endif
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item"><div class="row">
                                <div class="col-3">
                                    <span><strong>Emergency Contact No.: </strong></span>
                                </div>
                                <div class="col-9">
                                    @if(request('edit'))
                                    <span><input type="text" class="form-control" name="emergency_contact" value="{{ $user->emergency_contact }}" id=""></span>
                                    @else
                                    <span>{{ $user->emergency_contact }}</span>
                                    @endif
                                </div>
                            </div></li>
                        <li class="list-group-item"><div class="row">
                                <div class="col-3">
                                    <span><strong>Health Condition: </strong></span>
                                </div>
                                <div class="col-9">
                                    @if(request('edit'))
                                    <span><input type="text" class="form-control" name="health_condition" value="{{ $user->health_condition }}" id=""></span>
                                    @else
                                    <span>{{ $user->health_condition }}</span>
                                    @endif
                                </div>
                            </div></li>
                    </ul>
                    </form>
                </div>
            </div>

            <div class="col-3 mb-4">
                <div class="card custom-card">
                    <div class="card-body">
                        <p class="card-text">{{ $paymentDetails->first()->package->title }}</p>
                    </div>
                    @if(isset($remainingDays))
                        @if($remainingDays<=7)
                        <div class="card-body">
                            <a href="{{ route('payment') }}" class="btn btn-success">Make Payment</a>
                        </div>
                        @endif
                    @else
                        <div class="card-body">
                            <a href="{{ route('payment') }}" class="btn btn-success">Make Payment</a>
                        </div>
                    @endif
                </div>
            </div>

            <div class="col mb-4">
                <div class="card custom-card">
                    <div class="card-body">
                        <h5 class="card-title">Payment Information</h5>
                        <table id="paymentTable" class="table table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Payment Date</th>
                                    <th>Package</th>
                                    <th>Payment Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($paymentDetails as $item)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $item->payment_date }}</td>
                                    <td>{{ $item->package->title }}</td>
                                    <td>Rs. {{ \App\Package::where('id',$item->package_id)->first()->{$item->duration.'_price'} }}</td>
                                </tr>
                                @endforeach
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
    @else
    <div class="container mb-4" >
        <p>Payment not Activated</p>
        <a class="btn btn-primary" href="/payment">Pay</a>
    </div>
    @endif

@endsection
