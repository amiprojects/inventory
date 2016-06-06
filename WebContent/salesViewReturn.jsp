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
		$("#sSalesRetSearch").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Sales Return Search')}">
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
	<c:set var="salesReturn"
		value="${sessionScope['ejb'].getSalesReturnDetailsById(requestScope['sId'])}"></c:set>
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales Return View</h3>
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
													value="${salesReturn.salesEntry.customer.name}"></input></td>
											</tr>

											<tr>
												<td>Address :</td>
												<td><input type="text" name="addr" id="addr"
													style="length: 40px;" style="align:center;"
													readonly="readonly"
													value="${salesReturn.salesEntry.customer.address}"></input></td>
											</tr>
											<tr>
												<td>City :</td>
												<td><input type="text" name="city" id="city"
													style="length: 40px;" readonly="readonly"
													value="${salesReturn.salesEntry.customer.city}"></input></td>
											</tr>

											<tr>
												<td>Phone No. :</td>
												<td><input type="number" name="phone" id="phone"
													style="length: 40px;" readonly="readonly"
													value="${salesReturn.salesEntry.customer.mobile}"></input></td>
											</tr>

											<tr>
												<td>Vat No./CST No. :</td>
												<td><input type="text" name="vatcst" id="vatcst"
													style="length: 40px;" readonly="readonly"
													value="${salesReturn.salesEntry.customer.vat_cst_no}"></input></td>
											</tr>
											<tr>
												<td><c:choose>
														<c:when test="${salesReturn.salesEntry.vendor!=null}">
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
													value="${salesReturn.salesEntry.vendor.name}"></input></td>
											</tr>
											<tr id="aDetailsDiv">
												<td>Agent details :</td>
												<td><textarea rows="" cols="" id="aDetail"
														class="form-control" readonly="readonly"
														style="width: 100%;">
														Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${salesReturn.salesEntry.vendor.address}
															Ph1 : ${salesReturn.salesEntry.vendor.ph1}
															Ph2 : ${salesReturn.salesEntry.vendor.ph2}
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
												Return challan no. :</label> <input readonly="readonly" type="text"
												placeholder="" name="challanNumber" class="form-control"
												value="${salesReturn.challanNumber}">
										</div>

										<div class="form-group">
											<label style="font-size: 15px" class="font">Reference
												challan no. :</label> <input readonly="readonly" type="text"
												placeholder="" name="challanNumber" class="form-control"
												value="${salesReturn.salesEntry.challanNumber}">
										</div>

										<div class="form-group">
											<label style="font-size: 15px" class="font">Return
												Date :</label> <input class="form-control" type="text"
												name="salesDate" id="datepicker" readonly="readonly"
												value='<fmt:formatDate value="${salesReturn.returnDate}" pattern="dd-MM-yyyy"/>'>

										</div>
									</div>
								</div>
							</div>
							<div class="widget-area" style="padding: 3px 3px;">
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
								<div style="background-color: lightgrey; padding: 3px 3px;">
									<span class="head_style">Sold Product at:</span>
								</div>
								<c:choose>
									<c:when test="${salesReturn.salesEntry.isMRP()==true}">
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
											<th>Returned Qty.</th>
											<c:choose>
												<c:when test="${salesReturn.salesEntry.isMRP()==true}">
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
									<c:set var="subTotal" value="0"></c:set>
									<c:forEach var="salesRetProducts"
										items="${salesReturn.salesProductReturnDetail}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${salesRetProducts.salesProductDetails.purchase_Product_Details.productDetail.code}</td>
												<td>${salesRetProducts.salesProductDetails.purchase_Product_Details.productDetail.description}</td>
												<td>${salesRetProducts.salesProductDetails.purchase_Product_Details.lotNumber}</td>
												<td>${salesRetProducts.qtyReturn}</td>
												<td>${salesRetProducts.salesProductDetails.salesPrice}</td>
												<td><fmt:formatNumber var="amount"
														value="${salesRetProducts.qtyReturn*salesRetProducts.salesProductDetails.salesPrice}"
														maxFractionDigits="2" groupingUsed="false" /> ${amount} <c:set
														var="subTotal" value="${subTotal+amount}"></c:set></td>
											</tr>
										</tbody>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</table>
							</div>
							<div style="width: 60%; float: left;">
								<table style="float: left; margin-top: 30%;">
									<tr>
										<td><input type="button" class="btn btn-primary large"
											value="Print Sales Return Invoice"
											onclick="viewInvoiceR(${salesReturn.id});"></td>
										<td><input type="button" style="margin-left: 15px;"
											class="btn btn-primary large" value="Print Reference Invoice"
											onclick="viewInvoice(${salesReturn.salesEntry.id});"></td>
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
												value="${subTotal}"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">Discount &nbsp; <select name="disType"
												id="disType" disabled="disabled">
													<c:choose>
														<c:when
															test="${salesReturn.salesEntry.isFlatDiscount()==true}">
															<option value="disFlat">Flat</option>
															<c:set var="dis"
																value="${subTotal*salesReturn.salesEntry.discountValue/salesReturn.salesEntry.subTotal}"></c:set>
														</c:when>
														<c:otherwise>
															<option value="disPer">%</option>
															<c:set var="dis"
																value="${subTotal*salesReturn.salesEntry.discountValue/100}"></c:set>
														</c:otherwise>
													</c:choose>
											</select>
											</td>
											<td><input type="number" class="form-control"
												name="disValue" id="discount" placeholder=""
												readonly="readonly"
												value="<fmt:formatNumber value="${salesReturn.salesEntry.discountValue}" maxFractionDigits="2" groupingUsed="false" />"></td>
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
									<c:if
										test="${salesReturn.salesEntry.isEfectiveProfit()==true && salesReturn.salesEntry.vendor!=null}">
										<tbody>
											<tr>
												<td colspan="2">Agent Profit: &nbsp; <select
													name="profitType" id="profitType" onchange="profitTypeF();"
													disabled="disabled">
														<c:choose>
															<c:when
																test="${salesReturn.salesEntry.isFlatProfitAgent()==true}">
																<option value="profitFlat">Flat</option>
															</c:when>
															<c:otherwise>
																<option value="profitPer">%</option>
															</c:otherwise>
														</c:choose>
												</select>
												</td>
												<td><input type="text"
													value="${salesReturn.salesEntry.agentProfitValue}"
													class="form-control" name="profitVal" id="profitVal"
													placeholder="" readonly="readonly"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="disc">Agent Profit Value:</td>
												<td><input type="text" class="form-control"
													readonly="readonly" id="profitValue" name="profitValue"
													value="${salesReturn.retAgentProfitTotal}"></td>
											</tr>
										</tbody>
									</c:if>
									<tbody>
										<tr>
											<td><select class="form-control" id="taxGroup"
												name="taxGroup" disabled="disabled">
													<option>${salesReturn.salesEntry.tax_Type_Group.name}</option>
											</select></td>
											<td>%</td>
											<td><input type="text" class="form-control"
												readonly="readonly"
												value="${salesReturn.salesEntry.tax_Type_Group.getTotalTaxValue()}"
												id="taxTot"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2">Tax Amount :</td>
											<td><input type="text" class="form-control"
												readonly="readonly"
												value="<fmt:formatNumber value="${(subTotal-dis)*salesReturn.salesEntry.tax_Type_Group.getTotalTaxValue()/100}" maxFractionDigits="2" groupingUsed="false" />"
												id="taxAmount"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2" id="round">Round Of :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="roundvalue"
												name="roundvalue" value="${salesReturn.roundOff}"></td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td colspan="2" id="grand">Grand Total :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="grandtotal"
												name="grandtotal" value="${salesReturn.totalReCost}"></td>
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
		function viewInvoiceR(id) {
			window.open("salesReturnInvoiceForPrint.jsp?id=" + id, 'name',
					'width=900,height=700').print();
		}
		function viewInvoice(id) {
			window.open("stockSaCha.jsp?id=" + id, 'name',
					'width=900,height=700').print();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
