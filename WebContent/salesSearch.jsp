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
								<h3 style="margin-top: 11px;">Sales Search</h3>
							</div>
							<div class="widget-area">
								<div class="col-md-12">
									<form role="form" class="sec" action="salesSearchByDate"
										method="post">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label for="">Search between two dates : (Start
														Date)</label> <input type="text" placeholder="Enter First Date"
														id="datepicker" class="form-control" name="fDate"
														id="fDate">
												</div>
											</div>
											<div class="col-md-5">
												<div class="form-group">
													<label for="">(End Date)</label> <input type="text"
														placeholder="Enter last date" id="datepicker1"
														class="form-control" name="lDate" id="lDate">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchBySalesChallanNo" method="post">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="" style="float: left;">Sales challan
														no. :</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-1"
												style="margin-right: 0; padding-right: 0;">
												<input type="text" class="form-control" readonly="readonly"
													name="companyInitial"
													value="${sessionScope['ejb'].getLastBillSetupBySufix('INV').companyInitial}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<select class="form-control" name="fynYear">
													<c:forEach
														items="${sessionScope['ejb'].getAllFinancialForSales()}"
														var="fyr">
														<option value="${fyr}">${fyr}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<!-- <input type="text" class="form-control" name="month"> -->
												<select name="month" class="form-control">
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<div class="col-md-1" style="margin: 0; padding: 0;">
												<input type="text" class="form-control" readonly="readonly"
													name="billType"
													value="${sessionScope['ejb'].getLastBillSetupBySufix('INV').billType}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<input type="text" class="form-control" name="autoNum">
											</div>
											<div class="col-md-2"
												style="margin-left: 0; padding-left: 0;">
												<input type="text" class="form-control" name="suffix">
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left" type="submit">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec" action="salesSearchByAgentName"
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
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>

										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchByCustomerName" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Customer Name :</label>
													<input type="" placeholder="Enter Customer Name"
														id="custoName" name="custoName" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>

										</div>
									</form>
									<form role="form" class="sec" action="salesSearchByProductCode"
										method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Product code :</label> <input
														type="" placeholder="Enter Product code" id="prodCode"
														name="prodCode" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>
										</div>
									</form>
									<br>
									<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
									<br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Sales challan no.</th>
												<th>Customer Name</th>
												<th>Agent Name</th>
												<th>Sales Date</th>
												<th>Total Amount</th>
												<!-- <th>Barcode</th> -->
											</tr>
										</thead>

										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['salesEntryLst']}"
											var="sEntryByD">
											<tbody>
												<tr>
													<td>${count}</td>
													<td>${sEntryByD.challanNumber}</td>
													<td>${sEntryByD.customer.name}</td>
													<c:choose>
														<c:when test="${sEntryByD.vendor==null}">
															<td>NIL</td>
														</c:when>
														<c:otherwise>
															<td>${sEntryByD.vendor.name}</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatDate value="${sEntryByD.sales_date}"
															pattern="dd-MM-yy" /></td>
													<td>${sEntryByD.totalCost}</td>
													<td>
														<form action="salesView" method="post"
															id="sView${sEntryByD.id}">

															<a href="#" onclick="salesViewF('${sEntryByD.id}');"><input
																type="hidden" value="${sEntryByD.id}" name="sId"><img
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
			<!-- Content Sec -->
		</div>
		<!-- Page Container -->
	</div>
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
			$("#sales").attr("id", "activeSubMenu");
			$("#sSalesSearch").attr("style", "color: #6a94ff;");
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
		function salesViewF(id) {
			$("#sView" + id).submit();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>