@extends('layout.app')

@section('body')
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">{{ __('Your Schedules') }}</div>

                <div class="card-body">  
                    <ul>
                        @foreach (Auth::user()->schedules as $item)
                             <li>
                                <p>Day: {{ $item->day }}</p> 
                                <p>Time: {{ date("g:ia", strtotime($item->from)) }} to {{ date("g:ia", strtotime($item->to)) }}</p> 
                                <p>Package: {{  $item->package->title }}</p>
                            </li>
                        @endforeach
                    </ul>                 

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
