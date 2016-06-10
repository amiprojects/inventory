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

			<c:if test="${page.name.equals('Debit Note')}">
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
								<h3 style="margin-top: 11px;">Debit Note</h3>
							</div>

							<div class="widget-area">
								<div style="width: 100%; overflow: auto;">
									<table id="note" cellspacing="0" width="100%" class="display">
										<thead>
											<tr>
												<th>#</th>
												<th>Customer Name</th>
												<th>Phone</th>
												<th>City</th>
												<th>Current Debit</th>
												<th></th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach
												items="${sessionScope['ejb'].getAllCustomerEntryByAssendingMaxSale()}"
												var="customer">
												<tr>
													<td>${count}</td>
													<td>${customer.name}</td>
													<td>${customer.mobile}</td>
													<td>${customer.city}</td>
													<td><fmt:formatNumber var="currentDebit"
															value="${sessionScope['ejb'].getLastVoucherDetailsByCustomerId(customer.id).getTotalDebitNote()}"
															maxFractionDigits="2" groupingUsed="false" />
														${currentDebit}</td>
													<td>
														<form action="debitNoteByCustomer" method="post"
															id="dnView${customer.id}">
															<a href="#" onclick="debitNoteViewF('${customer.id}');"><input
																type="hidden" value="${customer.id}" name="cId"><input
																type="hidden" value="${customer.name}" name="custoName"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
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
			$("#debitNote").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		function debitNoteViewF(id) {
			$("#dnView" + id).submit();
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
			var table = $('#note').DataTable({
				"scrollY" : 400,
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
