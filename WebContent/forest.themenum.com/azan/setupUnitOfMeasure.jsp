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
								<div class="widget-area" style="width: 30%">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Name : </label> <input type="text"
												placeholder="" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Abbrev : </label> <input type="text"
												placeholder="" id="" class="">
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
												<th>Abbrev</th>
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
											<li><a title="" class="active">Unit of Measurements
													: </a></li>
											<li><a title=""><button type="button"
														class="btn btn-info btn-lg" data-toggle="modal"
														data-target="#newUOM">New</button></a></li>
											<li><a title=""><button type="submit">Edit</button></a></li>
											<li><a title=""><button type="submit">Delete</button></a></li>
										</ul>
									</div>

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#general">General</a></li>
										<li><a data-toggle="tab" href="#con">Conversions</a></li>
									</ul>
									<br>
									<div class="tab-content">
										<div id="general" class="tab-pane fade active in">
											<div class="row">
												<div class="col-md-2">Abreve :</div>
												<div class="col-md-10">
													<input type="text" readonly="readonly" class="form-control">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Name :</div>
												<div class="col-md-10">
													<input type="text" readonly="readonly" class="form-control">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Description :</div>
												<div class="col-md-10">
													<textarea rows="" cols="" class="form-control"
														readonly="readonly"></textarea>
												</div>
											</div>
										</div>
										<div id="con" class="tab-pane fade ">

											<div class="col-md-12">
												<div class="breadcrumbs">
													<ul>
														<li><a title="">Description </a></li>
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
				<!-- Content Sec -->
			</div>
			<!-- Page Container -->
		</div>
		<!-- main -->

		<div id="newUOM" class="modal fade" role="dialog" style="top: 25px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">New Unit of Measurements :</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-4">Select a UOM type :</div>
							<div class="col-md-8">
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>

			</div>
		</div>

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