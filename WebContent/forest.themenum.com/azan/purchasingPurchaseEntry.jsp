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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

</head>
<body>

	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<!-- <div class="widget-area" style="width: 300px;">
						<form role="form" class="sec">
							<div class="form-group">
								<label for="" class="">Number : </label> <input type="text"
									placeholder="" id="" class="">
							</div>
							<div class="form-group">
								<label for="" class="">Status : </label> <select>
									<option value="all">All Open</option>
									<option value="bid">Bid Request</option>
									<option value="issued">Issued</option>
									<option value="pic">Picking</option>
									<option value="partial">Partial</option>
									<option value="picked">Picked</option>
									<option value="shipped">Shipped</option>
								</select>
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
									<th>Name</th>
									<th>Vendor Name</th>
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
					</div> -->

					<div class="widget-area">
						<div class="breadcrumbs">
							<ul>
								<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
								<li><a title="">Purchase Entry : </a></li>
								<li><a title=""><button type="submit">New</button> </a></li>
							</ul>
						</div>
						<br>
						<form action="">
							<div id="wizard" class="swMain">
								<div class="col-md-6">
									<div class="inline-form">
										<label class="c-label">Vendor</label><input
											class="input-style" type="text" placeholder="" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="inline-form">
										<label class="c-label">PO no.</label><input
											class="input-style" type="text" placeholder="" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="inline-form">
										<label class="c-label">Purchase Date</label><input
											class="input-style" type="text" id="datepicker"
											placeholder="" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="inline-form">
										<label class="c-label">Vendor SO</label><input type="text"
											placeholder="" />
									</div>
								</div>
								<table border="1" bordercolor="gray" align="center">
									<thead>
										<tr>
											<th>Vendor</th>
											<th align="right"><button type="submit"
													class="btn green btn-default">Add</button></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"><textarea rows="" cols="100%"
													readonly="readonly"></textarea></td>
										</tr>
									</tbody>
								</table>
								<table>
									<tr>
										<td width="900px"><select class="form-control">
												<option>pcode</option>
												<option>pcode</option>
												<option>pcode</option>
												<option>pcode</option>
												<option>pcode</option>
										</select></td>
										<td>
											<button type="submit">Add</button>
										</td>
									</tr>
								</table>
								<table border="1" bordercolor="gray" width="900px"
									align="center">
									<tr>
										<th>Qty</th>
										<th>Cost</th>
										<th>WSP</th>
										<th>MRP</th>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
						</form>
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