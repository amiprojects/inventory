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
<link rel="stylesheet" href="css/toast.css" type="text/css" />
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

			<c:if test="${page.name.equals('Company Info')}">
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


	<c:set var="compInfo"
		value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />

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
								<h3 style="margin-top: 11px;">Company Details</h3>


							</div>

							<div class="widget-area">
								<form action="updateCompanyInfo" enctype="multipart/form-data"
									method="post" id="companydetails">
									<input type="hidden" value="${compInfo.id}" name="companyId">
									<ul class="nav nav-tabs">
										<li id="info1 " class="active"><a data-toggle="tab"
											href="#comp">Company details</a></li>
										<li id="info2"><a data-toggle="tab" href="#tax">Tax
												details</a></li>
									</ul>
									<div class="tab-content">
										<div id="comp" class="tab-pane fade active in">
											<div class="widget-area">

												<div class="wizard-form-h">

													<div id="step-1">

														<div class="col-md-12">

															<div class="col-md-6">
																<div>
																	<label for="">Company Name:<font color="red"
																		size="4">*</font></label> <input type="text" name="name"
																		id="compname" placeholder="Enter Company Name"
																		class="form-control" readonly="readonly"
																		value="${compInfo.compname}"><br>
																</div>
															</div>

															<div class="col-md-6">
																<div>
																	<label for="">Company Email:<font color="white"
																		size="4">*</font></label> <input type="text" name="email"
																		id="email" onchange="check();"
																		placeholder="Enter Company Email" class="form-control"
																		readonly="readonly" value="${compInfo.email}"><br>
																</div>

															</div>

														</div>
														<div class="col-md-12">
															<div class="col-md-6">
																<div>
																	<label for="">Company Mobile No:</label> <input
																		type='text' name="mono" id="mobile" maxlength="10"
																		minlength="10"
																		onChange="this.value = minmax(this.value, 999999999, 9999999999)"
																		placeholder="Eg. 9xxxxxxxxx" class="form-control"
																		readonly="readonly" value="${compInfo.mobile}"><br>
																</div>
															</div>



															<div class="col-md-6">
																<div>
																	<label for=""> Country:</label> <input id="country1"
																		readonly="readonly" type="text"
																		value="${compInfo.country1}"
																		placeholder="choose Country name" name="country1"
																		class="form-control"> <br>
																</div>
															</div>

														</div>
														<div class="col-md-12">

															<div class="col-md-6">
																<div>
																	<label for="">Company Phone No:</label> <input
																		type='number' name="phno" id="phone"
																		placeholder="Enter Phone Number" class="form-control"
																		readonly="readonly" value="${compInfo.phone}"><br>
																</div>

															</div>
															<div class="col-md-6">
																<div>
																	<label for=""> State:</label> <input id="state"
																		readonly="readonly" value="${compInfo.state}"
																		name="state" class="form-control"
																		placeholder="choose state name" type="text"><br>
																</div>
															</div>
														</div>
														<div class="col-md-12">

															<div class="col-md-6">
																<div>
																	<label for="">Company Address:</label><br>
																	<textarea name="adress" id="addr" rows="5" cols="55"
																		disabled="disabled">${compInfo.addr}</textarea>
																	<br>
																</div>
															</div>

															<div class="col-md-6">
																<div>
																	<label for=""> City:</label> <input
																		placeholder="choose city name" id="city"
																		readonly="readonly" value="${compInfo.city}"
																		class="form-control" name="city" type="text"><br>

																</div>
															</div>
														</div>
														<div class="col-md-12">
															<div class="col-md-12">
																<div>
																	<label for=""> Logo:</label>
																	<div>
																		<img id="image" alt=""
																			src="data:image/jpeg;base64,${compInfo.getImageAsString()}"
																			style="width: 100px; height: 50px;">
																	</div>
																</div>
																<div id="companyLogo">
																	<input type="file" name="proImg" size="60" id="image"
																		onchange="readURL(this);" value="${compInfo.image}">
																</div>
															</div>
														</div>
													</div>





												</div>

												<div style="position: absolute; bottom: 16px" align="left"
													id="companyinfo">
													<input class="btn btn-primary large" type="button"
														onclick="activatefields();" value="Edit">
												</div>
												<div align="right">
													<button class="btn btn-primary midium" type="button"
														onclick="detailButtonNext()">Next</button>
												</div>
											</div>
										</div>
										<div id="tax" class="tab-pane fade ">
											<div class="widget-area">

												<div class="wizard-form-h">

													<div id="step-1">
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">VAT No:</label> <input
																	type="text" name="vatno" id="vat"
																	placeholder="Enter Company VAT No" class="form-control"
																	readonly="readonly" value="${compInfo.vatno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">VAT
																	Registration Date:</label> <input type="text" name="vatdate"
																	id="vatdate" class="form-control"
																	placeholder="Enter Company VAT Registration Date"
																	readonly="readonly" value="${compInfo.vatdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">CST No:</label> <input
																	type="text" name="cstno" id="cst"
																	placeholder="Enter Company CST No" class="form-control"
																	readonly="readonly" value="${compInfo.cstno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">CST
																	Registration Date:</label> <input type="text" name="cstDate"
																	id="cstdate" class="form-control"
																	placeholder="Enter Company CST Registration Date"
																	readonly="readonly" value="${compInfo.cstdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">TIN No:</label> <input
																	type="text" name="tinno" id="tin"
																	placeholder="Enter Company TIN No" class="form-control"
																	readonly="readonly" value="${compInfo.tinno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">TIN
																	Registration Date:</label> <input type="text" name="tinDate"
																	placeholder="Enter Company TIN Registration Date"
																	id="tindate" class="form-control" readonly="readonly"
																	value="${compInfo.tindate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Service Tax No:</label>
																<input type="text" name="servicet" id="service"
																	placeholder="Enter Company Service tax"
																	class="form-control" readonly="readonly"
																	value="${compInfo.servicetaxno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Service Tax
																	Registration Date:</label> <input type="text"
																	placeholder="Enter Company Service Tax Registration Date"
																	name="serviceDate" id="servicedate"
																	class="form-control" readonly="readonly"
																	value="${compInfo.servtaxdate}"><br>
															</div>
														</div>


														<div>
															<div id="subBId">
																<button style="float: right"
																	class="btn green pull-right" type="button"
																	onclick="submitCompmanyDetails();">Submit</button>
															</div>
															<button
																style="margin-left: 14px; margin-top: 1px; float: left"
																class="btn btn-primary midium" type="button"
																onclick="addressButtonPrev()">Back</button>
														</div>

													</div>
												</div>
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
				</div>
			</div>
		</div>
		<!-- Content Sec -->
	</div>
	<!-- Page Container -->

	<!-- main -->

	<c:set var="isAdmin" value="1"></c:set>
	<c:set var="canEdit" value="0" />
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">
			<c:if test="${page.name.equals('Company Info Edit')}">
				<c:set var="canEdit" value="1" />
			</c:if>
		</c:forEach>
		<c:set var="isAdmin" value="0"></c:set>
	</c:if>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#companyinfo").show();
			$('#subBId').hide();
			$("#companyLogo").hide();
			$("#sSetupComp").attr("style", "color: #6a94ff;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});

		function activatefields() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$('#compname').attr("readonly", false);
				$('#email').attr("readonly", false);
				$('#mobile').attr("readonly", false);
				$('#phone').attr("readonly", false);
				$('#addr').attr("disabled", false);
				$('#city').attr("readonly", false);
				$('#state').attr("readonly", false);
				$('#country1').attr("readonly", false);
				$('#subBId').show();
				//	$('#state').attr("readonly", false);
				$('#vat').attr("readonly", false);
				$('#cst').attr("readonly", false);
				$('#tin').attr("readonly", false);
				$('#service').attr("readonly", false);
				$('#vatdate').attr("readonly", false);
				$('#cstdate').attr("readonly", false);
				$('#tindate').attr("readonly", false);
				$('#servicedate').attr("readonly", false);
				$("#companyinfo").hide();
				$('#imageUP').attr("readonly", false);
				$("#companyLogo").show();
			}
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image').attr('src', e.target.result).width(120).height(
							85);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}

		function checkPhone() {
			var number = jQuery('#phone').val();
			var splchars = /^[0-9-+]+$/;
			if (splchars.test(number)) {
				return true;
			} else {
				alert("Illegal characters detected!");
				return false;

			}

		}

		function submitCompmanyDetails() {

			if ($("#compname").val() == 0) {
				alert("please enter Company name");
			} /* else if ($("#mobile").val() == "") {
												alert("please select Mobile Number");
											} else if ($("#addr").val() == "") {
												alert("please select Address");
											} else if ($("#email").val() == "") {
												alert("please select email");
											} else if ($("#phone").val() == "") {
												alert("please select Phone");
											} else if ($("#cityname").val() == "") {
												alert("please select cityname");
											} else if ($("#vat").val() == "") {
												alert("please select VAT");
											} else if ($("#cst").val() == "") {
												alert("please select CST");
											} else if ($("#tin").val() == "") {
												alert("please select TIN");
											} else if ($("#service").val() == "") {
												alert("please select Service Tax");
											} else if ($("#vatdate").val() == "") {
												alert("please select VAT resistration Date");
											} else if ($("#cstdate").val() == "") {
												alert("please select CST resistration Date");
											} else if ($("#tinDate").val() == "") {
												alert("please select TIN resistration Date");
											} else if ($("#servicedate").val() == "") {
												alert("please select Service resistration Date");
											} */

			else {
				$("#companydetails").submit();
			}

		}
	</script>
	<script type="text/javascript">
		function minmax(value, min, max) {
			if (parseInt(value) < min || isNaN(value)) {
				alert("10 digit number")
				return null;
			} else if (parseInt(value) > max) {
				alert("10 digit number")
				return value;
			} else
				return value;
		}
	</script>

	<script type="text/javascript">
		function check() {
			var email_x = document.getElementById("email").value;
			filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (filter.test(email.value)) {

				return true;
			} else {

				alert("valid email id: abc@pqr.com");
				document.getElementById("email").value = "";
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		function addressButtonPrev() {
			$("#info2").removeAttr("class");
			$("#tax").attr("class", "tab-pane fade");
			$("#info1").attr("class", "active");
			$("#comp").attr("class", "tab-pane fade active in");
		}
		function detailButtonNext() {
			if ($("#compname").val() == 0) {
				alert("please enter Company name");
			} else {
				$("#info1").removeAttr("class");
				$("#comp").attr("class", "tab-pane fade");
				$("#info2").attr("class", "active");
				$("#tax").attr("class", "tab-pane fade active in");
			}
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#country1")
					.autocomplete(
							{
								source : function(request, response) {
									$
											.ajax({
												url : "getcountry",
												dataType : "json",
												data : {
													term : request.term
												},
												success : function(data) {
													response($
															.map(
																	data,
																	function(
																			item) {
																		return {
																			value : item.countryName,
																			id : item.id
																		}
																	}));
												}
											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#state").val("");
										$("#state").prop("disabled", true);
									} else {
										$("#state").prop("disabled", false);
										$("#state")
												.autocomplete(
														{
															source : function(
																	request,
																	response) {
																$
																		.ajax({
																			url : "getStateByCountryByStateName",
																			dataType : "json",
																			data : {
																				name : request.term,
																				cid : ui.item.id
																			},
																			success : function(
																					data) {
																				response($
																						.map(
																								data,
																								function(
																										item) {
																									return {
																										value : item.stateName,
																										id : item.id
																									}
																								}));
																			}

																		});
															},

															change : function(
																	event, ui) {
																if (ui.item == null) {
																	$(this)
																			.val(
																					"");
																	$("#city")
																			.val(
																					"");
																	$("#city")
																			.prop(
																					"disabled",
																					true);
																} else {
																	$("#city")
																			.prop(
																					"disabled",
																					false);
																	$("#city")
																			.autocomplete(
																					{
																						source : function(
																								request,
																								response) {
																							$
																									.ajax({
																										url : "getCityByStateByCityName",
																										dataType : "json",
																										data : {
																											name1 : request.term,
																											cid1 : ui.item.id
																										},
																										success : function(
																												data) {
																											response($
																													.map(
																															data,
																															function(
																																	item) {
																																return {
																																	value : item.cityName,
																																	id : item.id
																																}
																															}));
																										}

																									});
																						},

																					});
																}
															},

														});
									}
								},

							});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});
	</script>

</body>


</html>