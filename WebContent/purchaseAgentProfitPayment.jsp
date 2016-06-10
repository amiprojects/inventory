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
<link rel="stylesheet" href="css/scrollTable.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
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

			<c:if test="${page.name.equals('PurchaseAgentProfit Payment')}">
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
								<h3 style="margin-top: 11px;">Purchase Agent (via) Profit
									Payment</h3>
							</div>

							<div class="widget-area">
								<form role="form" class="sec"
									action="purchaseSearchAllForViaPurchaseAgent" method="post">
									<div class="row">
										<div class="col-md-12">
											<button class="btn green pull-right" type="submit"
												style="margin-right: 63px;">Show All</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByDateForViaPurchaseAgent" method="post"
									id="purchaseSearchByDateId">
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">Search between
													two dates : (Start Date)<font color="red" size="4">*</font>
												</label> <input type="text" placeholder="Enter First Date"
													id="datepicker" class="form-control" name="fDate" value=""
													autocomplete="off" onchange="dateSet();">
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">(End Date)<font
													color="red" size="4">*</font></label> <input type="text"
													placeholder="Enter last date" id="datepicker1"
													class="form-control" name="lDate" value=""
													autocomplete="off" onchange="checkDate();">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="button" onclick="purchaseSearchByDateSubmit();">Search</button>
										</div>
									</div>
								</form>

								<form role="form" class="sec"
									action="purchaseSearchByPurchaseChallanNoForViaPurchaseAgent"
									method="post">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="" style="float: left;">Purchase challan
													no. :</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-1"
											style="margin-right: 0; padding-right: 0;">
											<input type="text" class="form-control" readonly="readonly"
												name="companyInitial"
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PUR', compInfo.id).companyInitial}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<select class="form-control" name="fynYear">
												<c:forEach
													items="${sessionScope['ejb'].getAllFinancialForPurchase()}"
													var="fyr">
													<option value="${fyr}">${fyr}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<!-- <input type="text" class="form-control" name="month"> -->
											<select name="month" class="form-control">
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</div>
										<div class="col-md-1" style="margin: 0; padding: 0;">
											<input type="text" class="form-control" readonly="readonly"
												name="billType"
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PUR', compInfo.id).billType}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<input type="text" class="form-control" name="autoNum">
										</div>
										<div class="col-md-2" style="margin-left: 0; padding-left: 0;">
											<input type="text" class="form-control" name="suffix">
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" type="submit">Search</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByProductCodeForViaPurchaseAgent"
									method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Product Code:</label> <input
													type="" placeholder="Enter Product Code" id="prodCode"
													name="prodCode" class="form-control" autocomplete="off">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByVendorNameForViaPurchaseAgent"
									method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Vendor Name :</label> <input
													type="" placeholder="Enter Vendor Name" id="vendorName"
													name="vendorName" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>

									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByAgentNameForViaPurchaseAgent"
									id="purchaseSearchByAgentNameForm" method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Agent (Via) Name
													:</label> <input type="text" placeholder="Enter Agent (Via) Name"
													id="VagentName" name="VagentName" class="form-control"><input
													type="hidden" id="VagentId" name="VagentId" value="0"
													class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="button" onclick="purchaseSearchByViaAgentSubmit();">Search</button>
										</div>
									</div>
								</form>
								<br>
								<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
								<br>
								<div style=""></div>
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>Purchase challan no.</th>
											<th>Vendor Name</th>
											<th>Agent Name</th>
											<th>Vendor Bill no.</th>
											<th>Purchase Date</th>
											<th>Profit</th>
											<th>(-)Profit</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['purEntryList']}"
											var="pEntryByD">
											<c:if test="${pEntryByD.vendor.name!='Production Vendor'}">
												<c:if test="${pEntryByD.agentId!=0}">
													<tr>
														<td>${count}</td>
														<td><a href="#"
															onclick="viewInvoice(${pEntryByD.id});"><b>${pEntryByD.challanNumber}</b></a>
														</td>
														<c:if test="${pEntryByD.vendor.vendorType.type=='Vendor'}">
															<td>${pEntryByD.vendor.name}</td>
														</c:if>
														<c:if test="${pEntryByD.vendor.vendorType.type!='Vendor'}">
															<td>NIL</td>
														</c:if>
														<c:choose>
															<c:when
																test="${pEntryByD.vendor.vendorType.type=='Purchase Agent'}">
																<td>${pEntryByD.vendor.name}</td>
															</c:when>
															<c:when test="${pEntryByD.agentId!=0}">
																<td>${sessionScope['ejb'].getVendorById(pEntryByD.agentId).name}</td>
															</c:when>
															<c:otherwise>
																<td>NIL</td>
															</c:otherwise>
														</c:choose>
														<td>${pEntryByD.vendor_bill_no}</td>
														<td><fmt:formatDate
																value="${pEntryByD.purchase_date}" pattern="dd-MM-yy" /></td>
														<td>${pEntryByD.agentProfitTotal}</td>
														<td><c:set var="mProfit" value="${0}" /> <c:forEach
																var="pReturn" items="${pEntryByD.purchaseReturn}">
																<fmt:formatNumber var="mProfit"
																	value="${mProfit+pReturn.retAgentProfitTotal}"
																	maxFractionDigits="2" groupingUsed="false" />
															</c:forEach>${mProfit}</td>
														<td style="display: none;"><c:if
																test="${sessionScope['ejb'].getPaymentDetails4ViaAgentByPurchaseEntryId(pEntryByD.id).size()>0}">
																<c:set
																	value="${sessionScope['ejb'].getPaymentStatusById(sessionScope['ejb'].getPaymentDetails4ViaAgentByPurchaseEntryId(pEntryByD.id).get(0).paymentStatusId).status}"
																	var="Status"></c:set>
															</c:if> <c:if
																test="${sessionScope['ejb'].getPaymentDetails4ViaAgentByPurchaseEntryId(pEntryByD.id).size()==0}">
																<c:set value="Not Paid" var="Status"></c:set>
															</c:if> <span id="status${pEntryByD.id}">${Status}</span></td>
														<td><c:set var="totPaybleCost"
																value="${pEntryByD.agentProfitTotal}" /> <c:forEach
																var="purchaseRet" items="${pEntryByD.purchaseReturn}">
																<c:set var="totPaybleCost"
																	value="${totPaybleCost-purchaseRet.retAgentProfitTotal}" />
															</c:forEach>
															<form action="" method="post"
																id="agentPayment${pEntryByD.id}">
																<a href="#"
																	onclick="agentPaymentOCF('${pEntryByD.id}','${pEntryByD.challanNumber}','${totPaybleCost}','${pEntryByD.agentId}');">
																	<input type="hidden" value="${pEntryByD.challanNumber}"
																	name="pChallan"> <span style="color: #6a94ff;"><u>
																			Payment</u></span>
																</a>
															</form></td>
													</tr>
												</c:if>
												<c:set var="count" value="${count+1}" />
											</c:if>
										</c:forEach>
									</tbody>
								</table>
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
	<div id="agentPayModal" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						Agent Payment details for Sales : <span id="pChallan"></span>
					</h4>
				</div>
				<div class="modal-body">
					<table id="paymentDetailsTable" class="table">
						<thead>
							<tr>
								<th>Payment date</th>
								<th>Payment method</th>
								<th>Payment description</th>
								<th>Paid Amount</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<b style="float: left;"><span>Current Due : </span><span
						id="dueAmount"></span></b> <input type="button" value="Pay"
						id="payButton" onclick="payButtonOCF();"
						class="btn green pull-right" disabled="disabled">
				</div>
			</div>
		</div>
	</div>
	<form role="form" class="sec" method="post" id="paymentForm"
		action="purchaseAgentPayment">
		<div id="paymentModal" class="modal fade" role="dialog"
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
											<li><a title="">Select Payment status : <input
													type="hidden" name="uniqueNo"
													value="${sessionScope['ejb'].getLastUniqueNoOfPayDet4ViaAgent()+1}"></a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-5">
											Payment status :<font color="red" size="4">*</font>
										</div>
										<div class="col-md-7">
											<div class="sec">

												<select class="form-control" id="pstatus" name="pstatus"
													onchange="pStatusDiv()">
													<option value="-" selected="selected">---</option>
													<c:forEach
														items="${sessionScope['ejb'].getAllPaymentStatus()}"
														var="payStatus">
														<%-- <c:if test="${payStatus.status!='Not Paid'}"> --%>
														<option value="${payStatus.status}">${payStatus.status}</option>
														<%-- </c:if> --%>
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
												<div class="col-md-5">
													Payment type :<font color="red" size="4">*</font>
												</div>
												<div class="col-md-7">
													<select class="form-control" id="pType" name="pType"
														onchange="pTypeFunc()">
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
													<input type="text" id="datepicker2" class="form-control"
														readonly="readonly" name="payDate">
												</div>
											</div>
											<div id="pAmount">
												<div class="col-md-5">Full Amount :</div>
												<div class="col-md-7">
													<input type="text" class="form-control" readonly="readonly"
														id="spAmount" name="spAmount">
												</div>
											</div>
											<div id="pPayAmount">
												<div class="col-md-5">
													Payment Amount :<font color="red" size="4">*</font>
												</div>
												<div class="col-md-7">
													<input type="text" class="form-control" value="0"
														id="spPaymentAmount" name="spPaymentAmount"
														onkeyup="spPaymentAmountFunc();" autocomplete="off"
														onchange="spPaymentAmountDecimalFixF();">
												</div>
											</div>
											<div id="pDueAmount">
												<div class="col-md-5">Due Amount :</div>
												<div class="col-md-7">
													<input type="text" class="form-control" readonly="readonly"
														id="spDueAmount" name="spDueAmount">
												</div>
											</div>
											<div id="AMi2">
												<div>
													<div class="col-md-5">Current Credit Note :</div>
													<div class="col-md-7">
														<input type="text" id="totalCredit" name="totalCredit"
															class="form-control" readonly="readonly" value="0">
													</div>
												</div>
												<div>
													<div class="col-md-5">
														<span id="dORc">Final Credit Note :</span>
													</div>
													<div class="col-md-7">
														<input type="text" class="form-control" id="finalDC"
															name="finalDC" readonly="readonly" value="0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6" style="float: right;" id="description">
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
											<textarea rows="" cols="" class="form-control" id="desc"
												name="desc"></textarea>
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
		<input type="hidden" id="aId" name="aId"> <input type="hidden"
			id="peId" name="peId"><input type="hidden"
			id="voucherDetailSize" name="voucherDetailSize">
	</form>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#purch").attr("id", "activeSubMenu");
			$("#sPurchaseAgentProfitPayment").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
	</script>
	<script>
	function dateSet() {
		var dt = $("#datepicker").datepicker('getDate');
		var dt1 = $("#datepicker1").datepicker('getDate');
		if ($("#datepicker1").val() != "" && dt > dt1) {
			alert("Start date must be can not be later than end date...");
			$("#datepicker").val("");
		}
	}
	function checkDate() {
		var d = $("#datepicker").datepicker('getDate');
		var d1 = $("#datepicker1").datepicker('getDate');
		if ($("#datepicker").val() != "" && d > d1) {
			alert("End date can not be before than start date...");
			$("#datepicker1").val("");
		}
	}

		$(function() {
			$("#prodCode").autocomplete({
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
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#prodCode").val("");
					} else {
						$("#prodCode").val(ui.item.value);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#prodCode").val("");
					} else {
						$("#prodCode").val(ui.item.value);
					}

				}
			});
		});

		$(function() {
			$("#vendorName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeVendorAndName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.name,
									id : item.id
								});
							}));
						},

						error : function(a, b, c) {
							alert(a + b + c);
						}

					});
				},
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#vendorName").val("");
					} else {
						$("#vendorName").val(ui.item.value);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#vendorName").val("");
					} else {
						$("#vendorName").val(ui.item.value);
					}

				}
			});
		});

		$(function() {
			$("#agentName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypePurchaseAgentAndName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.name,
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
						$("#agentName").val("");
						$("#agentId").val("");
					} else {
						$("#agentName").val(ui.item.value);
						$("#agentId").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#agentName").val("");
						$("#agentId").val(0);
					} else {
						$("#agentName").val(ui.item.value);
						$("#agentId").val(ui.item.id);
					}

				}
			});
		});

		function purchaseSearchByDateSubmit() {
			if ($("#datepicker").val() == "" || $("#datepicker1").val() == "") {
				alert("Please enter start date and end date");
			} else {
				$("#purchaseSearchByDateId").submit();
			}
		}		
		
		function viewInvoice(id){
			window
			.open(
					"stockPurCha.jsp?id="+id,
					'name', 'width=900,height=700').print();
			
		}
		$(function() {
			$("#VagentName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypePurchaseAgentAndName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.name,
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
						$("#VagentName").val("");
						$("#VagentId").val("");
					} else {
						$("#VagentName").val(ui.item.value);
						$("#VagentId").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#VagentName").val("");
						$("#VagentId").val(0);
					} else {
						$("#VagentName").val(ui.item.value);
						$("#VagentId").val(ui.item.id);
					}

				}
			});
		});
		function purchaseSearchByViaAgentSubmit() {
			if ($("#VagentName").val() == "") {
				alert("Please enter agent name!");
			} else {
				$("#purchaseSearchByAgentNameForm").submit();
			}
		}
	</script>
	<script type="text/javascript">
	function agentPaymentOCF(id, challanNo, totPC, agentId) {
		$("#aId").val(agentId);
		$("#peId").val(id);
		$.ajax({
			url : "getAllVoucherDetails4ViaAgentByPurchaseEntryId",
			type : "post",
			dataType : "json",
			data : {
				id : id
			},
			success : function(data) {
				$("#voucherDetailSize").val(data.voucherDetailSize);
			}
		});
		$.ajax({
			type : "post",
			url : "getCurrentCreditNote4ViaAgentByAgentId",
			data : {
				id : agentId
			},
			dataType : "json",
			success : function(data) {
				$("#totalCredit").val(data.currentCreditNote);
			}
		});
		if($("#status"+id).html()=="Not Paid"){
			$("#dueAmount").html(Number(totPC).toFixed(2));		
			if(Number(totPC)>0){
				$("#payButton").removeAttr("disabled");
			}else{
				$("#payButton").attr("disabled","disabled");
			}
		}			
		$("#pChallan").html(challanNo+" (Total Payable: "+Number(totPC).toFixed(2)+" Rs.)");				
		$.ajax({
			type : "post",
			url : "getPaymentDetails4ViaAgentByPurchaseEntryId",
			data : {
				id : id
			},
			dataType : "json",
			success : function(data) {
				$("#paymentDetailsTable tbody").empty();
				var totalPaid=0;
				$.each(data, function(index, item) {
						$("#paymentDetailsTable").append('<tbody><tr><td>'+formatDate(item.paymentDate)+'</td><td>'+item.paymentMethod+'</td><td>'+item.paymentDescription+'</td><td>'+Number(item.paymentAmount).toFixed(2)+'</td></tr></tbody>');							
						totalPaid=totalPaid+item.paymentAmount;
				});
				$("#dueAmount").html(Number(Number(totPC)-Number(totalPaid)).toFixed(2));
				if(Number(Number(totPC)-Number(totalPaid))==0){
					$("#payButton").attr("disabled","disabled");
				}else{
					$("#payButton").removeAttr("disabled");
				}
			},
			error : function(a, b, c) {
				alert(a + b + c);
			}
		});
		$("#agentPayModal").modal("show");
	}
	function formatDate(d) {
		var dateparts = d.split(" ");
		return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
	}
	</script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#payDetail").hide();
		$("#description").hide();
		$("#AMi2").hide();
	});
	
	function payButtonOCF(){
		$("#paymentModal").modal("show");
	}
	
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
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number(0));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			finalCreditFunc();
		} else if (val == 'Full Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pDueAmount").hide();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#AMi2").hide();
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
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
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			finalCreditFunc();
		}
	}
	function spPaymentAmountFunc() {
		if (Number($("#spPaymentAmount").val()) > Number($("#spAmount").val())) {
			alert("Payment amount can not be greater than full amount...");
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);			
		} else {
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
		}
		finalCreditFunc();				
	}
	function finalCreditFunc(){
		if($("#voucherDetailSize").val()==0){
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		}else{
			$("#finalDC").val(
					Math.round((Number($("#totalCredit").val())- Number($("#spPaymentAmount").val())) * 100) / 100);
		}
	}
	function spPaymentAmountDecimalFixF() {
		$("#spPaymentAmount").val(
				Number($("#spPaymentAmount").val()).toFixed(2));
		spPaymentAmountFunc();
	}
	function pTypeFunc() {
		$("#description").show();
		var val = $('[name="pType"]').val();
		if (val == '-') {
			alert('Please select Payment Type...');
			$("#description").hide();
		}
	}	
	$(function() {		
		$("#spPaymentAmount").numericInput({
			allowFloat : true,
			allowNegative : false,
		});
	});
	function submit() {
		document.getElementById("paymentForm").submit();
	}
	$(function() {
		var d = new Date();
		var m = d.getMonth();
		if (m > 3) {
			var n = d.getFullYear();
		} else {
			var n = d.getFullYear() - 1;
		}
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy"
		});
		$("#datepicker2").datepicker('setDate', new Date());
	});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
