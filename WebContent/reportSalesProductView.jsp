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
								<h3 style="margin-top: 11px;">Sales Report By Product</h3>
							</div>

							<div class="widget-area">
								<c:set var="prod"
									value="${sessionScope['ejb'].getProductDetailById(requestScope['pId'])}" />
								<table id="stream_table"
									class="table table-striped table-bordered" style="width: 30%;">
									<thead>
										<tr>
											<th style="text-align: right;">Product Code :</th>
											<td>${prod.code}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Product Description :</th>
											<td>${prod.description}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">UOM :</th>
											<td>${prod.qtyUnit.name}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Total Qty (Sold) :</th>
											<td><c:set var="totPurQty" value="${0}"></c:set> <c:forEach
													var="proedPurDet"
													items="${sessionScope['ejb'].getSales_Product_DetailsByProductIdAndCompany(requestScope['pId'])}">
													<c:if test="${proedPurDet.salesEntry!=null}">
														<c:set var="totPurQty"
															value="${totPurQty+proedPurDet.quantity-proedPurDet.salesReQty}"></c:set>
													</c:if>
												</c:forEach> ${totPurQty}</td>
										</tr>
									</thead>
								</table>

								<br>
								<hr style="width: 100%;">
								<br>


								<table id="stream_table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Sales Date</th>
											<th>Customer Name</th>
											<th>Agent Name</th>
											<th>Sales Invoice no.</th>
											<!-- <th>Vendor Bill no.</th> -->
											<th>Qty</th>
											<th>Sub Total</th>
											<th>Discount Value</th>
											<th>Tax Amount</th>
											<!-- <th>Transport Cost</th>
											<th>Surcharge</th>
											<th>RoundOf</th>
											<th>Grand Total</th> -->
											<th></th>
										</tr>
									</thead>
									<tbody style="height: 300px;">
										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['purEntryList']}"
											var="pEntryByD">
											<tr>
												<td>${count}</td>
												<td><fmt:formatDate value="${pEntryByD.sales_date}"
														pattern="dd-MM-yy" /></td>
												<td>${pEntryByD.customer.name}</td>
												<c:choose>
													<c:when test="${pEntryByD.vendor!=null}">
														<td>${pEntryByD.vendor.name}</td>
													</c:when>
													<c:otherwise>
														<td>NIL</td>
													</c:otherwise>
												</c:choose>
												<td>${pEntryByD.challanNumber}</td>
												<%-- <td>${pEntryByD.vendor_bill_no}</td> --%>
												<td><c:set var="totPurQty" value="${0}"></c:set> <c:forEach
														var="proedPurDet" items="${pEntryByD.salesProductDetails}">
														<c:if
															test="${proedPurDet.purchase_Product_Details.productDetail.id==requestScope['pId']}">
															<c:set var="totPurQty"
																value="${totPurQty+proedPurDet.quantity-proedPurDet.salesReQty}"></c:set>
														</c:if>
													</c:forEach> ${totPurQty}</td>
												<td><c:set var="subot" value="${0}"></c:set> <c:forEach
														var="proedPurDet" items="${pEntryByD.salesProductDetails}">
														<c:if
															test="${proedPurDet.purchase_Product_Details.productDetail.id==requestScope['pId']}">
															<c:set var="subot"
																value="${subot+(proedPurDet.quantity-proedPurDet.salesReQty)*proedPurDet.salesPrice}"></c:set>
														</c:if>
													</c:forEach> ${subot}</td>
												<td><c:set var="disVal"
														value="${pEntryByD.isFlatDiscount()?subot*pEntryByD.discountValue/pEntryByD.subTotal:subot*pEntryByD.discountValue/100}" />
													${disVal}</td>
												<td><fmt:formatNumber var="taxAmount"
														value="${subot*pEntryByD.tax_Type_Group.getTotalTaxValue()/100}"
														maxFractionDigits="2" />${taxAmount}</td>
												<%-- <td>${pEntryByD.transport_cost}</td>
												<td>${pEntryByD.sur_charge}</td>
												<td>${pEntryByD.roundOf}</td>
												<td>${pEntryByD.totalCost}</td> --%>
												<td><form action="salesReportView" method="post"
														id="pView${pEntryByD.id}">
														<a href="#" onclick="purchaseViewF('${pEntryByD.id}');"><input
															type="hidden" value="${pEntryByD.id}" name="pId"><img
															alt="" src="images/eye.png" height="25px"></a>
													</form></td>
											</tr>
											<c:set var="count" value="${count+1}" />
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

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#reports").attr("id", "activeSubMenu");
			$("#report").attr("style", "color: #6a94ff;");
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
			if ($("#datepicker1").val() != "" && dt >= dt1) {
				alert("Start date must be before than end date...");
				$("#datepicker").val("");
			}
		}
		function checkDate() {
			var d = $("#datepicker").datepicker('getDate');
			var d1 = $("#datepicker1").datepicker('getDate');
			if ($("#datepicker").val() != "" && d >= d1) {
				alert("End date must be later than start date...");
				$("#datepicker1").val("");
			}
		}
		function purchaseViewF(id) {
			$("#pView" + id).submit();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
