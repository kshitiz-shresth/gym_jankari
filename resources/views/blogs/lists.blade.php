@extends('layout.app')

@section('body')
<div class="container"><!-- ======= Team Section ======= -->
    <section class="blogs">
        <div class="container" >

            <div class="section-title">
                <h2>Blogs</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit
                    sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias
                    ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <div class="row">
                @foreach ($blogs as $item)
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                   <div class="card text-center">
                      <img class="card-img-top" src="{{ Voyager::image($item->image) }}" alt="" width="100%">
                      <div class="card-block">
                          <h4 class="card-title">{{ $item->title }}</h4>
                          <p class="card-text">{{ $item->excerpt }}</p>
                          <a class="btn btn-default" href="/blog/{{ $item->slug }}">Read More</a>
                      </div>
                   </div>
                </div>
                @endforeach
              </div> <!-- row -->

        </div>
    </section><!-- End Team Section -->
</div>
@endsection
