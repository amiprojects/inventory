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
<script type="text/javascript" src="js/jquery.min.js"></script>

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




<script>
	var i = 2;
	var x = "";
	var serial = [];
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
											if (i == 9) {
												$("#finish").prop("disabled",
														false);
												$("#pcodedisp")
														.val(
																$(
																		"#productCode")
																		.val());
												$("#description1")
														.val(
																$(
																		"#description")
																		.val());
												$("#upc ")
														.val(
																$(
																		"#universalProductCode")
																		.val());
												$("#uom1")
														.val($("#uomO").val());
												$("#mrp1")
														.val($("#mrpO").val());
												$("#wsp").val($("#wspO").val());
												$("#quantity111").val(
														$("#quantity").val());
												$("#uom")
														.val($("#uomO1").val());
												$("#ucost")
														.val($("#ucO").val());
												$("#date2").val(
														$("#datepicker").val());
												$("#ltnum").val(
														$("#lotnO").val());
												$("#att1").val($("#a1O").val());
												$("#att2").val($("#a2O").val());
												$("#att3").val($("#a3O").val());
												$("#att4").val($("#a4O").val());
												$("#att5").val($("#a5O").val());
												$("#att6").val($("#a6O").val());

												for (l = 0; l < serial.length; l++) {
													x = x
															+ serial[l]
															+ '<br><input type="hidden" value="'+serial[l]+'" name="serialNumber">';

												}
												$("#slNo").html(x);
											}
										});

						$("#prev")
								.click(
										function() {
											$("#finish").prop("disabled", true);
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

					});

	function increSerial() {
		$("#step67").modal('show');
	}
	function submitSumary() {
		$("#fs").submit();
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
		<%-- <%@include file="includeHeader.jsp"%> --%>
		<div class="page-container menu-left" style="height: 100%;">
			<%-- <%@include file="includeSidebar.jsp"%> --%>
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
												<b>Product/Material</b> ${requestScope['msg']}
											</p></li>
									</ul>
								</div>
								<div class="widget-area" style="width: 66%">
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
									<div class="col-md-6">
										<input class="btn btn-primary large" type="button"
											onclick="back();" value="Back">
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

								</div>
								<div class="modal-body">

									<input type="hidden" name="id" value="" id="id1"> <span>Enter
										Initial Serial Number: </span> <input type="text"
										class="form-control" name="name" value="" id="1stSerial"><br>

									<input type="hidden" name="id" value="" id="id1"> <span>Count:
									</span> <input type="text" class="form-control" id="limit" readonly
										name="increLimit">

								</div>
								<div class="modal-footer">
									<button style="float: left;" onclick="incre();"
										class="c-btn small green" type="button">Submit</button>
									<button style="float: right;" class="c-btn small red"
										type="button" id="close2">Close</button>
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
												type="text" name="productCode" id="productCode" required
												class="form-control"><br>
										</div>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Description:</label> <input
												type="text" name="description" id="description" required
												class="form-control"><br>
										</div>

									</div>

									<div class="col-md-6">
										<label for="exampleInputEmail1">Universal Product
											Code:</label> <input type="text" name="universalProductCode"
											id="universalProductCode" required placeholder=""
											class="form-control"><br>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Unit Of
												Measurement:</label> <select required name="uom" id="uomO"
												class="form-control" style="width: 250px; height: 34px">

												<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
													var="qqty">
													<option value="${qqty.id}">${qqty.name}</option>
												</c:forEach>


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
								<input type="checkbox" onclick="isSaledata()" id="salepart">This
								Products is for sale:
							</p>

							<hr width="100%">
						</div>



						<script type="text/javascript">
							$('#salepart').click(function() {

								if ($('#salepart').is(':checked')) {
									$("#cross").hide();
									$("#tick").show();
								} else {

									$("#tick").hide();
									$("#cross").show();
								}
							});
						</script>

					</div>

					<div id="step2"
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
										<ul id="tree">
											<c:forEach items="${sessionScope['ejb'].getAllDepartments()}"
												var="dept">
												<li>${dept.name}
													<ul>
														<c:forEach
															items="${sessionScope['ejb'].getAllSubDepartmentsByDepartmentId(dept.id)}"
															var="subDept">
															<li>${subDept.name}
																<ul>
																	<c:forEach var="cat"
																		items="${sessionScope['ejb'].getAllCategoryBySubDepartmentId(subDept.id)}">
																		<li><input type="radio"
																			onclick="catProblem('${cat.id}')" value="${cat.id}">
																			${cat.name}
																			<ul>
																				<c:forEach var="pro"
																					items="${sessionScope['ejb'].getAllProductDetailByCategoryId(cat.id)}">
																					<li>${pro.description}</li>
																				</c:forEach>
																			</ul></li>
																	</c:forEach>
																</ul>
															</li>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
										</ul>
									</div>

								</div>
							</div>
						</div>



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
								function back() {
									window.location = 'stockView.jsp';
								}

								$(document).ready(function() {
									$("#divshow").hide();
									$("#divhide").show();
									$("#AttiDiv").hide();
									$("#skip").show();
									$("#showhide").show();
								});
								function openn() {
									if ($("#openn").is(":checked")) {
										$("#divshow").show();
										$("#divhide").hide();
										$("#AttiDiv").show();
										$("#l&S").show();
										$("#skip").hide();
										$("#showhide").hide();
									}
								}
								function o() {
									if ($("#idd").is(":checked")) {
										$("#divshow").hide();
										$("#divhide").show();
										$("#skip").show();
										$("#showhide").show();
									}
								}
							</script>


							<div id="divshow">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input
											type="number" name="mrp" placeholder="" id="mrpO"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input
											type="number" name="wsp" placeholder="" id="wspO"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											name="quantity" type="number" id="quantity"
											onkeyup="setLimit()" class="form-control">
									</div>


									<%-- 	<div class="form-group">
										<label for="" class="font">Unit of Measurement :</label> <select
											id="uomO1" name="uom1" style="width: 253px; height: 34px">
											<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
												var="qity">
												<option value="${qity.id}">${qity.name}</option>
											</c:forEach>
										</select>
									</div> --%>


									<div class="form-group">
										<label for="" class="font">Per Unit Cost:</label> <input
											name="unitCost" type="number" placeholder="" id="ucO"
											class="form-control">

									</div>
									<div class="form-group">
										<h4>
											Print Barcode <input type="checkbox" id="barCode">
										</h4>
									</div>
								</div>

							</div>

							<div id="divhide">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input
											type="text" readonly="readonly" placeholder="" id=""
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input
											type="text" readonly="readonly" placeholder="" id=""
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											readonly="readonly" type="text" placeholder="" id=""
											class="form-control">
									</div>



									<div class="form-group">
										<label for="" class="font">Per Unit Cost:</label> <input
											readonly="readonly" type="number" placeholder="" id=""
											class="form-control">


									</div>
								</div>
							</div>


						</fieldset>

					</div>
					<div id="step4"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">


						<div id="l&S">

							<fieldset>
								<legend> Initial inventory tracking </legend>

								<p style="font-size: 14px">(Enter the tracking information
									for Products being added to inventory.)</p>
								<br> <br> <br>
								<div class="col-md-6">
									<div id="lotdiv">
										<label for="exampleInputEmail1">Lot Number:</label> <input
											id="lotnO" type="text" name="lotNumber" required
											class="form-control"><br>
									</div>
								</div>
								<div id="serdiv">
									<div class="col-md-6">
										<div>
											<label for="exampleInputEmail1">Serial Number:</label> <input
												type="text" name="serialNumber" id="indvSerial"
												class="form-control" required><br>
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
														<div style="width: 375px; height: 164px; overflow: auto;">
															<table cellspacing="0" cellpadding="1" width="300"
																id="serialNo">

															</table>
														</div>
													</td>
												</tr>
											</table>
										</div>
									</div>
									<div style="position: absolute; bottom: 203px; left: 425px;">
										<a href="#" id="addSeriall" onclick="addSerial();"> <img
											src="img/pus.PNG" style="top: 2px; left: 3px"></a> <a
											onclick="increSerial();" href="#"> <img
											src="img/hash.PNG" style="top: 2px; left: 3px">
										</a> <a href="#"><img src="img/delete.PNG"
											style="top: 2px; left: 3px"></a>
									</div>
								</div>

							</fieldset>
						</div>
						<div id="skip">
							<h3>Skip the step</h3>
						</div>
					</div>

					<div id="step5"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">


						<div id="AttiDiv">

							<fieldset>
								<legend> Products category fields </legend>

								<p style="font-size: 14px">(Enter category fields values.)</p>



								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Attribute 1:</label> <input
											name="a1" type="text" placeholder="" id="a1O"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Attribute 2:</label> <input
											name="a2" type="text" placeholder="" id="a2O"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Attribute 3:</label> <input
											name="a3" type="text" placeholder="" id="a3O"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Attribute 4:</label> <input
											name="a4" type="text" placeholder="" id="a4O"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Attribute 5:</label> <input
											name="a5" type="text" placeholder="" id="a5O"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Attribute 6:</label> <input
											name="a6" type="text" placeholder="" id="a6O"
											class="form-control">
									</div>
								</div>
							</fieldset>
						</div>
						<div id="showhide">
							<h3>Skip the step</h3>
						</div>
					</div>
					<div id="step6"
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
										<td><input type="checkbox" name="iSLotNumber"
											onclick="L()" id="ll" value="lotnumber"></td>
										<td>Lot Number</td>
										<td>Lot#</td>

									</tr>

									<tr>
										<td><input type="checkbox" name="isSerialNumber"
											onclick="S()" id="ss" value="track"></td>
										<td>Serial Number</td>
										<td>Ser#</td>



									</tr>
								</tbody>
							</table>

						</fieldset>

					</div>




					<div id="step7"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Product Image fields </legend>

							<p style="font-size: 14px">(Upload product image)</p>

							<form id="myForm" method="post" enctype="multipart/form-data">

								Image: <input type="file" id="files" name="files" multiple=""
									accept="image/*"><br>

								<div style="width: 564px; height: 302px; overflow-y: scroll;"
									id="selectedFiles"></div>

							</form>




						</fieldset>





					</div>
					<div id="step8"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial; overflow: auto;">
						<div></div>
						<div>
							<fieldset>
								<legend> Summary </legend>
								<form action="productSumary" id="fs" method="Post">

									<input type="hidden" name="catagoryId" id="catagoryId" value="">
									<h4>
										<u>Products:</u>
									</h4>
									<table>
										<tr>
											<td>Code:</td>
											<td><input id="pcodedisp" name="productCode" type="text"
												class="form-control " readonly></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Description:</td>
											<td><input type="text" class="form-control "
												name="description" readonly id="description1"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Universal Product Code:</td>
											<td><input type="text" class="form-control " readonly
												name="upc" id="upc"></td>
										<tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Unit of Measurement:</td>
											<td><input type="text" class="form-control " readonly
												name="uom" id="uom1"></td>
										</tr>

										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Is Salable:</td>
											<td>
												<div id="tick">
													<p style="font-size: 29px">&#10004;</p>
												</div>
												<div id="cross">
													<p style="font-size: 29px">&#10007;</p>
												</div>
											</td>
										</tr>
									</table>
									<hr width="100%">


									<h4>
										<u>Add initial inventory:</u>
									</h4>
									<table>
										<tr>
											<td>Maximum Retail Price:</td>
											<td><input id="mrp1" class="form-control " readonly
												type="text" name="mrp1"></td>
										</tr>

										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Wholesale Price:</td>
											<td><input type="text" class="form-control " readonly
												name="wsp1" id="wsp"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Quantity:</td>
											<td><input id="quantity111" class="form-control "
												readonly name="qty1" type="text"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<!-- 	<tr>

											<td>Unit of Measurement:</td>
											<td><input id="uom" readonly class="form-control "
												name="uom11" type="text"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr> -->
										<tr>
											<td>Unit Cost:</td>
											<td><input id="ucost" class="form-control " readonly
												name="ucost" type="text"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<!-- 	<tr>
											<td>Date:</td>
											<td><input id="date2" class="form-control " readonly
												name="date2" type="text"></td>
										</tr> -->
									</table>
									<hr width="100%">

									<h4>
										<u>Initial inventory tracking:</u>
									</h4>
									<table>
										<tr>
											<td><b>Lot Number:</b></td>
											<td><input class="form-control " type="text"
												name="lotnumber" readonly id="ltnum"></td>
									</table>
									<br> <b>Serial Number:</b>
									<div
										style="width: 190px; height: 224px; border: 1px solid; overflow: auto;">
										<table align="center">
											<tr>
												<td><span id="slNo"></span></td>
											</tr>
										</table>

									</div>
									<hr width="100%">

									<h4>
										<u>Products Custom Field:</u>
									</h4>
									<table>
										<tr>
											<td>Attribute 1:</td>
											<td><input readonly class="form-control " id="att1"
												name="att1"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Attribute 2:</td>
											<td><input readonly class="form-control " name="a2"
												id="att2">
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Attribute 3:</td>
											<td><input readonly class="form-control " name="a3"
												id="att3"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Attribute 4:</td>
											<td><input readonly class="form-control " name="a4"
												id="att4"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Attribute 5:</td>
											<td><input readonly class="form-control " name="a5"
												id="att5"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Attribute 6:</td>
											<td><input readonly class="form-control " name="a6"
												id="att6"></td>
										</tr>
									</table>

									<hr width="100%">



									<h4>
										<u>Product Image Fields:</u>
									</h4>
									<div
										style="width: 190px; height: 224px; border: 1px solid; overflow: auto;">


									</div>
									<hr width="100%">



								</form>
							</fieldset>
						</div>
					</div>




					<div id="head"
						style="position: absolute; top: -1px; left: -2px; width: 754px; height: 50px; padding: 2px;">
						<!-- <h3>Create a new Part</h3> -->
						<div class="breadcrumbs">
							<ul>

								<li><a title=""><h4>
											Create a new Product
											<button
												style="position: absolute; right: 11px; font-size: 41px; color: red; top: 0px;"
												type="button" class="close" data-dismiss="modal">&times;</button>
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
								disabled="disabled" id="finish" onclick="submitSumary()"
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
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
		});
	</script>
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script type="text/javascript">
		var dupli = [];
		function incre() {
			var a = $("#1stSerial").val();
			var b = $("#limit").val();
			for (xc = a; xc < Number(a) + Number(b); xc++) {
				if (serial.lastIndexOf(Number(xc)) == -1) {
					$("#serialNo").append("<tr><td>" + xc + "</td></tr>");
					serial[j] = xc;
					$("#step67").hide();
					j++;
				} else {
					alert("Duplicate Serial number: " + xc);
				}
			}
		}

		var j = 0;
		function addSerial() {
			q = $("#quantity").val();

			if (j < q) {
				if ($("#indvSerial").val() != "") {
					if (serial.lastIndexOf($("#indvSerial").val()) == -1) {
						$("#serialNo").append(
								"<tr><td>" + $("#indvSerial").val()
										+ "</td></tr>");
						serial[j] = $("#indvSerial").val();
						$("#indvSerial").val("");
						$("#limit").val(q - j - 1);
						j++;
					} else {
						alert("Duplicate Serial number");
					}

				} else {
					alert("Give a Serial Number");
				}

			} else {

				alert("Quantity limit cross");
			}

		}

		function setLimit() {
			$("#limit").val($("#quantity").val());
		}

		$(document).ready(function() {
			$("#lotdiv").hide();
			$("#serdiv").hide();
			$("#tick").hide();
		});
		function L() {
			if ($("#ll").is(":checked")) {
				$("#lotdiv").show();

			} else {
				$("#lotdiv").hide();

			}
		}
		function S() {
			if ($("#ss").is(":checked")) {
				$("#serdiv").show();

			}

			else {
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
		function catProblem(a) {
			$("#catagoryId").val(a);
		}
	</script>





</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>