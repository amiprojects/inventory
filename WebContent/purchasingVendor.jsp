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
<link rel="stylesheet" href="bootstrapcdn.css">
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>


<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.fixedHeader.min.js"></script>

<script src="js/dataTables.searchHighlight.min.js"></script>

<script src="js/jquery.highlight.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});

	function fillFields() {
		$("#name").val("XYZ");
		$("#compname").val("KK");
		$("#phn1").val("23456789");
		$("#phn2").val();
		$("#email").val();
		$("#alias").val();
		$("#type").val();
		$("#addr").val();
		$("#vendorCity").val();
		$("#pin").val();
		$("#datepicker").val();
		$("#vatno").val();
		$("#cstno").val();
		$("#datepicker1").val();
		$("#pan").val();
		$("#datepicker2").val();
		$("#exciseno").val();
		$("#servtaxno").val();
		$("#datepicker3").val();
		$("#taxgroup").val();
		$("#bankname").val();
		$("#acno").val();
		$("#branch").val();
		$("#bankCity").val();
		$("#ifsc").val();
		$("#micrno").val();
		$("#rtgscd").val();
		$("#label").val();
		window.location = 'vendorEdit.jsp';

	}
</script>

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



<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>


<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/dataTables.searchHighlight.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#vendor").attr("id", "activeSubMenu");
		$("#vVendor").attr("style", "color: #6a94ff;");
	});

	function bankButtonPrev() {
		$("#bAcc").removeAttr("class");
		$("#bankAccount").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	function vendorButtonPrev() {
		$("#vAcc").removeAttr("class");
		$("#vendorAccount").attr("class", "tab-pane fade");
		$("#addr").attr("class", "active");
		$("#address").attr("class", "tab-pane fade active in");
	}

	function vendorButtonNext() {
		$("#vAcc").removeAttr("class");
		$("#vendorAccount").attr("class", "tab-pane fade");
		$("#bAcc").attr("class", "active");
		$("#bankAccount").attr("class", "tab-pane fade active in");
	}

	function detailButtonPrev() {
		$("#detl").removeAttr("class");
		$("#detail").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	function detailButtonNext() {
		if ($("#name").val() == "") {
			alert("Enter the Name");
		} else if ($("#phn1").val() == "") {
			alert("Enter the phone number1");
		} else {
			$("#detl").removeAttr("class");
			$("#detail").attr("class", "tab-pane fade");
			$("#addr").attr("class", "active");
			$("#address").attr("class", "tab-pane fade active in");
		}
	}

	function addressButtonPrev() {
		$("#addr").removeAttr("class");
		$("#address").attr("class", "tab-pane fade");
		$("#detl").attr("class", "active");
		$("#detail").attr("class", "tab-pane fade active in");
	}

	function addressButtonNext() {
		if ($("#vendorCity").val() == "") {
			alert("please Select City");
		} else {
			$("#addr").removeAttr("class");
			$("#address").attr("class", "tab-pane fade");
			$("#vAcc").attr("class", "active");
			$("#vendorAccount").attr("class", "tab-pane fade active in");
		}
	}

	$(function() {
		$("#bankCity").autocomplete({
			source : function(req, resp) {
				$.ajax({
					type : "post",
					url : "getCityByName",
					data : {
						name : req.term
					},
					dataType : "json",
					success : function(data) {
						resp($.map(data, function(item) {
							return ({
								value : item.cityName,
								id : item.id
							});
						}));
					}

				});
			},
			change : function(event, ui) {
				if (ui.item == null) {
					$(this).val("");
					$("#bankCityId").val("");
				} else {
					$("#bankCityId").val(ui.item.id);
				}
			},
			select : function(event, ui) {
				$("#bankCityId").val(ui.item.id);
			}
		});
	});
	$(function() {
		$("#vendorCity").autocomplete({
			source : function(req, resp) {
				$.ajax({
					type : "post",
					url : "getCityByName",
					data : {
						name : req.term
					},
					dataType : "json",
					success : function(data) {
						resp($.map(data, function(item) {
							return ({
								value : item.cityName,
								id : item.id
							});
						}));
					}

				});
			},
			change : function(event, ui) {
				if (ui.item == null) {
					$(this).val("");
					$("#vendorCityId").val("");
				} else {
					$("#vendorCityId").val(ui.item.id);
				}
			},
			select : function(event, ui) {
				$("#vendorCityId").val(ui.item.id);
			}
		});
	});
</script>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});

	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker3").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
</script>
<!-- <script>
	$(function() {

		$("#phn1").numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});

	});
</script>
<script>
	$(function() {

		$("#phn2").numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});

	});
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
</script> -->
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

			<c:if test="${page.name.equals('Vendor/Agent/Jobber/Designer')}">
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
									<h3 style="margin-top: 11px;">Vendor Details</h3>


								</div>

								<div class="widget-area" style="width: 32%">

									<!-- <div class="form-group">
											<form action="goSearchVendor" method="post">
												<label for="" class="">Vendor name </label> <input
													type="text" id="prodcode" name="pCodeSearch"
													class="form-control"> <label class="">Vendor City:</label> <input type="text" id="prodesc"
													name="pDesSearch" class="form-control"> 
												
												<br> <input class="btn green btn-default" type="submit"
													value="Search"> <a href="purchasingVendor.jsp"> <input
													class="btn green btn-default" type="button"
													value="Show All"></a>
											</form>
										</div> -->


									<br> <br>

									<table id="example" cellspacing="0" width="100%"
										class="display">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Phone Number</th>
												<th>View</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="c" value="1" />
											<c:forEach items="${sessionScope['ejb'].getAllVendors()}"
												var="vendor">
												<tr>
													<td>${c}</td>
													<td>${vendor.name}</td>
													<td>${vendor.ph1}</td>
													<td><a href="vendorEdit.jsp?id=${vendor.id}"><img
															alt="click to view" src="images/eye.png" height="20"></a></td>
												</tr>
												<c:set var="c" value="${c+1}" />
											</c:forEach>
										</tbody>
									</table>

								</div>
								<div class="widget-area" style="width: 68%">

									<form role="form" class="sec" action="addVendor" method="post"
										id="addVendorid">
										<ul class="nav nav-tabs">
											<li class="active" id="detl"><a data-toggle="tab"
												href="#detail">Details</a></li>
											<li id="addr"><a data-toggle="tab" href="#address">Address</a></li>
											<li id="vAcc"><a data-toggle="tab" href="#vendorAccount">Vendor
													Account Info</a></li>
											<li id="bAcc"><a data-toggle="tab" href="#bankAccount">Bank
													Account info</a></li>
											<!-- <li id="prts"><a data-toggle="tab" href="#part">Parts</a></li> -->
										</ul>
										<div class="tab-content">
											<div id="bankAccount" class="tab-pane fade">
												<div class="widget-area">
													<h5 align="center"></h5>
													<br>
													<div class="col-md-3">
														<b>Bank Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankName"
															id="bankname" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>A/C no:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankAccNo"
															id="acno" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>Branch:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankBranch"
															id="branch" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>City:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" id="bankCity">
														<input type="hidden" value="" name="bankCity"
															id="bankCityId" autocomplete="off">
													</div>
													<br>
													<div class="col-md-3">
														<b>IFSC no:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankIFSC"
															id="ifsc" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>MICR no:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankMICR"
															id="micrno" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>RTGS code:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankRTGS"
															id="rtgscd" onkeypress="return blockSpecialChar(event)">
													</div>
													<br>
													<div class="col-md-3">
														<b>Check lebel:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control"
															name="bankCheckLebel" id="label"
															" onkeypress="return blockSpecialChar(event)">
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="bankButtonPrev();">
													<!-- <input
														class="btn green pull-left" type="button" value="Next"
														onclick="partButtonNext();"> -->
													<button class="btn green pull-right" onclick="subVenform()"
														type="button">Finish</button>
												</div>
												<!-- <div class="col-md-12">
													<input type="button" value="Next"
														class="btn green pull-right" onclick="bankButonNext();">
												</div> -->
											</div>
											<div id="vendorAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="row">
														<h5 align="center"></h5>
														<br>
														<div class="col-md-5">
															<b>VAT no:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorVATno" id="vatno"
																onkeypress="return blockSpecialChar(event)">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>VAT registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorVATregDate" id="datepicker"
																readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST no:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorCSTno" id="cstno"
																onkeypress="return blockSpecialChar(event)">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorCSTregDate" id="datepicker1"
																readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>PAN no:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorPANno" id="pan"
																onkeypress="return blockSpecialChar(event)">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration no:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorExciseRegNo" id="exciseno"
																onkeypress="return blockSpecialChar(event)">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorExciseRegDate" id="datepicker2"
																readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration no:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorServiceTaxRegNo" id="servtaxno"
																onkeypress="return blockSpecialChar(event)">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorServiceTaxRegDate" id="datepicker3"
																readonly="readonly">
														</div>
													</div>
													<div class="row">
														<div class="col-md-5">
															<b>Tax group id:</b>
														</div>
														<div class="col-md-7">
															<select class="form-control" name="taxTypeGroupId"
																id="taxgroup">
																<option value="0">select a tax group</option>
																<c:forEach
																	items="${sessionScope['ejb'].getAllActiveTax_Type_Groups()}"
																	var="taxTypeGroup">
																	<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input type="button" value="Next"
														class="btn green pull-right" onclick="vendorButtonNext();">
													<input type="button" value="Previous"
														class="btn green pull-left" onclick="vendorButtonPrev();">
												</div>
											</div>

											<div id="detail" class="tab-pane fade active in">
												<div class="widget-area">

													<div class="col-md-4">
														<b>Name:<font color="red" size="4">*</font></b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="vendorName"
															id="name" onkeypress="return blockSpecialChar(event)"
															required="required" value="${vendor.name}">
													</div>
													<br>
													<div class="col-md-4">
														<b>Company Name:</b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control"
															name="vendorCompanyName" id="compname"
															value="${vendor.companyName}"
															onkeypress="return blockSpecialChar(event)">
													</div>
													<div class="col-md-12"></div>
													<div class="col-md-4">
														<b>Ph No1:<font color="red" size="4">*</font></b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="vendorPh1"
															id="phn1" required="required" value="${vendor.ph1}">
													</div>

													<div class="col-md-4">
														<b>Ph No2:</b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="vendorPh2"
															id="phn2" value="${vendor.ph2}">
													</div>

													<div class="col-md-4">
														<b>Email :</b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="vendorMail"
															id="email" value="${vendor.email}"
															onkeypress="return blockOtherThanEmail(event)">
													</div>

													<div class="col-md-4">
														<b>Alias name :</b>
													</div>
													<div class="col-md-8">
														<input type="text" class="form-control" name="vendorAlias"
															id="alias" value="${vendor.aliseName}"
															onkeypress="return blockSpecialChar(event)">
													</div>

													<div class="col-md-4">
														<b>Vendor type :</b>
													</div>
													<div class="col-md-8">
														<select class="form-control" name="vendorType" id="type"
															value="${vendor.vendorType}">
															<c:forEach
																items="${sessionScope['ejb'].getAllVendorType()}"
																var="vType">
																<option value="${vType.id}">${vType.type}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<!-- <input class="btn green pull-left" type="button"
														value="Previous" onclick="detailButtonPrev();"> -->
													<input class="btn green pull-right" type="button"
														value="Next" onclick="detailButtonNext();">
												</div>
											</div>
											<div id="address" class="tab-pane fade ">
												<div class="widget-area">
													<div class="row">
														<div class="col-md-3">
															<b>Address :</b>
														</div>
														<div class="col-md-9">
															<textarea rows="" cols="" class="form-control"
																name="vendorAddress" id="addr"
																onkeypress="return blockSpecialChar(event)"
																value="${vendor.address}"></textarea>
														</div>
													</div>
													<div class="row">
														<div class="col-md-3">
															<b>City:<font color="red" size="4">*</font></b>
														</div>
														<div class="col-md-9">
															<input type="text" class="form-control cityAuto"
																name="vendorCity" id="vendorCity" value="${vendor.city}"
																autocomplete="off"> <input type="hidden"
																name="vendorCityId" id="vendorCityId">
														</div>
													</div>
													<div class="row">
														<div class="col-md-3">
															<b>Pin code :</b>
														</div>
														<div class="col-md-9">
															<input type="text" class="form-control" name="vendorPin"
																id="pin" value="${vendor.pinCode}">
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="addressButtonPrev();"> <input
														class="btn green pull-right" type="button" value="Next"
														onclick="addressButtonNext();">
												</div>
											</div>
										</div>
									</form>
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
		</div>
		<!-- Page Container -->
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#example').DataTable({

				"scrollY" : 250,
				"scrollX" : true,
				"bLengthChange" : false,
			});

			table.on('draw', function() {
				var body = $(table.table().body());

				body.unhighlight();
				body.highlight(table.search());
			});
		});
	</script>
	<script>
		function subVenform() {

			if ($("#name").val() == "") {
				alert("Enter the Name");
			} else if ($("#phn1").val() == "") {
				alert("Enter the phone number1");
			} else if ($("#vendorCity").val() == "") {
				alert("please Select City");
			} else {
				$("#addVendorid").submit();

			}
		}
	</script>

	<script src="js/numericInput.min.js"></script>
	<script>
		$(function() {
			$("#phn1").numericInput({
				allowFloat : false, // Accpets positive numbers (floating point)
				allowNegative : false, // Accpets positive or negative integer
			});
			$("#phn2").numericInput({
				allowFloat : false, // Accpets positive numbers (floating point)
				allowNegative : false, // Accpets positive or negative integer
			});
			$("#pin").numericInput({
				allowFloat : false, // Accpets positive numbers (floating point)
				allowNegative : false, // Accpets positive or negative integer
			});
		});
	</script>

	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
		function blockOtherThanEmail(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 64 || k == 46 || (k >= 48 && k <= 57));
		}
	</script>

	<!-- main -->
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>