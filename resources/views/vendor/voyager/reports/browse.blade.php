@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="{{ $dataType->icon }}"></i> {{ $dataType->getTranslatedAttribute('display_name_plural') }}
        </h1>
        @can('edit', app($dataType->model_name))
            @if(isset($dataType->order_column) && isset($dataType->order_display_column))
                <a href="{{ route('voyager.'.$dataType->slug.'.order') }}" class="btn btn-primary btn-add-new">
                    <i class="voyager-list"></i> <span>{{ __('voyager::bread.order') }}</span>
                </a>
            @endif
        @endcan
        @can('delete', app($dataType->model_name))
            @if($usesSoftDeletes)
                <input type="checkbox" @if ($showSoftDeleted) checked @endif id="show_soft_deletes" data-toggle="toggle" data-on="{{ __('voyager::bread.soft_deletes_off') }}" data-off="{{ __('voyager::bread.soft_deletes_on') }}">
            @endif
        @endcan
        @foreach($actions as $action)
            @if (method_exists($action, 'massAction'))
                @include('voyager::bread.partials.actions', ['action' => $action, 'data' => null])
            @endif
        @endforeach
        @include('voyager::multilingual.language-selector')
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body"  style="min-height: 80vh">
                        @php
                            date_default_timezone_set('Asia/Kathmandu');
                            $todayDate = date("Y-m-d");
                            function checkUser($id) {
                                date_default_timezone_set('Asia/Kathmandu');
                                $todayDate = date("Y-m-d");
                                $date = request('date') ?? $todayDate ;
                                if(\App\Attendance::where('user_id',$id)->where('date',$date)->first()){
                                    return 'checked';
                                }
                                else{
                                    return '';
                                }
                            }
                        @endphp
                        <div class="info-box" style="display: flex; align-items:center;">
                            <form  method="get">
                                <div style="display: flex; align-items: center;">
                                    <div>
                                        <input class="form-control" type="text" id="fromCustomDate" name="from" value="{{ request('from') }}" data-select="datepicker" required>
                                    </div>
                                    <div style="margin-left:5px">
                                        <input class="form-control" type="text" id="toCustomDate" name="to" value="{{ request('to') ?? $todayDate }}"  data-select="datepicker" required>
                                    </div>
                                    <select id="package" class="form-control" name="package">
                                        <option value="-1">All</option>
                                        @foreach (\App\Package::all() as $item)
                                            <option {{ request('package') ? ( $item->id==request('package') ? 'selected' : '' ) : '' }} value="{{ $item->id }}">{{ $item->title }}</option>
                                        @endforeach
                                    </select>
                                    <span><button class="btn btn-success" type="submit">Search</button></span>
                                </div>
                            </form>
                        </div>
                        <div class="row" style="margin-top:15px">
                            <div class="col-md-6">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th><strong>Trainee</strong></th>
                                            <th>Package</th>
                                            <th><strong>Total Days Attended</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if(request('from')!=null && request('to')!=null)
                                        @foreach (\App\Models\User::all() as $item)
                                            @php
                                                $userID = $item->id;
                                                $attendanceCount = \App\Attendance::where('user_id',$userID)->where('date','>=',request('from'))->where('date','<=',request('to'))->get()->count();
                                                $payment =  $item->firstPaymentDate($item->id);
                                                $package = request('package') ? ($payment ?  ($payment->package->id==request('package') ? 1 : 0) : 0) : 1;
                                                $package = request('package') == -1 ? 1 : $package;
                                            @endphp
                                            @if($package)
                                            <tr>
                                                <td class="custom-image"><img src="{{ Voyager::image($item->avatar)}}" alt=""></td>
                                                <td>{{ $item->name }}</td>
                                                <td>{{ $payment ? $payment->package->title : "No Recent Package" }}</td>
                                                <td style="display: flex; justify-content:center">{{ $attendanceCount }}</td>
                                            </tr>
                                            @endif
                                        @endforeach
                                        @endif

                                    </tbody>

                                </table>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('css')
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
    <link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif

<link href="/css/jquery.datepicker2.css" rel="stylesheet">
<style>
    .custom-image{
        width: 80px;
        height: 80px;
    }
    .custom-image img{
        height: 100%;
        widows: 100%;
        object-fit: contain;
    }
    </style>
@stop

@section('javascript')
    <script src="/js/jquery.datepicker2.js"></script>
    <script>


        $('#fromCustomDate').prop("readonly", true);
        $('#toCustomDate').prop("readonly", true);

    </script>
    <!-- DataTables -->
    @if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
        <script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
    @endif
    <script>
        $(document).ready(function () {
            @if (!$dataType->server_side)
                var table = $('#dataTable').DataTable({!! json_encode(
                    array_merge([
                        "order" => $orderColumn,
                        "language" => __('voyager::datatable'),
                        "columnDefs" => [
                            ['targets' => 'dt-not-orderable', 'searchable' =>  false, 'orderable' => false],
                        ],
                    ],
                    config('voyager.dashboard.data_tables', []))
                , true) !!});
            @else
                $('#search-input select').select2({
                    minimumResultsForSearch: Infinity
                });
            @endif

            @if ($isModelTranslatable)
                $('.side-body').multilingual();
                //Reinitialise the multilingual features when they change tab
                $('#dataTable').on('draw.dt', function(){
                    $('.side-body').data('multilingual').init();
                })
            @endif
            $('.select_all').on('click', function(e) {
                $('input[name="row_id"]').prop('checked', $(this).prop('checked')).trigger('change');
            });
        });


        var deleteFormAction;
        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', '__id') }}'.replace('__id', $(this).data('id'));
            $('#delete_modal').modal('show');
        });

        @if($usesSoftDeletes)
            @php
                $params = [
                    's' => $search->value,
                    'filter' => $search->filter,
                    'key' => $search->key,
                    'order_by' => $orderBy,
                    'sort_order' => $sortOrder,
                ];
            @endphp
            $(function() {
                $('#show_soft_deletes').change(function() {
                    if ($(this).prop('checked')) {
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 1]), true)) }}"></a>');
                    }else{
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 0]), true)) }}"></a>');
                    }

                    $('#redir')[0].click();
                })
            })
        @endif
        $('input[name="row_id"]').on('change', function () {
            var ids = [];
            $('input[name="row_id"]').each(function() {
                if ($(this).is(':checked')) {
                    ids.push($(this).val());
                }
            });
            $('.selected_ids').val(ids);
        });
    </script>
@stop
