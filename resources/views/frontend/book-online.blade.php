<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png">
    <meta name="site-url" content="{{ url('/') }}">
    <meta name="success-title" content="{{ session('success-title') }}">
    <meta name="success-message" content="{{ session('success-message') }}">
	<title>{{ $ApplicationSetting->item_name }} | @lang('Contact') :: ambitiousit.net</title>
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.css') }}">
	<!-- Template CSS -->
	<link rel="stylesheet" href="assets/css/style-starter.css">
	<link rel="stylesheet" href="{{ asset('assets/css/frontend.css') }}">
    @if(session('locale') == 'ar')
        <link href="{{ asset('assets/css/bootstrap-rtl.min.css') }}" rel="stylesheet">
    @else
        <link href="{{ asset('assets/plugins/alertifyjs/css/themes/bootstrap.min.css') }}" rel="stylesheet">
    @endif
    <!-- sweetalert2 CSS -->
	<link rel="stylesheet" href="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.css') }}">
	<!-- Template CSS -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700&display=swap" rel="stylesheet">
	<!-- flag -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/flag-icons-3.1.0/css/flag-icon.css') }}">
</head>

<style>
  .w3l-free-consultion{
    margin: 4rem 0;
  }
</style>

<body>
	@include('frontend.common.header')

  <nav id="breadcrumbs" class="breadcrumbs">
		<div class="container page-wrapper">
			<a href="http://localhost/identsoft">Home</a> » <span class="breadcrumb_last" aria-current="page">Book Online</span>
		</div>
	</nav>

<section class="w3l-free-consultion">
  <div class="container">
    <div class="consultation-grids">
      <div class="apply-form">
        <h5>@lang('Book an Appointment')</h5>
        <form id="appointmentForm" action="" method="get">
          <input type="hidden" name="company_id" value="1">
          <div class="admission-form">
            <div class="form-group">
              <input type="text" name="name" class="form-control" placeholder="@lang('Full Name')*" required>
            </div>
            <div class="form-group">
              <input type="text" name="phone" class="form-control" placeholder="@lang('Phone Number')*" required>
            </div>
            <div class="form-group">
              <input type="email" name="email" class="form-control" placeholder="@lang('Email')*" required>
            </div>
            <select name="doctor_id" id="doctor_id" class="form-control" required>
            </select>
            <div class="form-group">
              <input type="text" name="appointment_date" id="appointment_date" class="form-control flatpickr" placeholder="@lang('Appointment Date')*" required>
            </div>
            <div class="form-group">
              <select id="appointment_slot" name="appointment_slot" class="form-control"  required>
                <option value="">@lang('Select Appointment Slot')*</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <textarea name="problem" class="form-control" placeholder="@lang('Problem')"></textarea>
          </div>
          <button type="submit" class="btn btn-primary submit">@lang('Book Now')</button>
        </form>
      </div>
      <div class="consultation-img">
        <img src="{{ asset('assets/images/ab.jpg') }}" class="img-fluid" alt="/">
      </div>
    </div>
  </div>
</section>


@include('frontend.common.footer')
<script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
@if(session('locale') == 'ar')
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
@else
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
@endif
<script src="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<script src="{{ asset('assets/js/custom/frontend/contact.js') }}"></script>
</body>

</html>