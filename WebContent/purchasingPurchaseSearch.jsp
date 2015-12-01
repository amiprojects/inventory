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

</head>
<body>

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec" style="height: 100%; overflow-y: scroll;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Purchase Search</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area">
									<form role="form" class="sec">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Purchase Entry Number :</label> <input
														type="" placeholder="Enter Purchase Entry Number" id=""
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Vendor SO :</label> <input type=""
														placeholder="Enter Vendor SO :" id="" class="form-control">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Search between two dates : (Start
														Date)</label> <input type="date" placeholder="Enter First Date"
														id="" class="form-control">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="">(End Date)</label> <input type="date"
														placeholder="Enter last date" id="" class="form-control">
												</div>
											</div>
										</div>
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="">Product code :</label> <input type=""
														placeholder="Enter Product code" id=""
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Vendor Name:</label> <input type=""
														placeholder="Enter Vendor Name" id="" class="form-control">
												</div>
											</div>
										</div>
										<button class="btn green pull-right" type="submit">Search</button>
									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>PO no.</th>
												<th>Vendor Name</th>
												<th>Vendor SO</th>
												<th>Purchase Date</th>
												<th>Cost</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
											</tr>
										</tbody>
									</table>
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

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>