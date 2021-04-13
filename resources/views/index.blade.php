@extends('layout.app')

@section('body')
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
                     >
                    <h1>The best place to train in KTown.</h1>
                    <h2>We are a group of professional trainers ready to tailor your fitness training needs.</h2>\
                    <div class="d-lg-flex">
                        <a href="{{ route('register') }}" class="btn-get-started scrollto"> <strong>TRAIN</strong> WITH
                            US <i class="icofont-dumbbell"
                                  style=" font-size: 1.5em;"></i></a>
                    </div>
                </div>
                <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="" >
                    <img src="assets/img/hero-img.png" class="img-fluid" alt="">
                </div>
            </div>
        </div>
    </section><!-- End Hero -->

    <main id="main">
        <!-- Corona Dialog -->
        <div class="modal fade" id="coronaDialog" tabindex="-1" aria-labelledby="coronaDialogLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="coronaDialogLabel">Dialog title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda ducimus in sapiente quia, perspiciatis tenetur ullam ipsam tempora obcaecati fugit eum corporis minus cupiditate delectus ea vel, nemo culpa. Nesciunt ea maiores sapiente fugiat optio pariatur quaerat delectus corporis necessitatibus. A fuga cupiditate ab quod nam, voluptatibus aspernatur, modi at repellat voluptate eveniet tempora autem labore culpa itaque laborum dignissimos exercitationem ullam minus, enim similique nemo optio doloribus. Inventore debitis dolore nemo deleniti, excepturi quo quasi animi cupiditate fugit blanditiis tempore minima sapiente ipsam alias, quaerat adipisci voluptates, cum nostrum placeat est quam labore culpa libero mollitia. Temporibus rerum sunt quam saepe doloremque, modi nostrum. Unde temporibus aliquid mollitia atque vel expedita ex soluta molestias ratione consectetur velit ab dolorum nostrum eum beatae ut voluptas sit illum quod nihil dolorem, iusto, harum quos. Ad mollitia quas, debitis sapiente quasi, aliquam numquam placeat eligendi hic corporis temporibus voluptatum. Libero voluptates est veritatis molestias? Rerum beatae in eligendi ipsam, voluptate aspernatur unde laboriosam sapiente nihil accusamus quae impedit provident dolorum repellendus, voluptas at quas odit sit maiores! Placeat velit sit dolore maxime quisquam deleniti consequatur sint labore non nulla! Amet, quos! Optio molestias aliquid fuga voluptatem fugit mollitia rerum autem. Animi officia corporis sint distinctio ipsum autem, est laudantium dignissimos, delectus veritatis quam ad possimus culpa molestiae ea rerum doloribus, accusamus sunt earum quia veniam praesentium neque. Saepe aspernatur consectetur tempora corrupti corporis ipsam voluptatem! Nulla dolores maiores vitae architecto corrupti animi quod facilis magnam dolorum saepe. Saepe, eius repellat voluptate perferendis doloremque provident facilis expedita ad dolorem praesentium maiores sequi eligendi odit sit pariatur quisquam! Tempora voluptatum possimus minus quia soluta nesciunt nisi, dolorem reiciendis dolorum voluptate beatae natus, quos illum fugit dolor autem quod architecto iste earum, eligendi quisquam. Quia nihil, placeat eos fuga numquam corrupti, at deserunt amet quam nesciunt optio accusamus adipisci ipsa voluptatem esse temporibus! Tempore optio expedita nulla placeat veniam commodi, minima, error ipsa quasi possimus dignissimos sit. Quod repellendus vel maxime esse dignissimos pariatur quae incidunt tenetur atque facilis obcaecati sunt aut, sit quidem culpa quasi rerum in. Delectus pariatur reprehenderit suscipit sed laborum explicabo dignissimos ratione sequi quam fugit similique molestias nemo, perspiciatis impedit molestiae illo, odit corrupti neque aliquid vero temporibus tempore repellat nobis? Deserunt iusto a ea aspernatur, fugit repellat alias nisi quidem perspiciatis error impedit pariatur totam consequuntur, commodi cum! Corrupti harum accusamus nam quo amet nostrum incidunt recusandae at id!
                </div>
            </div>
            </div>
        </div>
        <!-- ======= About Us Section ======= -->
        <section id="about" class="about">
            <div class="container">
                <div class="section-title">
                    <h2>About Us</h2>
                </div>

                <div class="row content">
                    <div class="col-lg-6">
                        <p>
                            Equipped with all the modern machines and professional trainers, GymJankari is the gym of
                            your choice. We provide all kind of fitness trainings in packages tailored to your schedule.
                        </p>
                        <p>
                            But be aware, its <b>GO HARD OR GO HOME</b> here all the time.
                        </p>
                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0">
                        <p>
                            Here are our key features:
                        </p>
                        <ul>
                            <li><i class="ri-check-double-line"></i> We provide you a trainer to monitor your trainings.
                            </li>
                            <li><i class="ri-check-double-line"></i> We custom tailor your diet according to your body
                                parameters.
                            </li>
                            <li><i class="ri-check-double-line"></i> With branches all over Kathmandu, you don't have to
                                worry about being too far away.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section><!-- End About Us Section -->


        <!-- ======= Packages Section ======= -->
        <section class="why-us">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 align-items-stretch order-2 order-lg-1 img"
                         style='background-image: url("assets/img/skills.png");' data-aos=""
                         >&nbsp;
                    </div>
                    <div
                        class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-1 order-lg-2">
                        <div class="content">
                            <h3>FIND <strong>THE BEST TRAINING</strong> FOR YOU</h3>
                            <p>
                                We provide variations in the type of trainings we provide. The best training for you
                                might depend upon your fitness goal. Out of all the trainees currently associated with
                                us, they have choosen following packages the most.
                            </p>
                        </div>

                        <div class="row content">
                            <a href="{{ route('packages') }}" class="custom-button"><i class="icofont-box"
                                                                                       style=" font-size: 1.5em;"></i>
                                BROWSE <strong>PACKAGES</strong></a>
                        </div>

                    </div>
                </div>

            </div>
        </section><!-- End Packages Section -->

        <!-- ======= Trainers Section ======= -->
        <section class="why-us section-bg">
            <div class="container">
                <div class="row">
                    <div
                        class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">
                        <div class="content">
                            <h3>TRAIN WITH <strong>THE BEST</strong></h3>
                            <p>
                                Trainers who have built a name for themselves are proudly associated with GymJankari.
                                Dont forget to check who you train with.
                            </p>
                        </div>
                        <div class="d-lg-flex content">
                            <a href="{{ route('trainers') }}" class="custom-button"><i
                                    class="icofont-gym-alt-2" style=" font-size: 1.5em;"></i>
                                BROWSE <strong>TRAINERS</strong></a>
                        </div>
                    </div>
                    <div class="col-lg-5 align-items-stretch order-1 order-lg-2 img"
                         style='background-image: url("assets/img/trainers.svg");' data-aos=""
                         >&nbsp;
                    </div>
                </div>

            </div>
        </section><!-- End Trainers Section -->

        <!-- ======= Cta Section ======= -->
        <section id="cta" class="cta">
            <div class="container" data-aos="">
                <div class="row">
                    <div class="col-lg-9 text-center text-lg-left">
                        <h3 style="font-weight: 400;">START <strong>TRAINING</strong> TODAY</h3>
                        <p>This is the long awaited time to join a gym. Start training with us today by signing up.</p>
                    </div>
                    <div class="col-lg-3 cta-btn-container text-center">
                        <a class="cta-btn align-middle" href="{{ route('register') }}">Sign Up</a>
                    </div>
                </div>

            </div>
        </section><!-- End Cta Section -->


        <!-- ======= Contact Section ======= -->
        <section class="why-us">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-5 align-items-stretch order-2 order-lg-1 img content"
                         data-aos=""
                         >
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3532.593534839098!2d85.3357853146197!3d27.698954982795332!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb199940d81663%3A0xaf36b9b58903050f!2sAPEX%20COLLEGE!5e0!3m2!1sne!2snp!4v1617267051794!5m2!1sne!2snp"
                            width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""
                            aria-hidden="false" tabindex="0"></iframe>

                    </div>
                    <div
                        class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-1 order-lg-2">
                        <div class="content">
                            <h3>KNOW <strong>WHERE</strong> YOU TRAIN</h3>
                            <p>
                                To start training you have to start at our Gym Location. You can also see more about contacting
                                us.
                            </p>
                        </div>
                        <div class="row content">
                            <a href="{{ route('contact') }}" class="custom-button"><i class="icofont-box"
                                                                                       style=" font-size: 1.5em;"></i>
                                <strong>CONTACT</strong> US</a>
                        </div>

                    </div>
                </div>

            </div>
        </section>
    </main><!-- End #main -->
@endsection

@section('script')
<script type="text/javascript">
    $(window).on('load', function() {
        $('#coronaDialog').modal('show');
    });
</script>
@endsection
