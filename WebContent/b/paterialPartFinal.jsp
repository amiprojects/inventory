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

<style>
.Clearboth {
	clear: both;
}

.divright {
	float: right;
}

.divleft {
	float: left;
}
</style>

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
<script type="text/javascript" src="js/jquery.min.js"></script>


<script>
var i=1;
	$(document).ready(function() {
		$("#step1").hide();
		$("#step2").hide();
		$("#step3").hide();
		$("#step4").hide();
		$("#step5").hide();
		$("#step6").hide();
		
		$("#next").click(function(){
			if(i>1){
				$("#step"+(i-1)).remove();
			}
			
			
			$("#step"+i).show();
			i=i+1;
		});
	
		//$("#step1").show();
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

					<div class="widget-area"
						style="width: 751px; height: 557px; padding: 2px; font-family: arial;">

						<div id="side"
							style="position: absolute; top: 33px; left: -1px; width: 167px; height: 555px; padding: 2px; font-family: arial;">

							<table id="stream_table"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Steps</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>step1</td>
									</tr>
									<tr>
										<td>step2</td>
									</tr>
									<tr>
										<td>step3</td>
									</tr>
									<tr>
										<td>step4</td>
									</tr>
									<tr>
										<td>step5</td>
									</tr>
									<tr>
										<td>step6</td>
									</tr>
									<tr>
										<td>step7</td>
									</tr>

									<tr>
										<td>summary</td>
									</tr>

								</tbody>
							</table>

						</div>


						<div id="step1"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">



							<div id="bU"
								style="position: position: absolute; top: 3px; right: 2px; width: 560px; height: 187px; font-family: arial; padding: 3px;">
								<fieldset>
									<legend>Parts:</legend>




									<form action="#" method="get">

										<div class="col-md-6">
											<div>
												<label for="exampleInputEmail1">Product Code:</label> <input
													type="text" name="pcode" placeholder="Enter Product code"
													required class="form-control"><br>
											</div>
										</div>
										<div class="col-md-6">
											<div>
												<label for="exampleInputPassword1">Description:</label> <input
													type="text" name="Description"
													placeholder="product Description" required
													class="form-control"><br>
											</div>

										</div>

										<div class="col-md-6">
											<label for="exampleInputEmail1">Universal Product
												Code:</label> <input type="text" name="Universal Product Code"
												placeholder="" class="form-control"><br>
										</div>
										<div class="col-md-6">
											<div>
												<label for="exampleInputPassword1">UOM:</label> <select
													name="uom" style="width: 238px; height: 34px">
													<option value="volvo">Volvo</option>
													<option value="saab">Saab</option>
													<option value="opel">Opel</option>
													<option value="audi">Audi</option>
												</select>
											</div>
										</div>

									</form>
								</fieldset>
							</div>
							<div id="bD"
								style="position: absolute; top: 225px; right: 2px; width: 560px; height: 180px; font-family: arial;">
								<fieldset>
									<legend>Products:</legend>

									<p style="font-size: 14px; margin-left: 342px;">
										&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp<input
											type="checkbox" name="salepart" value="salep" id="salepart">This
										Part is for sale:
									</p>
									<div id="divshow">
										<div class="col-md-6">
											<div>
												<label for="exampleInputEmail1">Product Code:</label> <input
													type="text" name="pcode" placeholder="Enter Product code"
													required class="form-control"><br>
											</div>
										</div>
										<div class="col-md-6"></div>
										<div class="col-md-6">
											<div>
												<label for="exampleInputPassword1">Description:</label> <input
													type="text" name="Description"
													placeholder="product Description" required
													class="form-control"><br>
											</div>

										</div>


										<div class="col-md-6">
											<label for="exampleInputEmail1">Universal Product
												Code:</label> <input type="text" name="Universal Product Code"
												placeholder="" class="form-control"><br>
										</div>
										<div class="col-md-6">
											<div>
												<label for="exampleInputPassword1">Price:</label> <input
													type="text" name="price" required class="form-control"><br>
											</div>
										</div>
									</div>

								</fieldset>

							</div>



						</div>

						<div id="step2"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




							<fieldset>
								<legend>
									<img src="Capture.PNG">&nbsp &nbsp Track
								</legend>

								<p style="font-size: 14px">(You want to track the
									product/raw materials by)</p>
								<br>
								<br>
								<br>
								<table class="table">

									<thead>
										<tr>
											<th>Selected</th>
											<th>Name</th>
											<th>Abbr</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="track" value="track"></td>
											<td>Lot Number</td>
											<td>Lot#</td>

										</tr>
										<tr>
											<td><input type="checkbox" name="expDate" value="track"></td>
											<td>Expiration Date</td>
											<td>Exp Date</td>

										</tr>
										<tr>
											<td><input type="checkbox" name="track" value="track"></td>
											<td>Serial Number</td>
											<td>Ser#</td>



										</tr>
									</tbody>
								</table>

							</fieldset>

						</div>

						<div id="step3"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




							<fieldset>
								<legend> Add Initial Inventory </legend>

								<p style="font-size: 14px">(Enter the part's initial
									inventory.)</p>
								<br> <br> <br> <input type="radio" name="do"
									value="doNotAdd">Do not add initial inventory <br>
								<hr width="100%">
								<input type="radio" name="do" value="initialInventory">Add
								initial inventory <br> <br>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Location:</label> <input
											type="text" name="location" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Quantity:</label> <input
											type="number" name="qty" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">UOM:</label><select name="uom"
											style="width: 238px; height: 34px">
											<option value="volvo">km</option>
											<option value="saab">mm</option>
											<option value="mercedes">hm</option>
											<option value="audi">cm</option>
										</select><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Unit Cost:</label> <input
											type="text" name="pcode" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Date:</label> <input
											type="text" name="date" required class="form-control"><br>
									</div>
								</div>




							</fieldset>

						</div>
						<div id="step4"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




							<fieldset>
								<legend> Initial inventory tracking </legend>

								<p style="font-size: 14px">(Enter the tracking information
									for parts being added to inventory.)</p>
								<br> <br> <br>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Lot Number:</label> <input
											type="number" name="location" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Expiration Date:</label> <input
											type="text" name="location" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-6">
									<div>
										<label for="exampleInputEmail1">Serial Number:</label> <input
											type="number" name="serialN" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-9">
									<div>
										<table id="stream_table"
											class="table table-striped table-bordered">
											<!-- 	<thead>
												<tr>
													<th>Serial Number</th>

												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>

												</tr>
											</tbody> -->
											<tr>
												<td>
													<table cellspacing="0" cellpadding="1" width="304">
														<tr style="">
															<th>Serial Number</th>

														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<div style="width: 375px; height: 86px; overflow: auto;">
														<table cellspacing="0" cellpadding="1" width="300">
															<tr>
																<td>789456123</td>

															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
															<tr>

																<td>789456123</td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</table>

									</div>
								</div>
								<div style="position: absolute; bottom: 124px; left: 425px;">
									<a href="#"> <img src="img/pus.PNG"
										style="top: 2px; left: 3px"></a> <a href="#"> <img
										src="img/sp.PNG" style="top: 2px; left: 3px">
									</a> <a href="#"><img src="img/hash.PNG"
										style="top: 2px; left: 3px"> </a> <a href="#"><img
										src="img/delete.PNG" style="top: 2px; left: 3px"></a>
								</div>


							</fieldset>

						</div>

						<div id="step5"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




							<fieldset>
								<legend> Parts category fields </legend>

								<p style="font-size: 14px">(Enter category fields values.)</p>
								<br> <br> <br>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 1:</label> <input
											type="text" name="c1" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 2:</label> <input
											type="text" name="c2" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 3:</label> <input
											type="text" name="c3" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 4:</label> <input
											type="text" name="c4" required class="form-control"><br>
									</div>
								</div>


							</fieldset>

						</div>
						<div id="step6"
							style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




							<fieldset>
								<legend> Product category fields </legend>

								<p style="font-size: 14px">(Enter category fields values.)</p>
								<br> <br> <br>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 1:</label> <input
											type="text" name="c1" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 2:</label> <input
											type="text" name="c2" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 3:</label> <input
											type="text" name="c3" required class="form-control"><br>
									</div>
								</div>
								<div class="col-md-8">
									<div>
										<label for="exampleInputEmail1">Category 4:</label> <input
											type="text" name="c4" required class="form-control"><br>
									</div>
								</div>


							</fieldset>

						</div>





						<div id="head"
							style="position: absolute; top: -1px; left: -3px; width: 754px; height: 50px; padding: 2px;">
							<!-- <h3>Create a new Part</h3> -->
							<div class="breadcrumbs">
								<ul>

									<li><a title=""><h4>Create a new Part</h4></a></li>
								</ul>
							</div>
							<!-- breadcrumbs -->
						</div>

						<div class="breadcrumbs">
							<ul>
								<li><a href="dashboard.html" title=""><i
										class="fa fa-home"></i></a>/</li>
								<li><a title="">Create a new Part</a></li>
							</ul>
						</div>

						<div id="boxdown"
							style="position: absolute; bottom: -12px; left: -1px; width: 751px; height: 49px; padding: 0;">

							<div class="breadcrumbs" style="height: 49px;">

								<button type="button" class="c-btn medium gray"
									style="position: absolute; right: 7px; top: 3px;">Cancel</button>
								<button type="button" class="c-btn medium gray"
									style="position: absolute; right: 87px; top: 3px;">Finish</button>
								<button type="button" class="c-btn medium gray"
									style="position: absolute; right: 165px; top: 3px;" id="next">Next</button>
								<button type="button" class="c-btn medium gray"
									style="position: absolute; right: 240px; top: 3px;">
									Back</button>

							</div>


						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->
	<!-- Script -->


	<script type="text/javascript">
		$(document).ready(function() {
			$("#divshow").hide();

			$("#salepart").click(function() {
				$("#divshow").toggle();
			});

		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image').attr('src', e.target.result).width(120).height(
							85);
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