
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
<!-- tost msg -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />

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

	$(document)
			.ready(
					function() {
						$("#step2").hide();
						$("#step3").hide();
						$("#step4").hide();
						$("#step5").hide();
						$("#step6").hide();
						$("#step7").hide();

						$("#next")
								.click(
										function() {
											if (i < 8) {
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
											if (i == 8) {
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
												$
														.ajax({
															url : "getQtyUnit",
															type : "post",
															dataType : "json",
															data : {
																id : $("#uomO")
																		.val()
															},
															success : function(
																	data) {
																$(
																		"#uomnamedisplay")
																		.val(
																				data.name);
															}
														});

												$("#mrp1")
														.val($("#mrpO").val());
												$("#wsp").val($("#wspO").val());
												$("#quantity111").val(
														$("#quantity").val());
												/* $("#uom")
														.val($("#uomO1").val()); */
												$("#ucost")
														.val($("#ucO").val());
												$("#date2").val(
														$("#datepicker").val());
												$("#ltnum").val(
														$("#lotnO").val());
												$("#att1").val($("#a10").val());
												$("#att2").val($("#a20").val());
												$("#att3").val($("#a30").val());
												$("#att4").val($("#a40").val());
												$("#att5").val($("#a50").val());
												$("#att6").val($("#a60").val());
												$("#lotnumberS").val(
														$("#lotnO").val());

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

	/* function increSerial() {
		$("#step67").modal('show');
	} */
	function submitSumary() {
		$("#fs").submit();
	}
	/* function */
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


	<c:if test="${!sessionScope['user'].equals('admin')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('MaterialPartDetailsGenerals')}">
				<c:set var="i" value="5" />
			</c:if>
		</c:forEach>
		<c:if test="${i!=5}">
			<script type="text/javascript">
				alert('you have no permission to view this page');
				window.location = "dashboard.jsp";
			</script>
		</c:if>
	</c:if>


	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
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

								<div class="widget-area" style="width: 40%;">





									<!-- .........*****************************............ PRODUCT SEARCH PANAEL............***************************************-->
									<form action="MaterialPartDetailsGenerals.jsp" method="get">
										<table>
											<tr>
												<td><b>Product code</b></td>
												<td><input type="text" placeholder="Search by Code"
													id="pCodeSearch" name="pCodeSearch"></td>
												<td>&nbsp; <input type="submit" value="Search">
												</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;</td>
											</tr>
										</table>
									</form>
									<form action="MaterialPartDetailsGeneralsDupli.jsp"
										method="get">
										<table>
											<tr>
												<td><b>Category</b></td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
													type="text" placeholder="Search by Category"
													id="pCatSearch" name="pCatSearch"></td>

												<td>&nbsp; <input type="submit" value="Search">
												</td>
											</tr>

										</table>
									</form>
									<!-- ************************************************endSearch*************************************************************** -->
									<br> <br>
									<table class="table">

										<tr>
											<th align="center">#</th>
											<th align="center">Product Code</th>
											<th align="right">Description</th>
											<th align="right">view</th>
										</tr>
									</table>
									<div
										style="overflow-y: scroll; overflow-x: scroll; height: 281px; width: 357px; border: 1px;">
										<table class="table">
											<c:set var="countt" value="${1}" />
											<c:forEach
												items="${param.pCodeSearch.equals(null)?sessionScope['ejb'].getAllProductDetail():sessionScope['ejb'].getAllProductByProductCode(param.pCodeSearch)}"
												var="productt">

												<tr>
													<td align="left">${countt}</td>
													<td align="left">${productt.code}</td>
													<td align="center">${productt.description}</td>
													<td align="center"><a href="#" id="abcdef"
														onclick="viewProduct('${productt.id}');"> <img
															alt="click to view" src="images/eye.png" height="20"></a></td>
												</tr>
												<c:set var="countt" value="${countt+1}" />
											</c:forEach>

										</table>
									</div>
								</div>
								<div class="widget-area" style="width: 60%; height: 536px">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Products Details : </a></li>
											<li><a href="#" title=""><button type="button"
														class="btn btn-info btn-sm" data-toggle="modal"
														data-target="#newMP">New</button></a></li>

											<li><a href="#" id="editId"><button
														class="btn btn-info btn-sm" id="sAnDfield"
														disabled="disabled" type="button">Edit</button></a></li>



										</ul>
									</div>

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#general">General</a></li>
										<li><a data-toggle="tab" href="#details">Details</a></li>
										<li><a data-toggle="tab" href="#Custom">Attribute</a></li>
										<li><a data-toggle="tab" href="#inventory">Inventory</a></li>
									</ul>
									<br>
									<div class="tab-content">

										<div id="general" class="tab-pane fade active in">
											<div class="row">
												<div class="col-md-3">
													<label>Products Code:</label>
												</div>
												<div class="col-md-5">
													<input id="pp1" type="text" readonly="readonly"
														class="form-control">
												</div>
												<div class="col-md-1">
													<label>UOM:</label>
												</div>
												<div class="col-md-2">
													<input type="text" id="uomuom" readonly="readonly"
														class="form-control">
												</div>
												<br> <br> <br>

												<div class="col-md-3">
													<label>Description:</label>
												</div>

												<div class="col-md-9">

													<textarea readonly="readonly" id="descc"
														class="form-control" name="adress" rows="5" cols="53"></textarea>
													<br>
												</div>



												<br>



												<div class="col-md-1">
													<label>Active</label>
												</div>
												<div class="col-md-1">
													<input id="actact" disabled type="checkbox" name="active">
												</div>


												<a href="#" id="proImg">
													<button id="sooImage" class="btn btn-info btn-sm"
														style="position: absolute; left: 429px; top: 326px;">
														Add Product Image</button>
												</a> <br> <br>

												<div
													style="position: absolute; width: 533px; height: 116px; top: 385px; left: 32px; overflow: scroll;">
													<div id="peoImg"></div>
												</div>
											</div>


										</div>

										<div id="Custom" class="tab-pane fade ">


											<fieldset>
												<legend> Products attribute fields </legend>

												<p style="font-size: 14px">(Enter attribute fields
													values.)</p>

												<div class="col-md-6">
													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 1:</label> <input
															type="text" id="ac1" name="c1" readonly
															class="form-control"><br>
													</div>

													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 2:</label> <input
															type="text" id="ac2" name="c2" readonly
															class="form-control"><br>
													</div>

													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 3:</label> <input
															type="text" id="ac3" name="c3" readonly
															class="form-control"><br>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 4:</label> <input
															type="text" id="ac4" name="c4" readonly
															class="form-control"><br>
													</div>

													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 5:</label> <input
															type="text" name="ac5" id="ac5" readonly
															class="form-control"><br>
													</div>

													<div class="form-group">
														<label for="exampleInputEmail1">Attribute 6:</label> <input
															type="text" name="ac6" id="ac6" readonly
															class="form-control"><br>
													</div>
												</div>

											</fieldset>




										</div>


										<div id="details" class="tab-pane fade ">


											<div class="col-md-12">

												<label>Universal Product Code:</label> <br> <input
													readonly type="text" id="upcupc" class="form-control">
												<br> <br>




												<h4>
													Is Saleable &nbsp; &nbsp;<input type="checkbox" id="salsal">
												</h4>
											</div>



										</div>


										<div id="inventory" class="tab-pane fade ">

											<table>

												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Maximum Retail Price:</b></td>
													<td><input id="mrp111" class="form-control " readonly
														type="text" name="mrp1"></td>
												</tr>



												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Wholesale Price:</b></td>
													<td><input type="text" class="form-control " readonly
														name="wsp111" id="wsp111"></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Remaining Quantity:</b></td>
													<td><input id="RquantitY" class="form-control "
														readonly name="Rty11Y" type="text"></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><b>Purchasing Quantity:</b></td>
													<td><input id="quantity0101" class="form-control "
														readonly name="qty111" type="text"></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>

												<tr>
													<td><b>Unit Cost:</b></td>
													<td><input id="ucost111" class="form-control "
														readonly name="ucost" type="text"></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>
											</table>
										</div>




									</div>
								</div>


							</div>
							<div class='toast' style='display: none'>
								<h3 id="msg">${requestScope['msg']}</h3>
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
									<td id="menu7">summary</td>
								</tr>

							</tbody>
						</table>

					</div>


					<!-- 
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
 -->
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
												onchange="uomFunction()" class="form-control"
												style="width: 250px; height: 34px">
												<option value="0">select an UOM</option>
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
							$('#salepart').click(
									function() {

										if ($('#salepart').is(':checked')) {
											$("#cross").hide();
											$("#tick").show();
											$("#isSalebi").val(
													$('#salepart').is(
															':checked'));
										} else {

											$("#tick").hide();
											$("#cross").show();
											$("#isSalebi").val(
													$('#barCode')
															.is(':checked'));
										}
									});
						</script>


					</div>

					<div id="step3"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">
						<fieldset>

							<legend> Add Product Image </legend>

							<p style="font-size: 14px">(Enter the Products Image .)</p>


							<div>
								<label> Upload logo:</label>
								<div>
									<img id="image" alt="" src="data:image/jpeg;base64,"
										style="width: 100px; height: 50px;">
								</div>
							</div>
							<div id="companyLogo">
								<input type="file" name="proImg" size="60" id="image"
									onchange="readURL(this);" value="">
							</div>

						</fieldset>
					</div>

					<div id="step4"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Add Initial Inventory </legend>

							<p style="font-size: 14px">(Enter the Products's initial
								inventory.)</p>
							<br> <br> <input type="radio" name="do" checked
								id="idd" onclick="openn();" value="doNotAdd">Do not add
							initial inventory <br> <br> <input type="radio"
								name="do" id="openn" onclick="openn();" value="add">Add
							initial inventory <br>
							<hr width="100%">



							<script type="text/javascript">
								$(document).ready(function() {
									$("#divshow").hide();
									$("#divhide").show();
									$("#AttiDiv").hide();
									$("#skip").show();
									$("#showhide").show();
									$("#nottrack").show();
									$("#trackkDiv").hide();
								});
								function openn() {

									if ($("[name='do']:checked").val() == "add") {
										$("#showhide").hide();

										$("#divshow").show();
										$("#divhide").hide();
										$("#AttiDiv").show();
										$("#skip").hide();
										$("#nottrack").hide();
										$("#trackkDiv").show();
										$("#addini").val(
												$("[name='do']:checked").val());

									} else {
										$("#divshow").hide();
										$("#divhide").show();
										$("#skip").show();
										$("#showhide").show();
										$("#AttiDiv").hide();
										$("#nottrack").show();
										$("#trackkDiv").hide();
										$("#addini").val(
												$("[name='do']:checked").val());
									}

								}
							</script>


							<div id="divshow">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input
											type="number" name="mrp" placeholder="" id="mrpO"
											onChange="wShow()" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input
											type="number" name="wsp" readonly="readonly"
											onChange="this.value = relationMW(this.value,$('#mrpO').val())"
											placeholder="" id="wspO" class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											name="quantity" type="number" id="quantity"
											onkeyup="setLimit()" class="form-control">
									</div>

									<div class="form-group">
										<label for="" class="font">Per Unit Cost:</label> <input
											readonly="readonly" name="unitCost" type="number"
											placeholder="" id="ucO" onChange="this.value = relationWP(this.value,$('#wspO').val())"
											class="form-control">

									</div>

								</div>

								<script type="text/javascript">
									function wShow() {

										$("#wspO").prop("readonly", false);

									}
								</script>

								<script type="text/javascript">
									function relationMW(value, max) {
										
										if (parseInt(value) > max) {
											alert("WSP is less or equal to MRP");

											return "";
										} else {
											$("#ucO").prop("readonly", false);
											return value;
										}
									}
								</script>
								<script type="text/javascript">
									function relationWP(value, max) {
										
										if (parseInt(value) > max) {
											alert("Per unit cost is less or equal to WSP");

											return "";
										} else {
											
											return value;
										}
									}
								</script>
								






							</div>

							<div id="divhide">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input
											type="text" readonly="readonly" placeholder="" id="mrpAmi"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input
											type="text" readonly="readonly" placeholder="" id="wspAmi"
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



					<div id="step2"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">

						<div class="masonary-grids">
							<div class="col-md-6">
								<div class="widget-area" align="left">
									<h2 class="widget-title">
										<strong>Tree</strong> List
									</h2>
									<p>
										<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
											id="tree-collapse-all">Collapse all</a>
									</p>

									<div class="tree-list"
										style="overflow-y: scroll; overflow-y: scroll; height: 300px">

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
																		<li><input type="radio" name="same"
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
										<!-- </div> -->
									</div>

								</div>
							</div>
						</div>
					</div>

					<div id="step6"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">

						<!-- ******************************************************************************* -->
						<fieldset>
							<legend>
								<img src="Capture.PNG">&nbsp &nbsp Initial inventory
								tracking
							</legend>

							<p style="font-size: 14px">(Track the product/raw materials
								by Lot Number)</p>
							<br> <br>
							<div id="trackkDiv">
								<div class="col-md-6">

									<label for="exampleInputEmail1">Lot Number:</label> <input
										id="lotnO" type="text" name="lotNumber" required
										class="form-control"><br>

								</div>
							</div>
							<div id="nottrack">
								<h3>Skip the step</h3>
							</div>
						</fieldset>
					</div>

					<div id="step5"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Products attribute fields </legend>

							<p style="font-size: 14px">(Enter category fields values.)</p>

							<div id="AttiDiv">

								<div class="col-md-6">
									<div class="form-group">
										<span id="sa1" style="font-size: 17px">Attribute 1:</span> <input
											name="a1" type="text" disabled="disabled" id="a10"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa2" style="font-size: 17px">Attribute 2:</span> <input
											name="a2" type="text" disabled="disabled" id="a20"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa3" style="font-size: 17px">Attribute 3:</span> <input
											name="a3" type="text" id="a30" disabled="disabled"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span id="sa4" style="font-size: 17px">Attribute 4:</span> <input
											name="a4" type="text" disabled="disabled" id="a40"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa5" style="font-size: 17px">Attribute 5:</span> <input
											name="a5" type="text" disabled="disabled" id="a50"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa6" style="font-size: 17px">Attribute 6:</span> <input
											name="a6" type="text" disabled="disabled" id="a60"
											class="form-control">
									</div>
								</div>
							</div>
							<div id="showhide">
								<h3>Skip the step</h3>
							</div>

						</fieldset>



					</div>

					<div id="step7"
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
											<td><input type="hidden" class="form-control " readonly
												name="uom" id="uom1"> <input type="text"
												class="form-control " readonly name="uom"
												id="uomnamedisplay"></td>

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
													<p style="font-size: 29px">
														&#10007; <input type="text" class="form-control" readonly
															id="isSalebi" name="isSalebi" value="false">
													</p>
												</div>
											</td>
										</tr>
									</table>



									<hr width="100%">

									<h4>Image</h4>
									<br> <br>


									<div id="imageSummary"></div>

									<hr width="100%">

									<h4>
										<u>Add initial inventory:</u>
									</h4>
									<table>
										<tr>

											<td><input type="text" id="addini" class="form-control"
												readonly name="addini" value="false"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Maximum Retail Price:</td>
											<td><input id="mrp1" class="form-control " readonly
												type="text" name="mrp1"></td>
										</tr>


										<!-- <tr>
											<td>barcode:</td>
											<td><input id="barcodeS" class="form-control " readonly
												type="text" name="barcodeS"></td>
										</tr> -->

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

										<tr>
											<td>Unit Cost:</td>
											<td><input id="ucost" class="form-control " readonly
												name="ucost" type="text"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
									</table>
									<hr width="100%">

									<h4>
										<u>Initial inventory tracking:</u>
									</h4>
									<table>
										<tr>
											<td><b>Lot Number:</b>
											<td>
											<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>

											<td><input class="form-control " type="text"
												name="lotnumberS" readonly id="lotnumberS"></td>
									</table>

									<hr width="100%">

									<h4>
										<u>Products Attribute Field:</u>
									</h4>
									<table>
										<tr>
											<td><span id="summaryA1" style="font-size: 15px">Attribute
													1:</span></td>
											<td><input readonly class="form-control " id="att1"
												name="att1"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><span id="summaryA2" style="font-size: 15px">Attribute
													2:</span></td>
											<td><input readonly class="form-control " name="att2"
												id="att2">
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><span id="summaryA3" style="font-size: 15px">Attribute
													3:</span></td>
											<td><input readonly class="form-control " name="att3"
												id="att3"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><span id="summaryA4" style="font-size: 15px">Attribute
													4:</span></td>
											<td><input readonly class="form-control " name="att4"
												id="att4"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><span id="summaryA5" style="font-size: 15px">Attribute
													5:</span></td>
											<td><input readonly class="form-control " name="att5"
												id="att5"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><span id="summaryA6" style="font-size: 15px">Attribute
													6:</span></td>
											<td><input readonly class="form-control " name="att6"
												id="att6"></td>
										</tr>
									</table>

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
			$("#isSalebi").hide();
			$("#addini").hide();
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
		function setLimit() {
			$("#limit").val($("#quantity").val());
		}

		$(document).ready(function() {
			$("#lotdiv").hide();
			$("#serdiv").hide();
			$("#tick").hide();
		});
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
		function catProblem(a) {
			$("#catagoryId").val(a);
			$.ajax({
				url : 'getCategoryById',
				type : 'post',
				dataType : "json",
				data : {
					id : a
				},
				success : function(data) {

					if ((data.attrNmae1) != 'null') {
						$("#sa1").html(data.attrNmae1);
						$("#summaryA1").html(data.attrNmae1);
						$("#a10").prop("disabled", false);
					} else {
						$("#sa1").html("Attribute1:");
						$("#summaryA1").html(data.attrNmae1);
						$("#a10").prop("disabled", true);
					}
					if ((data.attrNmae2) != 'null') {
						$("#sa2").html(data.attrNmae2);
						$("#summaryA2").html(data.attrNmae2);
						$("#a20").prop("disabled", false);
					} else {
						$("#sa2").html("Attribute2:");
						$("#summaryA2").html(data.attrNmae2);
						$("#a20").prop("disabled", true);
					}
					if ((data.attrNmae3) != 'null') {
						$("#sa3").html(data.attrNmae3);
						$("#summaryA3").html(data.attrNmae3);
						$("#a30").prop("disabled", false);
					} else {
						$("#sa3").html("Attribute3:");
						$("#summaryA3").html(data.attrNmae3);
						$("#a30").prop("disabled", true);
					}
					if ((data.attrNmae4) != 'null') {
						$("#sa4").html(data.attrNmae4);
						$("#summaryA4").html(data.attrNmae4);
						$("#a40").prop("disabled", false);
					} else {
						$("#sa4").html("Attribute4:");
						$("#summaryA4").html(data.attrNmae4);
						$("#a40").prop("disabled", true);
					}
					if ((data.attrNmae5) != 'null') {
						$("#sa5").html(data.attrNmae5);
						$("#summaryA5").html(data.attrNmae5);
						$("#a50").prop("disabled", false);
					} else {
						$("#sa5").html("Attribute5:");
						$("#summaryA5").html(data.attrNmae5);
						$("#a50").prop("disabled", true);
					}
					if ((data.attrNmae6) != 'null') {
						$("#sa6").html(data.attrNmae6);
						$("#summaryA6").html(data.attrNmae6);
						$("#a60").prop("disabled", false);
					} else {
						$("#sa6").html("Attribute6:");
						$("#summaryA6").html(data.attrNmae6);
						$("#a60").prop("disabled", true);
					}
				},
				error : function(a, b, c) {
					alert(b + ": " + c);
				}
			});
		}
	</script>


	<script type="text/javascript">
		$(document).ready(function() {
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});
	</script>

	<!-- <script type="text/javascript">
		$(function() {
			$("#descriptionName").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "getProductByDescription",
						dataType : "json",
						data : {
							descriptionName : request.term
						},
						success : function(data) {
							response($.map(data, function(item) {
								return {
									value : item.code,
									id : item.id,

								}
							}));
						}
					});
				},
				select : function(item, ui) {
					viewProduct(ui.item.id);
				}
			})

		});
	</script>***************************************description auto complete********************* -->

	<script>
		function viewProduct(id) {
			$("#sAnDfield").prop("disabled", false);

			$
					.ajax({
						type : "post",
						url : "getproductPro",
						data : {
							id : id
						},
						dataType : "json",
						success : function(data) {
							$("#pp1").val(data.code);

							if (data.attrNmae1 == 'null') {
								$("#ac1").val("");
							} else {
								$("#ac1").val(data.attrNmae1);
							}
							if (data.attrNmae2 == 'null') {
								$("#ac2").val("");
							} else {
								$("#ac2").val(data.attrNmae2);
							}
							if (data.attrNmae3 == 'null') {
								$("#ac3").val("");
							} else {
								$("#ac3").val(data.attrNmae3);
							}
							if (data.attrNmae4 == 'null') {
								$("#ac4").val("");
							} else {
								$("#ac4").val(data.attrNmae4);
							}
							if (data.attrNmae5 == 'null') {
								$("#ac5").val("");
							} else {
								$("#ac5").val(data.attrNmae5);
							}
							if (data.attrNmae6 == 'null') {
								$("#ac6").val("");
							} else {
								$("#ac6").val(data.attrNmae6);
							}

							$("#descc").val(data.description);
							$("#uomuom").val(data.qtyUnit);
							$("#upcupc").val(data.universalCode);
							$("#proImg").attr("href",
									"addNewProductImage.jsp?id=" + data.id);
							$("#editId").attr("href",
									"editPro.jsp?id=" + data.id);

							if (data.isActive) {
								$("#actact").prop("checked", true);
							} else {
								$("#actact").prop("checked", false);
							}
							if (data.isSaleble == 'true') {
								$("#salsal").prop("checked", true);
							} else {
								$("#salsal").prop("checked", false);
							}
							var img = "";
							$
									.ajax({
										type : "post",
										url : "getProductImageByProductid",
										data : {
											id : data.id
										},
										dataType : "json",
										success : function(data1) {
											$
													.map(
															data1,
															function(item) {
																//alert(item.image);
																img = img
																		+ '<img width="100" height="100" style="" alt="" src="data:image/jpeg;base64,'+item.image+'">';
															});
											$("#peoImg").html(img);
										}
									});
						}

					});

			$.ajax({
				type : "post",
				url : "getPurchasebyPro",
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					var qty = 0;
					var rqty = 0;
					$.each(data, function(index, value) {
						$("#mrp111").val(value.mrp);
						$("#wsp111").val(value.wsp);
						$("#ucost111").val(value.cost);
						$("#vName").val(value.purchaseVendorName);
						$("#vAdress").val(value.purchaseVendorAddress);
						$("#vCompany").val(value.purchaseVendorCompanyName);
						$("#vPhone").val(value.purchaseVendorPhoneNumber);
						rqty = rqty + Number(value.remaining_quantity)
						qty = qty + Number(value.quantity);
						$("#quantity0101").val(qty);
						$("#RquantitY").val(rqty);
					});

				}
			});

		}
	</script>


</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>