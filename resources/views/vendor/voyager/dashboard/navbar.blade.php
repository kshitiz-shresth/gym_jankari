<nav class="navbar navbar-default navbar-fixed-top navbar-top" style="background: #3c4d6b;
height: 61px;">
    <div class="container-fluid">

        <ul class="nav navbar-nav @if (__('voyager::generic.is_rtl') == 'true') navbar-left @else navbar-right @endif">
            <li class="dropdown profile">
                <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button"
                    aria-expanded="false"><img src="{{ $user_avatar }}" class="profile-img"> <span
                        class="caret"></span></a>
                <ul class="dropdown-menu dropdown-menu-animated">
                    <li>
                        <a href="/" target="_blank">
                            <i class="voyager-home"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <form action="/admin/logout" method="POST">
                            @csrf
                            <button type="submit" class="btn btn-danger btn-block">
                                <i class="voyager-power"></i>
                                Logout
                            </button>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
