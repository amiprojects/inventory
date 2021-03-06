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

<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

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
							<div class="col-md-12">
								<div class="widget-area" style="width: 30%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Username : </label> <input type="text"
												placeholder="Enter username" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">First name : </label> <input
												type="text" placeholder="Enter lastname" id="" class="">
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
								<div class="widget-area" style="width: 70%">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">New User : </a></li>
										</ul>
									</div>
									<form role="form" class="sec">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#general">General</a></li>
											<li><a data-toggle="tab" href="#locGroups">Location
													Groups</a></li>
										</ul>
										<div class="tab-content">
											<div id="general" class="tab-pane fade active in">
												<div class="col-md-6">
													<div class="form-group">
														<label for="" class="font">First Name :</label> <input
															type="text" placeholder="" id="" class="form-control">
													</div>
													<div class="form-group">
														<label for="" class="font">Username :</label> <input
															type="text" placeholder="" id="" class="form-control">
													</div>
													<div class="form-group">
														<label for="" class="font">Ph :</label> <input type="tel"
															placeholder="" id="" class="form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="" class="font">Last Name :</label> <input
															type="text" placeholder="" id="" class="form-control">
													</div>
													<div class="form-group">
														<label for="" class="font">Email :</label> <input
															type="email" placeholder="" id="" class="form-control">
													</div>
													<button class="btn green pull-right" type="submit">Set
														password</button>
												</div>
												<div class="col-md-12">
													<div class="breadcrumbs">
														<ul>
															<li><a title="">User Groups : </a></li>
														</ul>
													</div>
													<hr>
													<div class="row">
														<div class="col-md-5">
															<div class="breadcrumbs">
																<ul>
																	<li><a title="" class="font">Available Groups</a></li>
																</ul>
															</div>
															<textarea rows="" cols="" id="" class="form-control"></textarea>
														</div>
														<div class="col-md-2">
															<a href="#"><img src="images/forward.png"></a> <a
																href="#"><img src="images/backward.png"></a> <br>
															<a href="#"><img src="images/allForwaRD.png"></a> <a
																href="#"><img src="images/allbACKWARD.png"></a>
														</div>
														<div class="col-md-5">
															<div class="breadcrumbs">
																<ul>
																	<li><a title="" class="font">User belongs to</a></li>
																</ul>
															</div>
															<textarea rows="" cols="" id="" class="form-control"></textarea>
														</div>
													</div>
												</div>
												<br>
												<button class="btn green pull-right" type="submit">Next</button>
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
												<div class="col-md-12">
													<div class="breadcrumbs">
														<ul>
															<li><a title="">Location Groups : </a></li>
														</ul>
													</div>
													<hr>
													<div class="row">
														<div class="col-md-5">
															<div class="breadcrumbs">
																<ul>
																	<li><a title="" class="font">Available</a></li>
																</ul>
															</div>
															<textarea rows="" cols="" id="" class="form-control"></textarea>
														</div>
														<div class="col-md-2">
															<a href="#"><img src="images/forward.png"></a> <a
																href="#"><img src="images/backward.png"></a> <br>
															<a href="#"><img src="images/allForwaRD.png"></a> <a
																href="#"><img src="images/allbACKWARD.png"></a>
														</div>
														<div class="col-md-5">
															<div class="breadcrumbs">
																<ul>
																	<li><a title="" class="font">Member of</a></li>
																</ul>
															</div>
															<textarea rows="" cols="" id="" class="form-control"></textarea>
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-left" type="submit">Previous</button>
													<button class="btn green pull-right" type="submit">Submit</button>
												</div>
											</div>
										</div>
									</form>
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