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


<script src="js/jquery-ui/jquery-ui.js"></script>

<script>
	$(function() {
		$(document).tooltip();
	});
</script>



<script>
	$(function() {
		var d = new Date();
		var m = d.getMonth();
		if (m > 3) {
			var n = d.getFullYear();
		} else {
			var n = d.getFullYear() - 1;
		}
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, 3, 1),
			maxDate : 0
		});
		$("#datepicker").datepicker('setDate', new Date());
	});
	/* $(function() {
		var d = new Date();
		var n = d.getFullYear();
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, 0, 1),
			maxDate : 0
		});
		$("#datepicker2").datepicker('setDate', new Date());
	}); */
	function paymentDate() {
		if ($("#vendorType").val() == 0) {
			alert("please select Vendor type");
		} else if ($("#vName").val() == "") {
			alert("please enter Vendor name");
		} else if ($("#vendorBillNo").val() == "") {
			alert("please enter Vendor bill no.");
		} else if ($("#isAgent").val() == 'yes' && $("#agentName").val() == 0) {
			alert("please select agent name");
		} else if ($("#datepicker").val() == "") {
			alert("please select Purchase entry date");
		} else if (i == 1) {
			alert("please enter product to purchase");
		} else {
			//$("#datepicker2").val($("#datepicker").val());
			var d = $("#datepicker").datepicker('getDate');
			var n = d.getFullYear();
			var m = d.getMonth();
			var dt = d.getDate();
			$("#datepicker2").datepicker({
				dateFormat : "dd-mm-yy",
				minDate : new Date(n, m, dt),
				maxDate : 0
			});
			$("#datepicker2").datepicker('setDate', new Date());
			$("#savePurchase").modal("show");
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchEntry").attr("style", "color: #6a94ff;");
		$("#payDetail").hide();
		$("#description").hide();
		$("#AMi2").hide();
	});
	function closePayment() {
		$("#payDetail").hide();
		$("#description").hide();
		$("#pstatus").val('-');
		$("#pType").val('-');
		$("#AMi2").hide();
	}
	function pStatusDiv() {
		var val = $('[name="pstatus"]').val();
		$("#payDetail").show();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#payDetail").hide();
			$("#description").hide();
			$("#AMi2").hide();
			$("#pType").val("-");
		} else if (val == 'Not Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pAmount").hide();
			$("#pDate").hide();
			$("#pTypeDiv").hide();
			$("#pDueAmount").show();
			$("#description").show();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number(0));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		} else if (val == 'Full Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pDueAmount").hide();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#AMi2").hide();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number($("#gt").val()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
		} else if (val == 'Semi Paid') {
			$("#pType").val("-");
			$("#pPayAmount").show();
			$("#pDueAmount").show();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number($("#gt").val()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		}
	}
	function spPaymentAmountFunc() {
		if (Number($("#spPaymentAmount").val()) > Number($("#spAmount").val())) {
			alert("Payment amount can not be greater than full amount...");
			$("#spPaymentAmount").val(Number($("#gt").val()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		} else {
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		}
	}
	function pTypeFunc() {
		$("#description").show();
		var val = $('[name="pType"]').val();
		if (val == '-') {
			alert('Please select Payment Type...');
			$("#description").hide();
		}
	}
</script>
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

			<c:if test="${page.name.equals('Purchase Entry')}">
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


	<c:if test="${requestScope['purDetIdforPC']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"purchaseChallanForPrint.jsp?id=${requestScope['purDetIdforPC']}&print=${requestScope['print']}",
							'name', 'width=600,height=400');
			myWindow.print();
		</script>
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
								<h3 style="margin-top: 11px;">Purchase Entry</h3>

							</div>

							<div class="col-md-12">
								<form role="form" class="sec" method="post" id="purchaseForm"
									action="purchaseEntry">
									<div class="widget-area">
										<div class="col-md-6">
											<div class="col-md-12">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <select
													class="form-control" name="vendorType" id="vendorType"
													onchange="getVendorNameByType();" required="required">
													<option value="0">Select Vendor Type</option>
													<c:forEach
														items="${sessionScope['ejb'].getAllVendorType()}"
														var="vType">
														<c:choose>
															<c:when
																test="${vType.type.equals('Vendor') || vType.type.equals('Purchase Agent')}">
																<option value="${vType.id}">${vType.type}</option>
															</c:when>
														</c:choose>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-11">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
													type="text" class="form-control" id="vName" name="vName"
													required="required" onchange="emptyVender();"
													autocomplete="off"><input type="hidden" id="vId"
													name="vId">
											</div>
											<div class="col-md-1">
												<b class="font">&nbsp;&nbsp; </b> <a onclick="addVendor()"
													title="Add New Vendor."> <img
													style="margin-top: 4px; cursor: pointer" height="30px"
													width="30px" alt="" src="img/add.png">
												</a>
											</div>

											<div class="col-md-12" style="margin-top: 15px;">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
												<textarea rows="5" cols="" id="vDetail" class="form-control"
													readonly="readonly"></textarea>

											</div>
											<div class="col-md-12">
												<input type="checkbox" onclick="isAgentF();" id="agent"
													name="agent" disabled="disabled">&nbsp;<span>Via
													Agent</span>
											</div>
											<div class="col-md-12" id="aNameDiv">
												<div class="col-md-11">
													<label for="" class="font">Agent Name:</label>
													<!-- <input
															type="text" class="form-control" name="agentName"
															id="agentName"> -->
													<select class="form-control" id="agentName"
														name="agentName" onchange="getAgentDetail();">
														<option value="0">Select Agent name</option>
														<c:forEach
															items="${sessionScope['ejb'].getVendorsByVendorTypeJobber('Purchase Agent')}"
															var="agents">
															<option value="${agents.id}">${agents.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-1">

													<b class="font">&nbsp;&nbsp; </b> <a
														onclick="addAgentDetails()" title="Add New Agent."> <img
														style="margin-top: 4px; cursor: pointer" height="30px"
														width="30px" alt="" src="img/add.png">
													</a>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="" class="font">Vendor Bill no :</label> <input
													type="text" placeholder="" id="vendorBillNo"
													class="form-control" name="vendorBillNo"
													required="required">
											</div>
											<div class="form-group">
												<label for="" class="font">Purchase challan no. :</label>
												<c:set var="fy"
													value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
												<c:set var="cno"
													value="${sessionScope['ejb'].getLastPurchaseChallanNumberByCompany(compInfo.id)+1}" />
												<c:set var="csuf"
													value="${sessionScope['ejb'].getLastPurchaseChallanSuffixByCompany(compInfo.id)+1}" />
												<c:set var="suf" value="PUR" />
												<c:set var="bs"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId(suf, compInfo.id)}" />
												<fmt:formatNumber value="${cno}" var="lastChNo"
													minIntegerDigits="4" groupingUsed="false" />
												<fmt:formatNumber value="${csuf}" var="lastSuf"
													minIntegerDigits="3" groupingUsed="false" />
												<fmt:formatDate
													value="${sessionScope['ejb'].getCurrentDateTime()}"
													pattern="MM" var="yr" />
												<input readonly="readonly" type="text" placeholder=""
													name="challanNumber" class="form-control"
													value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
												<input type="hidden" name="challanNo" value="${lastChNo}"
													id="challanNo"> <input type="hidden"
													name="challanSuffix" value="${lastSuf}">
											</div>
											<div class="form-group">
												<label for="" class="font">Purchase Date :</label> <input
													type="text" id="datepicker" class="form-control"
													name="purchaseDate" required="required" readonly="readonly">
											</div>
											<div class="form-group" id="aDetailDiv">
												<label for="" class="font">Agent Details:</label>
												<textarea rows="5" cols="" class="form-control"
													readonly="readonly" id="agentDet" name="agentDet"></textarea>
											</div>
										</div>

										<div class="col-md-12" style="left: 10px;">
											&nbsp;<input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%" onclick="manage();">
										</div>
										<div class='toast' style='display: none'>
											<h3 id="msg">${requestScope['msg']}</h3>
										</div>
									</div>

									<table id="purProTable"
										class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Product Code</th>
												<th>Product Description</th>
												<th>Qty</th>
												<th>UOM</th>
												<th>Rate</th>
												<th>Amount</th>
												<th>Remove</th>
											</tr>
										</thead>
									</table>
									<div style="width: 40%; float: right;">
										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<td colspan="2">Sub Total :</td>
													<td><input type="text" class="form-control"
														id="subTotal" value="0" readonly="readonly"
														name="subTotal"></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><select class="form-control" id="taxGroup"
														name="taxGroup" onchange="selectedTaxGroup();">
															<option value="0">TAX type</option>
															<c:forEach
																items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
																var="taxTypeGroup">
																<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
															</c:forEach>
													</select></td>
													<td>%</td>
													<td><input type="text" class="form-control"
														readonly="readonly" value="0" id="taxTot"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Tax Amount :</td>
													<td><input type="text" class="form-control"
														readonly="readonly" value="0" id="taxAmount"
														name="taxAmount"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Transport charge :</td>
													<td><input type="text" class="form-control"
														name="transportCost" id="transportCost" onkeyup="gtot();"
														value="0" autocomplete="off"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Surcharge :</td>
													<td><input type="text" class="form-control"
														id="surcharge" name="surcharge" onkeyup="gtot();"
														value="0" autocomplete="off"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2" id="round">Round Of :</td>
													<td><input type="hidden" id="totalvalue"
														name="totalvalue" value="0"><input type="number"
														class="form-control" placeholder="" readonly="readonly"
														id="roundvalue" name="roundvalue" value="0"></td>
												</tr>
											</tbody>
											<thead>
												<tr>
													<td colspan="2">Grand Total :</td>
													<td><input type="text" class="form-control" id="gt"
														placeholder="0" readonly="readonly"></td>
												</tr>
											</thead>
										</table>
										<div class="widget-area" style="display: none;">
											<!-- <div class="widget-area" style="overflow-x: scroll;"> -->
											<table id="hiddenTable"
												class="table table-striped table-bordered">
												<thead style="background-color: #F0F0F0;">
													<tr>
														<th>Designer Number id</th>
														<th>Attribute1</th>
														<th>Atribute2</th>
														<th>Atribute3</th>
														<th>Atribute4</th>
														<th>Atribute5</th>
														<th>Atribute6</th>
														<th>Quantity</th>
														<th>UOM</th>
														<th>Rate</th>
														<th>WSP</th>
														<th>MRP</th>
														<th>Lot no.</th>
														<th>Initial Serial</th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="row">
											<div style="float: left;">
												&nbsp; &nbsp; <span><b>Print Barcode :</b> &nbsp; </span> <input
													type="radio" name="bar" value="yesBar">&nbsp; Yes <input
													type="radio" name="bar" value="noBar" checked="checked">&nbsp;
												No
											</div>
											<div style="float: right;">
												<input type="button" class="btn green pull-right"
													data-toggle="modal" value="Save" onclick="paymentDate();">
												<input type="button" onclick="cancelF();"
													class="btn btn-danger small" value="Cancel">
											</div>
										</div>
										<div id="savePurchase" class="modal fade" role="dialog"
											style="top: 25px;">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															onclick="closePayment();">&times;</button>
														<h4 class="modal-title">Payment Details</h4>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-md-6">
																<div class="widget-area">
																	<div class="breadcrumbs">
																		<ul>
																			<li><a title="">Select Payment status : </a></li>
																		</ul>
																	</div>
																	<br> <br> <br>
																	<div class="row">
																		<div class="col-md-5">Payment status :</div>
																		<div class="col-md-7">
																			<div class="sec">

																				<select class="form-control" id="pstatus"
																					name="pstatus" onchange="pStatusDiv()">
																					<option value="-" selected="selected">---</option>
																					<c:forEach
																						items="${sessionScope['ejb'].getAllPaymentStatus()}"
																						var="payStatus">
																						<option value="${payStatus.status}">${payStatus.status}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div id="payDetail">
																		<div class="breadcrumbs">
																			<ul>
																				<li><a title="">Payment Details : </a></li>
																			</ul>
																		</div>
																		<br> <br> <br>
																		<div class="row">
																			<div class="sec" id="pTypeDiv">
																				<div class="col-md-5">Payment type :</div>
																				<div class="col-md-7">
																					<select class="form-control" id="pType"
																						name="pType" onchange="pTypeFunc()">
																						<option value="-" selected="selected">---</option>
																						<c:forEach
																							items="${sessionScope['ejb'].getAllPaymentType()}"
																							var="payType">
																							<c:if
																								test="${payType.getType()!='Debit Note' && payType.getType()!='Credit Note'}">
																								<option value="${payType.getType()}">${payType.getType()}</option>
																							</c:if>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																			<div id="pDate">
																				<div class="col-md-5">Payment Date :</div>
																				<div class="col-md-7">
																					<input type="text" id="datepicker2"
																						class="form-control" readonly="readonly"
																						name="payDate">
																				</div>
																			</div>
																			<div id="pAmount">
																				<div class="col-md-5">Full Amount :</div>
																				<div class="col-md-7">
																					<input type="text" class="form-control"
																						readonly="readonly" id="spAmount" name="spAmount">
																				</div>
																			</div>
																			<div id="pPayAmount">
																				<div class="col-md-5">Payment Amount :</div>
																				<div class="col-md-7">
																					<input type="text" class="form-control" value="0"
																						id="spPaymentAmount" name="spPaymentAmount"
																						onkeyup="spPaymentAmountFunc();"
																						autocomplete="off">
																				</div>
																			</div>
																			<div id="pDueAmount">
																				<div class="col-md-5">Due Amount :</div>
																				<div class="col-md-7">
																					<input type="text" class="form-control"
																						readonly="readonly" id="spDueAmount"
																						name="spDueAmount">
																				</div>
																			</div>
																			<div id="AMi2">
																				<div>
																					<div class="col-md-5">Current Credit Note :</div>
																					<div class="col-md-7">
																						<input type="text" id="totalCredit"
																							name="totalCredit" class="form-control"
																							readonly="readonly" value="0">
																					</div>
																				</div>
																				<div>
																					<div class="col-md-5">
																						<span id="dORc">Final Credit Note :</span>
																					</div>
																					<div class="col-md-7">
																						<input type="text" class="form-control"
																							id="finalDC" name="finalDC" readonly="readonly"
																							value="0">
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-md-6" style="float: right;"
																id="description">
																<div class="widget-area">
																	<div class="breadcrumbs">
																		<ul>
																			<li><a title="">Provide Description : </a></li>
																		</ul>
																	</div>
																	<br> <br> <br>
																	<div class="row">
																		<div class="col-md-5">Description :</div>
																		<div class="col-md-7">
																			<textarea rows="" cols="" class="form-control"
																				id="desc" name="desc"></textarea>
																		</div>
																	</div>
																	<br>
																	<div class="breadcrumbs">
																		<button type="button" class="btn green pull-right"
																			onclick="submit();">Save</button>
																	</div>
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
									</div>
									<input type="hidden" name="isSalable" id="isSalable"> <input
										type="hidden" name="isBarPrint" id="isBarPrint"> <input
										type="hidden" name="isSerial" id="isSerial"> <input
										type="hidden" name="isLot" id="isLot"> <input
										type="hidden" name="isAgent" id="isAgent">
								</form>
								<!-- <input type="radio" name="a" value="x" onclick="first()" id="a">1
									<input type="radio" name="a" value="y" onclick="second()"
										id="b">2 -->
							</div>
						</div>
					</div>
				</div>







			</div>
		</div>
		<!-- Content Sec -->
	</div>



	<div id="addV" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeaddV();">&times;</button>
					<center>
						<h3 class="modal-title">Vendor/Agent</h3>
					</center>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="addVendorbyjson" id="addVen"
						method="post">
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
									<h5 align="center">(All the below fields are optional)</h5>
									<br>
									<div class="col-md-3">
										<b>Bank Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankName"
											id="idbankName">
									</div>
									<br>
									<div class="col-md-3">
										<b>A/C no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankAccNo"
											id="acno">
									</div>
									<br>
									<div class="col-md-3">
										<b>Branch:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankBranch"
											id="idbankBranch">
									</div>
									<br>
									<div class="col-md-3">
										<b>City:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" id="bankCity">
										<input type="hidden" value="" name="bankCity" id="bankCityId">
									</div>
									<br>
									<div class="col-md-3">
										<b>IFSC no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankIFSC"
											id="idbankIFSC">
									</div>
									<br>
									<div class="col-md-3">
										<b>MICR no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankMICR"
											id="idbankMICR">
									</div>
									<br>
									<div class="col-md-3">
										<b>RTGS code:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankRTGS"
											id="idbankRTGS">
									</div>
									<br>
									<div class="col-md-3">
										<b>Check lebel:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankCheckLebel"
											id="idbankCheckLebel">
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="bankButtonPrev();"> <input
										class="btn green pull-right" type="button" value="Finish"
										onclick="submitform1();">
								</div>

							</div>
							<div id="vendorAccount" class="tab-pane fade">
								<div class="widget-area">
									<div class="row">
										<h5 align="center">(All the below fields are optional)</h5>
										<br>
										<div class="col-md-5">
											<b>VAT no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorVATno"
												id="idvendorVATno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>VAT registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorVATregDate" id="datepickerA" readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorCSTno"
												id="idvendorCSTno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorCSTregDate" id="datepickerB" readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>PAN no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorPANno"
												id="idvendorPANno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegNo" id="idvendorExciseRegNo">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegDate" id="datepickerC"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegNo" id="idvendorServiceTaxRegNo">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegDate" id="datepickerD"
												readonly="readonly">
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<b>Tax group id:</b>
										</div>
										<div class="col-md-7">
											<select class="form-control" name="taxTypeGroupId"
												id="taxgroupV">
												<option value="0">select a tax group</option>
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
									<input type="button" value="Next" class="btn green pull-right"
										onclick="vendorButtonNext();"> <input type="button"
										value="Previous" class="btn green pull-left"
										onclick="vendorButtonPrev();">
								</div>
							</div>

							<div id="detail" class="tab-pane fade active in">
								<div class="widget-area">

									<div class="col-md-3">
										<b>Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorName"
											id="idName">
									</div>
									<br>
									<div class="col-md-3">
										<b>Company Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control"
											name="vendorCompanyName" id="idvendorCompanyName">
									</div>

									<div class="col-md-3">
										<b>Ph No1:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh1"
											id="iphone">
									</div>

									<div class="col-md-3">
										<b>Ph No2:(optional)</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh2"
											id="idvendorPh2">
									</div>

									<div class="col-md-3">
										<b>Email :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorMail"
											style="text-transform: none;" id="idvendorMail">

									</div>

									<div class="col-md-3">
										<b>Alias name :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorAlias"
											id="idvendorAlias">
									</div>

									<div class="col-md-3">
										<b>Vendor type :</b>
									</div>
									<div class="col-md-9">

										<select class="form-control" name="vendorType"
											id="idvendorType" value="${vendor.vendorType}"
											disabled="disabled">

											<option value="0">Select Vendor Type</option>

											<c:forEach items="${sessionScope['ejb'].getAllVendorType()}"
												var="vType">

												<c:choose>
													<c:when
														test="${vType.type.equals('Vendor') || vType.type.equals('Purchase Agent')}">
														<option value="${vType.id}">${vType.type}</option>

													</c:when>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<!-- <input class="btn green pull-left" type="button"
														value="Previous" onclick="detailButtonPrev();"> -->
									<input class="btn green pull-right" type="button" value="Next"
										onclick="detailButtonNext();">
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
												name="vendorAddress" id="idAdd"></textarea>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-3">
											<b>City :</b>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control cityAuto"
												name="vendorCity" required="required" id="vendorCity"
												autocomplete="off"> <input type="hidden"
												name="vendorCityId" id="vendorCityId" autocomplete="off">
										</div>
										<div class="col-md-1">
											<a onclick="addCitySC()" title="Add New City"> <img
												style="margin-top: 4px; cursor: pointer" height="30px"
												width="30px" alt="" src="img/add.png">
											</a>

										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-3">
											<b>Pin code :</b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="vendorPin"
												id="idvendorPin" required="required">
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
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>



	<div id="addA" class="modal fade" role="dialog" style="top: 25px;">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<center>
						<h3 class="modal-title">Vendor/Agent</h3>
					</center>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="addAgen" id="addAgena"
						method="post">
						<ul class="nav nav-tabs">
							<li class="active" id="detl2"><a data-toggle="tab"
								href="#detail2">Details</a></li>
							<li id="addr2"><a data-toggle="tab" href="#address2">Address</a></li>
							<li id="vAcc2"><a data-toggle="tab" href="#vendorAccount2">Vendor
									Account Info</a></li>
							<li id="bAcc2"><a data-toggle="tab" href="#bankAccount2">Bank
									Account info</a></li>
							<!-- <li id="prts"><a data-toggle="tab" href="#part">Parts</a></li> -->
						</ul>
						<div class="tab-content">
							<div id="bankAccount2" class="tab-pane fade">
								<div class="widget-area">
									<h5 align="center">(All the below fields are optional)</h5>
									<br>
									<div class="col-md-3">
										<b>Bank Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankName2"
											id="idbankName2">
									</div>
									<br>
									<div class="col-md-3">
										<b>A/C no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankAccNo2"
											id="acno2">
									</div>
									<br>
									<div class="col-md-3">
										<b>Branch:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankBranch2"
											id="idbankBranch2">
									</div>
									<br>
									<div class="col-md-3">
										<b>City:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" id="bankCity6"
											autocomplete="off"> <input type="hidden" value=""
											name="bankCity6" id="bankCityId26">
									</div>
									<br>
									<div class="col-md-3">
										<b>IFSC no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankIFSC2"
											id="idbankIFSC2">
									</div>
									<br>
									<div class="col-md-3">
										<b>MICR no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankMICR2"
											id="idbankMICR2">
									</div>
									<br>
									<div class="col-md-3">
										<b>RTGS code:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankRTGS2"
											id="idbankRTGS2">
									</div>
									<br>
									<div class="col-md-3">
										<b>Check lebel:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankCheckLebel2"
											id="idbankCheckLebel2">
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="bankButtonPrev2();"> <input
										class="btn green pull-right" type="button" value="Finish"
										onclick="submitform2();">
								</div>

							</div>
							<div id="vendorAccount2" class="tab-pane fade">
								<div class="widget-area">
									<div class="row">
										<h5 align="center">(All the below fields are optional)</h5>
										<br>
										<div class="col-md-5">
											<b>VAT no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorVATno2"
												id="idvendorVATno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>VAT registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorVATregDate2" id="datepickerA2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorCSTno2"
												id="idvendorCSTno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorCSTregDate2" id="datepickerB2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">

											<b>PAN no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorPANno2"
												id="idvendorPANno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegNo2" id="idvendorExciseRegNo2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegDate2" id="datepickerC2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegNo2" id="idvendorServiceTaxRegNo2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegDate2" id="datepickerD2"
												readonly="readonly">
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<b>Tax group id:</b>
										</div>
										<div class="col-md-7">
											<select class="form-control" name="taxTypeGroupId2"
												id="taxgroup2">
												<option value="0">select a tax group</option>
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
									<input type="button" value="Next" class="btn green pull-right"
										onclick="vendorButtonNext2();"> <input type="button"
										value="Previous" class="btn green pull-left"
										onclick="vendorButtonPrev2();">
								</div>
							</div>

							<div id="detail2" class="tab-pane fade active in">
								<div class="widget-area">

									<div class="col-md-3">
										<b>Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorName2"
											id="idName2" required="required">
									</div>
									<br>
									<div class="col-md-3">
										<b>Company Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control"
											name="vendorCompanyName2" id="idvendorCompanyName2">
									</div>

									<div class="col-md-3">
										<b>Ph No1:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh12"
											id="iphone2" required="required">
									</div>

									<div class="col-md-3">
										<b>Ph No2:(optional)</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh22"
											id="idvendorPh22" required="required">
									</div>

									<div class="col-md-3">
										<b>Email :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorMail2"
											style="text-transform: none;" id="idvendorMail2"
											required="required">
									</div>

									<div class="col-md-3">
										<b>Alias name :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorAlias2"
											id="idvendorAlias2" required="required">
									</div>

									<div class="col-md-3">
										<b>Vendor type :</b>
									</div>
									<div class="col-md-9">

										<select class="form-control" name="vendorType2"
											disabled="disabled" id="idvendorType2">
											<c:forEach items="${sessionScope['ejb'].getAllVendorType()}"
												var="vType">

												<c:choose>
													<c:when test="${vType.type.equals('Purchase Agent')}">
														<option value="${vType.id}" selected="selected">${vType.type}</option>

													</c:when>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<div class="col-md-12">

									<input class="btn green pull-right" type="button" value="Next"
										onclick="detailButtonNext2();">
								</div>
							</div>
							<div id="address2" class="tab-pane fade ">
								<div class="widget-area">
									<div class="row">
										<div class="col-md-3">
											<b>Adress :</b>
										</div>
										<div class="col-md-9">
											<textarea rows="" cols="" class="form-control"
												name="vendorAddress2" id="idAdd2" required="required"></textarea>
											<div class="row"></div>
										</div>
										<div class="col-md-3">
											<b>City :</b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control cityAuto"
												name="vendorCity2" required="required" id="vendorCity2">
											<input type="hidden" name="vendorCityId2" id="vendorCityId2">
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<b>Pin code :</b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="vendorPin2"
												id="idvendorPin2" required="required">
										</div>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="addressButtonPrev2();"> <input
										class="btn green pull-right" type="button" value="Next"
										onclick="addressButtonNext2();">
								</div>
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<div id="addProduct" class="modal fade" role="dialog"
		style="top: -70px; overflow-y: hidden; overflow-x: hidden;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="" style="font-size: 20px;"><strong>Group</strong></a></li>
								</ul>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-5">Department:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" readonly="readonly"
										id="dept" name="dept">
								</div>
								<div class="col-md-5">Sub-Department:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" readonly="readonly"
										id="subDept" name="subDept">
								</div>
								<div class="col-md-5">Category:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" readonly="readonly"
										id="cat" name="cat">
								</div>
								<div class="col-md-12">
									<br>
								</div>
								<div class="col-md-5">Product Code:</div>
								<div class="col-md-6">
									<input type="text" id="pCode" name="pCode" class="form-control"
										onchange="emptyForm();" autocomplete="off"><input
										type="hidden" id="productCode" name="productCode">

								</div>
								<div class="col-md-1">
									<a onclick="addDesineNo()" title="Add New Product"> <img
										style="margin-top: 4px; cursor: pointer; margin-left: -23px;"
										height="27px" width="27px" alt="" src="img/add.png">
									</a>
								</div>
								<div class="col-md-5">Product Descripsion:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" name="pDesc" id="pDesc"
										readonly="readonly">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="" style="font-size: 20px;"><strong>Attributes</strong>
									</a></li>
								</ul>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-2">
									<span id="attr1Name">Attribute1:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr1" id="attr1"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr2Name">Attribute2:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr2" id="attr2"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr3Name">Attribute3:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr3" id="attr3"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr4Name">Attribute4:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr4" id="attr4"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr5Name">Attribute5:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr5" id="attr5"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr6Name">Attribute6:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr6" id="attr6"
										readonly="readonly">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="col-md-3">Quantity:</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="qty" id="qty">
								</div>
								<div class="col-md-3">UOM:</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="uom" name="uom"
										readonly="readonly">
								</div>
								<div class="col-md-3">Rate:</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="rate" id="rate"
										required="required" onchange="rateF();">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="row">
									&nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" id="sale"
										onclick="salable();" style="display: none;"> &nbsp;
									<!-- Is salable -->

								</div>
								<div class="col-md-2">WSP:</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="wsp"
										readonly="readonly" name="wsp" onchange="wspF();">
								</div>
								<div class="col-md-2">MRP:</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="mrp"
										readonly="readonly" name="mrp" onchange="mrpF();">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 100%; top: 0px;">
							<!-- <div class="row">
								&nbsp; &nbsp; <span>Lot no : &nbsp;</span> <input type="radio"
									name="lot" value="yesLot" checked="checked">&nbsp; Yes
								<input type="radio" name="lot" value="noLot">&nbsp; No
							</div> -->

							<div class="row">
								<div class="col-md-2">
									<b>Lot No. :</b>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="lotText"
										name="lotText">
								</div>
							</div>
							<!-- <br>
							<div class="row">
								&nbsp; &nbsp; <span>Serial : &nbsp; </span> <input type="radio"
									name="serial" value="yesSerial">&nbsp; Yes <input
									type="radio" name="serial" value="noSerial" checked="checked">&nbsp;
								No
							</div>

							<div class="row">
								<div class="col-md-2">
									<b>Initial Serial. :</b>
								</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="serialText"
										name="serialText" dis>
								</div>
							</div> -->
							<br>
							<div class="row">
								<!-- <div style="float: left;">
									&nbsp; &nbsp; <span><b>Bar code :</b> &nbsp; </span> <input
										type="radio" name="bar" value="yesBar" checked="checked">&nbsp;
									Yes <input type="radio" name="bar" value="noBar">&nbsp;
									No
								</div> -->

								<div style="float: right; right: 25px;">
									<input type="button" class="btn green pull-left" width=""
										value="Add Product" data-toggle="modal"
										onclick="anotherShow();"> <input type="button"
										class="btn btn-default" data-dismiss="modal" value="Close"
										id="close" onclick="closeProduct()">
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div id="another" class="modal fade" role="dialog" style="top: -25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- <div class="modal-header">
					<button type="button" class="close" onclick="close1();">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div> -->
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>Product added successfully...</span> <span>Do you
									want to add another product?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-success medium" id="yesP">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noP">No</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" id="close1"
						onclick="close1();">Close</button> -->
				</div>
			</div>

		</div>
	</div>
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
								<span>Do you want to cancel?</span>
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



	<div id="addCitySC" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<div class="row">
						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Country/State/City</h3>

						</div>

						<div class="widget-area" style="width: 33%;">
							<form action="addJsonCountry" class="sec">
								<h3>Country</h3>
								<input class="btn green pull-left" type="button"
									onclick="countryPopup();" value="Add Country">
								<div id="createCountry" style="top: 25px; position: absolute;">
									<div class="modal-dialog" style="z-index: 1">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" onclick="closed();">&times;</button>
												<h4 class="modal-title">Country Ctreation</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-md-1">Name:</div>
													<div class="col-md-10">
														<input id="creConName" type="text" class="form-control"
															name="name" onkeyup="crecontxt();">
													</div>
													<div class="col-md-1">
														<input id="creConbtn" class="btn green pull-right"
															type="button" value="Add" disabled="disabled"
															onclick="submitformcountry();">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</form>
							<%-- <div class="widget-area"
								style="overflow-y: scroll; height: 350px;">
								<ul>
									<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
										var="contry">
										<li>${contry.countryName}</li>
									</c:forEach>
								</ul>
							</div> --%>
						</div>

						<div class="widget-area" style="width: 34%;">
							<form action="#" class="sec">
								<h3>State</h3>
								<input class="btn green pull-left" type="button"
									onclick="statePopup();" value="Add State">
								<div id="createState" style="top: 25px; position: absolute;">
									<div class="modal-dialog" style="z-index: 1">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" onclick="closed();">&times;</button>
												<h4 class="modal-title">State Ctreation</h4>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-md-1">Name:</div>
													<div class="col-md-11">
														<input type="text" class="form-control" name="name"
															id="stateName" onkeyup="stateNameKeyUp();">
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-md-4">The State Belongs to :</div>
													<div class="col-md-6">
														<input id="country" type="text" name="nameqaz"
															class="form-control"> <input id="countryId"
															type="hidden" name="id">
													</div>
													<div class="col-md-2">
														<input id="countryForStatebtn" type="button"
															onclick="methodState()" value="create"
															disabled="disabled" class="btn green pull-right">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</form>
							<%-- 	<br> <br> <span><b>Select Country:</b></span><select
								class="form-control" name="countryid" style="width: 150px;"
								onchange="stateDispByCountry();">
								<option value="0">select country</option>
								<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
									var="contry">
									<option value="${contry.id}">${contry.countryName}</option>
								</c:forEach>
							</select>
							<div class="widget-area"
								style="overflow-y: scroll; height: 292px;" id="states">
								<ul>
									<!-- ***************************state List here displayed******************* -->
								</ul>
							</div> --%>
						</div>


						<div class="widget-area" style="width: 33%;">
							<h3>City</h3>
							<input class="btn green pull-left" type="button"
								onclick="cityPopup();" value="Add City">
							<div id="createCity"
								style="top: 25px; left: 25px; position: absolute;">
								<div class="modal-dialog"
									style="z-index: 1; float: left; width: 200%;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" onclick="closed();">&times;</button>
											<h4 class="modal-title">City Ctreation</h4>
										</div>
										<div class="modal-body">
											<form action="addCity" class="sec">
												<div class="row">
													<div class="col-md-1">Name:</div>
													<div class="col-md-11">
														<input type="text" class="form-control" name="namezxc"
															id="cityName" onkeyup="cityNameKeyUp();">
													</div>
												</div>
												<br> <b>The City Belongs to :</b>
												<div class="row">
													<div class="col-md-2">Country:</div>
													<div class="col-md-10">
														<input id="country1" type="text" name="country1"
															class="form-control">
													</div>

													<div class="col-md-2">State:</div>

													<div class="col-md-8">
														<input id="state" type="text" name="name"
															class="form-control" disabled="disabled"> <input
															id="stateId" type="hidden" name="id">
													</div>

													<div class="col-md-2">
														<input id="cityAddbtn" type="button" value="create"
															onclick="methodCityA()" disabled="disabled"
															class="btn green pull-right">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer"></div>
									</div>
								</div>
							</div>
							<%-- <br> <br> <span><b>Select Country:</b></span><select
								class="form-control" name="countryid3"
								onchange="getStateList();">
								<option value="0">select country</option>
								<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
									var="contry">
									<option value="${contry.id}">${contry.countryName}</option>
								</c:forEach>
							</select> <span><b>Select State:</b></span><select class="form-control"
								name="sateid" id="statelist1" onchange="getCityList();">
								<!-- ********************state option**************************** -->
							</select>
							<div class="widget-area"
								style="overflow-y: scroll; height: 233px;" id="cityList">
								<ul>

								</ul>
							</div> --%>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>
	<div id="addDesineN" class="modal fade" role="dialog"
		style="top: 1px; left: 96px;">
		<div class="modal-dialog">
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
											<label for="exampleInputEmail1">Product Code:</label> <input
												type="text" name="productCode2" id="productCodeAMI"
												onkeyup="codeKeyUp();" onchange="codeChange();"
												class="form-control"><input type="hidden"
												id="pcodeCheck">
										</div>
									</div>
									<div class="col-md-6">
										<div>
											<label for="exampleInputPassword1">Description:</label> <input
												type="text" name="description" id="descriptionAMI"
												class="form-control"><br>
										</div>

									</div>

									<div class="col-md-6">
										<label for="exampleInputEmail1">Designer's Design
											number:</label> <input type="text" name="universalProductCode"
											id="universalProductCode" placeholder="" class="form-control"><br>
									</div>
									<div class="col-md-5">
										<div>
											<label for="exampleInputPassword1">Unit Of
												Measurement:</label> <select required name="uom" id="uomO"
												onchange="uomFunction()" class="form-control"
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

							<h3>Products:</h3>

							<p style="font-size: 20px; margin-right: 342px;">
								<input type="radio" name="isReady" id="raw" onclick=""
									value="raw">Raw &nbsp; &nbsp; &nbsp;<input type="radio"
									name="isReady" id="ready" onclick="" value="ready">Ready
								&nbsp;&nbsp;&nbsp; <input type="checkbox" onclick="isSaledata()"
									id="salepart">This Products is for sale
							</p>

							<hr width="100%">
						</div>






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
							<!-- <div id="companyLogo">
								<input type="file" name="proImg" size="60" id="image"
									onchange="readURL(this);" value="">
							</div> -->

						</fieldset>
					</div>

					<div id="step4"
						style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial;">




						<fieldset>
							<legend> Add Initial Inventory </legend>

							<p style="font-size: 14px">(Enter the Products's initial
								inventory.)</p>
							<br> <br> <input type="radio" name="do" checked
								id="idd" onclick="openn1();" value="doNotAdd">Do not add
							initial inventory <br> <br> <input type="radio"
								name="do" id="openn" onclick="openn1();" value="add">Add
							initial inventory <br>
							<hr width="100%">






							<div id="divshow">

								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Per Unit Cost:</label> <input
											name="unitCost" type="text" placeholder="" id="ucO"
											onchange="rateF2()" class="form-control">

									</div>
									<div class="form-group">
										<label for="" class="font">Wholesale Price :</label> <input
											type="text" name="wsp" onchange="wspF2()" placeholder=""
											id="wspO" class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="font">Quantity:</label> <input
											name="quantity" type="text" id="quantity"
											onkeyup="setLimit()" class="form-control">
									</div>


									<div class="form-group">
										<label for="" class="font">Maximum Retail Price :</label> <input
											type="text" name="mrp" placeholder="" id="mrpO"
											onchange="mrpF2()" class="form-control">
									</div>

								</div>


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
										<strong>Tree</strong> List &nbsp; &nbsp;
										<!--  <a onclick="addCat()"
											title="Add New Category"> <img style="margin-top: 4px;"
											height="30px" width="30px" alt="" src="img/add.png">
										</a> -->
									</h2>
									<p>
										<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
											id="tree-collapse-all">Collapse all</a>
									</p>

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
										<span id="sa1" style="font-size: 17px">Attribute 1</span> <input
											name="a1" type="text" disabled="disabled" id="a10"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa2" style="font-size: 17px">Attribute 2</span> <input
											name="a2" type="text" disabled="disabled" id="a20"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa3" style="font-size: 17px">Attribute 3</span> <input
											name="a3" type="text" id="a30" disabled="disabled"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<span id="sa4" style="font-size: 17px">Attribute 4</span> <input
											name="a4" type="text" disabled="disabled" id="a40"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa5" style="font-size: 17px">Attribute 5</span> <input
											name="a5" type="text" disabled="disabled" id="a50"
											class="form-control">
									</div>
									<div class="form-group">
										<span id="sa6" style="font-size: 17px">Attribute 6</span> <input
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
								<form action="#" id="fs" method="Post"
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
												name="description" readonly id="description1"></td>
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
												name="uom78" id="uom1"> <input type="text"
												class="form-control " readonly name="uom"
												id="uomnamedisplay"></td>

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
														&#10007; <input type="hidden" class="form-control"
															readonly id="isSalebi" name="isSalebi" value="false">
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
										<u>Add initial inventory:</u>
									</h4>
									<table>
										<tr>

											<td><input type="hidden" id="addini"
												class="form-control" readonly name="addini" value="false"></td>
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
												name="wsp1" id="wspAMI"></td>
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
								style="position: absolute; right: 165px; top: 3px;" id="next"
								onclick="nextF();">Next</button>
							<button type="button" class="c-btn medium gray"
								style="position: absolute; right: 240px; top: 3px;" id="prev"
								onclick="prevF();">Back</button>
						</div>
					</div>
				</div>
			</div>

		</div>
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
							<div class="col-md-3">Abbreviation :</div>
							<div class="col-md-9">
								<input type="text" required name="abbreviationuom"
									id="abbreviationuom" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">Name UOM :</div>
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
							onclick="submitform11()" value="Submit">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</form>


	</div>


	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
		function addDesineNo() {

			$("#addDesineN").modal('show');

		}
	</script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image').attr('src', e.target.result).width(120).height(
							85);
					var str = e.target.result;
					$("#proImage1")
							.val(str.substring(str.lastIndexOf(',') + 1));
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript">
		function codeKeyUp() {
			$("#pcodeCheck").val("");
			$.ajax({
				url : "checkPcode",
				dataType : "json",
				data : {
					productCode4 : $("#productCodeAMI").val()
				},
				success : function(data) {
					if (data.code != "") {
						$("#pcodeCheck").val(data.code);
					}
				}

			});

		}

		function codeChange() {
			if ($("#pcodeCheck").val() != "") {
				alert("this designer number: already exist.");
				$("#pcodeCheck").val("");
				$("#productCodeAMI").val("");
			}
		}
	</script>

	<script type="text/javascript">
		function submitform11() {

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
											id : $("#qtyUnitTypeIduom").val()
										},
										dataType : "json",
										success : function(data) {
											$("#uomO").empty();
											$("#uomO")
													.append(
															'<option value="0">select an UOM</option>');
											$.map(data, function(item) {
												$("#uomO").append(
														'<option value="'+item.id+'">'
																+ item.name
																+ '</option>');
											});
										}
									});
						}

					});
		}
	</script>

	<script type="text/javascript">
		$('#salepart').click(function() {

			if ($('#salepart').is(':checked')) {
				$("#cross").hide();
				$("#tick").show();
				$("#isSalebi").val($('#salepart').is(':checked'));
			} else {

				$("#tick").hide();
				$("#cross").show();
				$("#isSalebi").val($('#barCode').is(':checked'));
			}
		});
	</script>
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
		function openn1() {

			if ($("[name='do']:checked").val() == "add") {
				$("#showhide").hide();

				$("#divshow").show();
				$("#divhide").hide();
				$("#AttiDiv").show();
				$("#skip").hide();
				$("#nottrack").hide();
				$("#trackkDiv").show();
				$("#addini").val($("[name='do']:checked").val());
			} else {
				$("#divshow").hide();
				$("#divhide").show();
				$("#skip").show();
				$("#showhide").show();
				$("#AttiDiv").hide();
				$("#nottrack").show();
				$("#trackkDiv").hide();
				$("#addini").val($("[name='do']:checked").val());
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
				$("#pcodedisp").val($("#productCodeAMI").val());
				$("#description1").val($("#descriptionAMI").val());
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
				$("#wspAMI").val($("#wspO").val());
				$("#quantity111").val($("#quantity").val());

				$("#ucost").val($("#ucO").val());
				$("#date2").val($("#datepicker").val());
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

			if ($("#productCodeAMI").val() == 0) {
				alert("please select Product Code:");
			} else if ($("#description1").val() == "") {
				alert("please select Description");
			} else if ($("#universalProductCode").val() == "") {
				alert("please select Designer's Design number:");
			} else if ($("#uomnamedisplay").val() == "") {
				alert("please select Unit of measurement");
			} else if ($("#isRaw").val() == "") {
				alert("please select Raw or Ready product");
			} else if (!$("[name='same']").is(':checked')) {
				alert("please select product Category");
			} else if ($("#openn").is(':checked')) {

				if ($("#quantity").val() == 0) {
					alert("please select quantity");
				} else if ($("#mrpO").val() == 0) {

					alert("please select MRP");

				} else if ($("#wspO").val() == 0) {
					alert("please select WSP");
				} else if ($("#ucO").val() == 0) {
					alert("please select per unit cost");

				} else if ($("#lotnumberS").val() == 0) {
					alert("please select lot number");

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
				}

				else {
					var dataa1 = {
						productCode : $("#pcodedisp").val(),
						description : $("#description1").val(),
						upc : $("#upc").val(),
						uom : $("#uom1").val(),
						isRaw : $("#isRaw").val(),
						isSalebi : $("#isSalebi").val(),
						catagoryId : $("#catagoryId").val(),
						addini : $("#addini").val(),
						mrp1 : $("#mrp1").val(),
						wsp1 : $("#wspAMI").val(),
						qty1 : $("#quantity111").val(),
						ucost : $("#ucost").val(),
						att1 : $("#att1").val(),
						att2 : $("#att2").val(),
						att3 : $("#att3").val(),
						att4 : $("#att4").val(),
						att5 : $("#att5").val(),
						att6 : $("#att6").val(),
						lotnumberS : $("#lotnumberS").val(),
						proImage1 : $("#proImage1").val(),
						addini : $("#addini").val(),

					};
					$.ajax({
						url : "productSumaryJson",
						dataType : "json",
						data : dataa1,
						type : "post",
						success : function(data1) {
							alert(data1.result);

							$("#addDesineN").modal('hide');
							$("#descriptionAMI").val("");
							$("#productCodeAMI").val("");
							$("#universalProductCode").val("");
						}

					});
				}
			} else {

				var dataa1 = {
					productCode : $("#pcodedisp").val(),
					description : $("#description1").val(),
					upc : $("#upc").val(),
					uom : $("#uom1").val(),
					isRaw : $("#isRaw").val(),
					isSalebi : $("#isSalebi").val(),
					catagoryId : $("#catagoryId").val(),
					mrp1 : $("#mrp1").val(),
					wsp1 : $("#wspAMI").val(),
					qty1 : $("#quantity111").val(),
					ucost : $("#ucost").val(),
					att1 : $("#att1").val(),
					att2 : $("#att2").val(),
					att3 : $("#att3").val(),
					att4 : $("#att4").val(),
					att5 : $("#att5").val(),
					att6 : $("#att6").val(),
					lotnumberS : $("#lotnumberS").val(),
					proImage1 : $("#proImage1").val(),
					addini : $("#addini").val(),

				};
				$.ajax({
					url : "productSumaryJson",
					dataType : "json",
					data : dataa1,
					type : "post",
					success : function(data1) {
						alert(data1.result);

						$("#addDesineN").modal('hide');

						$("#descriptionAMI").val("");
						$("#productCodeAMI").val("");
						$("#universalProductCode").val("");

					}

				});
			}
		}

		/* function */
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
						$("#summaryA1").html("Attribute1:");
						$("#a10").prop("disabled", true);
					}
					if ((data.attrNmae2) != 'null') {
						$("#sa2").html(data.attrNmae2);
						$("#summaryA2").html(data.attrNmae2);
						$("#a20").prop("disabled", false);
					} else {
						$("#sa2").html("Attribute2:");
						$("#summaryA2").html("Attribute2:");
						$("#a20").prop("disabled", true);
					}
					if ((data.attrNmae3) != 'null') {
						$("#sa3").html(data.attrNmae3);
						$("#summaryA3").html(data.attrNmae3);
						$("#a30").prop("disabled", false);
					} else {
						$("#sa3").html("Attribute3:");
						$("#summaryA3").html("Attribute3:");
						$("#a30").prop("disabled", true);
					}
					if ((data.attrNmae4) != 'null') {
						$("#sa4").html(data.attrNmae4);
						$("#summaryA4").html(data.attrNmae4);
						$("#a40").prop("disabled", false);
					} else {
						$("#sa4").html("Attribute4:");
						$("#summaryA4").html("Attribute4:");
						$("#a40").prop("disabled", true);
					}
					if ((data.attrNmae5) != 'null') {
						$("#sa5").html(data.attrNmae5);
						$("#summaryA5").html(data.attrNmae5);
						$("#a50").prop("disabled", false);
					} else {
						$("#sa5").html("Attribute5:");
						$("#summaryA5").html("Attribute5:");
						$("#a50").prop("disabled", true);
					}
					if ((data.attrNmae6) != 'null') {
						$("#sa6").html(data.attrNmae6);
						$("#summaryA6").html(data.attrNmae6);
						$("#a60").prop("disabled", false);
					} else {
						$("#sa6").html("Attribute6:");
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
		function rateF2() {

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

		function wspF2() {

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

		function mrpF2() {

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

	<!-- 	*********************************************Numeric Testing****************************************** -->

	<script>
		$(function() {

			$("#quantity").numericInput({

				allowFloat : false, // Accpets positive numbers (floating point)

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
	<!-- 	*********************************************************************************************************** -->

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
	<script type="text/javascript">
		function addUOM() {
			$("#addUoM").modal("show");
		}

		function addCat() {
			$("#addCatJ").modal("show");
		}
	</script>

	<script type="text/javascript">
		function submitform1() {

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
											id : $("#qtyUnitTypeIduom").val()
										},
										dataType : "json",
										success : function(data) {
											$("#uomO").empty();
											$("#uomO")
													.append(
															'<option value="0">select an UOM</option>');
											$.map(data, function(item) {
												$("#uomO").append(
														'<option value="'+item.id+'">'
																+ item.name
																+ '</option>');
											});
										}
									});
						}

					});
		}
	</script>

	<script>
		$("input:radio[name=parent]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "y") {
				$("#prnt").prop("disabled", false);
			} else {
				$("#prnt").prop("disabled", true);
			}
		});

		$(function() {
			$("#datepicker").datepicker();
		});
		function addDept() {
			$("#createDept").modal('show');
		}
		function createSubDept(id) {
			$("#createSubDept" + id).modal('show');
		}
		function createCategory(id) {
			$("#createCategory" + id).modal('show');
		}
		function createProduct(id) {
			$("#createProduct" + id).modal('show');
		}
		function attr1F() {
			$("#attr2").prop("disabled", false);
			$("#attr1").prop("disabled", true);
		}
		function attr2F() {
			$("#attr3").prop("disabled", false);
			$("#attr2").prop("disabled", true);
		}
		function attr3F() {
			$("#attr4").prop("disabled", false);
			$("#attr3").prop("disabled", true);
		}
		function attr4F() {
			$("#attr5").prop("disabled", false);
			$("#attr4").prop("disabled", true);
		}
		function attr5F() {
			$("#attr6").prop("disabled", false);
			$("#attr5").prop("disabled", true);
		}
		function attr6F() {
			$("#attr6").prop("disabled", true);
		}
	</script>

	<script>
		$(document).ready(function() {
			$("#isSalable").val('no');
			$("#isBarPrint").val('no');
			$("#isSerial").val('no');
			$("#isLot").val('yes');
			$("#isAgent").val('no');
			$("#aNameDiv").hide();
			$("#aDetailDiv").hide();
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		function getProductDetailsByProductCode(id1) {
			if (id1 != 0) {
				$.ajax({
					url : 'getProductDetailById',
					type : 'post',
					dataType : "json",
					data : {
						id : id1
					},
					success : function(data) {
						$("#dept").val(data.Department);
						$("#pCode").val(data.code);
						if (data.isSaleble == 'true') {
							$("#wsp").attr("readonly", false);
							$("#mrp").attr("readonly", false);
							$("#isSalable").val('yes');
							$('#sale').prop("checked", "checked");
						} else {
							$("#wsp").attr("readonly", true);
							$("#mrp").attr("readonly", true);
							$("#isSalable").val('no');
							$('#sale').removeProp("checked");
						}
						$("#subDept").val(data.subDepartment);
						$("#cat").val(data.category);
						$("#pDesc").val(data.description);
						$("#uom").val(data.qtyUnit);
						if ((data.attrNmae1) != 'null') {
							$("#attr1Name").html(data.attrNmae1 + ":");
							$("#attr1").prop("readonly", false);
						} else {
							$("#attr1Name").html("Attribute1:");
							$("#attr1").prop("readonly", true);
						}
						if ((data.attrNmae2) != 'null') {
							$("#attr2Name").html(data.attrNmae2 + ":");
							$("#attr2").prop("readonly", false);
						} else {
							$("#attr2Name").html("Attribute2:");
							$("#attr2").prop("readonly", true);
						}
						if ((data.attrNmae3) != 'null') {
							$("#attr3Name").html(data.attrNmae3 + ":");
							$("#attr3").prop("readonly", false);
						} else {
							$("#attr3Name").html("Attribute3:");
							$("#attr3").prop("readonly", true);
						}
						if ((data.attrNmae4) != 'null') {
							$("#attr4Name").html(data.attrNmae4 + ":");
							$("#attr4").prop("readonly", false);
						} else {
							$("#attr4Name").html("Attribute4:");
							$("#attr4").prop("readonly", true);
						}
						if ((data.attrNmae5) != 'null') {
							$("#attr5Name").html(data.attrNmae5 + ":");
							$("#attr5").prop("readonly", false);
						} else {
							$("#attr5Name").html("Attribute5:");
							$("#attr5").prop("readonly", true);
						}
						if ((data.attrNmae6) != 'null') {
							$("#attr6Name").html(data.attrNmae6 + ":");
							$("#attr6").prop("readonly", false);
						} else {
							$("#attr6Name").html("Attribute6:");
							$("#attr6").prop("readonly", true);
						}
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
						$("#wsp").val("");
						$("#mrp").val("");
						$("#subDept").val("");
						$("#dept").val("");
						$("#cat").val("");
						$("#pDesc").val("");
						$("#uom").val("");
						$("#pCode").val("");
						$("#attr1Name").html("Attribute1:");
						$("#attr2Name").html("Attribute2:");
						$("#attr3Name").html("Attribute3:");
						$("#attr4Name").html("Attribute4:");
						$("#attr5Name").html("Attribute5:");
						$("#attr6Name").html("Attribute6:");
						$("#attr1").prop("readonly", true);
						$("#attr2").prop("readonly", true);
						$("#attr3").prop("readonly", true);
						$("#attr4").prop("readonly", true);
						$("#attr5").prop("readonly", true);
						$("#attr6").prop("readonly", true);
						$("#wsp").prop("readonly", true);
						$("#mrp").prop("readonly", true);
						$("#productCode").val(0);
					}
				});
				$("#wsp").val("");
				$("#mrp").val("");
				$("#rate").val("");
				$("#attr1").val("");
				$("#attr2").val("");
				$("#attr3").val("");
				$("#attr4").val("");
				$("#attr5").val("");
				$("#attr6").val("");
				$("#lotText").val("");
			} else {
				alert("please select one Product Code:");
				$("#wsp").val("");
				$("#mrp").val("");
				$("#rate").val("");
				$("#attr1").val("");
				$("#attr2").val("");
				$("#attr3").val("");
				$("#attr4").val("");
				$("#attr5").val("");
				$("#attr6").val("");
				$("#lotText").val("");
				$("#subDept").val("");
				$("#dept").val("");
				$("#cat").val("");
				$("#pDesc").val("");
				$("#uom").val("");
				$("#pCode").val("");
				$("#attr1Name").html("Attribute1:");
				$("#attr2Name").html("Attribute2:");
				$("#attr3Name").html("Attribute3:");
				$("#attr4Name").html("Attribute4:");
				$("#attr5Name").html("Attribute5:");
				$("#attr6Name").html("Attribute6:");
				$("#attr1").prop("readonly", true);
				$("#attr2").prop("readonly", true);
				$("#attr3").prop("readonly", true);
				$("#attr4").prop("readonly", true);
				$("#attr5").prop("readonly", true);
				$("#attr6").prop("readonly", true);
				$("#wsp").prop("readonly", true);
				$("#mrp").prop("readonly", true);
			}
			/* $.ajax({
				url : 'getCategoryById',
				type : 'post',
				dataType : "json",
				data : {
					id : $("#catId").val()
				},
				success : function(data) {
					if ((data.attrNmae1) != null) {
						$("#attr1Name").html(data.attrNmae1);
					}
					//$("#attr2Name").html(data.attrNmae2);
					//$("#attr3Name").html(data.attrNmae3);
					//$("#attr4Name").html(data.attrNmae4);
					//$("#attr5Name").html(data.attrNmae5);
					//$("#attr6Name").html(data.attrNmae6);
				},
				error : function(a, b, c) {
					alert(b + ": " + c);
				}
			}); */
		}
		function getAgentDetail() {
			if ($("#agentName").val() != 0) {
				$.ajax({
					url : 'getAgentDetails',
					type : 'post',
					dataType : "json",
					data : {
						id : $("#agentName").val()
					},
					success : function(data) {
						$("#agentDet").val(
								"Address :\n\t" + data.address + "\nPh1 : "
										+ data.ph1 + "\nPh2 : " + data.ph2);
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
						$("#agentName").val(0);
						$("#agentDet").val("");
					}
				});
			} else {
				alert("please select purchase agent");
				$("#agentName").val(0);
				$("#agentDet").val("");
			}
		}
		function salable() {

			if ($('#sale').is(":checked")) {
				$("#isSalable").val('yes');
				$("#wsp").attr("readonly", false);
				$("#mrp").attr("readonly", false);
			} else {
				$("#isSalable").val('no');
				$("#wsp").attr("readonly", true);
				$("#mrp").attr("readonly", true);
			}
		}

		function rateF() {
			if ($("#isSalable").val() == 'yes') {
				if ($("#wsp").val() != ""
						&& Number($("#rate").val()) > Number($("#wsp").val())) {
					alert("Rate should be less than or equals to WSP.");
					$("#rate").val("");
				} else if ($("#mrp").val() != ""
						&& Number($("#rate").val()) > Number($("#mrp").val())) {
					alert("Rate should be less than or equals to MRP.");
					$("#rate").val("");
				}
			}
		}

		function wspF() {
			if ($("#isSalable").val() == 'yes') {
				if ($("#rate").val() == "") {
					alert("Please insert Rate first...");
					$("#wsp").val("");
				} else if (Number($("#rate").val()) > Number($("#wsp").val())) {
					alert("WSP should be greater than or equals to Rate.");
					$("#wsp").val("");
				} else if ($("#mrp").val() != ""
						&& Number($("#wsp").val()) > Number($("#mrp").val())) {
					alert("WSP should be less than or equals to MRP.");
					$("#wsp").val("");
				}
			}
		}

		function mrpF() {
			if ($("#isSalable").val() == 'yes') {
				if ($("#rate").val() == "") {
					alert("Please insert Rate first...");
					$("#mrp").val("");
				} else if ($("#wsp").val() == "") {
					alert("Please insert WSP first...");
					$("#mrp").val("");
				} else if (Number($("#rate").val()) > Number($("#mrp").val())) {
					alert("MRP should be greater than or equals to Rate.");
					$("#mrp").val("");
				} else if (Number($("#wsp").val()) > Number($("#mrp").val())) {
					alert("MRP should be greater than or equals to WSP.");
					$("#mrp").val("");
				}
			}
		}

		function isAgentF() {
			if ($('#agent').is(":checked")) {
				$("#isAgent").val('yes');
				$("#aNameDiv").show();
				$("#aDetailDiv").show();
			} else {
				$("#isAgent").val('no');
				$("#aNameDiv").hide();
				$("#aDetailDiv").hide();
				$("#agentName").val(0);
				$("#agentDet").val("");
			}
		}
		$("input:radio[name=bar]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesBar") {
				$("#isBarPrint").val('yes');
			} else {
				$("#isBarPrint").val('no');
			}
		});
		/* $("input:radio[name=lot]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesLot") {
				$("#lotText").prop("disabled", false);
				$("#isLot").val('yes');
			} else {
				$("#lotText").prop("disabled", true);
				$("#isLot").val('no');
			}
		}); */
		$("input:radio[name=serial]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesSerial") {
				$("#serialText").prop("disabled", false);
				$("#isSerial").val('yes');
			} else {
				$("#serialText").prop("disabled", true);
				$("#isSerial").val('no');
			}
		});
		/* function first() {
			if ($('#a').is(":checked")) {
				alert("hi");
			}
		} */

		$("#close").click(function() {
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		/* $("#close1").click(function() {
			$("#another").modal("hide");
		}); */
		function close1() {
			$("#another").modal("hide");
		}
		function manage() {
			$("#header").hide();
		}
		$("#yesP").click(function() {
			$("#another").modal("hide");
		});
		$("#noP").click(function() {
			$("#another").modal("hide");
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		ind = 0;
		function removeProduct(a) {
			n1 = $("#trRemove" + a + " :nth-child(7)").html();
			n2 = $("#subTotal").val();
			$("#subTotal").val(
					Math.round((Number(n2) - Number(n1)) * 100) / 100);

			/* var sum = 0;
			$(".trRemove:nth-child(7)").each(function() {
				sum += parseFloat(this.value);
			});
			$("#subTotal").val(sum.toFixed(2)); */

			$("#trRemove" + a).remove();
			$("#trRemoveH" + a).remove();
			$("#taxAmount")
					.val(
							Math
									.round((Number($("#subTotal").val())
											* Number($("#taxTot").val()) / Number(100)) * 100) / 100);

			/* $("#gt").val(
					Math.round((Number($("#subTotal").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transportCost").val()) + Number($(
							"#surcharge").val())) * 100) / 100); */
			$("#totalvalue").val(
					Math.round((Number($("#subTotal").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transportCost").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			$("#gt").val(Math.round((round) * 100) / 100);

		}
		var i = 1;
		function anotherShow() {
			if ($("#productCode").val() == 0) {
				alert("please select Product Code:");
			} else if ($("#qty").val() == "") {
				alert("please insert quantity");
			} else if ($("#rate").val() == "") {
				alert("please insert Rate");
			} else if ($("#lotText").val() == "") {
				alert("please insert Lot no.");
			} else if ($("#isSalable").val() == 'yes' && $("#wsp").val() == "") {
				alert("please insert WSP");
			} else if ($("#isSalable").val() == 'yes' && $("#mrp").val() == "") {
				alert("please insert MRP");
			} else if (!$('#attr1').attr("readonly") && $("#attr1").val() == "") {
				alert("Please insert " + $("#attr1Name").html() + " value");
			} else if (!$('#attr2').attr("readonly") && $("#attr2").val() == "") {
				alert("Please insert " + $("#attr2Name").html() + " value");
			} else if (!$('#attr3').attr("readonly") && $("#attr3").val() == "") {
				alert("Please insert " + $("#attr3Name").html() + " value");
			} else if (!$('#attr4').attr("readonly") && $("#attr4").val() == "") {
				alert("Please insert " + $("#attr4Name").html() + " value");
			} else if (!$('#attr5').attr("readonly") && $("#attr5").val() == "") {
				alert("Please insert " + $("#attr5Name").html() + " value");
			} else if (!$('#attr6').attr("readonly") && $("#attr6").val() == "") {
				alert("Please insert " + $("#attr6Name").html() + " value");
			} else {
				$("#another").modal("show");
				//$("#amount").val(Number($("#qty").val()) * Number($("#rate").val()));
				$("#purProTable")
						.append(
								'<tbody><tr class="trRemove" id="trRemove'+ind+'"><td>'
										+ i
										+ '</td><td>'
										+ $("#pCode").val()
										+ '</td><td>'
										+ $("#pDesc").val()
										+ '</td><td>'
										+ $("#qty").val()
										+ '</td><td>'
										+ $("#uom").val()
										+ '</td><td>'
										+ $("#rate").val()
										+ '</td><td>'
										+ Number($("#qty").val())
										* Number($("#rate").val())
										+ '</td><td>'
										+ '<a href="#" onclick="removeProduct('
										+ ind
										+ ');"><img src="img/cross.png" height="16px" width="16px"></a>'
										+ '</td></tr></tbody>');
				$("#subTotal").val(
						Math.round((Number($("#subTotal").val()) + Number($(
								"#qty").val())
								* Number($("#rate").val())) * 100) / 100);
				$("#taxAmount")
						.val(
								Math
										.round((Number($("#subTotal").val())
												* Number($("#taxTot").val()) / Number(100)) * 100) / 100);
				/* $("#gt").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
				//$("#qty").val("");
				i++;

				$("#hiddenTable")
						.append(
								'<tbody><tr id="trRemoveH'+ind+'">'
										+ '<td><input type="text" name="pCodeIdH" value=\''
										+ $("#productCode").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr1H" value=\''
										+ $("#attr1").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr2H" value=\''
										+ $("#attr2").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr3H" value=\''
										+ $("#attr3").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr4H" value=\''
										+ $("#attr4").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr5H" value=\''
										+ $("#attr5").val()
										+ '\'></td>'
										+ '<td><input type="text" name="attr6H" value=\''
										+ $("#attr6").val()
										+ '\'></td>'
										+ '<td><input type="text" name="qtyH" value=\''
										+ $("#qty").val()
										+ '\'></td>'
										+ '<td><input type="text" name="uomH" value=\''
										+ $("#uom").val()
										+ '\'></td>'
										+ '<td><input type="text" name="rateH" value=\''
										+ $("#rate").val()
										+ '\'></td>'
										+ '<td><input type="text" name="wspH" value=\''
										+ $("#wsp").val()
										+ '\'></td>'
										+ '<td><input type="text" name="mrpH" value=\''
										+ $("#mrp").val()
										+ '\'></td>'
										+ '<td><input type="text" name="lotH" value=\''
										+ $("#lotText").val()
										+ '\'></td>'
										+ '<td><input type="text" name="serialH" value=\''
										+ $("#serialText").val()
										+ '\'></td>'
										+ '</tr></tbody>');
				ind++;

				$("#dept").val("");
				$("#subDept").val("");
				$("#cat").val("");
				$("#pCode").val("");
				$("#pDesc").val("");
				$("#attr1").val("");
				$("#attr2").val("");
				$("#attr3").val("");
				$("#attr4").val("");
				$("#attr5").val("");
				$("#attr6").val("");
				$("#qty").val("");
				$("#uom").val("");
				$("#rate").val("");
				$("#wsp").val("");
				$("#mrp").val("");
				$("#lotText").val("");
				$("#serialText").val("");
				$("#productCode").val("0");
				$("#attr1Name").html("Attribute1:");
				$("#attr2Name").html("Attribute2:");
				$("#attr3Name").html("Attribute3:");
				$("#attr4Name").html("Attribute4:");
				$("#attr5Name").html("Attribute5:");
				$("#attr6Name").html("Attribute6:");
				$("#attr1").prop("readonly", true);
				$("#attr2").prop("readonly", true);
				$("#attr3").prop("readonly", true);
				$("#attr4").prop("readonly", true);
				$("#attr5").prop("readonly", true);
				$("#attr6").prop("readonly", true);
			}
		}
		function closeProduct() {
			$("#dept").val("");
			$("#subDept").val("");
			$("#cat").val("");
			$("#pCode").val("");
			$("#pDesc").val("");
			$("#attr1").val("");
			$("#attr2").val("");
			$("#attr3").val("");
			$("#attr4").val("");
			$("#attr5").val("");
			$("#attr6").val("");
			$("#qty").val("");
			$("#uom").val("");
			$("#rate").val("");
			$("#wsp").val("");
			$("#mrp").val("");
			$("#lotText").val("");
			$("#serialText").val("");
			$("#productCode").val("0");
			$("#attr1Name").html("Attribute1:");
			$("#attr2Name").html("Attribute2:");
			$("#attr3Name").html("Attribute3:");
			$("#attr4Name").html("Attribute4:");
			$("#attr5Name").html("Attribute5:");
			$("#attr6Name").html("Attribute6:");
			$("#attr1").prop("readonly", true);
			$("#attr2").prop("readonly", true);
			$("#attr3").prop("readonly", true);
			$("#attr4").prop("readonly", true);
			$("#attr5").prop("readonly", true);
			$("#attr6").prop("readonly", true);
		}

		function getVendorNameByType() {
			$("#vName").val("");
			$("#vDetail").val("");
			$("#idvendorType").val($("#vendorType").val());
			if ($("#vendorType").val() == 0) {
				$("#agent").prop("disabled", "disabled");
				$("#agent").prop("checked", false);
				$("#isAgent").val('no');
				$("#aNameDiv").hide();
				$("#aDetailDiv").hide();
				$("#agentName").val(0);
				$("#agentDet").val("");
			}

			$.ajax({
				url : "getVendorTypeById",
				data : {
					id : $('[name="vendorType"]').val()
				},
				dataType : "json",
				success : function(data) {
					if ($("#vendorType").val() != 0) {
						if (data.type == 'Vendor') {
							$("#agent").removeProp("disabled");
						} else {
							$("#agent").prop("disabled", "disabled");
							$("#agent").prop("checked", false);
							$("#isAgent").val('no');
							$("#aNameDiv").hide();
							$("#aDetailDiv").hide();
							$("#agentName").val(0);
							$("#agentDet").val("");
						}
					}
				},
				error : function(a, b, c) {
					alert(c);
				}
			});
		}

		function emptyVender() {
			if ($("#vName").val() == "") {
				$("#vName").val("");
				$("#vDetail").val("");
				$("#taxGroup").val(0).prop("selected", true);
				$("#taxTot").val('0');
				$("#taxAmount").val('0');
				/* $("#gt").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */

				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
			}
		}

		$(function() {
			$("#vName")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												url : "getVendorByVendorType",
												dataType : "json",
												data : {
													id : $(
															'[name="vendorType"]')
															.val(),
													term : req.term
												},
												success : function(data) {
													resp($
															.map(
																	data,
																	function(
																			item) {
																		return ({
																			value : item.name,
																			addr : item.address,
																			id : item.id,
																			ph1 : item.ph1,
																			ph2 : item.ph2,
																			currentCreditNote : item.currentCreditNote
																		});
																	}));
												}
											});
								},
								change : function(event, ui) {

									if (ui.item == null) {
										$("#vName").val("");
										$("#vDetail").val("");
										$("#taxGroup").val(0).prop("selected",
												true);
										$("#taxTot").val('0');
										$("#taxAmount").val('0');
										$("#totalCredit").val('0');
										/* $("#gt")
												.val(
														Math
																.round((Number($(
																		"#subTotal")
																		.val())
																		+ Number($(
																				"#taxAmount")
																				.val())
																		+ Number($(
																				"#transportCost")
																				.val()) + Number($(
																		"#surcharge")
																		.val())) * 100) / 100); */
										$("#totalvalue")
												.val(
														Math
																.round((Number($(
																		"#subTotal")
																		.val())
																		+ Number($(
																				"#taxAmount")
																				.val())
																		+ Number($(
																				"#transportCost")
																				.val()) + Number($(
																		"#surcharge")
																		.val())) * 100) / 100);
										var tot = $("#totalvalue").val();
										var round = Math.round(tot);
										$("#roundvalue")
												.val(
														Math
																.round((round - tot) * 100) / 100);
										$("#gt")
												.val(
														Math
																.round((round) * 100) / 100);
									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val(
												"Address : \n\t" + ui.item.addr
														+ "\nPhone1 : "
														+ ui.item.ph1
														+ "\nPhone2 : "
														+ ui.item.ph2);
										$("#totalCredit").val(
												ui.item.currentCreditNote);
									}

								},
								select : function(event, ui) {

									if (ui.item == null) {
										$("#vName").val("");

									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val(
												"Address : \n\t" + ui.item.addr
														+ "\nPhone1 : "
														+ ui.item.ph1
														+ "\nPhone2 : "
														+ ui.item.ph2);

										/* $
												.ajax({
													type : "post",
													url : "getAccountDetails",
													data : {
														id : ui.item.id
													},
													dataType : "json",
													success : function(data5) {
														$("#taxGroup")
																.val(
																		data5.tax_Type_Group)
																.prop(
																		"selected",
																		true);
														$("#taxTot").val(
																data5.taxTotal);
														$("#taxAmount")
																.val(
																		Number($(
																				"#subTotal")
																				.val())
										 * Number($(
																						"#taxTot")
																						.val())
																				/ Number(100));
														$("#gt")
																.val(
																		Math
																				.round((Number($(
																						"#subTotal")
																						.val())
																						+ Number($(
																								"#taxAmount")
																								.val())
																						+ Number($(
																								"#transportCost")
																								.val()) + Number($(
																						"#surcharge")
																						.val())) * 100) / 100);
													},
													error : function(a, b, c) {
														alert(b + " error: "
																+ c);
													}
												}); */
									}
								}
							});
		});
		function selectedTaxGroup() {
			if ($("#taxGroup").val() != 0) {
				$
						.ajax({
							url : "getTaxGroupById",
							data : {
								id : $("#taxGroup").val()
							},
							dataType : "json",
							success : function(data) {
								$("#taxTot").val(data.taxtot);
								$("#taxAmount")
										.val(
												Math
														.round((Number($(
																"#subTotal")
																.val())
																* Number($(
																		"#taxTot")
																		.val()) / Number(100)) * 100) / 100);
								/* $("#gt")
										.val(
												Math
														.round((Number($(
																"#subTotal")
																.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transportCost")
																		.val()) + Number($(
																"#surcharge")
																.val())) * 100) / 100); */
								$("#totalvalue")
										.val(
												Math
														.round((Number($(
																"#subTotal")
																.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transportCost")
																		.val()) + Number($(
																"#surcharge")
																.val())) * 100) / 100);
								var tot = $("#totalvalue").val();
								var round = Math.round(tot);
								$("#roundvalue").val(
										Math.round((round - tot) * 100) / 100);
								$("#gt").val(Math.round((round) * 100) / 100);
							},
							error : function(a, b, c) {
								alert(c);
							}
						});
			} else {
				$("#taxTot").val('0');
				$("#taxAmount").val('0');
				/* $("#gt").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
			}

		}
		function gtot() {
			if (($("#transportCost").val() != "")
					|| ($("#surcharge").val() != "")) {
				/* $("#gt").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
			} else {
				/* $("#gt").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
			}
		}
		function submit() {
			document.getElementById("purchaseForm").submit();
		}
		function emptyForm() {
			if ($("#pCode").val() == "") {
				getProductDetailsByProductCode(0);
			}
		}
		$(function() {
			$("#pCode").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getProductbyProductCode",
						data : {
							code : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.code,
									id : item.id
								});
							}));
						},

						error : function(a, b, c) {
							alert(a + b + c);
						}

					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#productCode").val("");
						getProductDetailsByProductCode(0);
					} else {
						$("#productCode").val(ui.item.id);
						getProductDetailsByProductCode(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item != null) {
						$("#productCode").val(ui.item.id);
						getProductDetailsByProductCode(ui.item.id);
					} else {
						$(this).val("");
						$("#productCode").val("");
						getProductDetailsByProductCode(0);
					}

				}
			});
		});
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'purchasingPurchaseEntry.jsp'
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});
	</script>

	<script>
		$(function() {

			$("#rate").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		$(function() {

			$("#qty").numericInput({

				allowFloat : false, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		$(function() {

			$("#wsp").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		$(function() {

			$("#mrp").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>
	<script>
		function addVendor() {

			$("#addV").modal("show");
			$("#header").show();

		}

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
	</script>

	<script>
		function addAgentDetails() {

			$("#addA").modal("show");
			$("#header").show();
		}

		function bankButtonPrev2() {
			$("#bAcc2").removeAttr("class");
			$("#bankAccount2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
		}

		function vendorButtonPrev2() {
			$("#vAcc2").removeAttr("class");
			$("#vendorAccount2").attr("class", "tab-pane fade");
			$("#addr2").attr("class", "active");
			$("#address2").attr("class", "tab-pane fade active in");
		}

		function vendorButtonNext2() {
			$("#vAcc2").removeAttr("class");
			$("#vendorAccount2").attr("class", "tab-pane fade");
			$("#bAcc2").attr("class", "active");
			$("#bankAccount2").attr("class", "tab-pane fade active in");
		}

		function detailButtonPrev2() {
			$("#detl2").removeAttr("class");
			$("#detail2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
		}

		function detailButtonNext2() {
			$("#detl2").removeAttr("class");
			$("#detail2").attr("class", "tab-pane fade");
			$("#addr2").attr("class", "active");
			$("#address2").attr("class", "tab-pane fade active in");
		}

		function addressButtonPrev2() {
			$("#addr2").removeAttr("class");
			$("#address2").attr("class", "tab-pane fade");
			$("#detl2").attr("class", "active");
			$("#detail2").attr("class", "tab-pane fade active in");
		}

		function addressButtonNext2() {
			$("#addr2").removeAttr("class");
			$("#address2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
		}
	</script>

	<script type="text/javascript">
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

	<script type="text/javascript">
		$(function() {
			$("#bankCity6").autocomplete({
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
						$("#bankCityId26").val("");
					} else {
						$("#bankCityId26").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					$("#bankCityId26").val(ui.item.id);
				}
			});
		});
		$(function() {
			$("#vendorCity2").autocomplete({
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
						$("#vendorCityId2").val("");
					} else {
						$("#vendorCityId2").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					$("#vendorCityId2").val(ui.item.id);
				}
			});
		});
	</script>

	<script type="text/javascript">
		function submitform1() {
			var vID;
			var vvName;
			var vvphone1;
			var vvphone2;
			var vvadres;

			if ($("#idName").val() == 0) {
				alert("please select  name");
			} else if ($("#idvendorCompanyName").val() == "") {
				alert("please select Company Name");
			} else if ($("#iphone").val() == "") {
				alert("please select Ph No1");
			} else if ($("#idvendorMail").val() == "") {
				alert("please select email");
			} else if ($("#idvendorAlias").val() == "") {
				alert("please select Alias name");
			} else if ($("#cityname").val() == "") {
				alert("please select cityname");
			} else if ($("#idAdd").val() == "") {
				alert("please select Adress");
			} else if ($("#vendorCity").val() == "") {
				alert("please select vendor city");
			} else if ($("#idvendorPin").val() == "") {
				alert("please select pin code");
			} else {

				var dataa1 = {
					vendorName : $("#idName").val(),
					vendorAddress : $("#idAdd").val(),
					vendorAlias : $("#idvendorAlias").val(),
					vendorCityId : $("#vendorCityId").val(),
					vendorCompanyName : $("#idvendorCompanyName").val(),
					vendorMail : $("#idvendorMail").val(),
					vendorPh1 : $("#iphone").val(),
					vendorPh2 : $("#idvendorPh2").val(),
					vendorPin : $("#idvendorPin").val(),
					vendorType : $("#idvendorType").val(),
					bankAccNo : $("#idbankAccNo").val(),
					bankName : $("#idbankName").val(),
					bankCheckLebel : $("#idbankCheckLebel").val(),
					bankIFSC : $("#idbankIFSC").val(),
					bankMICR : $("#idbankMICR").val(),
					bankRTGS : $("#idbankRTGS").val(),
					bankBranch : $("#idbankBranch").val(),
					taxTypeGroupId : $("#taxgroupV").val(),
					bankCity : $("#bankCityId").val(),
					vendorCSTno : $("#idvendorCSTno").val(),
					vendorCSTregDate : $("#datepickerB").val(),
					vendorExciseRegNo : $("#idvendorExciseRegNo").val(),
					vendorExciseRegDate : $("#datepickerC").val(),
					vendorVATno : $("#idvendorVATno").val(),
					vendorVATregDate : $("#datepickerA").val(),
					vendorServiceTaxRegNo : $("#idvendorServiceTaxRegNo").val(),
					vendorServiceTaxRegDate : $("#datepickerD").val(),
					vendorPANno : $("#idvendorPANno").val()
				};
				$.ajax({
					url : "addVendorbyjson",
					dataType : "json",
					data : dataa1,
					type : "post",
					success : function(data1) {
						alert(data1.result);

						vID = data1.vid;
						vvName = data1.vname;
						vvphone1 = data1.vph1;
						vvphone2 = data1.vph2;
						vvadres = data1.vvadd;

					},

					complete : function() {

						$("#vName").val(vvName);
						$("#vId").val(vID);
						$("#vDetail").val(
								"\nAddress :" + vvadres + "\nPhone1 : "
										+ vvphone1 + "\nPhone2 : " + vvphone2);
						$("#addV").modal('hide');
					}

				});
			}
		}
	</script>

	<script type="text/javascript">
		var agentId;
		function submitform2() {
			if ($("#idName2").val() == 0) {
				alert("please select  name");
			} else if ($("#idvendorCompanyName2").val() == "") {
				alert("please select Company Name");
			} else if ($("#iphone2").val() == "") {
				alert("please select Ph No1");
			} else if ($("#idvendorMail2").val() == "") {
				alert("please select email");
			} else if ($("#idvendorAlias2").val() == "") {
				alert("please select Alias name");
			} else if ($("#cityname2").val() == "") {
				alert("please select cityname");
			} else if ($("#idAdd2").val() == "") {
				alert("please select Adress");
			} else if ($("#vendorCity2").val() == "") {
				alert("please select vendor city");
			} else if ($("#idvendorPin2").val() == "") {
				alert("please select pin code");
			} else if ($("#service2").val() == "") {
				alert("please select Service Tax");
			} else {
				var dataa2 = {
					vendorName2 : $("#idName2").val(),
					vendorAddress2 : $("#idAdd2").val(),
					vendorAlias2 : $("#idvendorAlias2").val(),
					vendorCityId2 : $("#vendorCityId2").val(),
					vendorCompanyName2 : $("#idvendorCompanyName2").val(),
					vendorMail2 : $("#idvendorMail2").val(),
					vendorPh12 : $("#iphone2").val(),
					vendorPh22 : $("#idvendorPh22").val(),
					vendorPin2 : $("#idvendorPin2").val(),
					vendorType2 : $("#idvendorType2").val(),
					bankAccNo2 : $("#idbankAccNo2").val(),
					bankName2 : $("#idbankName2").val(),
					bankCheckLebel2 : $("#idbankCheckLebel2").val(),
					bankIFSC2 : $("#idbankIFSC2").val(),
					bankMICR2 : $("#idbankMICR2").val(),
					bankRTGS2 : $("#idbankRTGS2").val(),
					bankBranch2 : $("#idbankBranch2").val(),
					taxTypeGroupId2 : $("#taxgroup2").val(),
					bankCity6 : $("#bankCityId26").val(),
					vendorCSTno2 : $("#idvendorCSTno2").val(),
					vendorCSTregDate2 : $("#datepickerB2").val(),
					vendorExciseRegNo2 : $("#idvendorExciseRegNo2").val(),
					vendorExciseRegDate2 : $("#datepickerC2").val(),
					vendorVATno2 : $("#idvendorVATno2").val(),
					vendorVATregDate2 : $("#datepickerA2").val(),
					vendorServiceTaxRegNo2 : $("#idvendorServiceTaxRegNo2")
							.val(),
					vendorServiceTaxRegDate2 : $("#datepickerD2").val(),
					vendorPANno2 : $("#idvendorPANno2").val()
				};
				$
						.ajax({
							url : "addAgen",
							dataType : "json",
							data : dataa2,
							type : "post",
							success : function(data2) {

								agentId = data2.vendorid;
								alert(data2.result);
								$("#addA").modal('hide');
							},
							complete : function() {
								$
										.ajax({
											url : "getVendorByType",
											data : {
												id : $("#idvendorType2").val()
											},
											dataType : "json",
											success : function(data) {

												$("#agentName").empty();
												$("#agentName")
														.append(
																'<option value="0">Select Agent name</option>');
												$
														.map(
																data,
																function(item) {
																	$(
																			"#agentName")
																			.append(
																					'<option value="'+item.id+'">'
																							+ item.name
																							+ '</option>');
																});
											},
											complete : function() {
												$("#agentName").val(agentId);

											}///show for current update

										});
							}

						});
			}
		}
	</script>


	<script>
		$(function() {
			$("#datepickerA").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});

		$(function() {
			$("#datepickerB").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
		$(function() {
			$("#datepickerC").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
		$(function() {
			$("#datepickerD").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});

		$(function() {

			$("#iphone").numericInput({

				allowFloat : false,

				allowNegative : false,

			});

		});

		$(function() {

			$("#idvendorPh2").numericInput({

				allowFloat : false,

				allowNegative : false,

			});

		});
	</script>


	<script>
		$(function() {
			$("#datepickerA2").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});

		$(function() {
			$("#datepickerB2").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
		$(function() {
			$("#datepickerC2").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
		$(function() {
			$("#datepickerD2").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});

		$(function() {

			$("#iphone2").numericInput({

				allowFloat : false,

				allowNegative : false,

			});

		});

		$(function() {

			$("#idvendorPh22").numericInput({

				allowFloat : false,

				allowNegative : false,

			});

		});
		$(function() {

			$("#transportCost").numericInput({

				allowFloat : true,

				allowNegative : false,

			});
			$("#surcharge").numericInput({

				allowFloat : true,

				allowNegative : false,

			});
			$("#spPaymentAmount").numericInput({

				allowFloat : true,

				allowNegative : false,

			});
		});
	</script>

	<script>
		function addCitySC() {
			$("#addCitySC").modal("show");
		}

		function submitformcountry() {

			var datom = {
				name : $("#creConName").val()
			}

			$.ajax({
				url : "addJsonCountry",
				dataType : "json",
				data : datom,
				type : "post",
				success : function(dat) {
					alert(dat.result);
					$("#createCountry").hide();
				}
			});
		}

		function methodState() {
			var countryVar;
			var delta = {
				nameqaz : $("#stateName").val(),
				id : $("#countryId").val()
			}

			$.ajax({
				url : "addJsonState",
				dataType : "json",
				data : delta,
				type : "post",
				success : function(dat) {
					alert(dat.result);
					$("#createState").hide();
				}
			});
		}
		function methodCityA() {
			var cityid69;
			var cityname69;
			var countryVar;
			var deltab = {
				namezxc : $("#cityName").val(),
				id : $("#stateId").val(),
				country1 : $("#country1").val(),
				name : $("#state").val()
			}

			$.ajax({
				url : "addJsonCity",
				dataType : "json",
				data : deltab,
				type : "post",
				success : function(datt) {
					alert(datt.result);
					cityid69 = datt.cityAid;
					cityname69 = datt.cityAname;

					$("#createCity").modal('hide');
					$("#addCitySC").modal('hide');
				},

				complete : function() {

					$("#vendorCity").val(cityname69);
					$("#vendorCityId").val(cityid69);
				}
			});

		}
	</script>
	<script>
		$(document).ready(function() {

			$("#createCountry").hide();
			$("#createState").hide();
			$("#createCity").hide();
		});

		function crecontxt() {
			if ($('#creConName').val() != "") {
				$('#creConbtn').prop("disabled", false);
			} else {
				$('#creConbtn').prop("disabled", true);
			}
		}
		function stateNameKeyUp() {
			if ($('#stateName').val() != "") {
				$('#stateNameBtn').prop("disabled", false);
			} else {
				$('#stateNameBtn').prop("disabled", true);
			}
		}
		$(function() {
			$("#country").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "getcountry",
						dataType : "json",
						data : {
							term : request.term
						},
						success : function(data) {
							response($.map(data, function(item) {
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
						$('#countryForStatebtn').prop("disabled", true);
					} else {
						$("#countryId").val(ui.item.id);
						$('#countryForStatebtn').prop("disabled", false);
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$('#countryForStatebtn').prop("disabled", true);
					} else {
						$("#countryId").val(ui.item.id);
						$('#countryForStatebtn').prop("disabled", false);
					}
				}
			});
		});
		function cityPopup() {
			$("#createCity").show();
		}
		function statePopup() {
			$("#createState").show();
		}
		function countryPopup() {
			$("#createCountry").show();

		}
		function closed() {
			$("#createCountry").hide();
			$("#createState").hide();
			$("#createCity").hide();
		}

		function stateDispByCountry() {
			var a = $('[name="countryid"]').val();
			if (a != 0) {
				$.ajax({
					url : "getStateByCountry",
					dataType : "json",
					data : {
						"id" : a
					},
					success : function(data) {
						$("#states ul").empty();
						$.each(data, function(index, value) {
							$("#states ul").append(
									'<li>' + value.stateName + '</li>');
						});
					}
				});
			} else {
				$("#states ul").empty();
				alert("select a country.");
			}
		}

		function getStateList() {
			var a = $("[name='countryid3']").val();
			if (a != 0) {
				$.ajax({
					url : "getStateByCountry",
					dataType : "json",
					data : {
						"id" : a
					},
					success : function(data) {
						$("#statelist1").empty();
						$("#statelist1").append(
								'<option value="0">select state</option>');
						$.map(data, function(item) {
							$("#statelist1").append(
									'<option value="'+item.id+'">'
											+ item.stateName + '</option>');
						});
					}
				});

			} else {
				$("#statelist1").empty();
			}
		}
		function getCityList() {
			var a = $('[name="sateid"]').val();//state id
			if (a != 0) {
				$.ajax({
					type : "post",
					url : "getCity",
					data : {
						id : a
					},
					dataType : "json",
					success : function(data) {
						$("#cityList ul").empty();
						$.each(data, function(index, val) {
							$("#cityList ul").append(
									'<li>' + val.cityName + '</li>');
						});
					}
				});
			} else {
				alert("please select a state");
			}

		}
		/**********************************for city add pupose******************************/
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
															select : function(
																	event, ui) {
																$("#stateId")
																		.val(
																				ui.item.id);
																if ($(
																		"#cityName")
																		.val() != "") {
																	$(
																			"#cityAddbtn")
																			.prop(
																					"disabled",
																					false);
																}

															},
															change : function(
																	event, ui) {
																if (ui.item == null) {
																	$(this)
																			.val(
																					"");
																	$(
																			"#stateId")
																			.val(
																					"");
																	$(
																			"#cityAddbtn")
																			.prop(
																					"disabled",
																					true);
																} else {
																	$(
																			"#stateId")
																			.val(
																					ui.item.id);
																	if ($(
																			"#cityName")
																			.val() != "") {
																		$(
																				"#cityAddbtn")
																				.prop(
																						"disabled",
																						false);
																	}
																}
															}
														});
									}
								},
								select : function(event, ui) {
									if (ui.item != null) {
										$("#state").prop("disabled", false);
									}
								}
							});
		});
		function cityNameKeyUp() {
			if ($("#cityName").val() != "" && $("#stateId").val() != "") {
				$("#cityAddbtn").prop("disabled", false);
			} else {
				$("#cityAddbtn").prop("disabled", true);
			}
		}

		function closeaddV() {

			$("#addV").hide();

		}
	</script>
	<script>
		
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
