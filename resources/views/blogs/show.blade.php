@extends('layout.app')

@section('body')
@php
function youtube_parser($url){
    preg_match('/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/',$url,$match);
       return $match[7];
    }
@endphp
<div class="container"><!-- ======= Team Section ======= -->
    <section class="blogs">
        <div class="container" >
            <div class="section-title">
                <h2>{{ $blog->title }}</h2>
                    <img class="img-fluid" style="height: 300px" src="/storage/{{ $blog->image }}" alt="">
                {!! $blog->body !!}

                <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ youtube_parser($blog['youtube_link']) }}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

            </div>
        </div>
    </section><!-- End Team Section -->
</div>
@endsection
