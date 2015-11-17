<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,500,700,900'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css' />

<!-- Styles -->
<link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.css"
	type="text/css" />
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" media="all"
	href="css/daterangepicker-bs3.css" />
<!-- Date Range Picker -->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="css/jquery-jvectormap.css" type="text/css" />
<!-- Vector Map -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" />
<!-- Carousal -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->

</head>
<body>

	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="widget-area" style="width: 300px;">
						<form role="form" class="sec">
							<div class="form-group">
								<label for="" class="">Username : </label> <input type="text"
									placeholder="Enter username" id="" class="">
							</div>
							<div class="form-group">
								<label for="" class="">First name : </label> <input type="text"
									placeholder="Enter lastname" id="" class="">
							</div>

							<button class="btn green btn-default" type="submit">Search
							</button>
							<button class="btn green btn-default" type="submit">Advanced
								Search</button>
						</form>
						<br> <br>
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Firstname</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td>Otto</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
									<td>Thornton</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Larry</td>
									<td>the Bird</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td>Otto</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td>Otto</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
									<td>Otto</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="widget-area" style="width: 600px">
						<div class="breadcrumbs">
							<ul>
								<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
								<li><a title="">User Details : </a></li>
								<li><a title=""><button type="submit">New</button> </a></li>
							</ul>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#general">General</a></li>
							<li><a data-toggle="tab" href="#locGroups">Location
									Groups</a></li>
							<li><a data-toggle="tab" href="#memo">Memo</a></li>
						</ul>
						<div class="tab-content">
							<div id="general" class="tab-pane fade ">
								<div class="wizard-form-h">
									<div id="wizard" class="swMain">
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">First Name</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Last Name</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Username</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Email</label><input type="text"
													placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Phone</label><input type="text"
													placeholder="" />
											</div>
										</div>
										&nbsp&nbsp&nbsp
										<button class="btn green btn-default" type="submit">Change
											Password</button>
										&nbsp&nbsp&nbsp&nbsp
										<button class="btn green btn-default" type="submit">Update</button>
									</div>
								</div>
								<br>
								<hr>
								<br>
								<table align="center" border="1" bordercolor="gray">
									<tr>
										<th colspan="2">User Groups</th>
									</tr>
									<tr>
										<td>Available Groups</td>
										<td>User belongs to</td>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>

							<div id="locGroups" class="tab-pane fade ">
								Default location groups :
								<div class="sec">
									<select class="form-control">
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
									</select>
								</div>
								<table border="1" bordercolor="gray">
									<tr>
										<th colspan="2">Location Groups</th>
									</tr>
									<tr>
										<td>Available</td>
										<td>Member of</td>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>
							<div id="memo" class="tab-pane fade ">
								<button type="submit">Print Memos</button>
								<hr>
								<table border="1" bordercolor="gray" align="center">
									<tr>
										<th>Date</th>
										<th>User</th>
										<th>Memo</th>
									</tr>
									<tr>
										<td colspan="3"><textarea rows="" cols=""></textarea></td>
									</tr>
									<tr>
										<td colspan="3"><button type="submit">Add</button>
											<button type="submit">Edit</button>
											<button type="submit">Delete</button></td>
									</tr>
								</table>
								<hr>
								<table>
									<tr>
										<th>Memo</th>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/daterangepicker.js"></script>
	<script type="text/javascript" src="js/moment.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript" src="js/jquery-jvectormap.js"></script>
	<script type="text/javascript" src="js/jquery-jvectormap-world-en.js"></script>
	<script type="text/javascript" src="js/gdp-data.js"></script>
	<script type="text/javascript" src="js/chart-line-and-graph.js"></script>
	<script type="text/javascript" src="js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/html5lightbox.js"></script>

	<script type="text/javascript">
		function random_num(field, interval, range) {

			setInterval(function() {
				var chars = "0123456789";
				var string_length = range;
				var randomstring = '';
				for (var i = 0; i < string_length; i++) {
					var rnum = Math.floor(Math.random() * chars.length);
					randomstring += chars.substring(rnum, rnum + 1);
				}
				var a = jQuery("#" + field).html(randomstring);
				console.log(a);
			}, interval);
		};
	</script>
	<script>
		jQuery(document).ready(function() {
			random_num('random', 3000, 3);
		});
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$(".carousal-sec").owlCarousel({
								autoPlay : true,
								stopOnHover : true,
								goToFirstSpeed : 500,
								slideSpeed : 500,
								singleItem : true,
								autoHeight : true,
								transitionStyle : "backSlide",
								navigation : true
							});

							$("#pie").sparkline(
									[ 1, 1, 2 ],
									{
										type : 'pie',
										width : '40',
										height : '40',
										sliceColors : [ '#2dcb73', '#fd6a59',
												'#17c3e5', '#109618',
												'#66aa00', '#dd4477',
												'#0099c6', '#990099 ' ]
									});

							$(function() {
								$("#new-orders").sparkline(
										[ 4, 5, 6, 7, 6, 5, 4, 3, 2, 2, 3, 4 ],
										{
											type : 'bar',
											height : '40px',
											barSpacing : 3,
											barWidth : 6,
											barColor : '#2dcb73',
											negBarColor : '#D6A838'
										});
							});

							$(function() {
								$("#new-sales").sparkline(
										[ 2, 3, 4, 5, 2, 5, 6, 2, 8, 5, 1, 5 ],
										{
											type : 'bar',
											height : '40px',
											barSpacing : 3,
											barWidth : 6,
											barColor : '#ff604f',
											negBarColor : '#D6A838'
										});
							});

							$(function() {
								$("#new-visitors").sparkline(
										[ 6, 5, 3, 1, 4, 5, 6, 7, 3, 2, 3, 8 ],
										{
											type : 'bar',
											height : '40px',
											barSpacing : 3,
											barWidth : 6,
											barColor : '#17c3e5',
											negBarColor : '#D6A838'
										});
							});

							$('#reportrange')
									.daterangepicker(
											{
												startDate : moment().subtract(
														'days', 29),
												endDate : moment(),
												minDate : '01/01/2012',
												maxDate : '12/31/2014',
												dateLimit : {
													days : 60
												},
												showDropdowns : true,
												showWeekNumbers : true,
												timePicker : false,
												timePickerIncrement : 1,
												timePicker12Hour : true,
												ranges : {
													'Today' : [ moment(),
															moment() ],
													'Yesterday' : [
															moment().subtract(
																	'days', 1),
															moment().subtract(
																	'days', 1) ],
													'Last 7 Days' : [
															moment().subtract(
																	'days', 6),
															moment() ],
													'Last 30 Days' : [
															moment().subtract(
																	'days', 29),
															moment() ],
													'This Month' : [
															moment().startOf(
																	'month'),
															moment().endOf(
																	'month') ],
													'Last Month' : [
															moment()
																	.subtract(
																			'month',
																			1)
																	.startOf(
																			'month'),
															moment()
																	.subtract(
																			'month',
																			1)
																	.endOf(
																			'month') ]
												},
												opens : 'left',
												buttonClasses : [ 'btn btn-default' ],
												applyClass : 'btn-small btn-primary',
												cancelClass : 'btn-small',
												format : 'MM/DD/YYYY',
												separator : ' to ',
												locale : {
													applyLabel : 'Submit',
													fromLabel : 'From',
													toLabel : 'To',
													customRangeLabel : 'Custom Range',
													daysOfWeek : [ 'Su', 'Mo',
															'Tu', 'We', 'Th',
															'Fr', 'Sa' ],
													monthNames : [ 'January',
															'February',
															'March', 'April',
															'May', 'June',
															'July', 'August',
															'September',
															'October',
															'November',
															'December' ],
													firstDay : 1
												}
											},
											function(start, end) {
												console
														.log("Callback has been called!");
												$('#reportrange span')
														.html(
																start
																		.format('MMMM D, YYYY')
																		+ ' - '
																		+ end
																				.format('MMMM D, YYYY'));
											});
							//Set the initial state of the picker label
							$('#reportrange span').html(
									moment().subtract('days', 29).format(
											'MMMM D, YYYY')
											+ ' - '
											+ moment().format('MMMM D, YYYY'));

							$(function() {
								$('#map').vectorMap({
									map : 'world_en'
								});
							})

						});
	</script>
</body>
</html>