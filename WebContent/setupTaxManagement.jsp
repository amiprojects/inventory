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
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sSetupTax").attr("style", "color: #6a94ff;");
		$("#setup").attr("id", "activeSubMenu");
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

			<c:if test="${page.name.equals('TaxManagement')}">
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
		<%@include file="includeLeftOrTop.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Tax Management</h3>
							</div>
							<div class="widget-area">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#tax">Tax</a></li>
									<li><a data-toggle="tab" href="#taxGroup">Tax Group</a></li>
								</ul>
								<div class="tab-content">
									<div id="tax" class="tab-pane fade active in">
										<div class="widget-area"
											style="height: 380px; overflow: auto; width: 50%;">
											<form action="addTax" method="post">
												<div class="col-md-12">
													<div class="form-group">
														<label for="" class="font">Tax Name :<font
															color="red" size="4">*</font></label> <input type="text"
															placeholder="Enter tax name" id="" name="name"
															onkeypress="return blockSpecialChar(event)"
															class="form-control" required>
													</div>
												</div>
												<div class="col-md-11">
													<div class="form-group">
														<label for="" class="font">Value :<font
															color="red" size="4">*</font></label> <input type="text"
															placeholder="" id="taxVal" name="value"
															class="form-control" required>
													</div>
												</div>
												<div class="col-md-1" style="top: 28px; float: left;">
													<img alt="" src="img/perc.png" height="20px" width="20px">
												</div>
												<div class="col-md-12">
													<input class="btn green pull-left" type="submit"
														value="Add">
												</div>
											</form>
										</div>
										<div class="widget-area" style="width: 50%;">
											<table class="table">
												<tbody>
													<tr>
														<th width="30%">Tax name</th>
														<th width="35%">Tax value (%)</th>
														<th width="20%">Status</th>
														<th></th>
													</tr>
												</tbody>
											</table>
											<div style="height: 273px; overflow: auto;">
												<table class="table">
													<c:forEach items="${sessionScope['ejb'].getAllTax()}"
														var="tax">
														<tbody>
															<tr>
																<td width="35%">${tax.name}</td>
																<td width="35%">${tax.value}</td>
																<td width="20%"><c:choose>
																		<c:when test="${tax.active.equals(true)}">Active</c:when>
																		<c:otherwise>Inactive</c:otherwise>
																	</c:choose></td>
																<td><a href="#"
																	onclick="editTax('${tax.id}','${tax.isActive()}')"><img
																		src="img/edit.png" height="16px" width="16px"></a></td>
															</tr>
														</tbody>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
									<div id="taxGroup" class="tab-pane fade ">
										<div class="widget-area"
											style="height: 380px; overflow: auto; width: 40%;">
											<button type="button" class="btn btn-info btn-lg"
												data-toggle="modal" data-target="#newTaxGroup">Create
												Tax Group</button>
										</div>
										<div class="widget-area"
											style="height: 380px; overflow: auto; width: 60%;">
											<table class="table">
												<tbody>
													<tr>
														<th width="35%">Tax Group name</th>
														<th width="35%">Status</th>
														<th></th>
													</tr>
												</tbody>
											</table>
											<div style="height: 273px; overflow: auto;">
												<table class="table">
													<c:forEach
														items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
														var="taxGroup">
														<tbody>
															<tr>
																<td width="35%"><span
																	onclick="showTaxes('${taxGroup.id}');"> <a
																		href="#"><u>${taxGroup.name}</u></a>
																</span></td>
																<td width="35%"><c:choose>
																		<c:when test="${taxGroup.active.equals(true)}">Active</c:when>
																		<c:otherwise>Inactive</c:otherwise>
																	</c:choose></td>
																<td><a href="#"
																	onclick="editTaxGroup('${taxGroup.id}','${taxGroup.isActive()}');">
																		<img src="img/edit.png" height="16px" width="16px">
																</a></td>
															</tr>
														</tbody>
														<div id="taxList${taxGroup.id}" class="modal fade"
															role="dialog" style="top: 25px;">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Tax list</h4>
																	</div>
																	<div class="modal-body">
																		<c:forEach
																			items="${sessionScope['ejb'].getTax_Type_GroupById(taxGroup.id).taxes}"
																			var="tax">
																			<br>
																			<span>${tax.name} (${tax.value})</span>
																		</c:forEach>
																	</div>
																	<div class="modal-footer">
																		<!-- <button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button> -->
																	</div>
																</div>

															</div>
														</div>
														<div id="taxListEdit${taxGroup.id}" class="modal fade"
															role="dialog" style="top: 25px;">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Edit tax group</h4>
																	</div>

																	<form action="editTaxGroup" method="post">
																		<div class="modal-body">
																			<input type="hidden" value="${taxGroup.id}" name="id">
																			<input type="radio" name="isActiveG" value="true"
																				id="activeRadioG">Active&nbsp; &nbsp;<input
																				type="radio" name="isActiveG" value="false"
																				id="inactiveRadioG">Inactive
																			<div style="float: right;"></div>
																			<div class="modal-footer">
																				<input type="submit" class="btn btn-default"
																					value="Update">
																			</div>
																	</form>
																</div>

															</div>
														</div>
													</c:forEach>
												</table>
											</div>
										</div>
										<div id="newTaxGroup" class="modal fade" role="dialog"
											style="top: 25px;">
											<form action="addTaxGroup" method="post" id="taxGroupSubId">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Create Tax Group</h4>
														</div>
														<div class="modal-body">
															<div class="widget-area">
																<div class="col-md-4"
																	style="height: 310px; overflow: auto;">
																	<c:forEach
																		items="${sessionScope['ejb'].getAllActiveTax()}"
																		var="tax">
																		<input type="checkbox" class="isSelected"
																			value="${tax.id}" name="tax">${tax.name} (${tax.value})&nbsp;													
																	<br>
																	</c:forEach>
																</div>
																<div class="col-md-8">
																	<label for="" class="font">Tax Group Name :<font
																		color="red" size="4">*</font></label> <input type="text"
																		placeholder="Enter tax group name" id="tgName"
																		name="name"
																		onkeypress="return blockSpecialChar(event)"
																		class="form-control"> <input
																		class="btn green pull-right" type="button"
																		value="Create" onclick="taxGroupSubmit();">
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<!-- <button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button> -->
														</div>
													</div>

												</div>
											</form>
										</div>
									</div>
								</div>
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
								<%-- <p>${requestScope['msg']}</p> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->

	<div id="editTaxDiv" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit tax</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="editTax">
						<input type="hidden" name="id" value="" id="id1"> <input
							type="radio" name="isActive" value="true" id="activeRadio">Active&nbsp;
						&nbsp;<input type="radio" name="isActive" value="false"
							id="inactiveRadio">Inactive
						<div style="float: right;">
							<input type="submit" class="btn btn-default" value="Update">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
		function showTaxes(tg) {

			/* alert(tg); */
			$("#taxList" + tg).modal('show');
		}

		function editTax(id, isactive) {
			$('#id1').val(id);
			/* $('#name1').val(taxnm);
				$('#value1').val(taxval); */
			if (isactive == 'true') {
				$('#activeRadio').prop("checked", "checked");
			} else {
				$('#inactiveRadio').prop("checked", "checked");
			}
			$("#editTaxDiv").modal('show');
		}
		function editTaxGroup(id, isactiveG) {
			//alert(id);
			$("#taxListEdit" + id).modal('show');
			if (isactiveG == 'true') {
				$('#activeRadioG').prop("checked", "checked");
			} else {
				$('#inactiveRadioG').prop("checked", "checked");
			}
		}

		function taxGroupSubmit() {
			var i = 0;
			$(".isSelected").each(function() {
				if ($(this).is(':checked')) {
					i = 1;
				}
			});
			if (i == 0) {
				alert("Please select tax...");
			} else if ($("#tgName").val() == "") {
				alert("Please enter tax group name...");
			} else {
				$("#taxGroupSubId").submit();
			}
		}
	</script>
	<script>
		$(document).ready(function() {
			$("#taxVal").change(function() {
				$("#taxVal").val(Number($("#taxVal").val()).toFixed(2));
			});
		});
	</script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
		
		$(function() {
			$("#taxVal").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false, // Accpets positive or negative integer
			});
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
