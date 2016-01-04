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
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>

	<c:if test="${!sessionScope['user'].equals('admin')}">
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
								<h3 style="margin-top: 11px;">Purchase Search</h3>

								<div class="widget-area">
									<form role="form" class="sec" action="purchaseSearchByDate">
										<!-- <div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Purchase challan no. :</label> <input type=""
														placeholder="Enter Purchase Entry Number" id=""
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Vendor Bill no. :</label> <input type=""
														placeholder="Enter Vendor SO :" id="" class="form-control">
												</div>
											</div>
										</div> -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Search between two dates : (Start
														Date)</label> <input type="text" placeholder="Enter First Date"
														id="datepicker" class="form-control" name="fDate"
														id="fDate">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="">(End Date)</label> <input type="text"
														placeholder="Enter last date" id="datepicker1"
														class="form-control" name="lDate" id="lDate">
												</div>
											</div>
										</div>
										<!-- <div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label for="">Product code :</label> <input type=""
														placeholder="Enter Product code" id=""
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Vendor Name:</label> <input type=""
														placeholder="Enter Vendor Name" id="" class="form-control">
												</div>
											</div>
										</div> -->
										<button class="btn green pull-right" type="submit">Search</button>
									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Purchase challan no.</th>
												<th>Vendor Name</th>
												<th>Agent Name</th>
												<th>Vendor Bill no.</th>
												<th>Purchase Date</th>
												<th>Total Amount</th>
												<th>Barcode</th>
											</tr>
										</thead>

										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['purEntryList']}"
											var="pEntryByD">
											<tbody>
												<tr>
													<td>${count}</td>
													<td>${pEntryByD.challanNumber}</td>
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
													<td>${pEntryByD.vendor_bill_no}</td>
													<td><fmt:formatDate value="${pEntryByD.purchase_date}"
															pattern="dd-MM-yy" /></td>
													<td>${pEntryByD.totalCost}</td>
													<td><a href="printBarcode.jsp?id=${pEntryByD.id}">
															<img alt="click to view" src="Capture.PNG" height="20">
													</a></td>
													<td>
														<form action="purchaseView" method="post"
															id="pView${pEntryByD.id}">

															<a href="#" onclick="purchaseViewF('${pEntryByD.id}');"><input
																type="hidden" value="${pEntryByD.id}" name="pId"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
												</tr>
											</tbody>
											<c:set var="count" value="${count+1}" />
										</c:forEach>
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
			$("#purch").attr("id", "activeSubMenu");
			$("#sPurchSearch").attr("style", "color: red;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
	</script>
	<script>
		$(function() {
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		function purchaseViewF(id) {
			$("#pView" + id).submit();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>