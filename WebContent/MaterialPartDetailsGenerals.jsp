<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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




<script type="text/javascript" src="js/enscroll.js"></script>

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
	var i = 2;
	$(document)
			.ready(
					function() {
						$("#step2").hide();
						$("#step3").hide();
						$("#step4").hide();
						$("#step5").hide();
						$("#step6").hide();
						$("#step7").hide();
						$("#step8").hide();
						$("#next")
								.click(
										function() {
											if (i < 9) {
												$("#step" + (i - 1)).hide();
												$("#menu" + (i - 1)).attr(
														"style", "");

												$("#step" + i).show();
												$("#menu" + i)
														.attr(
																"style",
																"color: red; font-weight: bolder; background-color: #A3DEDE; box-shadow: 1px 1px 1px 1px #507B8A");
												i = i + 1;
											}
										});

						$("#prev")
								.click(
										function() {
											if (i > 2) {
												$("#step" + (i - 1)).hide();
												$("#menu" + (i - 1)).attr(
														"style", "");

												$("#step" + (i - 2)).show();
												$("#menu" + (i - 2))
														.attr(
																"style",
																"color: red; font-weight: bolder; background-color: #A3DEDE; box-shadow: 1px 1px 1px 1px #507B8A");
												i = i - 1;
											}

										});

						//$("#step1").show();
					});

	
	function increSerial() {
		$("#step67").modal('show');
	}
</script>



<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<style>
#selectedFiles img {
	max-width: 125px;
	max-height: 125px;
	float: left;
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Product/Material</b>
											</p></li>
									</ul>
								</div>

								<div class="widget-area" style="width: 34%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Products Number : </label> <input
												type="text" placeholder="Enter Products Number" id=""
												class="">
										</div>
										<div class="form-group">
											<label for="" class="">Description : </label> <input
												type="text" placeholder="Enter Description" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Products Type : </label>&nbsp &nbsp <input
												type="text" placeholder="Enter Products type" id="" class="">
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
											<li><a title="">Products Details : </a></li>
											<li><a href="#" title=""><button type="button"
														class="btn btn-info btn-sm" data-toggle="modal"
														data-target="#newMP">New</button></a></li>
											<li><a title=""><button class="btn btn-info btn-sm"
														type="submit">Edit</button></a></li>
											<li><a title=""><button class="btn btn-info btn-sm"
														type="submit">Delete</button></a></li>
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
													<label>Products No:</label>
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
												<legend> Products Custom fields </legend>

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
															<td><input type="checkbox" name="active"
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



	<div id="newMP" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

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
									<td
										style="color: red; font-weight: bolder; background-color: #A3DEDE; box-shadow: 1px 1px 1px 1px #507B8A;"
										id="menu1">step1</td>
								</tr>
								<tr>
									<td id="menu2">step2</td>
								</tr>
								<tr>
									<td id="menu3">step3</td>
								</tr>
								<tr>
									<td id="menu4">step4</td>
								</tr>
								<tr>
									<td id="menu5">step5</td>
								</tr>
								<tr>
									<td id="menu6">step6</td>
								</tr>
								<tr>
									<td id="menu7">step7</td>
								</tr>

								<tr>
									<td id="menu8">summary</td>
								</tr>

							</tbody>
						</table>

					</div>
					


					<div id="step67" class="modal fade" role="dialog"
						style="top: 25px; right: 2px">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title">Serial Number</h4>
									<button type="button" id="close2">&times;</button>
								</div>
								<div class="modal-body">

									<input type="hidden" name="id" value="" id="id1"> <span>Enter
										Initial Serial Number: </span> <input type="text"
										class="form-control" name="name" value="" id="name1">

									<input type="hidden" name="id" value="" id="id1"> <span>Enter
										Increment Limit: </span> <input type="text" class="form-control"
										name="name" value="" id="name1"> <input type="submit"
										class="btn btn-default" value="submit">

								</div>
								<div class="modal-footer">
									<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
								</div>
							</div>

						</div>
					</div>

					<div id="step1"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">
						<div id="bU"
							style="position: position: absolute; top: 3px; right: 2px; width: 560px; height: 187px; font-family: arial; padding: 3px;">
							<fieldset>
								<legend>Product:</legend>
								<form action="#" method="get">
									<div class="col-md-6">
										<div>
											<label for="exampleInputEmail1">Product Code:</label> <input
												type="text" name="productCode" 
												required class="form-control"><br>
										</div>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Description:</label> <input
												type="text" name="description"
												 required
												class="form-control"><br>
										</div>

									</div>

									<div class="col-md-6">
										<label for="exampleInputEmail1">Universal Product
											Code:</label> <input type="text" name="universalProductCode" required
											placeholder="" class="form-control"><br>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Unit Of Measurement:</label> <select required
												name="uom" style="width: 245px; height: 34px">
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

							<h3>Products:</h3>

							<p style="font-size: 14px; margin-right: 342px;">
								<input type="checkbox" name="isSalesPart" value="salep"
									id="salepart">This Products is for sale:
							</p>

							<hr width="100%">
						</div>



					</div>

					<div id="step2"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend>
								<img src="Capture.PNG">&nbsp &nbsp Track
							</legend>

							<p style="font-size: 14px">(You want to track the product/raw
								materials by)</p>
							<br> <br> <br>
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
										<td><input type="checkbox" name="lotNumber" 
										onclick="L()" id="ll"
										value="lotnumber"></td>
										<td>Lot Number</td>
										<td>Lot#</td>

									</tr>

									<tr>
										<td><input type="checkbox" name="serialNumber"
										onclick="S()" id="ss"
										 value="track"></td>
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

							<p style="font-size: 14px">(Enter the Products's initial
								inventory.)</p>
							<br> <br> <input type="radio" name="do" checked
								id="idd" onclick="o();" value="doNotAdd">Do not add
							initial inventory <br> <br> <input type="radio"
								name="do" id="openn" onclick="openn();">Add initial
							inventory <br>
							<hr width="100%">



							<script type="text/javascript">
								$(document).ready(function() {
									$("#divshow").hide();
									$("#divhide").show();
								});
								function openn() {
									if ($("#openn").is(":checked")) {
										$("#divshow").show();
										$("#divhide").hide();
									}
								}
								function o() {
									if ($("#idd").is(":checked")) {
										$("#divshow").hide();
										$("#divhide").show();
									}
								}
							</script>
							
							
							<div id="divshow">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input type="text" name="mrp"
											placeholder="" id="" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input type="text" name="wsp"
											placeholder="" id="" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											type="number" placeholder="" id="" class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Unit of Measure :</label> <select name="uom"
											style="width: 249px; height: 34px">
											<option value="volvo">km</option>
											<option value="saab">mm</option>
											<option value="mercedes">hm</option>
											<option value="audi">cm</option>
										</select>
									</div>
									<div class="form-group">
										<label for="" class="font">Unit Cost:</label> <input
											type="text" placeholder="" id="" class="form-control">

									</div>
									<div class="form-group">
										<label for="" class="font">Date:</label> <input type="text"
											placeholder="" id="datepicker" class="form-control">
									</div>
								</div>

							</div>

							<div id="divhide">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input type="text" 
											readonly="readonly" placeholder="" id="" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input type="text"
											readonly="readonly" placeholder="" id="" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											readonly="readonly" type="number" placeholder="" id=""
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Unit of Measure :</label> <select name="uom"
											style="width: 238px; height: 34px">

										</select>
									</div>
									<div class="form-group">
										<label for="" class="font">Unit Cost:</label> <input
											readonly="readonly" type="text" placeholder="" id=""
											class="form-control">

									</div>
									<div class="form-group">
										<label for="" class="font">Date:</label> <input type="text"
											readonly="readonly" placeholder="" id="" class="form-control">
									</div>
								</div>

							</div>


						</fieldset>

					</div>
					<div id="step4"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Initial inventory tracking </legend>

							<p style="font-size: 14px">(Enter the tracking information
								for Products being added to inventory.)</p>
							<br> <br> <br>
							<div class="col-md-6">
								<div id="lotdiv">
									<label for="exampleInputEmail1">Lot Number:</label> <input
										type="text" name="lotNumber" required class="form-control"><br>
								</div>
							</div>
							<div id="serdiv">
							<div class="col-md-6">
								<div >
									<label for="exampleInputEmail1">Serial Number:</label> <input
										type="text" name="serialNumber" required class="form-control"><br>
								</div>
							</div>

							<div class="col-md-9">
								<div>
									<table id="stream_table"
										class="table table-striped table-bordered">

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
							<div style="position: absolute; bottom: 203px; left: 425px;">
								<a href="#" onclick="addSerial();"> <img
									src="img/pus.PNG" style="top: 2px; left: 3px"></a> <a
									onclick="increSerial();" href="#"> <img src="img/hash.PNG"
									style="top: 2px; left: 3px">
								</a> <a href="#"><img src="img/delete.PNG"
									style="top: 2px; left: 3px"></a>
							</div>
</div>

						</fieldset>

					</div>

					<div id="step5"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Products category fields </legend>

							<p style="font-size: 14px">(Enter category fields values.)</p>



							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="font">Attribute 1:</label> <input name="a1"
										type="text" placeholder="" id="" class="form-control">
								</div>
								<div class="form-group">
									<label for="" class="font">Attribute 2:</label> <input name="a2"
										type="text" placeholder="" id="" class="form-control">
								</div>
								<div class="form-group">
									<label for="" class="font">Attribute 3:</label> <input name="a3"
										type="number" placeholder="" id="" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="" class="font">Attribute 4:</label> <input name="a4"
										type="text" placeholder="" id="" class="form-control">
								</div>
								<div class="form-group">
									<label for="" class="font">Attribute 5:</label> <input name="a5"
										type="text" placeholder="" id="" class="form-control">
								</div>
								<div class="form-group">
									<label for="" class="font">Attribute 6:</label> <input name="a6"
										type="number" placeholder="" id="" class="form-control">
								</div>
							</div>
						</fieldset>

					</div>
					<div id="step6"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">

						<div class="masonary-grids">
							<div class="col-md-6">
								<div class="widget-area">
									<h2 class="widget-title">
										<strong>Tree</strong> List
									</h2>
									<div class="tree-list">
										<p>
											<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
												id="tree-collapse-all">Collapse all</a>
										</p>
										<!-- Listing directory ZendX from ZendFramework library -->
										<ul id="tree" class="abix-tree-list">
											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>Application
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Resource
														<ul>
															<li style="display: none;">Jquery.php</li>
														</ul></li>
												</ul></li>

											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>Console
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Process
														<ul>
															<li style="display: none;">Exception.php</li>
															<li style="display: none;">Unix.php</li>
														</ul></li>
													<li style="display: none;">Exception.php</li>
												</ul></li>

											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>JQuery
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Controller
														<ul>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Action
																<ul>
																	<li class="collapsed" style="display: none;"><span
																		class="icon glyphicon glyphicon-plus"></span>Helper
																		<ul>
																			<li style="display: none;">AutoComplete.php</li>
																		</ul></li>
																</ul></li>
														</ul></li>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>View
														<ul>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Helper
																<ul>
																	<li class="collapsed" style="display: none;"><span
																		class="icon glyphicon glyphicon-plus"></span>JQuery
																		<ul>
																			<li style="display: none;">Container.php</li>
																		</ul></li>
																	<li style="display: none;">UiWidgetPane.php</li>
																	<li style="display: none;">UiWidget.php</li>
																	<li style="display: none;">TabPane.php</li>
																	<li style="display: none;">TabContainer.php</li>
																	<li style="display: none;">Spinner.php</li>
																	<li style="display: none;">Slider.php</li>
																	<li style="display: none;">JQuery.php</li>
																	<li style="display: none;">AutoComplete.php</li>
																	<li style="display: none;">DialogContainer.php</li>
																	<li style="display: none;">DatePicker.php</li>
																	<li style="display: none;">ColorPicker.php</li>
																	<li style="display: none;">AccordionPane.php</li>
																	<li style="display: none;">AjaxLink.php</li>
																	<li style="display: none;">AccordionContainer.php</li>
																</ul></li>
															<li style="display: none;">Exception.php</li>
														</ul></li>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Form
														<ul>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Decorator
																<ul>
																	<li style="display: none;">AccordionContainer.php</li>
																	<li style="display: none;">UiWidgetPane.php</li>
																	<li style="display: none;">UiWidgetElementMarker.php</li>
																	<li style="display: none;">UiWidgetElement.php</li>
																	<li style="display: none;">UiWidgetContainer.php</li>
																	<li style="display: none;">TabPane.php</li>
																	<li style="display: none;">TabContainer.php</li>
																	<li style="display: none;">DialogContainer.php</li>
																	<li style="display: none;">AccordionPane.php</li>
																</ul></li>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Element
																<ul>
																	<li style="display: none;">AutoComplete.php</li>
																	<li style="display: none;">UiWidget.php</li>
																	<li style="display: none;">Spinner.php</li>
																	<li style="display: none;">Slider.php</li>
																	<li style="display: none;">DatePicker.php</li>
																	<li style="display: none;">ColorPicker.php</li>
																</ul></li>
															<li style="display: none;">Exception.php</li>
														</ul></li>
													<li style="display: none;">Form.php</li>
													<li style="display: none;">Exception.php</li>
												</ul></li>

											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>Db
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Adapter
														<ul>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Firebird
																<ul>
																	<li style="display: none;">Exception.php</li>
																</ul></li>
															<li style="display: none;">Firebird.php</li>
														</ul></li>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Statement
														<ul>
															<li class="collapsed" style="display: none;"><span
																class="icon glyphicon glyphicon-plus"></span>Firebird
																<ul>
																	<li style="display: none;">Exception.php</li>
																</ul></li>
															<li style="display: none;">Firebird.php</li>
														</ul></li>
												</ul></li>
											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>Form
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Decorator
														<ul>
															<li style="display: none;">AccordionContainer.php</li>
															<li style="display: none;">UiWidgetPane.php</li>
															<li style="display: none;">UiWidgetElementMarker.php</li>
															<li style="display: none;">UiWidgetElement.php</li>
															<li style="display: none;">UiWidgetContainer.php</li>
															<li style="display: none;">TabPane.php</li>
															<li style="display: none;">TabContainer.php</li>
															<li style="display: none;">DialogContainer.php</li>
															<li style="display: none;">AccordionPane.php</li>
														</ul></li>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>Element
														<ul>
															<li style="display: none;">AutoComplete.php</li>
															<li style="display: none;">UiWidget.php</li>
															<li style="display: none;">Spinner.php</li>
															<li style="display: none;">Slider.php</li>
															<li style="display: none;">DatePicker.php</li>
															<li style="display: none;">ColorPicker.php</li>
														</ul></li>
													<li style="display: none;">Exception.php</li>
												</ul></li>
											<li class="collapsed"><span
												class="icon glyphicon glyphicon-plus"></span>Helper
												<ul>
													<li class="collapsed" style="display: none;"><span
														class="icon glyphicon glyphicon-plus"></span>JQuery
														<ul>
															<li style="display: none;">Container.php</li>
														</ul></li>
													<li style="display: none;">UiWidgetPane.php</li>
													<li style="display: none;">UiWidget.php</li>
													<li style="display: none;">TabPane.php</li>
													<li style="display: none;">TabContainer.php</li>
													<li style="display: none;">Spinner.php</li>
													<li style="display: none;">Slider.php</li>
													<li style="display: none;">JQuery.php</li>
													<li style="display: none;">AutoComplete.php</li>
													<li style="display: none;">DialogContainer.php</li>
													<li style="display: none;">DatePicker.php</li>
													<li style="display: none;">ColorPicker.php</li>
													<li style="display: none;">AccordionPane.php</li>
													<li style="display: none;">AjaxLink.php</li>
													<li style="display: none;">AccordionContainer.php</li>
												</ul></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="step7"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Product category fields </legend>

							<p style="font-size: 14px">(Enter category fields values.)</p>

							<form id="myForm" method="post" enctype="multipart/form-data">

								Files: <input type="file" id="files" name="files" multiple=""
									accept="image/*"><br>

								<div style="width: 564px; height: 302px; overflow-y: scroll;"
									id="selectedFiles"></div>

							</form>




						</fieldset>





					</div>
					<div id="step8"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial; overflow: auto;">
						<fieldset>
							<legend> Summary </legend>
							<form>
								<h4>
									<u>Products:</u>
								</h4>
								<b>Code:</b><br> <b>Description:</b><br> <b>Universal
									Product Code:</b><br> <b>UOM:</b><br> <br>
								<h4>
									<u>Product:</u>
								</h4>
								<b>Code:</b><br> <b>Description:</b><br> <b>Universal
									Product Code:</b><br> <b>UOM:</b><br>
								<hr width="100%">

								<h4>
									<u>Tracking Options:</u>
								</h4>
								<b>Lot Number:</b><br>
								<hr width="100%">

								<h4>
									<u>Add initial inventory:</u>
								</h4>
								<b>Location:</b><br> <b>Quantity:</b><br> <b>UOM:</b><br>
								<b>Unit Cost:</b><br> <b>Date:</b>
								<hr width="100%">

								<h4>
									<u>Initial inventory tracking:</u>
								</h4>
								<b>Lot Number:</b><br> <b>Expiration Date:</b><br> <b>Serial
									Number:</b><br>
								<hr width="100%">

								<h4>
									<u>Products Custom Field:</u>
								</h4>
								<b>Custom1:</b><br> <b>Custom2:</b><br> <b>Custom3:</b><br>
								<b>Custom4:</b>
								<hr width="100%">

								<h4>
									<u>Product Tree:</u>
								</h4>
								<b>product was not added to any categories:</b>
								<hr width="100%">

								<h4>
									<u>Product Custom Fields:</u>
								</h4>
								<b>Custom1:</b><br> <b>Custom2:</b><br> <b>Custom3:</b><br>
								<b>Custom4:</b>
								<hr width="100%">



							</form>


						</fieldset>

					</div>




					<div id="head"
						style="position: absolute; top: -1px; left: -2px; width: 754px; height: 50px; padding: 2px;">
						<!-- <h3>Create a new Part</h3> -->
						<div class="breadcrumbs">
							<ul>

								<li><a title=""><h4>
											Create a new Product &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp
											&nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
											&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
											&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
											&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
											&nbsp &nbsp &nbsp &nbsp
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</h4></a></li>
							</ul>
						</div>

					</div>

					<div class="breadcrumbs">
						<ul>
							<li><a href="dashboard.html" title=""><i
									class="fa fa-home"></i></a>/</li>
							<li><a title="">Create a new Products</a></li>
						</ul>
					</div>

					<div id="boxdown"
						style="position: absolute; bottom: -12px; left: 0px; width: 751px; height: 49px; padding: 0;">

						<div class="breadcrumbs" style="height: 49px;">

							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 7px; top: 3px;"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 87px; top: 3px;">Finish</button>
							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 165px; top: 3px;" id="next">Next</button>
							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 240px; top: 3px;" id="prev">
								Back</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			</div>
		</div>

	</div>


	<!-- Script -->

	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#prodact").attr("id", "activeSubMenu");
			$("#sProduct").attr("style", "color: red;");
			$("#divshow").hide();
			$("#divhide").show();
		});
		$("#close").click(function() {
			$("#newMP").modal("hide");
		});
		
		
		$("#close2").click(function() {
			$("#step67").modal("hide");
		});
	</script>


	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	
	<script type="text/javascript">
								$(document).ready(function() {
									$("#lotdiv").hide();
									$("#serdiv").hide();
								});
								function L() {
									if ($("#ll").is(":checked")) {
										$("#lotdiv").show();
										
										
									}
									else{
										$("#lotdiv").hide();
										
									}
								}
								function S() {
									if ($("#ss").is(":checked")) {
										$("#serdiv").show();
										
										
									}
									
									else{
										$("#serdiv").hide();
										
									}
								}
							</script>
	
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});

		$(function() {
			$("#datepicker1").datepicker();
		});
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>
	<script>
		var selDiv = "";

		document.addEventListener("DOMContentLoaded", init, false);

		function init() {
			document.querySelector('#files').addEventListener('change',
					handleFileSelect, false);
			selDiv = document.querySelector("#selectedFiles");
		}

		function handleFileSelect(e) {

			if (!e.target.files || !window.FileReader)
				return;

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					return;
				}

				var reader = new FileReader();
				reader.onload = function(e) {
					var html = "<img src=\"" + e.target.result + "\">" + f.name
							+ "<br clear=\"left\"/>";
					selDiv.innerHTML += html;
				}
				reader.readAsDataURL(f);

			});

		}
		
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>