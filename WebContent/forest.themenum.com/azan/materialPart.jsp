<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
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
					<div class="widget-area"
						style="width: 300px; width: 751px; height: 557px; padding: 2px;  font-family: arial;">
						
						<div id="side" style="position:  absolute;
    top: 49px;
    left: -1px;
    width: 167px;
    height: 453px;
    padding: 2px;
    border: 1px solid black;
    font-family: arial;">
	

	
	</div>
	
	
	<div id="body" style="
    position: absolute;
    top: 57px;
    right: 2px;
    width: 568px;
    height: 439px;
    padding: 2px;
    
    font-family: arial;">
	<h4 text-align="center">Part & Product Information:</h4>
	
	
	<div id="bU" style="
   position: absolute;
    top: 45px;
    right: 2px;
    width: 560px;
    height: 187px;
    padding: 2px;
   
    font-family: arial;">
	<fieldset>
  <legend>Parts:</legend>
	
	<form>
	<table  align="center" style="font-size: 16px; height: 150px;">
  <col width="80">
  <col width="80">
  <tr><td>Code:</td>
  <td><input type="number" name="pcode" required></td></tr>
  
  <tr><td>Description:</td>
  <td><input type="text" name="pdes" required></td></tr>
  
   <tr><td>UPC:</td>
  <td><input type="number" name="pdes" required></td></tr>
  
  <tr><td>UOM:</td>
  <td><select name="uom" style="width: 172px">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="opel">Opel</option>
  <option value="audi">Audi</option>
</select></td></tr>
  
  
  </table>
	</form>
	
	</fieldset>
	
	</div>
	
	<div id="bD" style="
   position:  absolute;
    top: 253px;
    right: 2px;
    width: 560px;
    height: 180px;
    padding: 2px;
       font-family: arial;">
	<fieldset>
  <legend>Products:</legend>
  
  <input type="checkbox" name="salepart" value="salep">This Part is for sale:<br>
  <form>
	<table  align="center" style="font-size: 16px; height: 115px;">
  <col width="80">
  <col width="80">
  <tr><td>Code:</td>
  <td><input type="number" name="pcode1" required></td></tr>
  
  <tr><td>Description:</td>
  <td><input type="text" name="pdes2" required></td></tr>
  
   <tr><td>UPC:</td>
  <td><input type="number" name="upc" required></td></tr>
  </table>
</form>  
  </fieldset>
	
	</div>
	
	
	
	</div>
	
	<div id="head" style="position:  absolute;
    top: -1px;
    left: -1px;
    width: 751px;
    height: 45px;
    padding: 2px;
    border: 1px solid black;
    font-family: arial;">
	<h3> Create a new Part</h3>

	</div>
	
	<div id="boxdown" style="position:      absolute;
    bottom: -1px;
    left: -1px;
    width: 751px;
    height: 49px;
    padding: 2px;
    border: 1px solid black;
    font-family: arial;">
<button type="button" style=" position: absolute;
    right: 7px;
    width: 72px;
    height: 44px;
    top: 5px;" >Cancel</button>
 <button type="button" style=" position: absolute;
    right: 83px;
    width: 72px;
    height: 44px;
    top: 5px;">Finish</button>
 <button type="button" style=" position: absolute;
    right: 159px;
    width: 72px;
    height: 44px;
    top: 5px;">Next</button>
 <button type="button"style=" position: absolute;
    right: 240px;
    width: 72px;
    height: 44px;
    top: 5px;" > Back</button>
 
	</div>
	

					</div>

					<div class="widget-area" style="width: 600px"></div>
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
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).width(120).height(85);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
		dateFormat: "dd-mm-yy"
	});
	$(function() {
		$("#datepicker1").datepicker();
		dateFormat: "dd-mm-yy"
	});
	$(function() {
		$("#datepicker2").datepicker();
		dateFormat: "dd-mm-yy"
	});
	$(function() {
		$("#datepicker3").datepicker();
		dateFormat: "dd-mm-yy"
	});
</script>

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
											'#17c3e5', '#109618', '#66aa00',
											'#dd4477', '#0099c6', '#990099 ' ]
								});

						$(function() {
							$("#new-orders").sparkline(
									[ 4, 5, 6, 7, 6, 5, 4, 3, 2, 2, 3, 4 ], {
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
									[ 2, 3, 4, 5, 2, 5, 6, 2, 8, 5, 1, 5 ], {
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
									[ 6, 5, 3, 1, 4, 5, 6, 7, 3, 2, 3, 8 ], {
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
												'Today' : [ moment(), moment() ],
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
														moment().endOf('month') ],
												'Last Month' : [
														moment()
																.subtract(
																		'month',
																		1)
																.startOf(
																		'month'),
														moment().subtract(
																'month', 1)
																.endOf('month') ]
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
														'Tu', 'We', 'Th', 'Fr',
														'Sa' ],
												monthNames : [ 'January',
														'February', 'March',
														'April', 'May', 'June',
														'July', 'August',
														'September', 'October',
														'November', 'December' ],
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