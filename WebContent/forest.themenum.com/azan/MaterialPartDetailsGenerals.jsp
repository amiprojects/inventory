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
								<div class="widget-area" style="width: 34%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Part Number : </label> <input
												type="text" placeholder="Enter Part Number" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Description : </label> <input
												type="text" placeholder="Enter Description" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Part Type : </label>&nbsp &nbsp <input
												type="text" placeholder="Enter part type" id="" class="">
										</div>

										<button class="btn green btn-default" type="submit">Search
										</button>
										<button class="btn green btn-default" type="submit">Advanced
											Search</button>
									</form>
									<br> <br>
									<table class="table" >
										<thead>
											<tr>
												<th>#</th>
												<th>Number</th>
												<th>Description</th>
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
								<div class="widget-area" style="width: 66%">
									<div class="breadcrumbs">
										<ul>
											<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
											<li><a title="">Part Details : </a></li>
											<li><a title=""><button type="submit">New</button></a></li>
											<li><a title=""><button type="submit">Edit</button></a></li>
											<li><a title=""><button type="submit">Delete</button></a></li>
										</ul>
									</div>

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#general">General</a></li>
										<li><a data-toggle="tab" href="#details">Details</a></li>
										<li><a data-toggle="tab" href="#inventory">Inventory</a></li>
										<li><a data-toggle="tab" href="#Vendor">Vendor</a></li>
										<li><a data-toggle="tab" href="#Custom">Custom</a></li>
									</ul>
									<br>
									<div class="tab-content">
										<div id="general" class="tab-pane fade active in">
											<div class="row">
												<div class="col-md-2">
													<label>Part No:</label>
												</div>
												<div class="col-md-4">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												<div class="col-md-1">
													<label>UOM:</label>
												</div>
												<div class="col-md-2">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												<div class="col-md-1">
													<label>Type:</label>
												</div>
												<div class="col-md-2">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												<br> <br> <br>
												<div class="col-md-2">
													<label>Description:</label>
												</div>

												<div class="col-md-10">
													<input type="text" readonly="readonly" class="form-control">
													<input type="checkbox" name="active" value="active">&nbsp
													Active<br> <br>
												</div>
												<div class="col-md-2">
													<label>Details:</label>
												</div>

												<div class="col-md-10">

													<textarea readonly="readonly" class="form-control"
														name="adress" rows="5" cols="59"></textarea>
													<br>
												</div>
												<br> <br>
												<div class="col-md-2">
													<label>Image:</label> <input type="file" name="proImg"
														size="50" required onchange="readURL(this);">
												</div>

												<div class="col-md-8">

													<img id="image" alt="" src="">

												</div>


											</div>


										</div>
										
										<div id="Custom" class="tab-pane fade ">
											
											
											<fieldset>
										<legend> Parts Custom fields </legend>

										<p style="font-size: 14px">(Enter Custom fields values.)</p>
										<br> <br> <br>
										<div class="col-md-8">
											<div>
												<label for="exampleInputEmail1">Custom 1:</label> <input
													type="text" name="c1" required class="form-control"><br>
											</div>
										</div>
										<div class="col-md-8">
											<div>
												<label for="exampleInputEmail1">Custom 2:</label> <input
													type="text" name="c2" required class="form-control"><br>
											</div>
										</div>
										<div class="col-md-8">
											<div>
												<label for="exampleInputEmail1">Custom 3:</label> <input
													type="text" name="c3" required class="form-control"><br>
											</div>
										</div>
										<div class="col-md-8">
											<div>
												<label for="exampleInputEmail1">Custom 4:</label> <input
													type="text" name="c4" required class="form-control"><br>
											</div>
										</div>


									</fieldset>
											
											
															

										</div>
										<div id="Vendor" class="tab-pane fade ">
											
<div class="col-md-12">

												<table id="stream_table"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Vendor</th>
															<th>Number</th>
															<th>Last Cost</th>
															<th>UOM</th>
															<th>Last Date</th>
															<th>Lead Time</th>
															<th>Default</th>

														</tr>
													</thead>
													<tbody>
														<tr>

															<td>wd</td>
															<td>fd</td>
															<td>dfd</td>
															<td>wd</td>
															<td>fd</td>
															<td>dfd</td>
															<td> <input type="checkbox" name="active"
																	value="active"></td>

														</tr>

													</tbody>
												</table>

											</div>

											</div>


										


										<div id="inventory" class="tab-pane fade ">

											<div class="row">
												<div class="col-md-3">
													<label>Unit Of Measure:</label>
												</div>
												<div class="col-md-9">

													<input type="text" class="form-control">
												</div>

											</div>
											<br>



											<div class="row">
												<div class="col-md-12" style="background-color: #f5f5f5;">
													<label>Inventory:</label>


												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-3">
													<label>On Hand :</label>
												</div>
												<div class="col-md-3">

													<input type="text" class="form-control">
												</div>
												<div class="col-md-3">
													<label>On Oder:</label>
												</div>
												<div class="col-md-3">
													<input type="text" class="form-control">
												</div>

											</div>
											<br>


											<div class="row">
												<div class="col-md-3">
													<label>Allocated :</label>
												</div>
												<div class="col-md-3">

													<input type="text" class="form-control">
												</div>
												<div class="col-md-3">
													<label>Committed:</label>
												</div>
												<div class="col-md-3">
													<input type="text" class="form-control">
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-3">
													<label>Not Available :</label>
												</div>
												<div class="col-md-3">

													<input type="text" class="form-control">
												</div>
												<div class="col-md-3">
													<label>Back Oder:</label>
												</div>
												<div class="col-md-3">
													<input type="text" class="form-control">
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-md-3">
													<label>Available for sale:</label>
												</div>
												<div class="col-md-3">

													<input type="text" class="form-control">
												</div>
												<div class="col-md-3">
													<label>Available to pick:</label>
												</div>
												<div class="col-md-3">
													<input type="text" class="form-control">
												</div>

											</div>
											<br> <br>



											<div class="row">
												<div class="col-md-12" style="background-color: #f5f5f5;">
													<label>Reorder Information:</label>


												</div>

											</div>



											<div class="col-md-12">

												<table id="stream_table"
													class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Location group</th>
															<th>Order upto top lable</th>
															<th>Reorder Point</th>

														</tr>
													</thead>
													<tbody>
														<tr>

															<td>wd</td>
															<td>fd</td>
															<td>dfd</td>

														</tr>

													</tbody>
												</table>

											</div>

										</div>



										<div id="details" class="tab-pane fade ">
											<div class="row">
												<div class="col-md-3">
													<label>UPC Code:</label>
												</div>
												<div class="col-md-3">
													<input type="text" class="form-control">
												</div>


												<div class="col-md-2">
													<label>Last Cost:</label>
												</div>

												<div class="col-md-4">
													<input type="text" class="form-control"> <br>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="breadcrumbs">
														<p style="font-size: 15px">
															<b>Size & Weight</b>
														</p>
													</div>
												</div>

												<div class="col-md-4">
													<label>Length:</label> <input type="text"
														class="form-control">

												</div>
												<div class="col-md-3">
													<label>width:</label> <input type="text"
														class="form-control">

												</div>
												<div class="col-md-3">
													<label>Height:</label> <input type="text"
														class="form-control">

												</div>
												<div class="col-md-2">
													<div style="top: 30px; left: -5px; position: absolute;">
														<select><option>Miter</option>
															<option>Kilo meter</option></select>
													</div>
												</div>



											</div>
											<div class="row">
												<div class="col-md-3">
													<label>Width:</label> <input type="text"
														class="form-control">

												</div>
												<div class="col-md-2">
													<div style="top: 30px; position: absolute;">
														<select><option>Miter</option>
															<option>Kilo meter</option></select>
													</div>
												</div>

											</div>
											<div class="row">

												<div class="col-md-12">
													<div class="breadcrumbs">
														<p style="font-size: 15px">
															<b>Tracking</b>
														</p>
													</div>
												</div>
												<div class="col-md-12">

													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>Selected</th>
																<th>Name</th>
																<th>Abbr</th>
																<th>Description</th>
																<th>Type</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td><input type="checkbox" name="active"
																	value="active"></td>
																<td>wd</td>
																<td>fd</td>
																<td>dfd</td>
																<td>dfd</td>
															</tr>
															<tr>
																<td><input type="checkbox" name="active"
																	value="active"></td>
																<td>wd</td>
																<td>fd</td>
																<td>dfd</td>
																<td>dfd</td>
															</tr>
															<tr>
																<td><input type="checkbox" name="active"
																	value="active"></td>
																<td>wd</td>
																<td>fd</td>
																<td>dfd</td>
																<td>dfd</td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
											<div class="row">

												<div class="col-md-12">
													<div class="breadcrumbs">
														<p style="font-size: 15px">
															<b>Product</b>
														</p>
													</div>
												</div>
												<div class="col-md-12">

													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>Product code</th>
																<th>Description</th>
																<th>price</th>
																<th>Default</th>


															</tr>
														</thead>
														<tbody>
															<tr>
																<td>wd</td>
																<td>fd</td>
																<td>dfd</td>
																<td><input type="checkbox" name="active"
																	value="active"></td>
															</tr>


														</tbody>
													</table>

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
		</div>

	<!-- Content Sec -->
	
	<!-- Page Container -->

	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<!-- <script type="text/javascript" src="js/modernizr.js"></script> -->
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="maxcdn.bootstrapcdn.js"></script>

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>