<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header" style="background:#3c4d6b">
                <a class="navbar-brand" style="padding-left:22px"  href="/admin">
                    Gym Jankari
                </a>
            </div><!-- .navbar-header -->



        </div>
        <div id="adminmenu">
            <ul class="nav navbar-nav">
                <li class="{{ Request::segment(2) ? '' : 'active' }}"><a target="_self" href="/admin"><span class="icon voyager-folder"></span><span class="title">Dashboard</span></a></li>
                <li class="{{ Request::segment(2)=='attendances' ? 'active' : '' }}"><a target="_self" href="/admin/attendances"><span class="icon voyager-folder"></span><span class="title">Attendances</span></a></li>
                <li class="{{ Request::segment(2)=='reports' ? 'active' : '' }}"><a target="_self" href="/admin/reports"><span class="icon voyager-folder"></span><span class="title">Reports</span></a></li>
                <li class="{{ Request::segment(2)=='payments' ? 'active' : '' }}"><a target="_self" href="/admin/payments"><span class="icon voyager-folder"></span><span class="title">Payments</span></a></li>
                <li class="{{ Request::segment(2)=='packages' ? 'active' : '' }}"><a target="_self" href="/admin/packages"><span class="icon voyager-folder"></span><span class="title">Packages</span></a></li>
                <li class="{{ Request::segment(2)=='trainers' ? 'active' : '' }}"><a target="_self" href="/admin/trainers"><span class="icon voyager-folder"></span><span class="title">Trainers</span></a></li>
                <li class="{{ Request::segment(2)=='pages' ? 'active' : '' }}"><a target="_self" href="/admin/pages"><span class="icon voyager-folder"></span><span class="title">Blogs</span></a></li>
                <li class="{{ Request::segment(2)=='users' ? 'active' : '' }}"><a target="_self" href="/admin/users"><span class="icon voyager-folder"></span><span class="title">Users</span></a></li>
            </ul>
        </div>
    </nav>
</div>
