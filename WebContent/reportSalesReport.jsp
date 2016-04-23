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
						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales Report</h3>
						</div>

						<div class="widget-area">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#byProd">By
										Product</a></li>
								<li><a data-toggle="tab" href="#byCustomer">By Customer</a></li>
								<li><a data-toggle="tab" href="#byAgent">By Agent</a></li>
							</ul>
							<div class="tab-content">
								<div id="byProd" class="tab-pane fade active in">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Product Code</th>
												<th>Product Description</th>
												<th>Total Qty (Sold)</th>
												<th>UOM</th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach
												items="${sessionScope['ejb'].getAllProductDetailByAssendingProduct()}"
												var="prod">
												<tr>
													<td>${count}</td>
													<td>${prod.code}</td>
													<td>${prod.description}</td>
													<td><c:set var="totPurQty" value="${0}"></c:set> <c:forEach
															var="proedPurDet"
															items="${sessionScope['ejb'].getSales_Product_DetailsByProductIdAndCompany(prod.id)}">
															<c:if test="${proedPurDet.salesEntry!=null}">
																<c:set var="totPurQty"
																	value="${totPurQty+proedPurDet.quantity-proedPurDet.salesReQty}"></c:set>
															</c:if>
														</c:forEach> ${totPurQty}</td>
													<td>${prod.qtyUnit.name}</td>
													<td>
														<form action="salesProductView" method="post"
															id="pView${prod.id}">
															<a href="#" onclick="purchaseViewF('${prod.id}');"><input
																type="hidden" value="${prod.id}" name="pId"><input
																type="hidden" value="${prod.code}" name="prodCode"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
												</tr>
												<c:set var="count" value="${count+1}" />
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="byCustomer" class="tab-pane fade ">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Customer Name</th>
												<th>Phone</th>
												<th>City</th>
												<th>Sub Total</th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach
												items="${sessionScope['ejb'].getAllCustomerEntryByAssendingMaxSale()}"
												var="vendor">
												<tr>
													<td>${count}</td>
													<td>${vendor.name}</td>
													<td>${vendor.mobile}</td>
													<td>${vendor.city}</td>
													<td>${vendor.getTotSale()}</td>
													<td>
														<form action="salesReportByCustomerName" method="post"
															id="pView${vendor.id}">
															<a href="#" onclick="purchaseViewF('${vendor.id}');"><input
																type="hidden" value="${vendor.id}" name="pId"><input
																type="hidden" value="${vendor.name}" name="custoName"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
												</tr>
												<c:set var="count" value="${count+1}" />
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="byAgent" class="tab-pane fade ">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Agent Name</th>
												<th>Company Name</th>
												<th>Phone</th>
												<th>Sub Total</th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach
												items="${sessionScope['ejb'].getAllAgentsByAssendingMaxSale()}"
												var="vendor">
												<c:if test="${vendor.vendorType.type=='Sales Agent'}">
													<tr>
														<td>${count}</td>
														<td>${vendor.name}</td>
														<td>${vendor.companyName}</td>
														<td>${vendor.ph1}</td>
														<td>${vendor.getTotSale()}</td>
														<td>
															<form action="salesReportByAgentName" method="post"
																id="pView${vendor.id}">
																<a href="#" onclick="purchaseViewF('${vendor.id}');"><input
																	type="hidden" value="${vendor.id}" name="pId"><input
																	type="hidden" value="${vendor.name}" name="agentName"><img
																	alt="" src="images/eye.png" height="25px"></a>
															</form>
														</td>
													</tr>
												</c:if>
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
