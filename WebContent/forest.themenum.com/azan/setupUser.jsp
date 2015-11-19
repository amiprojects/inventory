<!DOCTYPE html>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
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
											<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
											<li><a title="">User Details : </a></li>
											<li><a title=""><button type="submit">New</button></a></li>
											<li><a title=""><button type="submit">Edit</button></a></li>
											<li><a title=""><button type="submit">Delete</button></a></li>
										</ul>
									</div>

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#general">General</a></li>
										<li><a data-toggle="tab" href="#locGroups">Location
												Groups</a></li>
									</ul>
									<div class="tab-content">
										<div id="general" class="tab-pane fade ">
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">First Name :</label> <input
														type="text" placeholder="" id="" class="form-control"
														readonly="readonly">
												</div>
												<div class="form-group">
													<label for="" class="font">Username :</label> <input
														type="text" placeholder="" id="" class="form-control"
														readonly="readonly">
												</div>
												<div class="form-group">
													<label for="" class="font">Ph :</label> <input type="tel"
														placeholder="" id="" class="form-control"
														readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Last Name :</label> <input
														type="text" placeholder="" id="" class="form-control"
														readonly="readonly">
												</div>
												<div class="form-group">
													<label for="" class="font">Email :</label> <input
														type="email" placeholder="" id="" class="form-control"
														readonly="readonly">
												</div>
											</div>
											<div class="col-md-12">
												<div class="breadcrumbs">
													<ul>
														<li><a title="">User Groups : </a></li>
													</ul>
												</div>
												<hr>
												<div class="row">
													<div class="col-md-6">
														<div class="breadcrumbs">
															<ul>
																<li><a title="" class="font">Available Groups</a></li>
															</ul>
														</div>
														<textarea rows="" cols="" id="" class="form-control"
															readonly="readonly"></textarea>
													</div>
													<div class="col-md-6">
														<div class="breadcrumbs">
															<ul>
																<li><a title="" class="font">User belongs to</a></li>
															</ul>
														</div>
														<textarea rows="" cols="" id="" class="form-control"
															readonly="readonly"></textarea>
													</div>
												</div>
											</div>
										</div>

										<div id="locGroups" class="tab-pane fade ">
											Default location groups :
											<div class="sec">
												<select class="form-control" disabled="disabled">
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
													<div class="col-md-6">
														<div class="breadcrumbs">
															<ul>
																<li><a title="" class="font">Available</a></li>
															</ul>
														</div>
														<textarea rows="" cols="" id="" class="form-control"
															readonly="readonly"></textarea>
													</div>
													<div class="col-md-6">
														<div class="breadcrumbs">
															<ul>
																<li><a title="" class="font">Member of</a></li>
															</ul>
														</div>
														<textarea rows="" cols="" id="" class="form-control"
															readonly="readonly"></textarea>
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