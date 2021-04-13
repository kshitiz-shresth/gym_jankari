@extends('layout.app')

@section('css')
    @livewireStyles
@endsection

@section('script')
    @livewireScripts
@endsection

@section('body')
    @livewire('payment', ['user' => Auth::user()], key(Auth::user()->id))
@endsection
