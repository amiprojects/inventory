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
<link rel="stylesheet" href="css/toast.css" type="text/css" />

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminProduction' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Unit Of Measure')}">
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
								<div class="breadcrumbs"
									style="height: 50px; text-align: center;">
									<h3 style="margin-top: 11px;">Unit Of Measurement</h3>


								</div>

								<div class="widget-area" style="width: 30%">
									<form role="form" class="sec" method="get"
										action="setupUnitOfMeasure.jsp">
										<div class="form-group">
											<label for="" class="">Name/Abbreviation : </label> <input
												type="text" id="searchUOMname" class="form-control"
												name="SearchName" placeholder="" id="" class="">
										</div>

										<input class="btn green btn-default" type="submit"
											value="Search">

									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<!-- hidden -->
												<th width="20%">#</th>
												<th width="40%">Name</th>
												<th width="40%">Abbrev</th>
												<th width="5%">view</th>
											</tr>
										</thead>
									</table>
									<div
										style="height: 250px; overflow-y: scroll; overflow-x: scroll;">
										<table class="table">
											<tbody>
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${param.SearchName.equals(null)?sessionScope['ejb'].getAllQtyUnit():sessionScope['ejb'].getAllQtyUnitByNameOrAbv(param.SearchName)}"
													var="unit">
													<!-- if null then ?work or not null then :work -->
													<tr>
														<td width="20%">${count}</td>
														<td width="40%">${unit.name}</td>
														<td width="35%">${unit.abbreviation}</td>
														<td width="5%"><a href="#"
															onclick="viewQtyUnit('${unit.id}');"><img
																alt="click to view" src="images/eye.png" height="20"></a></td>
													</tr>
													<c:set var="count" value="${count+1}" />
													<div id="addCon${unit.id}" class="modal fade" role="dialog"
														style="top: 25px;">

														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Select UOM to which UOM is
																		related</h4>
																</div>
																<form action="addNewConversion" method="post"
																	id="addNewConversion">
																	<div class="modal-body">
																		<div class="col-md-12">
																			<input type="hidden" value="${unit.id}"
																				name="firstUnit"> Select Target UOM for this
																			conversion:<font color="red" size="4">*</font> <select
																				id="contype${unit.id}" onchange="selectUnit()"
																				name="selectedUnit">
																				<option value="0">Select Unit</option>
																				<c:forEach
																					items="${sessionScope['ejb'].getAllOthersQtyUnitForConversion(unit.id)}"
																					var="qtyUnit">
																					<option value="${qtyUnit.id}">${qtyUnit.name}</option>
																				</c:forEach>
																			</select>
																		</div>
																		<br> <br> <br>
																		<div class="col-md-12">
																			Defining the relationship between units:<font
																				color="red" size="4">*</font>
																		</div>
																		<br>
																		<div class="col-md-12">
																			<input type="radio" name="name1" value="1"
																				onclick="relSelect();">1 <span
																				id="selectUnit1${unit.id}"></span> is greater than 1
																			<span>${unit.name}</span>
																		</div>
																		<br>
																		<div class="col-md-12">
																			<input type="radio" name="name1" value="2"
																				onclick="relSelect();">1 <span>${unit.name}</span>
																			is greater than 1 <span id="selectUnit2${unit.id}"></span>

																		</div>
																		<br> <br> <br>
																		<div class="col-md-12">
																			Defining ratio between the units:<font color="red"
																				size="4">*</font>
																		</div>
																		<br>
																		<div class="col-md-12">Fill in the blank with
																			correct number</div>
																		<br>
																		<div class="col-md-12">
																			1 <span id="selectUnit3${unit.id}"></span> is<input
																				type="number" name="convValue" required="required">in
																			<span id="selectUnit4${unit.id}"></span>
																		</div>
																		<br>

																	</div>

																	<div class="modal-footer">
																		<input type="submit" class="btn btn-default"
																			value="Save"> <input type="button"
																			class="btn btn-default" data-dismiss="modal"
																			value="Close">
																	</div>
																</form>
															</div>
														</div>
													</div>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>
								<div class="widget-area" style="width: 70%">
									<div class="breadcrumbs">
										<ul>
											<li><a title="" class="active">Unit of Measurements
													: </a></li>
											<li><a title=""><button type="button"
														class="btn btn-info btn-sm" data-toggle="modal"
														data-target="#newUOM">New</button></a></li>
											<!-- <li><a title=""><button type="submit"
														class="btn btn-info btn-sm">Edit</button></a></li> -->
											<li><a onclick="deleteUOM();" title=""><input
													type="submit" class="btn btn-info btn-sm" value="Delete"></a></li>
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
													<input type="text" id="Abreve" readonly="readonly" required
														class="form-control">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Name :</div>
												<div class="col-md-10">
													<input type="text" id="unitName" readonly="readonly"
														required class="form-control"> <input
														type="hidden" id="unitNameId" value=""> <input
														type="hidden" id="unitNameId1" value="">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Description</div>
												<div class="col-md-10">
													<textarea rows="" cols="" class="form-control"
														readonly="readonly" id="DisplayDescription"></textarea>
												</div>
											</div>
										</div>
										<div id="con" class="tab-pane fade ">

											<div class="col-md-10">
												<div class="breadcrumbs">
													<ul>
														<li><span id="conversionDetails">Unit
																conversion for</span></li>
													</ul>
												</div>
												<hr>
												<div id="unitConversionDetails"></div>

											</div>
											<div class="col-md-2">
												<input type="button" class="btn btn-default"
													onclick="addNewConversion();" value="add">

												<!-- <button type="button" class="btn btn-default"
													data-toggle="modal">Edit</button> -->

												<!-- <button type="button" class="btn btn-default">Delete</button> -->
											</div>



											<div id="editCon" class="modal fade" role="dialog"
												style="top: 25px;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Edit UOM to which UOM is
																related</h4>
														</div>
														<form action="updateConversion" method="post">
															<div class="col-md-12">
																<br>
																<div class="col-md-12">
																	1 <span id="unit1"></span>=<input type="text"
																		id="editValue" name="editValue"><span
																		id="unit2"></span>
																</div>
																<br>
															</div>
															<input type="hidden" value="" name="u1" id="u1">
															<input type="hidden" value="" name="u2" id="u2">
															<div class="modal-footer">
																<input type="submit" class="btn btn-default"
																	value="update">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</form>
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

	<div id="newUOM" class="modal fade" role="dialog" style="top: 25px;">
		<form action="addUOM" method="post">
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
								<select class="form-control" id="qtyUnitTypeId"
									name="qtyUnitTypeId">
									<c:forEach items="${sessionScope['ejb'].getAllQtyUnitTypes()}"
										var="qtyUnitType">
										<option value="${qtyUnitType.id}">${qtyUnitType.name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- <div class="col-md-2">
								<button type="button" class="btn btn-info btn-sm"
									data-toggle="modal" data-target="#nameUOM">Add</button>
							</div> -->
						</div>
						<div class="row">
							<div class="col-md-3">
								Abbreviation :<font color="red" size="4">*</font>
							</div>
							<div class="col-md-9">
								<input type="text" required name="abbreviation"
									onkeypress="return blockSpecialChar(event)"
									class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								Name UOM :<font color="red" size="4">*</font>
							</div>
							<div class="col-md-9">
								<input type="text" required name="name"
									onkeypress="return blockSpecialChar(event)"
									class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">UOM Description :</div>
							<div class="col-md-9">
								<textarea rows="" cols="" name="description"
									onkeypress="return blockSpecialChar(event)"
									class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" value="Submit">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="nameUOM" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="close1" class="close">&times;</button>
					<h4 class="modal-title">Add new UOM type :</h4>
				</div>
				<div class="modal-body">
					<span>Name :</span> <input type="text" id="UOMname"
						class="form-control">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="UOMnameSave">Save</button>
					<button type="button" class="btn btn-default" id="close">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script type="text/javascript">
		function deleteUOM() {
			if ($("#unitNameId").val() != "") {
				y = confirm("do yo want to delete the UOM");
				if (y) {
					$.ajax({
						type : "post",
						url : "deleteUOM",
						data : {
							id : $("#unitNameId").val()
						},
						dataType : "json",
						success : function(data) {
							if (data.response == "success") {
								alert('UOM deleted Successfully');
								window.location = "setupUnitOfMeasure.jsp";
							} else if (data.response == "failed") {
								alert('you can not delete UOM');
							}
						}
					});
				}

			} else {
				alert('please select UOM');
			}

		}

		var unit1;
		var unit2;

		function relSelect() {
			var id = $("#unitNameId").val();
			var optVal = $("#contype" + id + " option:selected").val();
			if (optVal != 0) {

				if ($("[name='name1']:checked").val() == 1) {
					$("#selectUnit3" + id).html(unit2);
					$("#selectUnit4" + id).html(unit1);
				} else if ($("[name='name1']:checked").val() == 2) {
					$("#selectUnit3" + id).html(unit1);
					$("#selectUnit4" + id).html(unit2);
				} else {
					alert("inconvenience highly regretted.")
				}
			}
		}

		function addNewConversion() {
			$("#addCon" + $("#unitNameId").val()).modal("show");
		}
		function selectUnit() {
			var id = $("#unitNameId").val();
			var optVal = $("#contype" + id + " option:selected").val();
			if (optVal != 0) {
				$.ajax({
					type : "post",
					url : "getQtyUnit",
					data : {
						id : optVal
					},
					dataType : "json",
					success : function(data) {
						$("#selectUnit1" + id).html(data.name);
						$("#selectUnit2" + id).html(data.name);
						unit2 = data.name;
						$("#unitNameId1").val(data.id);
					}

				});
			} else {
				alert("please select a unit.");
			}

		}

		function viewQtyUnit(id) {
			$
					.ajax({
						type : "post",
						url : "getQtyUnit",
						data : {
							id : id
						},
						dataType : "json",
						success : function(data) {
							$("#Abreve").val(data.abbreviation);
							$("#unitName").val(data.name);
							$("#DisplayDescription").val(data.description);
							$("#unitNameId").val(data.id);
							$("#conversionDetails").html(
									"Unit Conversion for " + data.name);
							unit1 = data.name;
							$
									.ajax({
										type : "post",
										url : "getQtyUnitConversion",
										data : {
											id : data.id
										},
										dataType : "json",
										success : function(data1) {
											var i = 0;
											var txt = "<table>";
											$
													.map(
															data1,
															function(item) {
																if (i % 2 == 0) {
																	txt = txt
																			+ "<tr><td style='background-color:#989898;' width='500px'><span >1 "
																			+ item.qtyUnit1Name
																			+ " = "
																			+ item.conversion
																			+ " "
																			+ item.qtyUnit2Name
																			+ "</span></td><td><a onclick='editConversion(\""
																			+ item.qtyUnitId1
																			+ "\",\""
																			+ item.qtyUnitId2
																			+ "\")' href=\"#\"><img src=\"img/edit.png\" height=\"20\"></a></span></td></tr>";
																} else {
																	txt = txt
																			+ "<tr><td style='background-color:#C0C0C0;'><span>1 "
																			+ item.qtyUnit1Name
																			+ " = "
																			+ item.conversion
																			+ " "
																			+ item.qtyUnit2Name
																			+ "</td><td><a onclick='editConversion(\""
																			+ item.qtyUnitId1
																			+ "\",\""
																			+ item.qtyUnitId2
																			+ "\")' href=\"#\"><img src=\"img/edit.png\" height=\"20\"></a></span></td></tr>";
																}
																i++;
															});
											$("#unitConversionDetails").html(
													txt + "</table>");
										}
									});
						}

					});
		}
		function editConversion(a, b) {
			$("#editCon").modal('show');
			$.ajax({
				type : "post",
				url : "getQtyConversion",
				dataType : "json",
				data : {
					id1 : a,
					id2 : b
				},
				success : function(data) {

					$("#unit1").html(data.qtyUnit1Name);
					$("#unit2").html(data.qtyUnit2Name);
					$("#u1").val(data.qtyUnitId1);
					$("#u2").val(data.qtyUnitId2);
					$("#editValue").val(data.conversion);
				}
			});
		}

		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupUOM").attr("style", "color: #6a94ff;");
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});

		$("#close").click(function() {
			$("#nameUOM").modal("hide");
		});
		$("#close1").click(function() {
			$("#nameUOM").modal("hide");
		});
		var qtyUnitTypes = "";

		$("#UOMnameSave")
				.click(
						function() {
							var name = $('#UOMname').val();
							if (name != "") {
								$
										.ajax({
											url : 'addNewUOMtype',
											dataType : 'json',
											data : {
												typeName : name
											},
											success : function(data) {

												if (data.response == "success") {
													$('#msg')
															.html(
																	"UOM added successfully");
													$('.toast').fadeIn(400)
															.delay(3000)
															.fadeOut(400);
													$
															.ajax({
																url : 'getUOMtype',
																dataType : 'json',
																success : function(
																		data) {
																	$
																			.each(
																					data,
																					function(
																							index,
																							value) {
																						qtyUnitTypes = qtyUnitTypes
																								+ '<option value="'+value.id+'">'
																								+ value.name
																								+ '</option>';
																					});
																	document
																			.getElementById("qtyUnitTypeId").innerHTML = qtyUnitTypes;
																	qtyUnitTypes = "";
																	$(
																			"#nameUOM")
																			.modal(
																					"hide");
																}
															});
												} else if (data.response == 'already exist') {
													$('#msg')
															.html(
																	"UOM name already exists");
													$('.toast').fadeIn(400)
															.delay(3000)
															.fadeOut(400);
												}

											}
										});
							} else {
								$('#msg').html("please enter a name");
								$('.toast').fadeIn(400).delay(3000)
										.fadeOut(400);
							}
						});
		function search() {
			var nm = $("#searchUOMname").val();
			$.ajax({
				url : 'getAllQtyUnitByNameOrAbv',
				dataType : 'json',
				data : {
					name : nm
				},
				success : function(data) {
					$.map(data, function(item) {

					});
				}
			});
		}
	</script>
	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
	</script>
	<div class='toast' style='display: none'>
		<h3 id="msg">${requestScope['msg']}</h3>
	</div>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>