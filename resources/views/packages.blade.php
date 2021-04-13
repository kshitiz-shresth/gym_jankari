@extends('layout.app')

@section('body')
    <!-- ======= Packages Section ======= -->
    <div class="container">
        <section id="pricing" class="pricing">
            <div class="container" >

                <div class="section-title">
                    <h2>Packages</h2>
                    <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit
                        sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias
                        ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
                </div>

                <div class="row">
                    @foreach ($packages as $item)
                    <div class="col-lg-4">
                        <div class="box">
                            <h3>{{ $item->title }}</h3>
                            <h4><sup>Rs</sup>{{ $item->one_month_price }}<span>per month</span></h4>
                            {!! $item->description !!}
                            <a href="{{ route('register') }}" class="buy-btn">Get Started</a>
                        </div>
                    </div>
                    @endforeach
                   </div>
            </div>
        </section><!-- End Packages Section -->
    </div>
@endsection
