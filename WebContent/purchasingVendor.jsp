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
<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

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
<!-- Script -->
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>

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

<!-- <script type="text/javascript">
$(document).ready(function(){
	$('#dashSing').removeAttr("class");
	$('#dashSub').removeAttr("style","display: none;");
	$('#purSing').attr("class","active");
	$('#purSub').attr("style","display: block !important;");
});
</script> -->

</head>
<body>

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec" style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">

								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Vendor Details</b>
											</p></li>
									</ul>
								</div>

								<div class="widget-area" style="width: 28%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Name : </label> <input type="text"
												placeholder="" id="" class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="">City/State : </label>
											<div class="row">
												<div class="col-md-8">
													<input type="text" placeholder="" id=""
														class="form-control">
												</div>
												<div class="col-md-4">
													<select class="form-control">
														<option>---</option>
														<option>---</option>
														<option>---</option>
														<option>---</option>
														<option>---</option>
													</select>
												</div>
											</div>
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
												<th>Number</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="widget-area" style="width: 72%">

									<form role="form" class="sec">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab"
												href="#bankAccount">Bank Account info</a></li>
											<li><a data-toggle="tab" href="#vendorAccount">Vendor
													Account Info</a></li>
											<li><a data-toggle="tab" href="#detail">Details</a></li>
											<li><a data-toggle="tab" href="#address">Address</a></li>
											<li><a data-toggle="tab" href="#part">Parts</a></li>
										</ul>
										<div class="tab-content">
											<div id="bankAccount" class="tab-pane fade active in">
												<div class="widget-area">
													<div class="col-md-3">
														<b>Bank Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>A/C no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>Branch:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>City:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>IFSC no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>MICR no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>RTGS code:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>Check lebel:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-right" type="submit">Next</button>
												</div>
											</div>
											<div id="vendorAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="row">
														<div class="col-md-5">
															<b>VAT no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>VAT registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>PAN no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control">
														</div>
													</div>
													<div class="row">
														<div class="col-md-5">
															<b>Tax group id:</b>
														</div>
														<div class="col-md-7">
															<select class="form-control">
																<option>---</option>
																<option>---</option>
																<option>---</option>
															</select>
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-left" type="submit">Previous</button>
													<button class="btn green pull-right" type="submit">Next</button>
												</div>
											</div>

											<div id="detail" class="tab-pane fade">
												<div class="widget-area">

													<div class="col-md-3">
														<b>Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>
													<br>
													<div class="col-md-3">
														<b>Company Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>

													<div class="col-md-3">
														<b>Ph No1:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>

													<div class="col-md-3">
														<b>Ph No2:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>

													<div class="col-md-3">
														<b>Email :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>

													<div class="col-md-3">
														<b>Alias name :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control">
													</div>

													<div class="col-md-3">
														<b>Vendor type :</b>
													</div>
													<div class="col-md-9">
														<select class="form-control">
															<option>Supplier</option>
															<option>Agent</option>
															<option>Jobber</option>
															<option>Transporter</option>
														</select>
													</div>

													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font">Change History</a></li>
														</ul>
														<hr>
													</div>

													<div class="row">
														<b>Last modified date :</b>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-left" type="submit">Previous</button>
													<button class="btn green pull-right" type="submit">Next</button>
												</div>
											</div>
											<div id="address" class="tab-pane fade ">
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Address</h6></a></li>
														</ul>
													</div>
													<textarea rows="" cols="" class="form-control"></textarea>
													<div class="row">
														<div class="col-md-3">City :</div>
														<div class="col-md-9">
															<input type="text" class="form-control">
														</div>
													</div>
													<div class="row">
														<div class="col-md-3">Pin code :</div>
														<div class="col-md-9">
															<input type="text" class="form-control">
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-left" type="submit">Previous</button>
													<button class="btn green pull-right" type="submit">Next</button>
												</div>
											</div>
											<div id="part" class="tab-pane fade ">
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Purchase
																		History</h6></a></li>
														</ul>
													</div>
													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Part Number</th>
																<th>Vendor number</th>
																<th>Last cost</th>
																<th>UOM</th>
																<th>Last date</th>
																<th>Lead time</th>
																<th>Description</th>
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
																<td>---</td>
																<td>---</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Vendor
																		cost rules</h6></a></li>
														</ul>
													</div>
													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Part Number</th>
																<th>Qty</th>
																<th>Part UOM</th>
																<th>Unit cost</th>
																<th>Total cost</th>
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
																<td>---</td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>
												<div class="col-md-12">
													<button class="btn green pull-left" type="submit">Previous</button>
													<button class="btn green pull-left" type="submit">Next</button>
													<button class="btn green pull-right" type="submit">Update</button>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>