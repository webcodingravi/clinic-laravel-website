<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
        @lang('version'): {{ $ApplicationSetting->item_version; }}
    </div>
    <!-- Default to the left -->
    @lang('Copyright') &copy; {{ date("Y") }} <a href="#" target="_blank"></a>@lang('All rights reserved').
</footer>
