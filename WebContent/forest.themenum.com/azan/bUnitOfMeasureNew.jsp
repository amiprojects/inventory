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

	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>

			<div class="content-sec">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-8">
								<div class="widget-area">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">New Unit of Measurements : </a></li>
										</ul>
									</div>
									<br> <br> <br>

									<div class="row">
										<div class="col-md-3">Select a UOM type :</div>
										<div class="col-md-9">
											<select class="form-control">
												<option value="none">---</option>
												<option value="cou">Count</option>
												<option value="wei">Weight</option>
												<option value="len">Length</option>
												<option value="are">Area</option>
												<option value="vol">Volume</option>
												<option value="tim">Time</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">Abbreviation :</div>
										<div class="col-md-9">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">Name UOM :</div>
										<div class="col-md-9">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">UOM Description :</div>
										<div class="col-md-9">
											<textarea rows="" cols="" class="form-control"></textarea>
										</div>
									</div>
									<button type="submit" class="btn green pull-right">Submit</button>
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