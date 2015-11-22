<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
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
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<style>
.font {
	color: #777777;
	float: left;
	font-family: Roboto;
	font-size: 12px;
	letter-spacing: 0.3px;
	padding-right: 20px;
}
</style>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#notpaid").hide();
		$("#semipaid").hide();
		$("#fullpaid").hide();
		$("#cash").hide();
		$("#bank").hide();
		$("#cheque").hide();
		$("#scash").hide();

	});
	function pstatus() {
		var val = $('[name="pstatus"]').val();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'npaid') {
			$("#notpaid").show();
			$("#fullpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'fpaid') {
			$("#fullpaid").show();
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'spaid') {
			$("#semipaid").show();
			$("#notpaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		}
	}
	function fptype() {
		var val = $('[name="fptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#cash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#cash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#cash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#cash").hide();
		}
	}
	function sptype() {
		var val = $('[name="sptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#scash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#scash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#scash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#scash").hide();
		}
	}
</script>
</head>
<body>
	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-6">
								<div class="widget-area">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Select Payment status : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-4">Payment status :</div>
										<div class="col-md-8">
											<div class="sec">
												<select class="form-control" name="pstatus"
													onchange="pstatus()">
													<option value="-" selected="selected">---</option>
													<option value="fpaid">Full paid</option>
													<option value="spaid">Semi paid</option>
													<option value="npaid">not paid</option>
												</select>
											</div>
										</div>
									</div>
									<div class="widget-area" id="fullpaid">
										<div class="breadcrumbs">
											<ul>
												<li><a title="">Select Payment type : </a></li>
											</ul>
										</div>
										<br> <br> <br>
										<div class="row">
											<div class="col-md-4">Payment type :</div>
											<div class="col-md-8">
												<div class="sec">
													<select class="form-control" name="fptype"
														onchange="fptype()">
														<option value="-" selected="selected">---</option>
														<option value="cash">Cash</option>
														<option value="cheq">Cheque</option>
														<option value="btra">Bank transfer</option>
													</select>
												</div>
											</div>
											<div class="col-md-4">Payment Date :</div>
											<div class="col-md-8">
												<input type="text" id="datepicker" class="form-control">
											</div>
											<div class="col-md-4">Amount :</div>
											<div class="col-md-8">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<br>
										<div class="breadcrumbs" id="cash">
											<button type="submit" class="btn green pull-right">Save</button>
										</div>
									</div>

									<div id="semipaid">
										<div class="breadcrumbs">
											<ul>
												<li><a title="">Select Payment type : </a></li>
											</ul>
										</div>
										<br> <br> <br>
										<div class="row">
											<div class="col-md-4">Payment type :</div>
											<div class="col-md-8">
												<div class="sec">
													<select class="form-control" name="sptype"
														onchange="sptype()">
														<option value="-" selected="selected">---</option>
														<option value="cash">Cash</option>
														<option value="cheq">Cheque</option>
														<option value="btra">Bank transfer</option>
													</select>
												</div>
											</div>
											<div class="col-md-4">Payment Date :</div>
											<div class="col-md-8">
												<input type="text" id="datepicker" class="form-control">
											</div>
											<div class="col-md-4">Full Amount :</div>
											<div class="col-md-8">
												<input type="text" class="form-control" readonly="readonly">
											</div>
											<div class="col-md-4">Payment Amount :</div>
											<div class="col-md-8">
												<input type="text" class="form-control">
											</div>
											<div class="col-md-4">Due Amount :</div>
											<div class="col-md-8">
												<input type="text" class="form-control" readonly="readonly">
											</div>
										</div>
										<br>
										<div class="breadcrumbs" id="scash">
											<button type="submit" class="btn green pull-right">Save</button>
										</div>
									</div>

								</div>
							</div>

							<!-- <div class="col-md-6" style="float: right;" id="notpaid">
								<div class="widget-area">not paid...</div>
							</div> -->

							<div class="col-md-6" style="float: right;" id="notpaid">
								<div class="widget-area">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Not Paid : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-4">Due Amount :</div>
										<div class="col-md-8">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<br>
									<div class="breadcrumbs">
										<button type="submit" class="btn green pull-right">Save</button>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="float: right;" id="cheque">
								<div class="widget-area">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Provide Cheque details : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-4">Cheque No. :</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
										<div class="col-md-4">Description(if any):</div>
										<div class="col-md-8">
											<textarea rows="" cols="" class="form-control"></textarea>
										</div>
									</div>
									<br>
									<div class="breadcrumbs">
										<button type="submit" class="btn green pull-right">Save</button>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="float: right;" id="bank">
								<div class="widget-area">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Provide Bank transfer details : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-4">Transaction ID :</div>
										<div class="col-md-8">
											<input type="text" class="form-control">
										</div>
										<div class="col-md-4">Description(if any):</div>
										<div class="col-md-8">
											<textarea rows="" cols="" class="form-control"></textarea>
										</div>
									</div>
									<br>
									<div class="breadcrumbs">
										<button type="submit" class="btn green pull-right">Save</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Content Sec -->
		</div>
		<!-- Page Container -->
	</div>
	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>