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
<title>Purchase Agent's Credit Note Statement</title>

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

<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/dataTables.searchHighlight.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
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
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Sales Agent's Credit Note
									Statement</h3>
							</div>

							<div class="widget-area">
								<c:set var="vendor"
									value="${sessionScope['ejb'].getVendorById(requestScope['saId'])}" />
								<table id="stream_table"
									class="table table-striped table-bordered" style="width: 30%;">
									<thead>
										<tr>
											<th style="text-align: right;">Vendor Name :</th>
											<td>${vendor.name}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Company Name :</th>
											<td>${vendor.companyName}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Phone1 :</th>
											<td>${vendor.ph1}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Phone2 :</th>
											<td>${vendor.ph2}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Address :</th>
											<td>${vendor.address}</td>
										</tr>
									</thead>
									<thead>
										<tr>
											<th style="text-align: right;">Current Credit :</th>
											<td><fmt:formatNumber var="currentCredit"
													value="${sessionScope['ejb'].getCurrentCreditNote4ViaAgentByAgentId(vendor.id)}"
													maxFractionDigits="2" groupingUsed="false" />
												${currentCredit}</td>
										</tr>
									</thead>
								</table>

								<br>
								<hr style="width: 100%;">
								<br>

								<div style="width: 100%; overflow: auto;">
									<table id="statement" cellspacing="0" width="100%"
										class="display">
										<thead>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Credit/Debit</th>
												<th>Amount</th>
												<th>Purpose</th>
												<th>Reference No.</th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach items="${requestScope['vouDetList']}"
												var="vouDetList">
												<tr>
													<td>${count}</td>
													<td><fmt:formatDate value="${vouDetList.voucherDate}"
															pattern="dd-MM-yy" /></td>
													<td><c:if test="${vouDetList.isCredit()}">Credit</c:if>
														<c:if test="${!vouDetList.isCredit()}">Debit</c:if></td>
													<td>${vouDetList.value}</td>
													<td><c:if test="${vouDetList.salesEntryId!=0}">Sales Payment</c:if></td>
													<td><c:if test="${vouDetList.salesEntryId!=0}">${sessionScope['ejb'].getSalesEntryById(vouDetList.salesEntryId).challanNumber}</c:if>
													</td>
												</tr>
												<c:set var="count" value="${count+1}" />
											</c:forEach>
										</tbody>
										<thead>
											<tr>
												<th colspan="7" style="text-align: left;">Current
													Credit : ${currentCredit}</th>
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
			$("#debitCreditNote").attr("id", "activeSubMenu");
			$("#creditNote").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		function purchaseViewF(id) {
			$("#pView" + id).submit();
		}
	</script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.fixedHeader.min.js"></script>
	<script src="js/buttons.flash.min.js"></script>
	<script src="js/buttons.html5.min.js"></script>
	<script src="js/buttons.print.min.js"></script>
	<script src="js/dataTables.buttons.min.js"></script>
	<script src="js/jszip.min.js"></script>
	<script src="js/vfs_fonts.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/dataTables.searchHighlight.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/jquery.highlight.js"></script>
	<script type="text/javascript" src="js/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#statement').DataTable({
				"scrollY" : 300,
				"scrollX" : true,
				"bPaginate" : false,
				dom : 'Bfrtip',
				buttons : [ 'copy', 'excel', 'print' ]
			});

			table.on('draw', function() {
				var body = $(table.table().body());

				body.unhighlight();
				body.highlight(table.search());
			});
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
