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

			<c:if test="${page.name.equals('Sales Entry')}">
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
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
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
									<%-- <c:set var="subTotal" value="0"></c:set> --%>
									<c:forEach var="salesProducts"
										items="${salesSearchView.salesProductDetails}">
										<tbody>
											<tr>
												<td>${i}</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.code}</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.description}</td>
												<td>${salesProducts.quantity}</td>
												<c:choose>
													<c:when test="${salesSearchView.isMRP()==true}">
														<td>${salesProducts.purchase_Product_Details.mrp}</td>
														<td><fmt:formatNumber var="amount"
																value="${salesProducts.quantity*salesProducts.purchase_Product_Details.mrp}"
																maxFractionDigits="2" /> ${amount}</td>
														<%-- <c:set var="subTotal"
															value="${subTotal+salesProducts.quantity*salesProducts.purchase_Product_Details.mrp}"></c:set> --%>
													</c:when>
													<c:otherwise>
														<td>${salesProducts.purchase_Product_Details.wsp}</td>
														<td><fmt:formatNumber var="amount"
																value="${salesProducts.quantity*salesProducts.purchase_Product_Details.wsp}"
																maxFractionDigits="2" /> ${amount}</td>
														<%-- <c:set var="subTotal"
															value="${subTotal+salesProducts.quantity*salesProducts.purchase_Product_Details.wsp}"></c:set> --%>
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
												<td>${salesReturn.challanNumber}</td>
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
							<div style="width: 40%; float: right;">
								<input type="hidden" id="totalvalue" name="totalvalue" value="0">
								<table id="stream_table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<td colspan="2" id="sub">Sub Total :</td>
											<td>
												<%-- <input type="number" class="form-control"
												readonly="readonly" id="subtotalvalue" name="subtotalvalue"
												value="${subTotal}"> --%> <input type="number"
												class="form-control" readonly="readonly" id="subtotalvalue"
												name="subtotalvalue" value="${salesSearchView.subTotal}">
											</td>
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
															<%-- <c:set var="dis"
																value="${salesSearchView.discountValue*100/subTotal}"></c:set> --%>
															<c:set var="dis"
																value="${salesSearchView.subTotal*salesSearchView.discountValue/100}"></c:set>
														</c:otherwise>
													</c:choose>
											</select>
											</td>
											<td><input type="number" class="form-control"
												name="disValue" id="discount" placeholder=""
												readonly="readonly"
												value="<fmt:formatNumber value="${salesSearchView.discountValue}" maxFractionDigits="2" />"></td>
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
											<td>
												<%-- <input type="text" class="form-control"
												readonly="readonly"
												value="${subTotal*salesSearchView.tax_Type_Group.getTotalTaxValue()/100}"
												id="taxAmount"> --%> <input type="text" class="form-control"
												readonly="readonly" value="${salesSearchView.taxAmount}"
												id="taxAmount">
											</td>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
