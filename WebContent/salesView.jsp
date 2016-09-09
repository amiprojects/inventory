<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

.head_style {
	font-size: 17px;
}
</style>

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/Checkbox.css" type="text/css" />
<link rel="stylesheet" href="css/checkbox1.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sales").attr("id", "activeSubMenu");
		$("#sSalesSearch").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Sales Search')}">
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
	<c:set var="salesSearchView"
		value="${sessionScope['ejb'].getSalesEntryById(requestScope['sId'])}"></c:set>
	<div class="main" style="height: 664px;">
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales View</h3>
						</div>

						<div class="col-md-12" style="height: 800px;">
							<div class="row">
								<div class="col-md-6">
									<div class="widget-area"
										style="height: 270px; padding: 4px 5px;">
										<div style="background-color: lightgrey; padding: 3px 3px;">
											<span class="head_style">Bill To:</span>
										</div>
										<table cellspacing="2">
											<tr>
												<td>Name :</td>
												<td><input type="text" name="custName" id="custName"
													style="align: center;" readonly="readonly"
													value="${salesSearchView.customer.name}"></input></td>
											</tr>

											<tr>
												<td>Address :</td>
												<td><input type="text" name="addr" id="addr"
													style="length: 40px;" style="align:center;"
													readonly="readonly"
													value="${salesSearchView.customer.address}"></input></td>
											</tr>
											<tr>
												<td>City :</td>
												<td><input type="text" name="city" id="city"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.city}"></input></td>
											</tr>

											<tr>
												<td>Phone No. :</td>
												<td><input type="number" name="phone" id="phone"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.mobile}"></input></td>
											</tr>

											<tr>
												<td>Vat No./CST No. :</td>
												<td><input type="text" name="vatcst" id="vatcst"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.vat_cst_no}"></input></td>
											</tr>
											<tr>
												<td><c:choose>
														<c:when test="${salesSearchView.vendor!=null}">
															<input type="checkbox" checked="checked"
																onclick="isAgentF();" id="agent" name="agent"
																disabled="disabled">&nbsp; Via Agent :
														</c:when>
														<c:otherwise>
															<input type="checkbox" onclick="isAgentF();" id="agent"
																name="agent" disabled="disabled">&nbsp; Via Agent :</c:otherwise>
													</c:choose></td>
												<td><input type="text" name="agentName" id="agentName"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.vendor.name}"></input></td>
											</tr>
											<tr id="aDetailsDiv">
												<td>Agent details :</td>
												<td><textarea rows="" cols="" id="aDetail"
														class="form-control" readonly="readonly"
														style="width: 100%;">
														Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${salesSearchView.vendor.address}
															Ph1 : ${salesSearchView.vendor.ph1}
															Ph2 : ${salesSearchView.vendor.ph2}
														</textarea></td>
											</tr>
										</table>
									</div>
								</div>

								<div class="col-md-6">
									<div class="widget-area"
										style="height: 270px; padding: 5px 3px;">
										<div style="background-color: lightgrey; padding: 3px 3px;"">
											<span class="head_style">Invoice Details:</span>
										</div>

										<div class="form-group" style="padding-top: 18px;">
											<label style="font-size: 15px" class="font">Sales
												challan no. :</label> <input readonly="readonly" type="text"
												placeholder="" name="challanNumber" class="form-control"
												value="${salesSearchView.challanNumber}">
										</div>

										<div class="form-group">
											<label style="font-size: 15px" class="font">Date :</label> <input
												class="form-control" type="text" name="salesDate"
												id="datepicker" readonly="readonly"
												value='<fmt:formatDate value="${salesSearchView.sales_date}" pattern="dd-MM-yyyy"/>'>

										</div>
									</div>
								</div>
							</div>
							<div class="widget-area" style="padding: 3px 3px;">
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
								<div style="background-color: lightgrey; padding: 3px 3px;">
									<span class="head_style">Sale Product at:</span>
								</div>
								<c:choose>
									<c:when test="${salesSearchView.isMRP()==true}">
										<input type="radio" class="chk" name="saleAt" value="mrp"
											id="mrp" style="display: none;" disabled="disabled"
											checked="checked">
										<label for="mrp"></label>MRP
										<input type="radio" disabled="disabled" class="chk"
											name="saleAt" value="wsp" id="wsp" style="display: none;">&nbsp;<label
											for="wsp"></label>WSP
									</c:when>
									<c:otherwise>
										<input type="radio" class="chk" name="saleAt" value="mrp"
											id="mrp" style="display: none;" disabled="disabled">
										<label for="mrp"></label>MRP
										<input type="radio" checked="checked" disabled="disabled"
											class="chk" name="saleAt" value="wsp" id="wsp"
											style="display: none;">&nbsp;<label for="wsp"></label>WSP</c:otherwise>
								</c:choose>
							</div>
							<div class="widget-area">
								<table class="table table-striped table-bordered"
									id="productTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Product code</th>
											<th>Product Description</th>
											<th>Lot No.</th>
											<th>Returned Qty</th>
											<th>Qty.</th>
											<c:choose>
												<c:when test="${salesSearchView.isMRP()==true}">
													<th>MRP/Qty</th>
												</c:when>
												<c:otherwise>
													<th>WSP/Qty</th>
												</c:otherwise>
											</c:choose>
											<th>Total</th>
										</tr>
									</thead>
									<c:set var="i" value="${1}"></c:set>
									<c:forEach var="salesProducts"
										items="${salesSearchView.salesProductDetails}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.code}</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.description}</td>
												<td>${salesProducts.purchase_Product_Details.lotNumber}</td>
												<td>${salesProducts.salesReQty}</td>
												<td>${salesProducts.quantity}</td>
												<c:choose>
													<c:when test="${salesSearchView.isMRP()==true}">
														<td>${salesProducts.salesPrice}</td>
														<td><fmt:formatNumber var="amount"
																value="${salesProducts.quantity*salesProducts.salesPrice}"
																maxFractionDigits="2" groupingUsed="false" /> ${amount}</td>
													</c:when>
													<c:otherwise>
														<td>${salesProducts.salesPrice}</td>
														<td><fmt:formatNumber var="amount"
																value="${salesProducts.quantity*salesProducts.salesPrice}"
																maxFractionDigits="2" groupingUsed="false" /> ${amount}</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</tbody>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</table>

								<table class="table table-striped table-bordered" id="example"
									cellspacing="0" width="100%">

									<thead>
										<tr>
											<th>#</th>
											<th>Return Date</th>
											<th>Sales Return challan no.</th>
											<th>Product Code</th>
											<th>Product Description</th>
											<th>Returning Qty</th>
											<th>Drawback</th>
										</tr>
									</thead>

									<c:set var="j" value="${1}"></c:set>
									<c:forEach var="salesReturn"
										items="${salesSearchView.salesReturn}">

										<tbody>
											<tr>
												<td>${j}</td>
												<td><fmt:formatDate value="${salesReturn.returnDate}"
														pattern="dd-MM-yy" /></td>
												<td><a href="#"
													onclick="viewInvoiceS(${salesReturn.id});"><b>${salesReturn.challanNumber}</b><br>
														<input type="button" class="btn btn-primary small"
														value="Print"></a></td>
												<td><c:forEach var="salesReturnProd"
														items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.salesProductDetails.purchase_Product_Details.productDetail.code}
														<hr>

													</c:forEach></td>
												<td><c:forEach var="salesReturnProd"
														items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.salesProductDetails.purchase_Product_Details.productDetail.description}
														<hr>

													</c:forEach></td>

												<td><c:forEach var="salesReturnProd"
														items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.qtyReturn}
														<hr>

													</c:forEach></td>
												<td><c:forEach var="salesReturnProd"
														items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.fault}
														<hr>

													</c:forEach></td>
											</tr>
										</tbody>
										<c:set var="j" value="${j+1}" />
									</c:forEach>

								</table>

							</div>
							<div style="width: 60%; float: left;">
								<div class="widget-area"
									style="margin-top: 21px; margin-bottom: 21px;">
									<div class="form-group"">
										<label style="font-size: 15px" class="font">Description
											:</label>
										<textarea rows="8" cols="" class="form-control"
											name="salesDesc" id="salesDesc" style="text-align: left;"
											readonly="readonly">
											${salesSearchView.description}
											</textarea>
									</div>
								</div>
								<table>
									<tr>
										<td><input type="button" class="btn btn-primary large"
											value="Print Sales Invoice"
											onclick="viewInvoice(${salesSearchView.id});"></td>
										<td><input type="button" style="margin-left: 15px;"
											class="btn btn-primary large"
											value="Print Invoice for All Details"
											onclick="viewInvoiceSoldOnly(${salesSearchView.id});"></td>
									</tr>
								</table>
							</div>
							<div style="width: 40%; float: right;">
								<input type="hidden" id="totalvalue" name="totalvalue" value="0">
								<table id="stream_table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<td colspan="2" id="sub">Sub Total :</td>
											<td><input type="number" class="form-control"
												readonly="readonly" id="subtotalvalue" name="subtotalvalue"
												value="${salesSearchView.subTotal}"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">Discount &nbsp; <select name="disType"
												id="disType" disabled="disabled">
													<c:choose>
														<c:when test="${salesSearchView.isFlatDiscount()==true}">
															<option value="disFlat">Flat</option>
															<c:set var="dis" value="${salesSearchView.discountValue}"></c:set>
														</c:when>
														<c:otherwise>
															<option value="disPer">%</option>
															<c:set var="dis"
																value="${salesSearchView.subTotal*salesSearchView.discountValue/100}"></c:set>
														</c:otherwise>
													</c:choose>
											</select>
											</td>
											<td><input type="number" class="form-control"
												name="disValue" id="discount" placeholder=""
												readonly="readonly"
												value="<fmt:formatNumber value="${salesSearchView.discountValue}" maxFractionDigits="2" groupingUsed="false" />"></td>
										</tr>
									</tbody>

									<tbody>
										<tr>
											<td colspan="2" id="disc">Discount Value:</td>
											<td><input type="number" class="form-control"
												readonly="readonly" id="discountValue" name="discountValue"
												value="${dis}"></td>
										</tr>

									</tbody>
									<c:choose>
										<c:when test="${salesSearchView.vendor==null}">
											<tbody style="display: none;">
												<tr>
													<td colspan="2">Agent Profit:</td>
													<td>Is Effective On Return:&nbsp; <select
														name="isEffective" id="isEffective" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isEfectiveProfit()==true}">
																	<option>Yes</option>
																</c:when>
																<c:otherwise>
																	<option>No</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
												</tr>
											</tbody>
											<tbody style="display: none;">
												<tr>
													<td colspan="2">Agent Profit: &nbsp; <select
														name="profitType" id="profitType"
														onchange="profitTypeF();" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isFlatProfitAgent()==true}">
																	<option value="profitFlat">Flat</option>
																</c:when>
																<c:otherwise>
																	<option value="profitPer">%</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
													<td><input type="text"
														value="${salesSearchView.agentProfitValue}"
														class="form-control" name="profitVal" id="profitVal"
														placeholder="" readonly="readonly"></td>
												</tr>
											</tbody>
											<tbody style="display: none;">
												<tr>
													<td colspan="2" id="disc">Agent Profit Value:</td>
													<td><input type="text" class="form-control"
														readonly="readonly" id="profitValue" name="profitValue"
														value="${salesSearchView.agentProfitTotal}"></td>
												</tr>
											</tbody>
										</c:when>
										<c:otherwise>
											<tbody>
												<tr>
													<td colspan="2">Agent Profit:</td>
													<td>Is Effective On Return:&nbsp; <select
														name="isEffective" id="isEffective" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isEfectiveProfit()==true}">
																	<option>Yes</option>
																</c:when>
																<c:otherwise>
																	<option>No</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Agent Profit: &nbsp; <select
														name="profitType" id="profitType"
														onchange="profitTypeF();" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isFlatProfitAgent()==true}">
																	<option value="profitFlat">Flat</option>
																</c:when>
																<c:otherwise>
																	<option value="profitPer">%</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
													<td><input type="text"
														value="${salesSearchView.agentProfitValue}"
														class="form-control" name="profitVal" id="profitVal"
														placeholder="" readonly="readonly"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2" id="disc">Agent Profit Value:</td>
													<td><input type="text" class="form-control"
														readonly="readonly" id="profitValue" name="profitValue"
														value="${salesSearchView.agentProfitTotal}"></td>
												</tr>
											</tbody>
										</c:otherwise>
									</c:choose>
									<tbody>
										<tr>
											<td><select class="form-control" id="taxGroup"
												name="taxGroup" disabled="disabled">
													<option>${salesSearchView.tax_Type_Group.name}</option>
											</select></td>
											<td>%</td>
											<td><input type="text" class="form-control"
												readonly="readonly"
												value="${salesSearchView.tax_Type_Group.getTotalTaxValue()}"
												id="taxTot"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2">Tax Amount :</td>
											<td><input type="text" class="form-control"
												readonly="readonly" value="${salesSearchView.taxAmount}"
												id="taxAmount"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2" id="trans">Transport charge :</td>
											<td><input type="number" class="form-control"
												value="${salesSearchView.transportcCharge}" id="transcharge"
												name="transcharge" readonly="readonly"></td>
										</tr>
									</tbody>

									<tbody>
										<tr>
											<td colspan="2" id="sur">Surcharge :</td>
											<td><input type="number" class="form-control"
												value="${salesSearchView.surcharge}" id="surcharge"
												name="surcharge" readonly="readonly"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2" id="round">Round Of :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="roundvalue"
												name="roundvalue" value="${salesSearchView.roundOf}"></td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td colspan="2" id="grand">Grand Total :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="grandtotal"
												name="grandtotal" value="${salesSearchView.totalCost}"></td>
										</tr>
									</thead>
								</table>
							</div>
							<table id="" class="table table-striped table-bordered">
								<thead style="background-color: #F0F0F0;">
									<tr>
										<th>#</th>
										<th>Payment date</th>
										<th>Payment method</th>
										<th>Payment description</th>
										<th>Paid Amount</th>
									</tr>
								</thead>
								<c:set var="j" value="${1}"></c:set>
								<c:forEach var="paymentDetails"
									items="${sessionScope['ejb'].getPaymentDetailsBySalesEntryId(salesSearchView.id)}">
									<tbody>
										<tr>
											<td>${j}</td>
											<td><fmt:formatDate
													value="${paymentDetails.paymentDate}" pattern="dd-MM-yy" />
											</td>
											<c:choose>
												<c:when test="${paymentDetails.paymentType.type!=null}">
													<td>${paymentDetails.paymentType.type}<c:if
															test="${paymentDetails.salesReturn!=null}">
															<br>(Return Value)</c:if>
													</td>
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
								<thead style="background-color: #F0F0F0;">
									<tr>
										<c:set var="lastPayment"
											value="${sessionScope['ejb'].getPaymentDetailsBySalesEntryId(salesSearchView.id).get(0)}"></c:set>
										<th colspan="5">Current Due : <span id="dueAmount">${lastPayment.totalAmount-lastPayment.paidAmount}</span>
											<c:choose>
												<%-- <c:when
													test="${lastPayment.totalAmount-lastPayment.paidAmount>0}"> --%>
												<c:when
													test="${lastPayment.totalAmount-lastPayment.paidAmount!=0}">
													<input type="button" value="Pay"
														class="btn green pull-right" id="payButton"
														onclick="payButtonOCF();">
												</c:when>
												<c:otherwise>
													<input type="button" value="Pay"
														class="btn green pull-right" disabled="disabled">
												</c:otherwise>
											</c:choose>
										</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form role="form" class="sec" method="post" id="paymentForm"
		action="salesPayment">
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
													value="${sessionScope['ejb'].getLastUniqueNoOfPayDet()+1}"></a></li>
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
															<c:if test="${payType.getType()=='Debit Note'}">
																<option value="${payType.getType()}">Debit Note</option>
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
														autocomplete="off"
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
											<!-- <div id="AMi2">
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
											</div> -->
											<div id="AMi2">
												<div>
													<div class="col-md-5">Current Debit Note :</div>
													<div class="col-md-7">
														<input type="text" id="totalDebit" name="totalDebit"
															class="form-control" readonly="readonly" value="0">
													</div>
												</div>
												<div>
													<div class="col-md-5">
														<span id="dORc">Final Debit Note :</span>
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
		<input type="hidden" id="cId" name="cId"
			value="${salesSearchView.customer.id}"> <input type="hidden"
			id="seId" name="seId" value="${salesSearchView.id}"><input
			type="hidden" id="voucherDetailSize" name="voucherDetailSize"
			value="${sessionScope['ejb'].getAllVoucherDetailsBySalesEntryId(salesSearchView.id)}">
	</form>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
	function viewInvoiceS(id){		
		window
		.open(
				"salesReturnInvoiceForPrint.jsp?id="+id,
				'name', 'width=900,height=700').print();
	}
	function viewInvoice(id){			
		window
		.open(
				"salesChallanForSoldOnly.jsp?id="+id,
				'name', 'width=900,height=700').print();
	}
	function viewInvoiceSoldOnly(id){			
		window
		.open(
				"stockSaCha.jsp?id="+id,
				'name', 'width=900,height=700').print();
	}
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#payDetail").hide();
		$("#description").hide();
		$("#AMi2").hide();
	});
	
	function payButtonOCF(){
		$("#paymentModal").modal("show");
		/* $.ajax({
			url : "getCustomerById",
			type : "post",
			dataType : "json",
			data : {
				id : "${salesSearchView.customer.id}"
			},
			success : function(data) {
				$("#totalDebit").val(data.currentDebitNote);
			}
		}); */
		$.ajax({
			type : "post",
			url : "getCurrentDebitNoteByCustomerId",
			data : {
				id : "${salesSearchView.customer.id}"
			},
			dataType : "json",
			success : function(data) {
				$("#totalDebit").val(data.currentDebitNote);
			}
		});
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
			$("#pType").val("-");
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
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
			$("#AMi2").show();
			finalCreditFunc();
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
							"#totalDebit").val())) * 100) / 100);
		}else{
			$("#finalDC").val(
					Math.round((Number($("#totalDebit").val())- Number($("#spPaymentAmount").val())) * 100) / 100);
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
			allowNegative : true,
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
