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
		$("#sPurchSearch").attr("style", "color: #6a94ff;");
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
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Purchase Search')}">
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
	<c:set var="purchaseSearchView"
		value="${sessionScope['ejb'].getPurchaseEntryById(requestScope['pId'])}" />
	<div class="main" style="height: 664px;">
		<%@include file="includeLeftOrTop.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Purchase View</h3>

							</div>
							<div class="col-md-12">
								<div class="widget-area">
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
												value="${purchaseSearchView.vendor.name}">
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
												class="form-control" name="vendorBillNo" readonly="readonly"
												value="${purchaseSearchView.vendor_bill_no}">
										</div>
										<div class="form-group">
											<label for="" class="font">Purchase challan no. :</label> <input
												readonly="readonly" type="text" placeholder=""
												name="challanNumber" class="form-control"
												value="${purchaseSearchView.challanNumber}">
										</div>
										<div class="form-group">
											<label for="" class="font">Purchase Date :</label> <input
												type="text" id="datepicker" class="form-control"
												name="purchaseDate" required="required" readonly="readonly"
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
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>
								</div>

								<table id="" class="table table-striped table-bordered">
									<thead style="background-color: #F0F0F0;">
										<tr>
											<th>#</th>
											<th>Product Code:</th>
											<th>Product Description</th>
											<th>Lot No.</th>
											<th>WSP</th>
											<th>MRP</th>
											<th>Qty</th>
											<th>UOM</th>
											<th>Rate</th>
											<th>Amount</th>
										</tr>
									</thead>
									<c:set var="i" value="${1}"></c:set>
									<c:forEach var="purchaseProducts"
										items="${purchaseSearchView.purchase_Product_Details}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${purchaseProducts.productDetail.code}</td>
												<td>${purchaseProducts.productDetail.description}</td>
												<td>${purchaseProducts.lotNumber}</td>
												<td>${purchaseProducts.wsp}</td>
												<td>${purchaseProducts.mrp}</td>
												<td>${purchaseProducts.quantity}</td>
												<td>${purchaseProducts.productDetail.qtyUnit.name}</td>
												<td>${purchaseProducts.cost}</td>
												<td><fmt:formatNumber var="amount"
														value="${purchaseProducts.quantity*purchaseProducts.cost}"
														maxFractionDigits="2" />${amount}</td>
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
												<td><a href="#"
													onclick="viewInvoice(${purchaseReturn.id});"><b>${purchaseReturn.challanNumber}</b><br>
														<input type="button" class="btn btn-primary small"
														value="Print"></a></td>
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

								<div style="width: 60%; float: left;">
									<table style="float: left; margin-top: 60%;">
										<tr>
											<td><input type="button" class="btn btn-primary large"
												value="Print"
												onclick="viewInvoicePEC(${purchaseSearchView.id});"></td>
										</tr>
									</table>
								</div>
								<div style="width: 40%; float: right;">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2">Sub Total :</td>
												<td><fmt:formatNumber var="subt"
														value="${purchaseSearchView.subTotal}"
														maxFractionDigits="2" /> <input type="text"
													class="form-control" id="subTotal" value="${subt}"
													readonly="readonly"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount &nbsp; <select name="disType"
													id="disType" disabled="disabled">
														<c:choose>
															<c:when
																test="${purchaseSearchView.isFlatDiscount()==true}">
																<option value="disFlat">Flat</option>
															</c:when>
															<c:otherwise>
																<option value="disPer">%</option>
															</c:otherwise>
														</c:choose>
												</select>
												</td>
												<td><input type="number" class="form-control"
													name="disValue" id="discount" placeholder=""
													readonly="readonly"
													value="<fmt:formatNumber value="${purchaseSearchView.discountValue}" maxFractionDigits="2" />"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="number" class="form-control"
													readonly="readonly" id="discountValue" name="discountValue"
													value="<fmt:formatNumber value="${purchaseSearchView.discountTotal}" maxFractionDigits="2" />"></td>
											</tr>

										</tbody>
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
												<td><fmt:formatNumber var="ta"
														value="${purchaseSearchView.taxAmount}"
														maxFractionDigits="2" /> <input type="text"
													class="form-control" readonly="readonly" value="${ta}"
													id="taxAmount"></td>
											</tr>
										</tbody>
										<c:choose>
											<c:when test="${purchaseSearchView.agentId==0}">
												<tbody style="display: none;">
													<tr>
														<td colspan="2">Agent Profit:</td>
														<td>Is Effective On Return:&nbsp; <select
															name="isEffective" id="isEffective" disabled="disabled">
																<c:choose>
																	<c:when
																		test="${purchaseSearchView.isEfectiveProfit()==true}">
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
																		test="${purchaseSearchView.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text"
															value="${purchaseSearchView.agentProfitValue}"
															class="form-control" name="profitVal" id="profitVal"
															placeholder="" readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody style="display: none;">
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="${purchaseSearchView.agentProfitTotal}"></td>
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
																		test="${purchaseSearchView.isEfectiveProfit()==true}">
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
																		test="${purchaseSearchView.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text"
															value="${purchaseSearchView.agentProfitValue}"
															class="form-control" name="profitVal" id="profitVal"
															placeholder="" readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="${purchaseSearchView.agentProfitTotal}"></td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
										<tbody>
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
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="hidden" id="totalvalue"
													name="totalvalue" value="0"><input type="number"
													class="form-control" placeholder="" readonly="readonly"
													id="roundvalue" name="roundvalue"
													value="${purchaseSearchView.roundOf}"></td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<td colspan="2">Grand Total :</td>
												<td><input type="text" class="form-control" id="gt"
													placeholder="0" readonly="readonly"
													value="${purchaseSearchView.totalCost}"></td>
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
										items="${purchaseSearchView.paymentDetails}">
										<tbody>
											<tr>
												<td>${j}</td>
												<td><fmt:formatDate
														value="${paymentDetails.paymentDate}" pattern="dd-MM-yy" />
												</td>
												<c:choose>
													<c:when test="${paymentDetails.paymentType.type!=null}">
														<td>${paymentDetails.paymentType.type}<c:if
																test="${paymentDetails.purchaseReturn!=null}">
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
												value="${sessionScope['ejb'].getPaymentDetailsByPurchaseEntryId(purchaseSearchView.id).get(0)}"></c:set>
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
		<!-- Content Sec -->
	</div>
	<form role="form" class="sec" method="post" id="paymentForm"
		action="purchasePayment">
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
											<li><a title="">Select Payment status : </a></li>
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
															<c:if test="${payType.getType()=='Credit Note'}">
																<option value="${payType.getType()}">Credit
																	Note</option>
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
		<input type="hidden" id="vId" name="vId"
			value="${purchaseSearchView.vendor.id}"> <input type="hidden"
			id="peId" name="peId" value="${purchaseSearchView.id}"><input
			type="hidden" id="voucherDetailSize" name="voucherDetailSize"
			value="${sessionScope['ejb'].getAllVoucherDetailsByPurchaseEntryId(purchaseSearchView.id)}">
	</form>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
	function viewInvoice(id){
		window
		.open(
				"purchaseReturnChallanForPrint.jsp?id="+id,
				'name', 'width=900,height=700').print();		
	}
	function viewInvoicePEC(id){
		window
		.open(
				"stockPurCha.jsp?id="+id,
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
		$.ajax({
			url : "getVendorByVendorId",
			type : "post",
			dataType : "json",
			data : {
				id : "${purchaseSearchView.vendor.id}"
			},
			success : function(data) {
				$("#totalCredit").val(data.currentCreditNote);
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
