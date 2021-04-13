@extends('layout.app')

@section('body')
    @if(session('user'))
        <div class="container mb-4">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">{{ __('Reset Password') }}</div>

                        <div class="card-body">
                            <form method="POST" action="/changepassword">
                                @csrf
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('New Password') }}</label>

                                    <div class="col-md-6">
                                        <input id="password" name="password" type="password" class="form-control" autofocus>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Confirm New Password') }}</label>

                                    <div class="col-md-6">
                                        <input id="confirm_password" type="password" class="form-control" autofocus>
                                    </div>
                                    <div id='message' style="float: right"></div>

                                </div>
                                <input type="hidden" name="id" value="{{ session('user')->id }}">

                                <div class="form-group row mb-0">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" id="mybutton" class="btn btn-primary" disabled>
                                            {{ __('Change Password') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection

@section('script')
    <script>
        $('#password, #confirm_password').on('keyup', function () {
            $('#mybutton').attr("disabled",true);

            if ($('#password').val() == $('#confirm_password').val()) {
                $('#message').html('Matched').css('color', 'green');
                $('#mybutton').removeAttr("disabled");
            } else if ($('#password').val() != $('#confirm_password').val())
                $('#message').html('No Match').css('color', 'red');
            });
    </script>
@endsection
