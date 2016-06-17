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

<!-- <link rel="stylesheet" href=style.css> -->
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">

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

<style>
div.dataTables_wrapper {
	width: 100%;
	margin: 0 auto;
}

table {
	width: 100% !important;
}

th {
	width: 16.66% !important;
	text-align: center !important;
}

tbody {
	width: 100% !important;
}

td {
	width: 16.66% !important;
	text-align: center !important;
}

tfoot {
	width: 100% !important;
}
</style>

</head>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#reports").attr("id", "activeSubMenu");
		$("#report").attr("style", "color: #6a94ff;");
	});
</script>
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

			<c:if test="${page.name.equals('Report')}">
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
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">


							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Finalcial Report</h3>
							</div>

							<div class="widget-area">
								<div class="col-md-12">


									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#dayBook">DayBook</a></li>
										<li><a data-toggle="tab" href="#profitLoss">Profit-Loss</a></li>
										<li><a data-toggle="tab" href="#ledgerAcount">Ledger
												Account</a></li>

									</ul>
									<div class="tab-content">

										<!-- .......................................**********************DayBook****************************************************......... -->


										<div id="dayBook" class="tab-pane fade active in">
											<br> <br>
											<div>
												<form action="dayBookreport">
													<label>Choose your date:</label>&nbsp;<input type="text"
														readonly="readonly" name="dayBookDate" id="datepicker">
													<input type="submit" value="search">
												</form>
											</div>
											<br> <br>
											<div>
												<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
														<c:set var="total1" value="${0}" />
														<c:set var="total2" value="${0}" />
														<c:set var="total3" value="${0}" />
														<c:set var="total4" value="${0}" />
														<c:set var="total5" value="${0}" />
														<c:set var="total6" value="${0}" />
														<c:set var="total7" value="${0}" />
														<c:set var="total8" value="${0}" />

														<c:forEach items="${requestScope['salesEty']}" var="sRepo">
															<tr>
																<td><fmt:formatDate value="${sRepo.sales_date}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${sRepo.customer.name}&nbsp;<br> <br>&nbsp;${sRepo.paymentDetails.get(0).paymentType.type}
																</td>
																<td>Sales Payment</td>
																<td>${sRepo.challanNumber}</td>
																<td><fmt:formatNumber var="totalCost"
																		value="${sRepo.totalCost}" maxFractionDigits="2"
																		groupingUsed="false" /> ${totalCost}<br> <br>0



																
																<td>0<br> <br> <c:set var="lastPayment"
																		value="${sessionScope['ejb'].getPaymentDetailsBySalesEntryId(sRepo.id).get(0)}"></c:set>
																	<c:set var="currentDue"
																		value="${lastPayment.totalAmount-lastPayment.paidAmount}"></c:set>
																	${sRepo.totalCost-currentDue}
																</td>
															</tr>
															<c:set var="total1" value="${total1 + sRepo.totalCost}" />
															<c:set var="total2"
																value="${total2 + sRepo.totalCost-currentDue}" />
														</c:forEach>

														<c:forEach items="${requestScope['purchaseEty']}"
															var="pRepo">
															<c:if test="${pRepo.vendor.name!='Production Vendor'}">
																<tr>
																	<td><fmt:formatDate value="${pRepo.purchase_date}"
																			pattern="dd-MM-yyyy" /></td>
																	<td>${pRepo.vendor.name}&nbsp;<br> <br>&nbsp;${pRepo.paymentDetails.get(0).paymentType.type}
																	</td>
																	<td>Purchase Payment</td>
																	<td>${pRepo.challanNumber}</td>
																	<td>0<br> <br> <fmt:formatNumber
																			var="totalCost" value="${pRepo.totalCost}"
																			maxFractionDigits="2" groupingUsed="false" />
																		${totalCost}
																	</td>
																	<td><c:set var="lastPayment"
																			value="${sessionScope['ejb'].getPaymentDetailsByPurchaseEntryId(pRepo.id).get(0)}"></c:set>
																		<c:set var="currentDue"
																			value="${lastPayment.totalAmount-lastPayment.paidAmount}"></c:set>
																		${pRepo.totalCost-currentDue}<br> <br>0</td>
																</tr>
																<c:set var="total3" value="${total3 + pRepo.totalCost}" />
																<c:set var="total4"
																	value="${total4 + pRepo.totalCost-currentDue}" />
															</c:if>
														</c:forEach>

														<c:forEach items="${requestScope['salesReturn']}"
															var="srRepo">
															<tr>
																<td><fmt:formatDate value="${srRepo.returnDate}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${srRepo.salesEntry.customer.name}&nbsp;<br>
																	<br>&nbsp;${srRepo.salesEntry.paymentDetails.get(0).paymentType.type}
																</td>
																<td>Sales Return Payment</td>
																<td>${srRepo.challanNumber}</td>
																<td>0<br> <br> <fmt:formatNumber
																		var="totalCost" value="${srRepo.totalReCost}"
																		maxFractionDigits="2" groupingUsed="false" />
																	${totalCost}
																</td>
																<td><fmt:formatNumber var="totalCost"
																		value="${srRepo.totalReCost}" maxFractionDigits="2"
																		groupingUsed="false" /> ${totalCost}<br> <br>0</td>
															</tr>
															<c:set var="total5"
																value="${total5 + srRepo.totalReCost}" />
															<c:set var="total6"
																value="${total6 + srRepo.totalReCost}" />
														</c:forEach>
														<c:forEach items="${requestScope['purchaseReturn']}"
															var="prRepo">
															<tr>
																<td><fmt:formatDate value="${prRepo.returnDate}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${prRepo.purchaseEntry.vendor.name}&nbsp;<br>
																	<br>&nbsp;${prRepo.paymentDetails.get(0).paymentType.type}
																</td>
																<td>Purchase Return Payment</td>
																<td>${prRepo.challanNumber}</td>
																<td><fmt:formatNumber var="totalCost"
																		value="${prRepo.totalReCost}" maxFractionDigits="2"
																		groupingUsed="false" /> ${totalCost}<br> <br>0</td>
																<td>0<br> <br> <fmt:formatNumber
																		var="totalCost" value="${prRepo.totalReCost}"
																		maxFractionDigits="2" groupingUsed="false" />
																	${totalCost}
																</td>
															</tr>
															<c:set var="total7"
																value="${total7 + prRepo.totalReCost}" />
															<c:set var="total8"
																value="${total8 + prRepo.totalReCost}" />
														</c:forEach>
													</tbody>
													<tfoot>
														<tr>


															<th colspan="4"><h4>Total:</h4></th>
															<th><h4>
																	<fmt:formatNumber var="totalDebit"
																		value="${total3+total1+total5+total7}"
																		maxFractionDigits="2" groupingUsed="false" />${totalDebit}</h4></th>
															<th><h4>
																	<fmt:formatNumber var="totalCredit"
																		value="${total2+total4+total6+total8}"
																		maxFractionDigits="2" groupingUsed="false" />${totalCredit}</h4></th>

														</tr>
													</tfoot>
												</table>
											</div>
										</div>
										<!-- .......................................**********************profitLoss****************************************************......... -->
										<div id="profitLoss" class="tab-pane fade">

											<div class="col-md-6">
												<h4 align="center">Total Income</h4>

												<table class="table table-striped table-bordered">
													<c:set value="${0}" var="totalSE" />
													<c:forEach
														items="${sessionScope['ejb'].getAllSalesEntry()}"
														var="gAs">
														<c:set value="${totalSE+gAs.totalCost}" var="totalSE" />

													</c:forEach>

													<c:set value="${0}" var="totalSE1" />
													<c:forEach
														items="${sessionScope['ejb'].getAllSalesEntry()}"
														var="gAs1">
														<c:set value="${totalSE1+gAs1.surcharge}" var="totalSE1" />

													</c:forEach>

													<c:set value="${0}" var="totalSE2" />
													<c:forEach
														items="${sessionScope['ejb'].getAllSalesEntry()}"
														var="gAs2">
														<c:set value="${totalSE2+gAs2.taxAmount}" var="totalSE2" />

													</c:forEach>

													<c:set value="${0}" var="totalSE3" />
													<c:forEach
														items="${sessionScope['ejb'].getAllSalesEntry()}"
														var="gAs3">
														<c:set value="${totalSE3+gAs3.transportcCharge}"
															var="totalSE3" />

													</c:forEach>
													<c:set value="${0}" var="spd" />
													<c:set value="${0}" var="spd1" />
													<c:forEach var="salesProDet"
														items="${sessionScope['ejb'].getAllSalesProductDetails()}">

														<c:set value="${salesProDet.quantity+spd}" var="spd" />
														<c:set value="${salesProDet.salesReQty+spd1}" var="spd1" />

													</c:forEach>

													<c:set value="${0}" var="srta" />
													<c:forEach
														items="${sessionScope['ejb'].getAllSalesReturn()}"
														var="sReturnToAmo">

														<c:set value="${srta+sReturnToAmo.totalReCost}" var="srta" />


													</c:forEach>
													<tr>
														<td colspan="2">Product Sold</td>
														<td>Amount</td>
													</tr>

													<tr>
														<td><h2 style="color: #6a94ff;">Sales</h2></td>
														<td>Quantity<br> <br> <fmt:formatNumber
																value="${spd-spd1}" var="quantity" maxFractionDigits="3"
																groupingUsed="false" /> ${quantity}
														</td>

														<td>${totalSE-srta}<br> <br>&#8721; of
															Grand total
														</td>
													</tr>

													<tr>
														<td colspan="2">Total Transport Charge</td>
														<td>${totalSE3}<br> <br>-&#8721; of
															Transport
														</td>
													</tr>

													<tr>
														<td colspan="2">Total Surcharge</td>
														<td>${totalSE1}<br> <br>-&#8721; of
															Surcharge
														</td>
													</tr>

													<tr>
														<c:set value="${0}" var="rettaxtot" />
														<c:forEach
															items="${sessionScope['ejb'].getAllSalesProductReturnDetail()}"
															var="ppdet">
															<c:set value="${0}" var="stot" />
															<c:set
																value="${stot+ppdet.salesProductDetails.getSalesPrice()*ppdet.qtyReturn}"
																var="stot" />
															<c:set value="${0}" var="disVal" />
															<c:set var="disVal"
																value="${ppdet.salesReturn.salesEntry.isFlatDiscount()?stot*ppdet.salesReturn.salesEntry.discountValue/ppdet.salesReturn.salesEntry.subTotal:stot*ppdet.salesReturn.salesEntry.discountValue/100}" />
															<c:set
																value="${rettaxtot+(stot-disVal)*ppdet.salesReturn.salesEntry.tax_Type_Group.getTotalTaxValue()/100}"
																var="rettaxtot" />
														</c:forEach>
														<td colspan="2">Total Tax</td>
														<td><fmt:formatNumber type="number" var="totalSE2"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalSE2-rettaxtot}" />${totalSE2}<br> <br>-&#8721;
															of Tax</td>
													</tr>



													<tr>
														<td colspan="2">Total:</td>
														<td><fmt:formatNumber type="number"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalSE-srta-totalSE3-totalSE2-totalSE1}" /></td>
													</tr>



												</table>

											</div>

											<!-- total expance........................... -->
											<div class="col-md-6">
												<h4 align="center">Total Expense</h4>
												<table class="table table-striped table-bordered">
													<c:set value="${0}" var="totalPE" />
													<c:forEach
														items="${sessionScope['ejb'].getAllPurchaseEntry()}"
														var="gAp">
														<c:set value="${totalPE+gAp.subTotal}" var="totalPE" />
													</c:forEach>

													<c:set value="${0}" var="totalPE1" />
													<c:forEach
														items="${sessionScope['ejb'].getAllPurchaseEntry()}"
														var="gAp1">
														<c:set value="${totalPE1+gAp1.sur_charge}" var="totalPE1" />

													</c:forEach>

													<c:set value="${0}" var="totalPE2" />
													<c:forEach
														items="${sessionScope['ejb'].getAllPurchaseEntry()}"
														var="gAp2">
														<c:set value="${totalPE2+gAp2.taxAmount}" var="totalPE2" />

													</c:forEach>

													<c:set value="${0}" var="totalPE3" />
													<c:forEach
														items="${sessionScope['ejb'].getAllPurchaseEntry()}"
														var="gAp3">
														<c:set value="${totalPE3+gAp3.transport_cost}"
															var="totalPE3" />
													</c:forEach>
													<c:set value="${0}" var="ppd" />
													<c:set value="${0}" var="ppd1" />
													<c:forEach var="purProDet"
														items="${sessionScope['ejb'].getAllPurchase_Product_Details()}">
														<c:if
															test="${purProDet.purchase_Entry.vendor.name!='Production Vendor'}">
															<fmt:formatNumber value="${purProDet.quantity+ppd}"
																var="ppd" maxFractionDigits="3" groupingUsed="false" />
															<fmt:formatNumber
																value="${purProDet.totalReturningQty+ppd1}" var="ppd1"
																maxFractionDigits="3" groupingUsed="false" />
														</c:if>
													</c:forEach>

													<c:set value="${0}" var="prta" />
													<c:forEach
														items="${sessionScope['ejb'].getAllPurchaseReturn()}"
														var="pReturnToAmo">

														<c:set value="${prta+pReturnToAmo.totalReCost}" var="prta" />


													</c:forEach>
													<tr>
														<td colspan="2">Product Purchased</td>
														<td>Amount</td>
													</tr>

													<tr>
														<td><h2 style="color: #6a94ff;">Purchase</h2></td>
														<td>Quantity<br> <br> <fmt:formatNumber
																value="${ppd-ppd1}" var="quantity" maxFractionDigits="3"
																groupingUsed="false" /> ${quantity}
														</td>

														<td>${totalPE-prta}<br> <br>&#8721; of Sub
															total
														</td>
													</tr>

													<tr>
														<td colspan="2">Total Transport Charge</td>
														<td>${totalPE3}<br> <br>+&#8721; of
															Transport
														</td>
													</tr>

													<tr>
														<td colspan="2">Total Surcharge</td>
														<td>${totalPE1}<br> <br>+&#8721; of
															Surcharge
														</td>
													</tr>

													<tr>
														<c:set value="${0}" var="rettaxtot" />
														<c:forEach
															items="${sessionScope['ejb'].getAllPurchase_Product_Details()}"
															var="ppdet">
															<c:set value="${0}" var="stot" />
															<c:set value="${stot+ppdet.cost*ppdet.totalReturningQty}"
																var="stot" />
															<c:set value="${0}" var="disVal" />
															<c:set var="disVal"
																value="${ppdet.purchase_Entry.isFlatDiscount()?stot*ppdet.purchase_Entry.discountValue/ppdet.purchase_Entry.subTotal:stot*ppdet.purchase_Entry.discountValue/100}" />
															<c:set
																value="${rettaxtot+(stot-disVal)*ppdet.purchase_Entry.tax_Type_Group.getTotalTaxValue()/100}"
																var="rettaxtot" />
														</c:forEach>
														<td colspan="2">Total Tax</td>
														<td><fmt:formatNumber type="number" var="totalPE2"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalPE2-rettaxtot}" />${totalPE2}<br> <br>+&#8721;
															of Tax</td>
													</tr>
													<tr>
														<td colspan="2">Total:</td>
														<td><fmt:formatNumber type="number"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalPE-prta+totalPE3+totalPE2+totalPE1}" /></td>
													</tr>



												</table>
											</div>

											<div class="col-md-12">
												<br>

												<table class="table table-striped table-bordered">

													<tr>
														<td><h4 align="center">Total Profit</h4></td>
														<td><h4>=</h4></td>
														<td><h4 align="center">Total Income</h4></td>
														<td><h4>__</h4></td>
														<td><h4 align="center">Total Expanse</h4></td>
													</tr>
													<tr>

														<td><fmt:formatNumber type="number"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalSE-srta-totalSE3-totalSE2-totalSE1-totalPE+prta-totalPE3-totalPE2-totalPE1}" /></td>
														<td>&nbsp;</td>

														<td><fmt:formatNumber type="number"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalSE-srta-totalSE3-totalSE2-totalSE1}" /></td>
														<td>&nbsp;</td>
														<td><fmt:formatNumber type="number"
																maxFractionDigits="2" groupingUsed="false"
																value="${totalPE-prta+totalPE3+totalPE2+totalPE1}" /></td>
													</tr>
												</table>
											</div>

										</div>

										<!-- .......................................**********************ledgerAcount****************************************************......... -->
										<div id="ledgerAcount" class="tab-pane fade">


											<div class="col-md-12">
												<div class="col-md-4">
													<h4>Select your Ledger Type:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -60px;">
													<h4>
														<select class="form-control" onchange="ledger()"
															id="ledSel">
															<option value="0">select ledger type</option>
															<option value="vendorLed">Vendor</option>
															<option value="AgentLedP">Purchase Agent</option>
															<option value="AgentLedS">Sales Agent</option>
															<option value="CustomerLed">Customer</option>
														</select>
													</h4>
												</div>

											</div>


											<div class="col-md-12" id="cus">
												<br> <br>
												<div>
													<table id="" class="table table-bordered display"
														cellspacing="0" width="100%">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Phone Number</th>
																<th>Address</th>
																<th>Details/view</th>

															</tr>
														</thead>

														<tbody>
															<c:set var="c" value="1" />
															<c:forEach
																items="${sessionScope['ejb'].getAllCustomerEntry()}"
																var="ccustomer">
																<tr>
																	<td>${c}</td>
																	<td>${ccustomer.name}</td>
																	<td>${ccustomer.mobile}</td>
																	<td>${ccustomer.address}</td>
																	<td><a
																		href="reportCustomerRaz.jsp?id=${ccustomer.id}"><img
																			alt="click to view" src="images/eye.png" height="20"></a></td>

																</tr>
																<c:set var="c" value="${c+1}" />
															</c:forEach>

														</tbody>
													</table>
												</div>
											</div>
											<div class="col-md-12" id="vend">
												<br> <br>
												<div>
													<table id="" class="table table-bordered display"
														cellspacing="0" width="100%">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Phone Number</th>
																<th>Address</th>
																<th>Details/view</th>

															</tr>
														</thead>

														<tbody>
															<c:set var="c" value="1" />
															<c:forEach
																items="${sessionScope['ejb'].getAllVendtypeVen()}"
																var="vvendor">
																<c:if test="${vvendor.name!='Production Vendor'}">
																	<tr>
																		<td>${c}</td>
																		<td>${vvendor.name}</td>
																		<td>${vvendor.ph1}</td>
																		<td>${vvendor.address}</td>
																		<td><a
																			href="reportVendorRaz.jsp?id=${vvendor.id}"><img
																				alt="click to view" src="images/eye.png" height="20"></a></td>

																	</tr>
																	<c:set var="c" value="${c+1}" />
																</c:if>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div class="col-md-12" id="agenS">


												<br> <br>
												<div>
													<table id="" class="table table-bordered display"
														cellspacing="0" width="100%">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Phone Number</th>
																<th>Address</th>
																<th>Details/view</th>

															</tr>
														</thead>

														<tbody>
															<c:set var="c" value="1" />
															<c:forEach
																items="${sessionScope['ejb'].getAllAgenttypeSalesAgent()}"
																var="endor">
																<tr>
																	<td>${c}</td>
																	<td>${endor.name}</td>
																	<td>${endor.ph1}</td>
																	<td>${endor.address}</td>
																	<td><a
																		href="reportSalesAgentRaz.jsp?id=${endor.id}"><img
																			alt="click to view" src="images/eye.png" height="20"></a></td>

																</tr>
																<c:set var="c" value="${c+1}" />
															</c:forEach>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-md-12" id="agenP">


												<br> <br>
												<div>
													<table id="" class="table table-bordered display"
														cellspacing="0" width="100%">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Phone Number</th>
																<th>Address</th>
																<th>Details/view</th>

															</tr>
														</thead>

														<tbody>
															<c:set var="c" value="1" />
															<c:forEach
																items="${sessionScope['ejb'].getAllAgenttypePurchaseAgent()}"
																var="endor">
																<tr>
																	<td>${c}</td>
																	<td>${endor.name}</td>
																	<td>${endor.ph1}</td>
																	<td>${endor.address}</td>
																	<td><a href="reportPurAgentRaz.jsp?id=${endor.id}"><img
																			alt="click to view" src="images/eye.png" height="20"></a></td>

																</tr>
																<c:set var="c" value="${c+1}" />
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
					</div>
					<!-- Content Sec -->
				</div>
				<!-- Page Container -->
			</div>
			<!-- main -->
		</div>
	</div>
	<!-- Script -->

	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.fixedHeader.min.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$('table.display').DataTable();
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0,
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$("#cus").hide();
			$("#vend").hide();
			$("#agenP").hide();
			$("#agenS").hide();

		});
		function ledger() {
			if ($("#ledSel").val() == "vendorLed") {
				$("#cus").hide();
				$("#vend").show();
				$("#agenP").hide();
				$("#agenS").hide();

			} else if ($("#ledSel").val() == "AgentLedP") {
				$("#cus").hide();
				$("#vend").hide();
				$("#agenP").show();
				$("#agenS").hide();

			} else if ($("#ledSel").val() == "CustomerLed") {
				$("#cus").show();
				$("#vend").hide();
				$("#agenP").hide();
				$("#agenS").hide();

			} else if ($("#ledSel").val() == "AgentLedS") {
				$("#cus").hide();
				$("#vend").hide();
				$("#agenP").hide();
				$("#agenS").show();

			}

			else {
				$("#cus").hide();
				$("#vend").hide();
				$("#agenP").hide();
				$("#agenS").hide();

			}

		}
	</script>
	<!-- <script>
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

				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#vendorName").val("");
					} else {
						$("#vendorName").val(ui.item.name);
					}

				}
			});
		});

		$(function() {
			$("#agentName").autocomplete({
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

				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#agentName").val("");
					} else {
						$("#agentName").val(ui.item.name);
					}

				}
			});
		});
	</script> -->

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
