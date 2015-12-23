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
<link rel="stylesheet" href="bootstrapcdn.css">
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
		
		$("#type").val($("#oldVendortypeID").val());
	});
	
	function fillFields(){
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
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchVendor").attr("style", "color: red;");
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
		$("#detl").removeAttr("class");
		$("#detail").attr("class", "tab-pane fade");
		$("#addr").attr("class", "active");
		$("#address").attr("class", "tab-pane fade active in");
	}

	function addressButtonPrev() {
		$("#addr").removeAttr("class");
		$("#address").attr("class", "tab-pane fade");
		$("#detl").attr("class", "active");
		$("#detail").attr("class", "tab-pane fade active in");
	}

	function addressButtonNext() {
		$("#addr").removeAttr("class");
		$("#address").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	$(function() {
		$("#bankcity").autocomplete({
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
		$("#vendorcity").autocomplete({
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
	
	function submitVendorDetails(){
		 $("#vendordetails").submit();
	 }
</script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	
	
	<c:if test="${!sessionScope['user'].equals('admin')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if
				test="${page.name.equals('Vendor Management')}">
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
	
	<c:set var="vendor" value="${sessionScope['ejb'].getVendorById(param.id)}"/>
	<c:set var="account" value="${sessionScope['ejb'].getAccountDetailsByVendorId(param.id)}"/>
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
												<b>Vendor Details</b>
											</p></li>
									</ul>
								</div>

								
								<div class="widget-area" style="width: 72%">
									<%-- <p>${requestScope['msg']}</p> --%>
									<form role="form" class="sec" action="updateVendor" method="post" id="vendordetails">
									   <input type="hidden" value="${param.id}" name="vendoeId" id="vendorid">
									   
										<ul class="nav nav-tabs">
											<li class="active" id="detl"><a data-toggle="tab"
												href="#detail">Details</a></li>
											<li id="addr"><a data-toggle="tab" href="#address">Address</a></li>
											<li id="vAcc"><a data-toggle="tab" href="#vendorAccount">Vendor
													Account Info</a></li>
											<li id="bAcc"><a data-toggle="tab" href="#bankAccount">Bank
													Account info</a></li>
											<li id="prts"><a data-toggle="tab" href="#part">Parts</a></li>
										</ul>
										<div class="tab-content">
											<div id="bankAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="col-md-3">
														<b>Bank Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankName" id="bankname"
															required="required" value="${account.bankName}">
													</div>
													<br>
													<div class="col-md-3">
														<b>A/C no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankAccNo" id="acno"
															required="required" value="${account.bankAccountNumber}">
													</div>
													<br>
													<div class="col-md-3">
														<b>Branch:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankBranch" id="branch"
															required="required" value="${account.branch}">
													</div>
													<br>
													<div class="col-md-3">
														<b>City:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" id="bankcity"
															required="required"  value="${account.city.cityName}"> <input type="hidden"
															value="${account.city.id}" name="bankCity" id="bankCityId">
													</div>
													<br>
													<div class="col-md-3">
														<b>IFSC no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankIFSC" id="ifsc"
															required="required" value="${account.bankIFSCnumber}">
													</div>
													<br>
													<div class="col-md-3">
														<b>MICR no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankMICR" id="micrno"
															required="required" value="${account.bankMICRnumber}">
													</div>
													<br>
													<div class="col-md-3">
														<b>RTGS code:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankRTGS" id="rtgscd"
															required="required" value="${account.bankRTGCnumber}">
													</div>
													<br>
													<div class="col-md-3">
														<b>Check lebel:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control"
															name="bankCheckLebel" id="label" required="required">
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="bankButtonPrev();">
												
													
												</div>
												
											</div>
											<div id="vendorAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="row">
														<div class="col-md-5">
															<b>VAT no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorVATno" id="vatno" required="required" value="${account.vatNumber}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>VAT registration date:</b>
														</div>
														<div class="col-md-7">
														<fmt:formatDate value="${account.vatRegistrationDate}" var="vatregdate" pattern="dd-MM-yyyy"/>
															<input type="text" class="form-control"
																name="vendorVATregDate" required="required"
																id="datepicker" readonly="readonly"  value="${vatregdate}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorCSTno" id="cstno" required="required" value="${account.cstNumber}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST registration date:</b>
														</div>
														<div class="col-md-7">
														<fmt:formatDate value="${account.cstRegistrationDate}" var="cstregdate" pattern="dd-MM-yyyy"/>
															<input type="text" class="form-control"
																name="vendorCSTregDate" required="required"
																id="datepicker1" readonly="readonly" value="${cstregdate}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>PAN no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorPANno" id="pan" required="required" value="${account.panNumber}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorExciseRegNo" id="exciseno" required="required" value="${account.exciseRegistrationNumber}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration date:</b>
														</div>
														<div class="col-md-7">
														<fmt:formatDate value="${account.exciseRegistrationDate}" var="exciseregdate" pattern="dd-MM-yyyy"/>
															<input type="text" class="form-control"
																name="vendorExciseRegDate" required="required"
																id="datepicker2" readonly="readonly" value="${exciseregdate}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorServiceTaxRegNo" id="servtaxno" required="required" value="${account.serviceTaxRegistrationNumber}">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration date:</b>
														</div>
														<div class="col-md-7">
														<fmt:formatDate value="${account.serviceTaxRegistrationDate}" var="serviceregdate" pattern="dd-MM-yyyy"/>
															<input type="text" class="form-control"
																name="vendorServiceTaxRegDate" required="required"
																id="datepicker3" readonly="readonly" value="${serviceregdate}">
														</div>
													</div>
													<div class="row">
														<div class="col-md-5">
															<b>Tax group id:</b>
														</div>
														<div class="col-md-7">
															<select class="form-control" name="taxTypeGroupId" id="taxgroup" value="${account.tax_Type_Group}">
																<c:forEach
																	items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
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

													<div class="col-md-3">
														<b>Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorName" id="name"
															required="required"  value="${vendor.name}">
													</div>
													<br>
													<div class="col-md-3">
														<b>Company Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control"
															name="vendorCompanyName" id="compname" required="required"  value="${vendor.companyName}">
													</div>

													<div class="col-md-3">
														<b>Ph No1:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorPh1" id="phn1"
															required="required"  value="${vendor.ph1}">
													</div>

													<div class="col-md-3">
														<b>Ph No2:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorPh2" id="phn2"
															required="required"  value="${vendor.ph2}">
													</div>

													<div class="col-md-3">
														<b>Email :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorMail" id="email"
															required="required"  value="${vendor.email}">
													</div>

													<div class="col-md-3">
														<b>Alias name :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorAlias" id="alias"
															required="required"  value="${vendor.aliseName}">
													</div>

													<div class="col-md-3">
														<b>Vendor type :</b>
													</div>
													<div class="col-md-9">
													<input type="hidden" id="oldVendortypeID" value="${vendor.vendorType.id}">
														<select class="form-control" name="vendorType" id="type">
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
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Address</h6></a></li>
														</ul>
													</div>
													<textarea rows="" cols="" class="form-control"
														name="vendorAddress" id="addr" required="required" >${vendor.address}</textarea>
													<div class="row">
														<div class="col-md-3">City :</div>
														<div class="col-md-9">
															<input type="text" class="form-control cityAuto" id="vendorcity"
																name="vendorCity" required="required"  value="${vendor.city.cityName}">
															<input type="hidden" name="vendorCityId" value="${account.city.id}"
																id="vendorCityId">
														</div>
													</div>
													<div class="row">
														<div class="col-md-3">Pin code :</div>
														<div class="col-md-9">
															<input type="text" class="form-control" name="vendorPin" id="pin"
																required="required"  value="${vendor.pinCode}">
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="addressButtonPrev();"> <input
														class="btn green pull-right" type="button" value="Next"
														onclick="addressButtonNext();">
												</div><br>
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
											</div>
										</div>
										<input type="button" class="btn green pull-left" type="submit" style="width: 100px;margin-top: 27px;" value="Submit" onclick="submitVendorDetails();">
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
	<!-- main -->
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>