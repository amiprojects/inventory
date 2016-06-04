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
		$("#sPurchRetSearch").attr("style", "color: #6a94ff;");
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
	<c:set var="purchaseReturn"
		value="${sessionScope['ejb'].getPurchaseReturnById(requestScope['prId'])}" />
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
								<h3 style="margin-top: 11px;">Purchase Return View</h3>

							</div>
							<div class="col-md-12">
								<div class="widget-area">
									<div class="col-md-6">
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <input
												type="text" class="form-control" readonly="readonly"
												name="vendorType" id="vendorType"
												value="${purchaseReturn.purchaseEntry.vendor.vendorType.type}">
										</div>
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
												type="text" class="form-control" id="vName" name="vName"
												readonly="readonly"
												value="${purchaseReturn.purchaseEntry.vendor.name}">
										</div>
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
											<textarea rows="5" cols="" id="vDetail" class="form-control"
												readonly="readonly">
													Address : 
														&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;${purchaseReturn.purchaseEntry.vendor.address}
													Ph1: ${purchaseReturn.purchaseEntry.vendor.ph1}
													Ph2: ${purchaseReturn.purchaseEntry.vendor.ph2}
													</textarea>

										</div>
										<div class="col-md-12">
											<c:choose>
												<c:when test="${purchaseReturn.purchaseEntry.agentId==0}">
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
												<c:when test="${purchaseReturn.purchaseEntry.agentId!=0}">
													<input class="form-control" type="text"
														class="form-control" name="agentName" id="agentName"
														readonly="readonly"
														value="${sessionScope['ejb'].getVendorById(purchaseReturn.purchaseEntry.agentId).getName()}">
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
											<label for="" class="font">Purchase Return challan
												no. :</label> <input readonly="readonly" type="text" placeholder=""
												name="challanNumber" class="form-control"
												value="${purchaseReturn.challanNumber}">
										</div>
										<div class="form-group">
											<label for="" class="font">Reference challan no. :</label> <input
												readonly="readonly" type="text" placeholder=""
												name="challanNumber" class="form-control"
												value="${purchaseReturn.purchaseEntry.challanNumber}">
										</div>
										<div class="form-group">
											<label for="" class="font">Return Date :</label> <input
												type="text" id="datepicker" class="form-control"
												name="purchaseDate" required="required" readonly="readonly"
												value="<fmt:formatDate value="${purchaseReturn.returnDate}"
																			pattern="dd-MM-yyyy" />">
										</div>
										<div class="form-group" id="aDetailDiv">
											<label for="" class="font">Agent Details:</label>
											<c:choose>
												<c:when test="${purchaseReturn.purchaseEntry.agentId!=0}">
													<textarea rows="5" cols="" class="form-control"
														readonly="readonly" id="agentDet" name="agentDet">
															Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${sessionScope['ejb'].getVendorById(purchaseReturn.purchaseEntry.agentId).address}
															Ph1 : ${sessionScope['ejb'].getVendorById(purchaseReturn.purchaseEntry.agentId).ph1}
															Ph2 : ${sessionScope['ejb'].getVendorById(purchaseReturn.purchaseEntry.agentId).ph2}
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
											<th>Returned Qty</th>
											<th>UOM</th>
											<th>Rate</th>
											<th>Amount</th>
										</tr>
									</thead>
									<c:set var="i" value="${1}"></c:set>
									<c:set value="${0}" var="stot" />
									<c:forEach var="purchaseRetProducts"
										items="${purchaseReturn.purchaseReturnProductDetails}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${purchaseRetProducts.purchaseProductDetails.productDetail.code}</td>
												<td>${purchaseRetProducts.purchaseProductDetails.productDetail.description}</td>
												<td>${purchaseRetProducts.purchaseProductDetails.lotNumber}</td>
												<td>${purchaseRetProducts.qtyReturn}</td>
												<td>${purchaseRetProducts.purchaseProductDetails.productDetail.qtyUnit.name}</td>
												<td>${purchaseRetProducts.purchaseProductDetails.cost}</td>
												<td><fmt:formatNumber var="amount"
														value="${purchaseRetProducts.qtyReturn*purchaseRetProducts.purchaseProductDetails.cost}"
														maxFractionDigits="2" groupingUsed="false" />${amount}</td>
											</tr>
										</tbody>
										<c:set var="i" value="${i+1}" />
										<c:set value="${stot+amount}" var="stot" />
									</c:forEach>
								</table>

								<div style="width: 60%; float: left;">
									<table style="float: left; margin-top: 40%;">
										<tr>
											<td><input type="button" class="btn btn-primary large"
												value="Print Purchase Return Challan"
												onclick="viewInvoice(${purchaseReturn.id});"></td>
											<td>&nbsp;&nbsp;&nbsp;<input type="button"
												class="btn btn-primary large"
												value="Print Reference Challan"
												onclick="viewInvoicePEC(${purchaseReturn.purchaseEntry.id});"></td>
										</tr>
									</table>
								</div>
								<div style="width: 40%; float: right;">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2">Sub Total :</td>
												<td><fmt:formatNumber var="subt" value="${stot}"
														maxFractionDigits="2" groupingUsed="false" /> <input
													type="text" class="form-control" id="subTotal"
													value="${subt}" readonly="readonly"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount &nbsp; <select name="disType"
													id="disType" disabled="disabled">
														<c:choose>
															<c:when
																test="${purchaseReturn.purchaseEntry.isFlatDiscount()==true}">
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
													value="<fmt:formatNumber value="${purchaseReturn.purchaseEntry.discountValue}" maxFractionDigits="2" groupingUsed="false" />"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="number" class="form-control"
													readonly="readonly" id="discountValue" name="discountValue"
													value="<fmt:formatNumber value="${stot*purchaseReturn.purchaseEntry.discountTotal/purchaseReturn.purchaseEntry.subTotal}"
													 maxFractionDigits="2" groupingUsed="false" />"></td>
											</tr>

										</tbody>
										<c:choose>
											<c:when
												test="${purchaseReturn.purchaseEntry.isEfectiveProfit()==true && purchaseReturn.purchaseEntry.agentId!=0}">
												<tbody>
													<tr>
														<td colspan="2">Agent Profit: &nbsp; <select
															name="profitType" id="profitType"
															onchange="profitTypeF();" disabled="disabled">
																<c:choose>
																	<c:when
																		test="${purchaseReturn.purchaseEntry.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text"
															value="${purchaseReturn.purchaseEntry.agentProfitValue}"
															class="form-control" name="profitVal" id="profitVal"
															placeholder="" readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="<fmt:formatNumber value="${stot*purchaseReturn.purchaseEntry.agentProfitTotal/purchaseReturn.purchaseEntry.subTotal}"
													 		maxFractionDigits="2" groupingUsed="false" />"></td>
													</tr>
												</tbody>
											</c:when>
											<c:otherwise>
												<tbody style="display: none;">
													<tr>
														<td colspan="2">Agent Profit: &nbsp; <select
															name="profitType" id="profitType"
															onchange="profitTypeF();" disabled="disabled">
																<c:choose>
																	<c:when
																		test="${purchaseReturn.purchaseEntry.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text" value="0" class="form-control"
															name="profitVal" id="profitVal" placeholder=""
															readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody style="display: none;">
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="0"></td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
										<tbody>
											<tr>
												<td>${purchaseReturn.purchaseEntry.tax_Type_Group.name}</td>
												<td>%</td>
												<td><input type="text" class="form-control"
													readonly="readonly"
													value="${purchaseReturn.purchaseEntry.tax_Type_Group.getTotalTaxValue()}"
													id="taxTot"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Tax Amount :</td>
												<td><fmt:formatNumber var="ta"
														value="${stot*purchaseReturn.purchaseEntry.taxAmount/purchaseReturn.purchaseEntry.subTotal}"
														maxFractionDigits="2" groupingUsed="false" /> <input
													type="text" class="form-control" readonly="readonly"
													value="${ta}" id="taxAmount"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="hidden" id="totalvalue"
													name="totalvalue" value="0"><input type="number"
													class="form-control" placeholder="" readonly="readonly"
													id="roundvalue" name="roundvalue"
													value="${purchaseReturn.roundOff}"></td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<td colspan="2">Grand Total :</td>
												<td><input type="text" class="form-control" id="gt"
													placeholder="0" readonly="readonly"
													value="${purchaseReturn.totalReCost}"></td>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Content Sec -->
	</div>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
