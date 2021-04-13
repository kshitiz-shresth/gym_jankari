@extends('layout.app')

@section('body')
    <div class="container"><!-- ======= Team Section ======= -->
        <section id="team" class="team">
            <div class="container" >

                <div class="section-title">
                    <h2>Trainers</h2>
                    <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit
                        sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias
                        ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
                </div>

                <div class="row">
                    @foreach (\App\Trainer::orderBy('order')->get() as $item)
                    <div class="col-lg-6">
                        <div class="member d-flex align-items-start"  >
                            <div class="pic"><img src="{{ Voyager::image($item->image) }}" class="img-fluid" alt=""></div>
                            <div class="member-info">
                                <h4>{{ $item->name }}</h4>
                                <span>{{ $item->designation }}</span>
                                {!! $item->description !!}
                                <div class="social">
                                    <a href=""><i class="ri-twitter-fill"></i></a>
                                    <a href=""><i class="ri-facebook-fill"></i></a>
                                    <a href=""><i class="ri-instagram-fill"></i></a>
                                    <a href=""> <i class="ri-linkedin-box-fill"></i> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>

            </div>
        </section><!-- End Team Section -->
    </div>
@endsection
