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
                            <div class="d-flex justify-content-between">
                                <h4 style="font-size: 40px"><sup>Rs</sup>{{ $item->one_month_price }}<span>1 month</span></h4 style="font-size: 40px">
                                <h4 style="font-size: 40px"><sup>Rs</sup>{{ $item->three_month_price }}<span>3 months</span></h4>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h4 style="font-size: 40px"><sup>Rs</sup>{{ $item->six_month_price }}<span>6 months</span></h4>
                                <h4 style="font-size: 40px"><sup>Rs</sup>{{ $item->one_year_price }}<span>1 year</span></h4>
                            </div>

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
