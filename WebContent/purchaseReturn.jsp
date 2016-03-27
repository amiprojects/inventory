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
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchReturn").attr("style", "color: #6a94ff;");
	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#payDetail").hide();
		$("#description").hide();
	});
	function closePayment() {
		//$("#payDetail").hide();
		$("#description").hide();
		$("#pstatus").val('-');
		$("#pType").val('-');
		$("#AMi2").hide();
	}
	/* function pStatusDiv() {
		var val = $('[name="pstatus"]').val();
		$("#payDetail").show();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#payDetail").hide();
			$("#description").hide();
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
		} else if (val == 'Full Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pDueAmount").hide();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
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
		}
	} 
	function spPaymentAmountFunc() {
		$("#spDueAmount").val(
				Math.round((Number($("#spAmount").val()) - Number($(
						"#spPaymentAmount").val())) * 100) / 100);
	}*/
	function pTypeFunc() {
		$("#description").show();
		var val = $('[name="pType"]').val();
		if (val == '-') {
			alert('Please select Payment Type...');
			$("#description").hide();
			$("#AMi2").hide();
		} else if (val == 'Credit Note') {
			/* $("#cVouDetails").modal("show"); */
			$("#AMi2").show();
		} else if (val == 'Cash') {
			$("#AMi2").hide();
		} else if (val == 'Cheque') {
			$("#AMi2").hide();
		} else if (val == 'Bank Transfer') {
			$("#AMi2").hide();
		}
	}
	/* function plzClose() {
		$("#cVouDetails").modal('hide');

	} */
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
	<c:if test="${requestScope['purRetIdforPC']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"purchaseReturnChallanForPrint.jsp?id=${requestScope['purRetIdforPC']}",
							'name', 'width=600,height=400');
			myWindow.print();
		</script>
	</c:if>
	<c:set var="compInfo"
		value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />
	<c:set var="purchaseSearchView"
		value="${sessionScope['ejb'].getPurchaseEntryById(requestScope['pId'])}" />
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
								<h3 style="margin-top: 11px;">Purchase Return</h3>

							</div>
							<div class="col-md-12">
								<div class="widget-area">
									<div class="col-md-12">
										<form role="form" class="sec" action="purchaseSearchForReturn"
											method="post">
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label for="" style="float: left;">Purchase
															challan no. :</label>
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
												<div class="col-md-2"
													style="margin-left: 0; padding-left: 0;">
													<input type="text" class="form-control" name="suffix">
												</div>
												<div class="col-md-2">
													<button class="btn green pull-left" type="submit">Go</button>
												</div>
											</div>
										</form>
										<hr width="100%">

										<h3 align="center" style="color: #6a94ff;" id="msg">${requestScope['msg']}</h3>

										<hr width="100%">
									</div>
									<form role="form" class="sec" action="purchaseReturn"
										method="post">
										<div class="col-md-6">
											<div class="col-md-12">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <input
													type="text" class="form-control" readonly="readonly"
													name="vendorType" id="vendorType"
													value="${purchaseSearchView.vendor.vendorType.type}">
											</div>
											<div class="col-md-12">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
													type="text" class="form-control" id="vName" name="vName"
													readonly="readonly"
													value="${purchaseSearchView.vendor.name}"><input
													type="hidden" value="${purchaseSearchView.vendor.id}"
													id="vId" name="vId">
											</div>
											<div class="col-md-12">
												&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
												<textarea rows="5" cols="" id="vDetail" class="form-control"
													readonly="readonly">
													Address : 
														&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;${purchaseSearchView.vendor.address}
													Ph1: ${purchaseSearchView.vendor.ph1}
													Ph2: ${purchaseSearchView.vendor.ph2}
													</textarea>

											</div>
											<div class="col-md-12">
												<c:choose>
													<c:when test="${purchaseSearchView.agentId==0}">
														<input type="checkbox" id="agent" name="agent"
															disabled="disabled">&nbsp;<span>Via Agent</span>
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="agent" name="agent"
															disabled="disabled" checked="checked">&nbsp;<span>Via
															Agent</span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-md-12" id="aNameDiv">
												<label for="" class="font">Agent Name:</label>
												<c:choose>
													<c:when test="${purchaseSearchView.agentId!=0}">
														<input class="form-control" type="text"
															class="form-control" name="agentName" id="agentName"
															readonly="readonly"
															value="${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).getName()}">
													</c:when>
													<c:otherwise>
														<input class="form-control" type="text"
															class="form-control" name="agentName" id="agentName"
															readonly="readonly">
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="" class="font">Vendor Bill no :</label> <input
													type="text" placeholder="" id="vendorBillNo"
													class="form-control" name="vendorBillNo"
													readonly="readonly"
													value="${purchaseSearchView.vendor_bill_no}"> <input
													type="hidden" name="peId" value="${purchaseSearchView.id}">
											</div>
											<div class="form-group">
												<label for="" class="font">Reference Purchase
													challan no. :</label> <input readonly="readonly" type="text"
													placeholder="" name="REFchallanNumber" class="form-control"
													value="${purchaseSearchView.challanNumber}">
											</div>
											<div class="form-group">

												<label for="" class="font">Purchase Return challan
													no. :</label>
												<c:set var="fy"
													value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
												<c:set var="cno"
													value="${sessionScope['ejb'].getLastPurchaseChallanNumberByCompany(compInfo.id)+1}" />
												<c:set var="csuf"
													value="${sessionScope['ejb'].getLastPurchaseReturnChallanSuffix()+1}" />
												<c:set var="suf" value="RPUR" />
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
											<div class="form-group col-md-6"
												style="margin: 0; padding: 0;">
												<label for="" class="font">Purchase Date :</label> <input
													type="text" id="datepicker" class="form-control"
													name="purchaseDate" required="required" readonly="readonly"
													value="<fmt:formatDate
																			value="${purchaseSearchView.purchase_date}"
																			pattern="dd-MM-yyyy" />">
											</div>
											<div class="form-group col-md-6"
												style="margin: 0; padding: 0;">
												<label for="" class="font">Return Date :</label> <input
													type="text" id="datepicker1" class="form-control"
													name="returnDate" required="required" readonly="readonly"
													value="<fmt:formatDate
																			value="${purchaseSearchView.purchase_date}"
																			pattern="dd-MM-yyyy" />">
											</div>
											<div class="form-group" id="aDetailDiv">
												<label for="" class="font">Agent Details:</label>

												<c:choose>
													<c:when test="${purchaseSearchView.agentId!=0}">
														<textarea rows="5" cols="" class="form-control"
															readonly="readonly" id="agentDet" name="agentDet">
															Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).address}
															Ph1 : ${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).ph1}
															Ph2 : ${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).ph2}
															</textarea>
													</c:when>
													<c:otherwise>
														<textarea rows="5" cols="" class="form-control"
															readonly="readonly" id="agentDet" name="agentDet"></textarea>
													</c:otherwise>
												</c:choose>

											</div>
										</div>
								</div>

								<table id="productList"
									class="table table-striped table-bordered">
									<thead style="background-color: #F0F0F0;">
										<tr>
											<th>#</th>
											<th>Product Code</th>
											<th>Product Description</th>
											<th>Qty</th>
											<th>Remaining Qty</th>
											<th>UOM</th>
											<th>Rate</th>
											<th>Amount</th>
											<th>Returning Qty</th>
											<th>Returning amount</th>
											<th>Drawback</th>
										</tr>
									</thead>
									<c:set var="i" value="${1}"></c:set>
									<c:forEach var="purchaseProducts"
										items="${purchaseSearchView.purchase_Product_Details}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${purchaseProducts.productDetail.code}<input
													type="hidden" name="purProductDetailsID"
													value="${purchaseProducts.id}">
												</td>
												<td>${purchaseProducts.productDetail.description}</td>
												<td>${purchaseProducts.quantity}</td>
												<td id="qty${purchaseProducts.id}">${purchaseProducts.quantity-purchaseProducts.totalReturningQty}</td>
												<td>${purchaseProducts.productDetail.qtyUnit.name}</td>
												<td id="cost${purchaseProducts.id}">${purchaseProducts.cost}</td>
												<td>${purchaseProducts.quantity*purchaseProducts.cost}</td>
												<td><input type="text" class="form-control rQty"
													id="rQty${purchaseProducts.id}" name="rQty"
													onkeyup="changeNcheck('${purchaseProducts.id}');" value="0"
													autocomplete="off"></td>
												<td><input type="text" readonly="readonly"
													class="form-control rAmount"
													id="rAmount${purchaseProducts.id}"></td>
												<td><input type="text" class="form-control"
													name="drawBack"></td>
											</tr>
										</tbody>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</table>

								<table class="table table-striped table-bordered">

									<thead>
										<tr>
											<th>#</th>
											<th>Return Date</th>
											<th>Purchase Return challan no.</th>
											<th>Product Code</th>
											<th>Product Description</th>
											<th>Returning Qty</th>
											<th>Drawback</th>
										</tr>
									</thead>

									<c:set var="j" value="${1}"></c:set>
									<c:forEach var="purchaseReturn"
										items="${purchaseSearchView.purchaseReturn}">

										<tbody>
											<tr>
												<td>${j}</td>
												<td><fmt:formatDate
														value="${purchaseReturn.returnDate}" pattern="dd-MM-yy" />
												</td>
												<td>${purchaseReturn.challanNumber}</td>
												<td><c:forEach var="purchaseReturnProd"
														items="${purchaseReturn.purchaseReturnProductDetails}">														
													${purchaseReturnProd.purchaseProductDetails.productDetail.code}
														<hr>
													</c:forEach></td>
												<td><c:forEach var="purchaseReturnProd"
														items="${purchaseReturn.purchaseReturnProductDetails}">														
													${purchaseReturnProd.purchaseProductDetails.productDetail.description}
														<hr>
													</c:forEach></td>
												<td><c:forEach var="purchaseReturnProd"
														items="${purchaseReturn.purchaseReturnProductDetails}">														
													${purchaseReturnProd.qtyReturn}
														<hr>
													</c:forEach></td>
												<td><c:forEach var="purchaseReturnProd"
														items="${purchaseReturn.purchaseReturnProductDetails}">
														<%-- <c:if test="${purchaseReturnProd.qtyReturn!=0}"> --%>
													${purchaseReturnProd.fault}
														<hr>
													</c:forEach></td>
											</tr>
										</tbody>
										<c:set var="j" value="${j+1}" />
									</c:forEach>
								</table>

								<div style="width: 40%; float: right;">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2">Sub Total :</td>
												<td><input type="text" class="form-control" name="subTotalname"
													id="subTotal" value="0" readonly="readonly"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${purchaseSearchView.tax_Type_Group.name}</td>
												<td>%</td>
												<td><input type="text" class="form-control"
													readonly="readonly"
													value="${purchaseSearchView.tax_Type_Group.getTotalTaxValue()}"
													id="taxTot"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Tax Amount :</td>
												<td><input type="text" class="form-control"
													readonly="readonly" value="0" id="taxAmount"></td>
											</tr>
										</tbody>
										<%-- <tbody>
											<tr>
												<td colspan="2">Transport charge :</td>
												<td><input type="text" class="form-control"
													name="transportCost" id="transportCost"
													value="${purchaseSearchView.transport_cost}"
													readonly="readonly"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Surcharge :</td>
												<td><input type="text" class="form-control"
													id="surcharge" name="surcharge"
													value="${purchaseSearchView.sur_charge}"
													readonly="readonly"></td>
											</tr>
										</tbody> --%>
										<tbody>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="hidden" id="totalvalue"
													name="totalvalue" value="0"><input type="number"
													class="form-control" placeholder="" readonly="readonly"
													id="roundvalue" name="roundvalue" value="0"></td>
											</tr>
										</tbody>
										<%-- <tbody>
											<tr>
												<td colspan="2" id="due">Due Amount :</td>
												<td>
													<input type="text" class="form-control"
													readonly="readonly" id="dueAmount" name="dueAmount"
													value="${purchaseSearchView.totalCost-purchaseSearchView.paymentDetails.get(0).paidAmount}">
													<input type="text" class="form-control" readonly="readonly"
													id="dueAmount" name="dueAmount"
													value="${purchaseSearchView.getVoucherDetails().getValue()}">
												</td>
											</tr>
										</tbody> --%>
										<thead>
											<tr>
												<td colspan="2">Grand Total :</td>
												<td><input type="text" class="form-control" id="gt"
													name="gTotal" placeholder="0" readonly="readonly" value="0"></td>
											</tr>
										</thead>
									</table>

									<div class="row">
										<div style="float: right;">
											<input type="button" class="btn green pull-right"
												data-toggle="modal" value="Save" onclick="paymentDate();">
											<input type="button" onclick="cancelF();"
												class="btn btn-danger small" value="Cancel">
										</div>
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
															<%-- <div class="breadcrumbs">
									<ul>
										<li><a title="">Select Payment status : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Payment status :</div>
									<div class="col-md-7">
										<div class="sec">

											<select class="form-control" id="pstatus" name="pstatus"
												onchange="pStatusDiv()">
												<option value="-" selected="selected">---</option>
												<c:forEach
													items="${sessionScope['ejb'].getAllPaymentStatus()}"
													var="payStatus">
													<option value="${payStatus.status}">${payStatus.status}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div> --%>
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
																			<select class="form-control" id="pType" name="pType"
																				onchange="pTypeFunc()">
																				<option value="-" selected="selected">---</option>
																				<c:forEach
																					items="${sessionScope['ejb'].getAllPaymentType()}"
																					var="payType">
																					<c:if test="${payType.getType()!='Debit Note'}">
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
																		<div class="col-md-5">
																			<!-- Full  -->
																			Amount :
																		</div>
																		<div class="col-md-7">
																			<input type="text" class="form-control"
																				readonly="readonly" id="spAmount" name="spAmount">
																		</div>
																	</div>
																	<div id="AMi2">
																		<div>
																			<div class="col-md-5">Current Credit Note :</div>
																			<div class="col-md-7">
																				<c:set value="${0}" var="totCr" />
																				<c:set value="${0}" var="totDb" />
																				<c:forEach
																					items="${purchaseSearchView.vendor.voucherAssign.voucherDetails}"
																					var="vDet">
																					<%-- <c:set value="${totCr+vDet.value}" var="totCr" /> --%>
																					<c:choose>
																						<c:when test="${vDet.isCredit().equals(true)}">
																							<c:set value="${totCr+vDet.value}" var="totCr" />
																						</c:when>
																						<c:otherwise>
																							<c:set value="${totDb+vDet.value}" var="totDb" />
																						</c:otherwise>
																					</c:choose>
																				</c:forEach>
																				<c:set value="${totCr-totDb}" var="totCr" />
																				<input type="text" id="totalCredit"
																					name="totalCredit" class="form-control"
																					readonly="readonly" value="${totCr}">
																			</div>
																		</div>
																		<!-- <div>
																			<div class="col-md-5">Total Bill VAlue :</div>
																			<div class="col-md-7">
																				<input type="text" class="form-control"
																					readonly="readonly" id="spAmount" name="spAmount">
																			</div>
																		</div> -->
																		<div>
																			<div class="col-md-5">
																				<span id="dORc">Final Debit/Credit Note :</span>
																			</div>
																			<div class="col-md-7">
																				<input type="text" class="form-control" id="finalDC"
																					name="finalDC" readonly="readonly">
																			</div>
																		</div>
																		<!-- <div>
																			<div class="col-md-5">Payment Date :</div>
																			<div class="col-md-7">
																				<input type="text" id="datepicker" name="payDate"
																					class="form-control" readonly="readonly">
																			</div>
																		</div> -->
																	</div>
																	<!-- <div id="pPayAmount">
											<div class="col-md-5">Payment Amount :</div>
											<div class="col-md-7">
												<input type="text" class="form-control" value="0"
													id="spPaymentAmount" name="spPaymentAmount"
													onkeyup="spPaymentAmountFunc();" autocomplete="off">
											</div>
										</div>
										<div id="pDueAmount">
											<div class="col-md-5">Due Amount :</div>
											<div class="col-md-7">
												<input type="text" class="form-control" readonly="readonly"
													id="spDueAmount" name="spDueAmount">
											</div>
										</div> -->
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
								</form>

								<%-- <table id="" class="table table-striped table-bordered">
									<thead style="background-color: #F0F0F0;">
										<tr>
											<th>#</th>
											<th>Payment date</th>
											<th>Payment method</th>
											<th>Payment description</th>
											<th>Amount</th>
										</tr>
									</thead>
									<c:set var="j" value="${1}"></c:set>
									<c:forEach var="paymentDetails"
										items="${purchaseSearchView.paymentDetails}">
										<tbody>
											<tr>
												<td>${j}</td>
												<td><fmt:formatDate
														value="${paymentDetails.paymentDate}" pattern="dd-MM-yy" />
												</td>
												<c:choose>
													<c:when test="${paymentDetails.paymentType.type!=null}">
														<td>${paymentDetails.paymentType.type}</td>
													</c:when>
													<c:otherwise>
														<td>NA</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${paymentDetails.description!=null}">
														<td>${paymentDetails.description}</td>
													</c:when>
													<c:otherwise>
														<td>NIL</td>
													</c:otherwise>
												</c:choose>
												<td>${paymentDetails.paidAmount}</td>
											</tr>
										</tbody>
										<c:set var="j" value="${j+1}" />
									</c:forEach>
								</table> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Content Sec -->
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

	<!-- <div id="cVouDetails" class="modal fade" role="dialog"
		style="top: 25px;">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Vendor Credit Note Details</h4>
				</div>
				<div class="modal-body">
					<h2>Vendor: Mr Sairas Mistri</h2>
					<div class="row">
						<table class="table table-striped table-bordered">

							<thead>
								<tr>
									<th>#</th>
									<th>Date</th>
									<th>Amount</th>

								</tr>
							</thead>

							<tbody>
								<tr>

									<td>1</td>
									<td>---</td>
									<td>23</td>


								</tr>

								<tr>

									<td>2</td>
									<td>---</td>
									<td>23</td>


								</tr>
								<tr>

									<td>3</td>
									<td>----</td>
									<td>23</td>


								</tr>


							</tbody>
							<tfoot>

								<tr>
									<td>&nbsp;</td>
									<td colspan="2">Total Credit Note :</td>
								</tr>

							</tfoot>

						</table>
						<input type="button" class="btn green pull-right"
							style="float: right;" value="what?" onclick="plzClose()">

					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div> -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script type="text/javascript">
		function changeNcheck(id) {
			if (Number($("#rQty" + id).val()) <= Number($("#qty" + id).html())) {
				$("#rAmount" + id).val(
						Number($("#rQty" + id).val())
								* Number($("#cost" + id).html()));
				var sum = 0;
				$(".rAmount").each(function() {
					if (!isNaN(this.value) && this.value.length != 0) {
						sum += parseFloat(this.value);
					}
				});
				$("#subTotal").val(sum.toFixed(2));
				$("#taxAmount")
						.val(
								Math
										.round((Number($("#subTotal").val())
												* Number($("#taxTot").val()) / Number(100)) * 100) / 100);
				/* $("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val()) + Number($(
								"#taxAmount").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);
			}

			else {

				alert("Returning quantity should be less than Remaining quantity...");
				$("#rQty" + id).val("0");
				$("#rAmount" + id).val("0");
				var sum = 0;
				$(".rAmount").each(function() {
					sum += parseFloat(this.value);
				});
				$("#subTotal").val(sum.toFixed(2));
				$("#taxAmount")
						.val(
								Math
										.round((Number($("#subTotal").val())
												* Number($("#taxTot").val()) / Number(100)) * 100) / 100);
				/* $("#totalvalue").val(
						Math.round((Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val()) + Number($(
								"#surcharge").val())) * 100) / 100); */
				$("#totalvalue").val(
						Math.round((Number($("#subTotal").val()) + Number($(
								"#taxAmount").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				$("#gt").val(Math.round((round) * 100) / 100);

			}
		}

		function paymentDate() {
			$("#AMi2").hide();
			var count = $('#productList tbody').length;

			var chk = 0;
			$(".rQty").each(function() {
				if (this.value != 0 && this.value != "") {
					chk = chk + 1;
				}
			});

			if (count < 1 || chk < 1) {
				alert("No product found to return.");
			} else {
				var d = $("#datepicker1").datepicker('getDate');
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
				$("#spAmount").val(Number($("#gt").val()));

				if (Number($("#spAmount").val()) > Number($("#totalCredit")
						.val())) {
					$("#dORc").html("Final Debit :");
					$("#finalDC").val(
							(Number($("#spAmount").val()) - Number($(
									"#totalCredit").val())).toFixed(2));
				} else {
					$("#dORc").html("Final Credit :");
					$("#finalDC").val(
							(Number($("#totalCredit").val()) - Number($(
									"#spAmount").val())).toFixed(2));
				}
			}
		}

		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'purchaseReturn.jsp'
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});

		$(function() {
			var dte = $("#datepicker").val();
			var d = dte.split("-");
			var n = d[2];
			var m = d[1];
			var dt = d[0];
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy",
				minDate : new Date(n, m - 1, dt),
				maxDate : 0
			});
			$("#datepicker1").datepicker('setDate', new Date());
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
