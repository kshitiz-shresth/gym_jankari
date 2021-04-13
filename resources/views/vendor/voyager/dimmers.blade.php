<div class="clearfix container-fluid row">
    <div class="panel widget center bgimage" style="margin-bottom:0;overflow:hidden;background-image:url('/assets/img/users.jpg');">
        <div class="dimmer"></div>
        <div class="panel-content">
             <i class='voyager-group'></i>
            <h4>{{ \App\Models\User::all()->count() }} Users</h4>
            <p>You Have {{ \App\Models\User::all()->count() }} Users in your database.</p>
            <a href="/admin/users" class="btn btn-primary">See All</a>
        </div>
    </div>

</div>
