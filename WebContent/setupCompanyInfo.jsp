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
							<div class="widget-area">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Company Details :</a></li>
									</ul>
								</div>
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#comp">Company
											details</a></li>
									<li><a data-toggle="tab" href="#tax">Tax details</a></li>
								</ul>
								<div class="tab-content">
									<div id="comp" class="tab-pane fade active in">
										<div class="widget-area">

											<div class="wizard-form-h">

												<div id="step-1">

													<form action="#" method="get">

														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Company Name:</label> <input
																	type="text" name="name"
																	placeholder="Enter Company Name" required
																	class="form-control"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company
																	Email:</label> <input type="email" name="email"
																	placeholder="Enter Company Email" required
																	class="form-control"><br>
															</div>

														</div>

														<div class="col-md-6">
															<label for="exampleInputEmail1">Company Mobile
																No:</label> <input type='tel' pattern="[0-9]{10,10}" name="mono"
																placeholder="Eg. +9900000000" minlength="10"
																maxlength="10" required class="form-control"><br>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company Phone
																	No:</label> <input type='tel' pattern="[0-9]{10,10}"
																	name="phno" placeholder="Eg. +9900000000"
																	minlength="10" maxlength="10" required
																	class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company
																	Address:</label><br>
																<textarea name="adress" rows="5" cols="59"></textarea>
																<br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> City:</label> <input
																	type="text" name="city" placeholder="Enter city"
																	required class="form-control"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> State:</label> <input
																	type="text" name="state" placeholder="Enter State"
																	required class="form-control"><br>
															</div>
														</div>


														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> Upload logo:</label>
																<div>
																	<img id="image" alt="" src="">
																</div>
															</div>
															<input type="file" name="proImg" size="50" required
																onchange="readURL(this);">
														</div>
														<div class="col-md-6" style="top: 23px; right: -350px">
															<button class="btn btn-primary large" type="submit">Submit</button>
														</div>
													</form>

												</div>

											</div>

										</div>
									</div>
									<div id="tax" class="tab-pane fade ">
										<div class="widget-area">

											<div class="wizard-form-h">

												<div id="step-1">


													<form action="#" method="get">

														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">VAT No:</label> <input
																	type="number" name="vatno"
																	placeholder="Enter Company VAT No" required
																	class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">VAT
																	Registration:</label> <input type="text" name="email"
																	id="datepicker" required class="form-control"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">CST No:</label> <input
																	type="number" name="vatno"
																	placeholder="Enter Company CST No" required
																	class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">CST
																	Registration:</label> <input type="text" name="email"
																	id="datepicker" required class="form-control"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">TIN No:</label> <input
																	type="number" name="vatno"
																	placeholder="Enter Company TIN No" required
																	class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">TIN
																	Registration:</label> <input type="text" name="email"
																	id="datepicker" required class="form-control"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Service Tax No:</label>
																<input type="number" name="servicet"
																	placeholder="Enter Company Name" required
																	class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Service Tax
																	Registration:</label> <input type="text" name="email"
																	id="datepicker" required class="form-control"><br>
															</div>
														</div>

														<div class="col-md-6" style="top: 21px; right: -809px">
															<button class="btn btn-primary large" type="submit">Submit</button>
														</div>
													</form>
												</div>
											</div>
										</div>
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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