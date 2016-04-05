<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jobPlan").attr("style", "color: #6a94ff;");
	});
</script>

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).width(120).height(85);
				var str = e.target.result;
				$("#proImage1").val(str.substring(str.lastIndexOf(',') + 1));
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<script>
	var i = 2;
	var x = "";

	$(document).ready(function() {
		$("#step2").hide();
		$("#step3").hide();
		$("#step4").hide();
		$("#step5").hide();
		$("#step6").hide();
		$("#step7").hide();
	});
	function nextF() {

		if (i < 8) {
			$("#step" + (i - 1)).hide();
			$("#menu" + (i - 1)).attr("style", "");

			$("#step" + i).show();
			$("#menu" + i)
					.attr(
							"style",
							"color: red; font-weight: bolder; background-color: #A3DEDE; box-shadow: 1px 1px 1px 1px #507B8A");
			i = i + 1;

		}

		if (i == 8) {
			$("#finish").prop("disabled", false);
			$("#pcodedisp").val($("#productCode").val());
			$("#description1").val($("#description").val());
			$("#upc ").val($("#universalProductCode").val());
			$("#uom1").val($("#uomO").val());
			$.ajax({
				url : "getQtyUnit",
				type : "post",
				dataType : "json",
				data : {
					id : $("#uomO").val()
				},
				success : function(data) {
					$("#uomnamedisplay").val(data.name);
				}
			});

			$("#mrp1").val($("#mrpO").val());
			$("#wsp").val($("#wspO").val());
			$("#quantity111").val($("#quantity").val());

			$("#ucost").val($("#ucO").val());
			$("#ltnum").val($("#lotnO").val());
			$("#att1").val($("#a10").val());
			$("#att2").val($("#a20").val());
			$("#att3").val($("#a30").val());
			$("#att4").val($("#a40").val());
			$("#att5").val($("#a50").val());
			$("#att6").val($("#a60").val());
			$("#lotnumberS").val($("#lotnO").val());

		}
	}

	function prevF() {
		$("#finish").prop("disabled", true);
		if (i > 2) {
			$("#step" + (i - 1)).hide();
			$("#menu" + (i - 1)).attr("style", "");

			$("#step" + (i - 2)).show();
			$("#menu" + (i - 2))
					.attr(
							"style",
							"color: red; font-weight: bolder; background-color: #A3DEDE; box-shadow: 1px 1px 1px 1px #507B8A");
			i = i - 1;
		}
	}

	function submitSumary() {
		
		if ($("#productCode").val() == 0) {
			alert("please enter Product Code:");
		} else if ($("#description").val() == "") {
			alert("please enter Description");
		} else if ($("#universalProductCode").val() == "") {
			alert("please enter Designer's Design number:");
		} else if ($("#uomnamedisplay").val() == "") {
			alert("please select Unit of measurement");
		} else if ($("#isRaw").val() == "") {
			alert("please select Raw or Ready product");
		} else if (!$("[name='same']").is(':checked')) {
			alert("please enter product Category");
		} else if ($("#quantity").val() == 0) {
			alert("please enter quantity");
		} else if ($("#mrpO").val() == 0) {
			alert("please enter MRP");
		} else if ($("#wspO").val() == 0) {
			alert("please enter WSP");
		} else if ($("#ucO").val() == 0) {
			alert("please select per unit cost");
		} else if ($("#lotnumberS").val() == 0) {
			alert("please enter lot number");
		} else if (!$('#a10').attr("disabled") && $("#a10").val() == "") {
			alert("Please insert " + $("#sa1").html() + " value");
		} else if (!$('#a20').attr("disabled") && $("#a20").val() == "") {
			alert("Please insert " + $("#sa2").html() + " value");
		} else if (!$('#a30').attr("disabled") && $("#a30").val() == "") {
			alert("Please insert " + $("#sa3").html() + " value");
		} else if (!$('#a40').attr("disabled") && $("#a40").val() == "") {
			alert("Please insert " + $("#sa4").html() + " value");
		} else if (!$('#a50').attr("disabled") && $("#a50").val() == "") {
			alert("Please insert " + $("#sa5").html() + " value");
		} else if (!$('#a60').attr("disabled") && $("#a60").val() == "") {
			alert("Please insert " + $("#sa6").html() + " value");
		} else {
			$("#fs").submit();
		}
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
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Assignment')}">
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

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Job Plan View</h3>
							</div>

							<!-- <div class="widget-area"> -->


							<div class="col-md-12">
								<form action="jobSearchByPlanNo" method="post"
									id="jobSearchByPlanNoId">
									<div class="widget-area" style="margin-bottom: 20px;">
										<div class="col-md-8">
											<div class="form-group">
												<label for="" class="font">Design No. :</label> <input
													type="text" class="form-control" name="dNo"
													required="required" id="dNo" autocomplete="off"> <input
													type="hidden" id="dId" name="dId"> <input
													type="hidden" id="dNoCheck" name="dNoCheck">
											</div>
											<div class="form-group">
												<!-- <label for="" class="font">Plan No. :</label> -->
												<input readonly="readonly" type="hidden"
													class="form-control" value="" name="planNo" id="planNo">
											</div>
										</div>
										<div class="col-md-4">
											<!-- <button class="btn green pull-left"
											style="margin-top: 22px; margin-right: 20px;" type="button"
											onclick="plansByDnoF();">Go</button> -->
											<button class="btn pull-left"
												style="margin-top: 22px; margin-right: 20px;" type="button"
												onclick="cancelF();">Reset</button>
											<button class="btn green pull-left" style="margin-top: 22px;"
												type="button" onclick="allJobPlanF();" id="allJobBtn">All
												Plans</button>

										</div>
									</div>
								</form>
								<h3 align="center" style="color: #6a94ff;">
									<span id="planNoMsg"></span>
								</h3>
								<br>
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th colspan="6"><h3>Expanse Details</h3></th>
										</tr>
									</thead>
									<thead>
										<tr>
											<th>Total Product Cost :</th>
											<td><span id="totProCost"></span></td>
											<th>Total Job expanse till now :</th>
											<td><span id="totJobExpanse"></span></td>
											<th>Total Expanse till now :</th>
											<td><span id="totExpanse"></span></td>
										</tr>
									</thead>
								</table>
								<div class="col-md-12">
									<div class="col-md-6">
										<h3 align="left">Current Status</h3>
									</div>
									<div class="col-md-6" align="right">
										<!-- <a href="#" target="_blank" onclick="jobSearchByPlanNoF();"><input
												type="hidden" value="" name="planIdForAssign"
												id="planIdForAssign"><u><h3>All job
														assignments of this plan</h3></u></a> -->
									</div>
								</div>
								<div id="productNjobsDiv">
									<input type="hidden" id="orItem">
								</div>
								<table id="productNjobsTable"
									class="table table-striped table-bordered">
									<thead style="background-color: #F0F0F0;">
										<tr>
											<th style="text-align: right;">Product code :</th>
											<td>---</td>
											<th style="text-align: right;">Description :</th>
											<td>---</td>
											<th style="text-align: right;">Quantity :</th>
											<td>code</td>
											<th style="text-align: right;">Total Amount :</th>
											<td>---</td>
										</tr>
										<tr>
											<th>#</th>
											<th>Job</th>
											<th>Sample Rate</th>
											<th>Present Rate</th>
											<th>Qty</th>
											<th>UOM</th>
											<th>Amount</th>
											<th>Estimated Submission Date</th>
										</tr>
									</thead>
								</table>
								<button class="btn btn-primary large"
									onclick="jobSearchByPlanNoF();" type="button">All job
									assignments of this plan</button>
								<button class="btn btn-primary large" id="completeBtn"
									type="button" style="float: right;" disabled="disabled"
									data-toggle="modal" data-target="#newMP">Complete This
									Plan</button>
								<br>
							</div>
							<!-- </div> -->
						</div>
					</div>
				</div>
			</div>
			<!-- Content Sec -->
		</div>
		<!-- Page Container -->
	</div>
	<!-- main -->

	<div id="cancelOrNot" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- <h4 class="modal-title">Modal Header</h4> -->
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>Do you want to reset?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-success medium" id="yesC">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noC">No</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>

	<div id="jobPlans" class="modal fade" role="dialog" style="top: 25px;"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Job plans For the Design Number</h4>
				</div>
				<div class="modal-body">
					<table id="stream_table" width="100%">
						<thead>
							<tr>
								<th>Design No:</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="dNoModal" class="form-control"></td>
							</tr>
							<tr>
								<th>Description :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="dDescModal" class="form-control"></td>
							</tr>
						</thead>
					</table>
					<table id="jobPlansTable" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Plan No.</th>
								<!-- <th>PLan Description</th> -->
								<th>Plan Date</th>
								<th>Design Qty</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="JobPlanOkF();">Ok</button>
				</div>
			</div>
		</div>
	</div>

	<div id="jobPlansAll" class="modal fade" role="dialog"
		style="top: 25px;" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">All Job plans</h4>
				</div>
				<div class="modal-body">
					<table id="jobPlansTableA" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Plan No.</th>
								<!-- <th>PLan Description</th> -->
								<th>Plan Date</th>
								<th>Design Qty</th>
								<th>Design No.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="JobPlanOkF();">Ok</button>
				</div>
			</div>
		</div>
	</div>

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

					<div id="step1"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">
						<div id="bU"
							style="position: position: absolute; top: 3px; right: 2px; width: 560px; height: 187px; font-family: arial; padding: 3px;">
							<fieldset>
								<legend>Product:</legend>
								<form action="#" method="get">
									<div class="col-md-6">
										<div>
											<label for="exampleInputEmail1">Product Code:<font
												color="red" size="4">*</font></label> <input type="text"
												name="productCode2" id="productCode" onkeyup="codeKeyUp();"
												onchange="codeChange();" class="form-control"
												onkeypress="return blockSpecialCharNspace(event)"
												autocomplete="off">
										</div>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Description:<font
												color="red" size="4">*</font></label> <input type="text"
												name="description" id="description" class="form-control"
												onkeypress="return blockSpecialChar(event)"><br>
										</div>
									</div>
									<div class="col-md-6">
										<label for="exampleInputEmail1">Designer's Design
											number:<font color="red" size="4">*</font>
										</label> <input type="text" name="universalProductCode"
											id="universalProductCode"
											onkeypress="return blockSpecialChar(event)" placeholder=""
											class="form-control" onkeyup="dNoKeyUp();"
											onchange="dNoChange();" autocomplete="off"><input
											type="hidden" id="dNoCheck" name="dNoCheck"><br>
									</div>
									<div class="col-md-5">
										<div>
											<label for="exampleInputPassword1">Unit Of
												Measurement:<font color="red" size="4">*</font>
											</label> <select required id="uomO" class="form-control"
												style="width: 205px; height: 34px">
												<option value="0">select an UOM</option>
												<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
													var="qqty">
													<option value="${qqty.id}">${qqty.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-md-1">
										<b class="font">&nbsp;&nbsp; </b> <a onclick="addUOM()"
											title="Add New unit of measurement"> <img
											style="margin-top: 4px;" height="30px" width="30px" alt=""
											src="img/add.png">
										</a>
									</div>
								</form>
							</fieldset>
						</div>
						<div id="bD"
							style="position: absolute; top: 225px; right: 2px; width: 560px; height: 180px; font-family: arial;">

							<h3>
								Products:<font color="red" size="4">*</font>
							</h3>

							<p style="font-size: 20px; margin-right: 342px;">
								<input type="radio" name="isReady" id="raw" onclick=""
									value="raw" disabled="disabled">Raw &nbsp; &nbsp;
								&nbsp;<input type="radio" name="isReady" id="ready" onclick=""
									value="ready" disabled="disabled" checked="checked">Ready
								&nbsp;&nbsp;&nbsp; <input type="checkbox" id="salepart"
									disabled="disabled" checked="checked">This Products is
								for sale
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
								<input type="file" name="proImg" size="20"
									onchange="readURL(this);"><br> <img id="image"
									alt="" src=""><a href="javascript:void(take_snapshot())"><button
										class="btn blue btn-default" type="button">Take
										Snapshot</button></a>
								<div id="my_camera" style="width: 320px; height: 240px;"></div>
							</div>
						</fieldset>
					</div>

					<div id="step4"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">
						<fieldset>
							<legend> Price Details </legend>
							<br>
							<script type="text/javascript">
								$(document).ready(function() {
									/* $("#AttiDiv").hide();
									$("#skip").show();
									$("#trackkDiv").hide(); */

									$("#AttiDiv").show();
									$("#skip").hide();
									$("#trackkDiv").show();
								});
							</script>

							<div id="divshow">
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Per Unit Cost:<font
											color="red" size="4">*</font></label> <input name="unitCost"
											type="text" placeholder="" id="ucO" onchange="rateF()"
											class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :<font
											color="red" size="4">*</font></label> <input type="text" name="wsp"
											onchange="wspF()" placeholder="" id="wspO"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Quantity:<font color="red"
											size="4">*</font></label> <input name="quantity" type="text"
											pattern="\d*" id="quantity" class="form-control">
									</div>
									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :<font
											color="red" size="4">*</font></label> <input type="text" name="mrp"
											placeholder="" id="mrpO" onchange="mrpF()"
											class="form-control">
									</div>
								</div>
							</div>
						</fieldset>
					</div>

					<div id="step2"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">
						<div class="masonary-grids">
							<div class="col-md-12">
								<div class="widget-area" align="left">
									<h2 class="widget-title">
										<strong>Choose Category</strong> From Department <font
											color="red" size="4">*</font>&nbsp; &nbsp;
									</h2>
									<!-- <p>
										<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
											id="tree-collapse-all">Collapse all</a>
									</p> -->

									<div class="tree-list"
										style="overflow-y: scroll; overflow-y: scroll; height: 300px">
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
																			${cat.name} <%-- <ul>
																				<c:forEach var="pro"
																					items="${sessionScope['ejb'].getAllProductDetailByCategoryId(cat.id)}">
																					<li>${pro.description}</li>
																				</c:forEach>
																			</ul> --%>
																			<ul>
																				<c:if test="${cat.attrNmae1!=null}">
																					<li>${cat.attrNmae1}</li>
																				</c:if>
																				<c:if test="${cat.attrNmae2!=null}">
																					<li>${cat.attrNmae2}</li>
																				</c:if>
																				<c:if test="${cat.attrNmae3!=null}">
																					<li>${cat.attrNmae3}</li>
																				</c:if>
																				<c:if test="${cat.attrNmae4!=null}">
																					<li>${cat.attrNmae4}</li>
																				</c:if>
																				<c:if test="${cat.attrNmae5!=null}">
																					<li>${cat.attrNmae5}</li>
																				</c:if>
																				<c:if test="${cat.attrNmae6!=null}">
																					<li>${cat.attrNmae6}</li>
																				</c:if>
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

					<div id="step6"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">

						<!-- ******************************************************************************* -->
						<fieldset>
							<legend>
								<img src="Capture.PNG">&nbsp &nbsp Tracking
							</legend>

							<p style="font-size: 14px">(Track the product/raw materials
								by Lot Number)</p>
							<br> <br>
							<div id="trackkDiv">
								<div class="col-md-6">

									<label for="exampleInputEmail1">Lot Number:<font
										color="red" size="4">*</font></label> <input id="lotnO" type="text"
										name="lotNumber" required class="form-control"><br>

								</div>
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
										<span id="sa1" style="font-size: 17px">Attribute 1</span><span
											id="starNcolonsa1" style="font-size: 17px"></span><input
											name="a1" type="text" disabled="disabled" id="a10"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa2" style="font-size: 17px">Attribute 2</span><span
											id="starNcolonsa2" style="font-size: 17px"></span> <input
											name="a2" type="text" disabled="disabled" id="a20"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa3" style="font-size: 17px">Attribute 3</span><span
											id="starNcolonsa3" style="font-size: 17px"></span> <input
											name="a3" type="text" id="a30" disabled="disabled"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span id="sa4" style="font-size: 17px">Attribute 4</span><span
											id="starNcolonsa4" style="font-size: 17px"></span> <input
											name="a4" type="text" disabled="disabled" id="a40"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa5" style="font-size: 17px">Attribute 5</span><span
											id="starNcolonsa5" style="font-size: 17px"></span> <input
											name="a5" type="text" disabled="disabled" id="a50"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa6" style="font-size: 17px">Attribute 6</span><span
											id="starNcolonsa6" style="font-size: 17px"></span> <input
											name="a6" type="text" disabled="disabled" id="a60"
											class="form-control">
									</div>
								</div>
							</div>
						</fieldset>
					</div>

					<div id="step7"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial; overflow: auto;">
						<div></div>
						<div>
							<fieldset>
								<legend> Summary </legend>
								<form action="completePlanAndProductSumaryProduction" id="fs" method="Post"
									enctype="multipart/form-data">
									<input type="hidden" name="proImage1" id="proImage1" value="">
									<input type="hidden" name="catagoryId" id="catagoryId" value="">
									<h4>
										<u>Products:</u>
									</h4>
									<table>
										<tr>
											<td>Product Code:</td>
											<td><input id="pcodedisp" name="productCode" type="text"
												class="form-control " readonly></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Description:</td>
											<td><input type="text" class="form-control "
												name="description" readonly id="description1"
												onkeypress="return blockSpecialChar(event)"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Designer's Design number:</td>
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
												class="form-control " readonly id="uomnamedisplay"></td>

										</tr>

										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Is Raw : <input type="hidden" name="isRaw"
												id="isRaw"></td>
											<td>
												<div id="tick1">
													<p style="font-size: 29px">&#10004;</p>
												</div>
												<div id="cross1">
													<p style="font-size: 29px">&#10007;</p>
												</div>
											</td>

										</tr>
										<tr>
											<td>Is Salable:</td>
											<td>
												<div id="tick">
													<p style="font-size: 29px">&#10004;</p>
												</div>
												<div id="cross">
													<p style="font-size: 29px">
														&#10007; <input type="text" class="form-control" readonly
															id="isSalebi" name="isSalebi" value="true">
													</p>
												</div>
											</td>
										</tr>
									</table>
									<!-- <hr width="100%">

									<h4>Image</h4>
									<br> <br>
									<div id="imageSummary"></div> -->

									<hr width="100%">
									<h4>
										<u>Price Details:</u>
									</h4>
									<table>
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
										<u>Tracking:</u>
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
								style="position: absolute; right: 165px; top: 3px;" id="next"
								onclick="nextF();">Next</button>
							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 240px; top: 3px;" id="prev"
								onclick="prevF();">Back</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			</div>
		</div>
		<input type="hidden" id="pcodeCheck">
	</div>
	<div id="addUoM" class="modal fade" role="dialog" style="top: 25px;">

		<form action="addUOMjson" method="post">

			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">New Unit of Measurements :</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-3">Select UOM type :</div>
							<div class="col-md-7">
								<select class="form-control" id="qtyUnitTypeIduom"
									name="qtyUnitTypeIduom">

									<c:forEach items="${sessionScope['ejb'].getAllQtyUnitTypes()}"
										var="qtyUnitType">
										<option value="${qtyUnitType.id}">${qtyUnitType.name}</option>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="row">
							<div class="col-md-3">
								Abbreviation :<font color="red" size="4">*</font>
							</div>
							<div class="col-md-9">
								<input type="text" required name="abbreviationuom"
									id="abbreviationuom" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								Name UOM :<font color="red" size="4">*</font>
							</div>
							<div class="col-md-9">
								<input type="text" id="nameuom" required name="nameuom"
									class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">UOM Description :</div>
							<div class="col-md-9">
								<textarea rows="" cols="" name="descriptionuom"
									id="descriptionuom" class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default"
							onclick="submitform1()" value="Submit">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/numericInput.min.js"></script>
	<script>
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'jobPlanSearch.jsp';
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});

		$(function() {
			$("#dNo")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												type : "post",
												url : "getSampleDesignCostSheetByDesignNumber",
												data : {
													dNo : req.term
												},
												dataType : "json",
												success : function(data) {
													resp($
															.map(
																	data,
																	function(
																			item) {
																		return ({
																			value : item.dNumber,
																			id : item.dId,
																			dDEsc : item.dDEsc,
																			dNo : item.dNumber,
																		});
																	}));
												}

											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#dId").val("");
										$("#dDescModal").val("");
										$("#dNoModal").val("");
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									} else {
										$("#dId").val(ui.item.id);
										$("#dDescModal").val(ui.item.dDEsc);
										//$("#dNoModal").val($(this).val());
										$("#dNoModal").val(ui.item.dNo);
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									}
								},
								select : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#dId").val("");
										$("#dDescModal").val("");
										$("#dNoModal").val("");
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									} else {
										$("#dId").val(ui.item.id);
										$("#dDescModal").val(ui.item.dDEsc);
										//$("#dNoModal").val($(this).val());
										$("#dNoModal").val(ui.item.dNo);
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();

										$
												.ajax({
													type : "post",
													url : "getAllJobPlanByDesignNumber",
													dataType : "json",
													data : {
														dId : $("#dId").val()
													},
													success : function(data2) {
														$(
																"#jobPlansTable tbody")
																.empty();
														//alert(data2.length);
														if (data2.length > 0) {
															$
																	.each(
																			data2,
																			function(
																					index,
																					item2) {
																				$(

																				"#jobPlansTable")
																						.append(
																								"<tbody id='jobPlan"
																										+ item2.jpId
																										+ "' onclick='selectPlan(\""
																										+ item2.jpId
																										+ "\",\""
																										+ item2.jpQty
																										+ "\");'>"
																										+ "<tr>"
																										+ "<td>"
																										+ Number(1 + index)
																										+ "</td>"
																										+ "<td>"
																										+ item2.jpId
																										+ "</td>"
																										/* + "<td>"
																										+ item2.jpDEsc
																										+ "</td>" */
																										+ "<td>"
																										+ formatDate(item2.jpDate)
																										+ "</td>"
																										+ "<td>"
																										+ item2.jpQty
																										+ "</td>"
																										+ "</tr>"
																										+ "</tbody>");
																			});
															$("#jobPlans")
																	.modal(
																			"show");
														} else {
															alert("There is no plan for this design number.");
															$("#dNo").val("");
														}
													}
												});

									}
								}
							});
		});

		function formatDate(d) {
			var dateparts = d.split(" ");
			return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
		}
		function presentRateKU(jobId) {
			$("#jobAmount" + jobId).val(
					$("#jobPresentRate" + jobId).val()
							* $("#jobQty" + jobId).val());

			//error
			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			profitValF();
			$("#grandtot").val(
					Number($("#gtot").val()) + Number($("#totProfit").val()));
		}
		function qtyKU(jobId) {
			if ($("#jobQty" + jobId).val() > $("#jobRemQty" + jobId).val()) {
				alert("Assigning qty can not be more than Remaining qty!");
				$("#jobQty" + jobId).val($("#jobRemQty" + jobId).val());
			} else {
				$("#jobAmount" + jobId).val(
						$("#jobPresentRate" + jobId).val()
								* $("#jobQty" + jobId).val());

				//error
				var sum = 0;
				$(".eachtotalvalue").each(function() {
					sum += parseFloat(this.value);
				});
				$("#gtot").val(
						Number($("#gt").val()) + Number(sum.toFixed(2))
								+ Number($("#surcharge").val()));
				profitValF();
				$("#grandtot").val(
						Number($("#gtot").val())
								+ Number($("#totProfit").val()));
			}
		}

		function JobPlanOkF() {
			if ($("#planNo").val() != "") {
				$("#jobPlans").modal("hide");
				$("#jobPlansAll").modal("hide");
				$(".estSubmDate").trigger("click");
			} else {
				alert("Please select a plan.")
			}
			//$("#dNo").attr("readonly","readonly");
		}
		function selectPlan(pId, pQty) {
			$("#planNo").val(pId);
			$("#planNoMsg").html("Yor search for plan number : " + pId);
			alert("plan " + pId + " selected");
			$("#jobPlans").modal("hide");
			$("#jobPlansAll").modal("hide");
			$(".estSubmDate").trigger("click");

			$
					.ajax({
						type : "post",
						url : "getPlanNumbersById",
						dataType : "json",
						data : {
							id : pId
						},
						success : function(data) {
							//alert(data.id);
							$("#totProCost").html(
									Number(data.totalProductCost).toFixed(2));
							$("#totJobExpanse").html(
									Number(data.totalJobExpanse).toFixed(2));
							$("#totExpanse").html(
									Number(data.totalExpanse).toFixed(2));
						}
					});

			var flag = 0;
			$
					.ajax({
						type : "post",
						url : "getProductAndDesignDetailsAndJobPlanByJobPlanId",
						dataType : "json",
						data : {
							pId : pId
						},
						success : function(data2) {
							$(".estSubmDate").trigger("click");
							$("#productNjobsDiv table").empty();
							$("#dNo").attr("readonly", "readonly");
							$
									.each(
											data2,
											function(index, item2) {
												$
														.ajax({
															url : 'getItmProductsForSampleByProductId',
															type : 'post',
															dataType : "json",
															data : {
																id : item2.ProductId
															},
															success : function(
																	data) {
																$("#orItem")
																		.val(
																				data.itemName);
															},
															error : function(a,
																	b, c) {
																alert(b + ": "
																		+ c);
															},
															complete : function() {

																$("#dNo")
																		.val(
																				item2.DesignNo);

																$(
																		"#productNjobsTable")
																		.hide();
																if ((item2.japYesOrNo == "yes" && item2.IsComplete == true)
																		|| (item2.japYesOrNo == "yes"
																				&& item2.japRemQty > 0 && item2.IsComplete == false)) {
																	if (item2.japRemQty > 0
																			&& item2.IsComplete == false) {
																		var Assigned = "Assigned";
																	} else if (item2.IsComplete == true) {
																		var Assigned = "Completed";
																	}
																	$(
																			'#productNjobsDiv')
																			.append(
																					'<table id="pDetTable'+item2.ProductForSampleId+'" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
																							+ "Pcode:"
																							+ '</th><td>'
																							+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductCode+"'>"
																							+ "<input type='hidden' class='form-control' readonly='readonly' id='productForSampleId"+item2.ProductForSampleId+"' value='"+item2.ProductForSampleId+"'>"
																							+ "<input type='hidden' class='form-control' readonly='readonly' id='productId"+item2.ProductForSampleId+"' value='"+ item2.ProductId+ "'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Description:"
																							+ '</th><td colspan="2">'
																							+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductDesc+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Qty:"
																							+ '</th><td>'
																							+ "<input type='text' id='qtyOfSampleProduct"+item2.ProductForSampleId+"' class='form-control' readonly='readonly' value='"+item2.ProductQtyForSample*pQty+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Total Amount:"
																							+ '</th><td>'
																							+ "<input type='text' class='form-control' id='productEachTotal"+item2.ProductForSampleId+"' readonly='readonly' value='"+item2.ProductTotalAmount+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Status:"
																							+ '</th><td>'
																							+ Assigned
																							+ '</td><td>'
																							+ "<b>Item: </b>"
																							+ $(
																									'#orItem')
																									.val()
																							+ '</td></tr><tr><th>'
																							+ "#"
																							+ '</th><th>'
																							+ "Job"
																							+ '</th><th>'
																							+ "Sample Rate"
																							+ '</th><th>'
																							+ "Present Rate"
																							+ '</th><th>'
																							+ "Qty per sample"
																							+ '</th><th>'
																							+ "Total Qty"
																							+ '</th><th>'
																							+ "UOM"
																							+ '</th><th>'
																							+ "Total Amount"
																							+ '</th><th colspan="3">'
																							+ "Est. Submission Date"
																							+ '</th><th>'
																							+ "Status"
																							+ '</th></tr></thead></table>');

																	var ProductForSampleId = item2.ProductForSampleId;
																	var planId = pId;
																	var prodId = item2.ProductId;
																	var japId = item2.japId;
																	$
																			.ajax({
																				type : "post",
																				url : "getJobsForDesignCostSheetByPlanId",
																				dataType : "json",
																				data : {
																					pid : ProductForSampleId,
																					planId : planId,
																					prodId : prodId,
																					japId : japId
																				},
																				success : function(
																						data2) {
																					$
																							.each(
																									data2,
																									function(
																											index,
																											item2) {
																										if (item2.EstSubDate != "NA") {
																											var EstSubDate = formatDate(item2.EstSubDate);
																										} else {
																											var EstSubDate = item2.EstSubDate;
																										}
																										$(

																												"#pDetTable"
																														+ ProductForSampleId)
																												.append(
																														"<tbody id='pDetTable"+item2.JobId+"'>"
																																+ "<tr>"
																																+ "<td>"
																																+ Number(1 + index)
																																+ "</td>"
																																+ "<td>"
																																+ item2.JobName
																																+ "<input type='hidden' id='jobId"+item2.JobId+"' value='"+item2.JobId+"'>"
																																+ "</td>"
																																+ "<td>"
																																+ item2.JobRateOfSample
																																+ "</td>"
																																+ "<td>"
																																+ "<input type='text' readonly='readonly' class='form-control' id='jobPresentRate"
																																+ item2.JobId
																																+ "' onkeyup='presentRateKU("
																																+ item2.JobId
																																+ ");' value='"
																																+ item2.PresentRate
																																+ "'>"
																																+ "</td>"
																																+ "<td>"
																																+ item2.JobQtyOfSample
																																+ "</td>"
																																+ "<td>"
																																+ "<input type='text' readonly='readonly' class='form-control' id='jobQty"
																																+ item2.JobId
																																+ "' onkeyup='qtyKU("
																																+ item2.JobId
																																+ ");' value='"
																																+ item2.AssignQty
																																+ "'>"
																																+ "</td>"
																																+ "<td>"
																																+ item2.JobUOMOfSample
																																+ "</td>"
																																+ "<td>"
																																+ "<input type='text' readonly='readonly' id='jobAmount"+item2.JobId+"' class='form-control' value='"+item2.Amount+"'>"
																																+ "</td>"
																																+ "<td colspan='3'>"
																																+ "<input type='text' readonly='readonly' id='estSubmDate"+item2.JobId+"' value='"+EstSubDate+"' class='form-control'>"
																																+ "</td>"
																																+ "<td>"
																																+ item2.Status
																																+ "</td>"
																																+ "</tr>"
																																+ "</tbody>");

																									});
																				}
																			});

																} else if (item2.japYesOrNo == "no"
																		|| (item2.japYesOrNo == "yes" && item2.japRemQty == 0)) {
																	if (item2.japYesOrNo == "no") {
																		var Assigned = "Not Assigned";
																		var japId = 0;
																	} else if (item2.japYesOrNo == "yes"
																			&& item2.japRemQty == 0) {
																		var Assigned = "Job Cycle:"
																				+ item2.jobCycle;
																		var japId = item2.japId;
																	}
																	$(
																			'#productNjobsDiv')
																			.append(
																					'<table id="pDetTable'+item2.ProductForSampleId+'" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
																							+ "Pcode:"
																							+ '</th><td>'
																							+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductCode+"'>"
																							+ "<input type='hidden' class='form-control' readonly='readonly' id='productForSampleId"+item2.ProductForSampleId+"' value='"+item2.ProductForSampleId+"'>"
																							+ "<input type='hidden' class='form-control' readonly='readonly' id='productId"+item2.ProductForSampleId+"' value='"+ item2.ProductId+ "'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Description:"
																							+ '</th><td>'
																							+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductDesc+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Qty:"
																							+ '</th><td>'
																							+ "<input type='text' id='qtyOfSampleProduct"+item2.ProductForSampleId+"' class='form-control' readonly='readonly' value='"+item2.ProductQtyForSample*pQty+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Total Amount:"
																							+ '</th><td>'
																							+ "<input type='text' class='form-control' id='productEachTotal"+item2.ProductForSampleId+"' readonly='readonly' value='"+item2.ProductTotalAmount+"'>"
																							+ '</td><th style="text-align: right;">'
																							+ "Status:"
																							+ '</th><td>'
																							+ Assigned
																							+ '</td><td>'
																							+ "<b>Item: </b>"
																							+ $(
																									'#orItem')
																									.val()
																							+ '</td></tr><tr><th>'
																							+ "#"
																							+ '</th><th colspan="2">'
																							+ "Job"
																							+ '</th><th colspan="2">'
																							+ "Sample Rate"
																							+ '</th><th colspan="2">'
																							+ "Qty per sample"
																							+ '</th><th>'
																							+ "Total Qty"
																							+ '</th><th>'
																							+ "UOM"
																							+ '</th><th colspan="2">'
																							+ "Status"
																							+ '</th></tr></thead></table>');

																	var ProductForSampleId = item2.ProductForSampleId;
																	var planId = pId;
																	var prodId = item2.ProductId;
																	$
																			.ajax({
																				type : "post",
																				url : "getJobsForDesignCostSheetByPlanId",
																				dataType : "json",
																				data : {
																					pid : ProductForSampleId,
																					planId : planId,
																					prodId : prodId,
																					japId : japId
																				},
																				success : function(
																						data2) {
																					$
																							.each(
																									data2,
																									function(
																											index,
																											item2) {
																										$(

																												"#pDetTable"
																														+ ProductForSampleId)
																												.append(
																														"<tbody id='pDetTable"+item2.JobId+"'>"
																																+ "<tr>"
																																+ "<td>"
																																+ Number(1 + index)
																																+ "</td>"
																																+ "<td colspan='2'>"
																																+ item2.JobName
																																+ "<input type='hidden' id='jobId"+item2.JobId+"' value='"+item2.JobId+"'>"
																																+ "</td>"
																																+ "<td colspan='2'>"
																																+ item2.JobRateOfSample
																																+ "</td>"
																																+ "<td colspan='2'>"
																																+ "<input type='text' class='form-control' id='jobRemQty"+item2.JobId+"' readonly='readonly' value='"+item2.JobQtyOfSample
																																+"'>"
																																+ "</td>"
																																+ "<td>"
																																+ "<input type='text' class='form-control' id='jobRemQty"+item2.JobId+"' readonly='readonly' value='"+item2.JobQtyOfSample
																																* pQty+"'>"
																																+ "</td>"
																																+ "<td>"
																																+ item2.JobUOMOfSample
																																+ "</td>"
																																+ "<td colspan='2'>"
																																+ item2.Status
																																+ "</td>"
																																+ "</tr>"
																																+ "</tbody>");

																									});
																				}
																			});
																}
															}
														});
											});
						},
						complete : function() {
							$.ajax({
								url : 'getJobPlanProductsByPlanId',
								type : 'post',
								dataType : "json",
								data : {
									pId : pId
								},
								success : function(data) {
									$.map(data, function(item) {
										if (item.jppQty != item.jppRemQty) {
											flag = 1;
										}
									});
								},
								complete : function() {
									if (flag == 0) {
										$("#completeBtn")
												.removeAttr("disabled");
									} else {
										$("#completeBtn").attr("disabled",
												"disabled");
									}
								}
							});
						}
					});
			$(".estSubmDate").trigger("click");
			$("#allJobBtn").prop("disabled", "disabled");
		}

		function allJobPlanF() {
			$.ajax({
				type : "post",
				url : "getAllJobPlans",
				dataType : "json",
				success : function(data2) {
					$("#jobPlansTableA tbody").empty();
					//alert(data2.length);
					if (data2.length > 0) {
						$.each(data2, function(index, item2) {
							$(

							"#jobPlansTableA").append(
									"<tbody id='jobPlan" + item2.jpId
											+ "' onclick='selectPlan(\""
											+ item2.jpId + "\",\""
											+ item2.jpQty + "\");'>" + "<tr>"
											+ "<td>" + Number(1 + index)
											+ "</td>" + "<td>" + item2.jpId
											+ "</td>"
											/* + "<td>"
											+ item2.jpDEsc
											+ "</td>" */
											+ "<td>" + formatDate(item2.jpDate)
											+ "</td>" + "<td>" + item2.jpQty
											+ "</td>" + "<td>" + item2.dNo
											+ "</td>" + "</tr>" + "</tbody>");
						});
						$("#jobPlansAll").modal("show");
					} else {
						alert("There is no plan");
						$("#dNo").val("");
					}
				}
			});
		}

		function jobSearchByPlanNoF() {
			if ($("#planNo").val() != "") {
				$("#jobSearchByPlanNoId").submit();
			} else {
				alert("Please select a plan first");
			}
		}
	</script>

	//product entry scripts

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>

	<!-- <script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
		});
	</script> -->

	<script type="text/javascript">
		$(document).ready(function() {
			//$("#isSalebi").hide();
			//$("#tick1").hide();
			$("#lotdiv").hide();
			$("#serdiv").hide();
			//$("#tick").hide();

			$("#cross").hide();
			$("#tick").show();
			$("#isSalebi").val($('#salepart').is(':checked'));

			$("#isRaw").val('false');
			$("#tick1").hide();
			$("#cross1").show();
		});
		$("#close").click(function() {
			$("#newMP").modal("hide");
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
						$("#starNcolonsa1").html(
								":<font color='red' size='4'>*</font>");
						$("#summaryA1").html(data.attrNmae1);
						$("#a10").prop("disabled", false);
					} else {
						$("#sa1").html("Attribute1:");
						$("#starNcolonsa1").html("");
						$("#summaryA1").html("Attribute1:");
						$("#a10").prop("disabled", true);
					}
					if ((data.attrNmae2) != 'null') {
						$("#sa2").html(data.attrNmae2);
						$("#starNcolonsa2").html(
								":<font color='red' size='4'>*</font>");
						$("#summaryA2").html(data.attrNmae2);
						$("#a20").prop("disabled", false);
					} else {
						$("#sa2").html("Attribute2:");
						$("#starNcolonsa2").html("");
						$("#summaryA2").html("Attribute2:");
						$("#a20").prop("disabled", true);
					}
					if ((data.attrNmae3) != 'null') {
						$("#sa3").html(data.attrNmae3);
						$("#starNcolonsa3").html(
								":<font color='red' size='4'>*</font>");
						$("#summaryA3").html(data.attrNmae3);
						$("#a30").prop("disabled", false);
					} else {
						$("#sa3").html("Attribute3:");
						$("#starNcolonsa3").html("");
						$("#summaryA3").html("Attribute3:");
						$("#a30").prop("disabled", true);
					}
					if ((data.attrNmae4) != 'null') {
						$("#sa4").html(data.attrNmae4);
						$("#starNcolonsa4").html(
								":<font color='red' size='4'>*</font>");
						$("#summaryA4").html(data.attrNmae4);
						$("#a40").prop("disabled", false);
					} else {
						$("#sa4").html("Attribute4:");
						$("#starNcolonsa4").html("");
						$("#summaryA4").html("Attribute4:");
						$("#a40").prop("disabled", true);
					}
					if ((data.attrNmae5) != 'null') {
						$("#sa5").html(data.attrNmae5);
						$("#starNcolonsa5").html(
								":<font color='red' size='4'>*</font>");
						$("#summaryA5").html(data.attrNmae5);
						$("#a50").prop("disabled", false);
					} else {
						$("#sa5").html("Attribute5:");
						$("#starNcolonsa5").html("");
						$("#summaryA5").html("Attribute5:");
						$("#a50").prop("disabled", true);
					}
					if ((data.attrNmae6) != 'null') {
						$("#sa6").html(data.attrNmae6);
						$("#summaryA6").html(data.attrNmae6);
						$("#starNcolonsa6").html(
								":<font color='red' size='4'>*</font>");
						$("#a60").prop("disabled", false);
					} else {
						$("#sa6").html("Attribute6:");
						$("#starNcolonsa2").html("");
						$("#summaryA6").html("Attribute6:");
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
		function codeKeyUp() {
			$("#pcodeCheck").val("");
			$.ajax({
				url : "checkPcode",
				dataType : "json",
				data : {
					productCode4 : $("#productCode").val()
				},
				success : function(data) {
					if (data.code != "") {
						$("#pcodeCheck").val(data.code);
					} else {
						$("#pcodeCheck").val("");
					}
				}
			});
		}

		function codeChange() {
			if ($("#pcodeCheck").val() != "") {
				alert("this Product Code: already exist.");
				$("#pcodeCheck").val("");
				$("#productCode").val("");
			}
		}
	</script>
	<script type="text/javascript">
		function addUOM() {
			$("#addUoM").modal("show");
		}
		function submitform1() {
			if ($("#abbreviationuom").val() == "") {
				alert("please enter UOM Abbreviation.");
			} else if ($("#nameuom").val() == "") {
				alert("please enter UOM name.");
			} else {
				var dataa2 = {
					descriptionuom : $("#descriptionuom").val(),
					nameuom : $("#nameuom").val(),
					abbreviationuom : $("#abbreviationuom").val(),
					qtyUnitTypeIduom : $("#qtyUnitTypeIduom").val()

				};
				$
						.ajax({
							url : "addUOMjson",
							dataType : "json",
							data : dataa2,
							type : "post",
							success : function(data2) {
								alert(data2.result);
								$("#addUoM").modal('hide');
							},
							complete : function() {
								$
										.ajax({
											url : "getuomByType",
											data : {
												id : $("#qtyUnitTypeIduom")
														.val()
											},
											dataType : "json",
											success : function(data) {
												$("#uomO").empty();
												$("#uomO")
														.append(
																'<option value="0">select an UOM</option>');
												$
														.map(
																data,
																function(item) {
																	$("#uomO")
																			.append(
																					'<option value="'+item.id+'">'
																							+ item.name
																							+ '</option>');
																});
											}
										});
							}
						});
			}
		}
	</script>
	<script type="text/javascript">
		function blockSpecialCharNspace(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
		}
	</script>
	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
	</script>
	<script type="text/javascript">
		function dNoKeyUp() {
			$("#dNoCheck").val("");
			$
					.ajax({
						url : "getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck",
						dataType : "json",
						data : {
							dNo : $("#universalProductCode").val()
						},
						success : function(data) {
							$.map(data, function(item) {
								if (item.dNumber != "") {
									$("#dNoCheck").val(item.dNumber);
								} else {
									$("#dNoCheck").val("");
								}
							});
						}

					});

		}

		function dNoChange() {
			if ($("#dNoCheck").val() != "") {
				alert("Duplicate Design Number");
				$("#dNoCheck").val("");
				$("#universalProductCode").val("");
			}
		}
	</script>

	<script type="text/javascript" src="js/webcam.js"></script>
	<script>
		Webcam.set({
			width : 320,
			height : 240,
			image_format : 'jpeg',
			jpeg_quality : 90
		});
		Webcam.attach('#my_camera');

		function take_snapshot() {
			Webcam.snap(function(data_uri) {
				$('#image').attr('src', data_uri).width(120).height(85);
				str = data_uri;
				$("#proImage1").val(str.substring(str.lastIndexOf(',') + 1));
			});
		}

		$("input:radio[name=isReady]").click(function() {
			var value = $(this).val();
			if (value == "raw") {
				$("#isRaw").val('true');
				$("#tick1").show();
				$("#cross1").hide();
			} else {
				$("#isRaw").val('false');
				$("#tick1").hide();
				$("#cross1").show();
			}
		});
	</script>
	<script>
		$(function() {

			$("#quantity").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>

	<script>
		$(function() {

			$("#mrpO").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>
	<script>
		$(function() {

			$("#wspO").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>
	<script>
		$(function() {

			$("#ucO").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>
	<script type="text/javascript">
		function rateF() {
			$("#ucO").val(Number($("#ucO").val()).toFixed(2));
			if ($("#wspO").val() != ""
					&& Number($("#ucO").val()) > Number($("#wspO").val())) {
				alert("Rate should be less than or equals to wsp.");
				$("#ucO").val("");
			} else if ($("#mrpO").val() != ""
					&& Number($("#ucO").val()) > Number($("#mrpO").val())) {
				alert("Rate should be less than or equals to MRP.");
				$("#ucO").val("");
			}
		}

		function wspF() {
			$("#wspO").val(Number($("#wspO").val()).toFixed(2));
			if ($("#ucO").val() == "") {
				alert("Please insert Rate first...");
				$("#wspO").val("");
			} else if (Number($("#ucO").val()) > Number($("#wspO").val())) {
				alert("WSP should be greater than or equals to Rate.");
				$("#wspO").val("");
			} else if ($("#mrpO").val() != ""
					&& Number($("#wspO").val()) > Number($("#mrpO").val())) {
				alert("WSP should be less than or equals to MRP.");
				$("#wspO").val("");
			}
		}

		function mrpF() {
			$("#mrpO").val(Number($("#mrpO").val()).toFixed(2));
			if ($("#ucO").val() == "") {
				alert("Please insert ucO first...");
				$("#mrpO").val("");
			} else if ($("#wspO").val() == "") {
				alert("Please insert WSP first...");
				$("#mrpO").val("");
			} else if (Number($("#ucO").val()) > Number($("#mrpO").val())) {
				alert("MRP should be greater than or equals to Rate.");
				$("#mrpO").val("");
			} else if (Number($("#wspO").val()) > Number($("#mrpO").val())) {
				alert("MRP should be greater than or equals to WSP.");
				$("#mrpO").val("");
			}
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
