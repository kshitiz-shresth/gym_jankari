<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>GymJankari</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="/assets/img/favicon.png" rel="icon">
    <link href="/assets/img/logo.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- CSS Files -->
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/assets/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="/assets/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/gijgo.min.css">
    @yield('css')
</head>

<body>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top {{ Request::segment(1) ? 'header-scrolled' : '' }}">
    <div class="container d-flex align-items-center">

        <!-- Uncomment below if you prefer to use an text logo -->
        {{-- <h1 class="logo mr-auto"><a href="/">Gym Jankari</a></h1> --}}
        <a href="/" class="logo mr-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>

        <nav class="nav-menu d-none d-lg-block">
            <ul>
                <li class="@if(Request::segment(1)=='/' || Request::segment(1)=="" || Request::segment(1)=="#") active @endif "><a href="/#">Home</a></li>
                <li class="@if(Request::segment(1)=='trainers') active @endif"><a href="/trainers">Trainers</a></li>
                <li class="@if(Request::segment(1)=='packages') active @endif"><a href="/packages">Packages</a></li>
                <li class="@if(Request::segment(1)=='blogs') active @endif"><a href="/blogs">Blogs</a></li>
                <li class="@if(Request::segment(1)=='contact') active @endif"><a href="/contact">Contact Us</a></li>
                {{-- <li class="drop-down"><a href="">Drop Down</a>
                  <ul>
                    <li><a href="#">Drop Down 1</a></li>
                    <li class="drop-down"><a href="#">Deep Drop Down</a>
                      <ul>
                        <li><a href="#">Deep Drop Down 1</a></li>
                        <li><a href="#">Deep Drop Down 2</a></li>
                        <li><a href="#">Deep Drop Down 3</a></li>
                        <li><a href="#">Deep Drop Down 4</a></li>
                        <li><a href="#">Deep Drop Down 5</a></li>
                      </ul>
                    </li>
                    <li><a href="#">Drop Down 2</a></li>
                    <li><a href="#">Drop Down 3</a></li>
                    <li><a href="#">Drop Down 4</a></li>
                  </ul>
                </li> --}}
                @if(Auth::check() || Auth::guard('trainer')->check())
                    <li class="drop-down">
                        @if(Auth::user())
                            <a href="#">{{ Auth::user()->name }}</a>
                        @elseif(Auth::guard('trainer')->check())
                            <a href="#">{{ Auth::guard('trainer')->user()->name }}</a>
                        @endif
                        <ul>
                            <li>
                                <a href="{{ !Auth::guard('trainer')->check() ? route('dashboard') : route('trainer.dashboard') }}">Dashboard</a>
                            </li>
                            <li><a href="#" onclick="document.getElementById('logout').submit()">Logout</a></li>
                            <form action="{{ route('logout') }}" id="logout" method="post">
                                @csrf
                            </form>
                        </ul>
                    </li>
                @endif
            </ul>
        </nav><!-- .nav-menu -->
        @if(!Auth::check() && !Auth::guard('trainer')->check())
            <div>
                <a href="{{ route('login') }}" class="get-started-btn scrollto">Login</a>
                <a href="{{ route('register') }}" class="get-started-btn scrollto ml-1">Sign Up</a>
            </div>

        @endif
    </div>
</header><!-- End Header -->
@if(Request::segment(1))
    <div style="margin-bottom: 85px">

    </div>
@endif
@yield('body')
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-3 footer-contact">
                    <a href="/" class="logo mr-auto text"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a>
                </div>

                <div class="col-lg-6 col-md-6 footer-links d-flex align-items-center flex-column">
                    <h4>CALL US AT</h4>
                    <a href="tel:+9771234567890" class="phone row">
                        <i class="icofont-phone text-light" style="font-size: 1.5em;"></i>
                        <h4>&nbsp;+977 12345 67890</h4>
                    </a>
                    <a href="#" class="phone row">
                        <i class="icofont-email text-light" style="font-size: 1.5em;"></i>
                        <h4>&nbsp;info@gymjankari.com.np</h4>
                    </a>
                </div>

                <div class="col-lg-3 col-md-3 footer-links d-flex align-items-center flex-column">
                    <h4>OUR SOCIAL NETWORKS</h4>
                    <div class="social-links mt-3">
                        <a href="https://www.facebook.com" target="_blank" class="facebook"><i
                                class="bx bxl-facebook"></i></a>
                        <a href="https://www.instagram.com" target="_blank" class="instagram"><i
                                class="bx bxl-instagram"></i></a>
                        <a href="https://www.twitter.com" target="_blank" class="twitter"><i class="bx bxl-twitter"></i></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</footer><!-- End Footer -->


<a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>

<!-- Vendor JS Files -->
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
    $('#paymentTable').DataTable();
} );
</script>
<script src="/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/assets/vendor/venobox/venobox.min.js"></script>
<script src="/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="/assets/vendor/aos/aos.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"
        integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"
        async></script>

@yield('script')
<!-- Template Main JS File -->
<script src="/assets/js/main.js"></script>
@if(!Request::segment(1))
    <script>
        // Toggle .header-scrolled class to #header when page is scrolled
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('#header').addClass('header-scrolled');
            } else {
                $('#header').removeClass('header-scrolled');
            }
        });

        if ($(window).scrollTop() > 100) {
            $('#header').addClass('header-scrolled');
        }
    </script>
@endif

</body>

</html>
