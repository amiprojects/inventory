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
								<h3 style="margin-top: 11px;">Purchase Report</h3>
							</div>

							<div class="widget-area">
								<form role="form" class="sec" action="allPurchaseReport"
									method="post" id="allReport">
									<div class="row">
										<div class="col-md-12">
											<button class="btn green pull-right" type="submit"
												style="margin-right: 63px;">Show All</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec" action="purchaseReportByDate"
									method="post">
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">Search between
													two dates : (Start Date)</label> <input type="text"
													placeholder="Enter First Date" id="datepicker"
													class="form-control" name="fDate" id="fDate"
													autocomplete="off" onchange="dateSet();">
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">(End Date)</label> <input
													type="text" placeholder="Enter last date" id="datepicker1"
													class="form-control" name="lDate" id="lDate"
													autocomplete="off" onchange="checkDate();">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>
									</div>
								</form>

								<form role="form" class="sec"
									action="purchaseReportByProductCode" method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Product Code:</label> <input
													type="" placeholder="Enter Product Code" id="prodCode"
													name="prodCode" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseReportByVendorName" method="post">
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
								<form role="form" class="sec" action="purchaseReportByAgentName"
									method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Agent Name :</label> <input
													type="" placeholder="Enter Agent Name" id="agentName"
													name="agentName" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>

									</div>
								</form>
								<br>
								<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
								<br>
								<div style=""></div>
								<table id="stream_table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Purchase Date</th>
											<th>Vendor Name</th>
											<th>Agent Name</th>
											<th>Purchase challan no.</th>
											<th>Vendor Bill no.</th>
											<th>Sub Total</th>
											<th>Tax Amount</th>
											<th>Transport Cost</th>
											<th>Surcharge</th>
											<th>RoundOf</th>
											<th>Grand Total</th>
										</tr>
									</thead>
									<tbody style="height: 300px;">
										<c:set var="count" value="${1}" />
										<c:choose>
											<c:when test="${requestScope['purEntryList']!=null}">
												<c:forEach items="${requestScope['purEntryList']}"
													var="pEntryByD">
													<tr>
														<td>${count}</td>
														<td><fmt:formatDate
																value="${pEntryByD.purchase_date}" pattern="dd-MM-yy" /></td>
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
														<td>${pEntryByD.challanNumber}</td>
														<td>${pEntryByD.vendor_bill_no}</td>
														<td>${pEntryByD.subTotal}</td>
														<td>${pEntryByD.taxAmount}</td>
														<td>${pEntryByD.transport_cost}</td>
														<td>${pEntryByD.sur_charge}</td>
														<td>${pEntryByD.roundOf}</td>
														<td>${pEntryByD.totalCost}</td>
													</tr>
													<c:set var="count" value="${count+1}" />
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${sessionScope['ejb'].getAllPurchaseEntryByCompany()}"
													var="pEntryByD">
													<tr>
														<td>${count}</td>
														<td><fmt:formatDate
																value="${pEntryByD.purchase_date}" pattern="dd-MM-yy" /></td>
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
														<td>${pEntryByD.challanNumber}</td>
														<td>${pEntryByD.vendor_bill_no}</td>
														<td>${pEntryByD.subTotal}</td>
														<td>${pEntryByD.taxAmount}</td>
														<td>${pEntryByD.transport_cost}</td>
														<td>${pEntryByD.sur_charge}</td>
														<td>${pEntryByD.roundOf}</td>
														<td>${pEntryByD.totalCost}</td>
													</tr>
													<c:set var="count" value="${count+1}" />
												</c:forEach>
											</c:otherwise>
										</c:choose>
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
