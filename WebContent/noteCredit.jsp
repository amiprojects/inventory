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
								<h3 style="margin-top: 11px;">Credit Note</h3>
							</div>

							<div class="widget-area">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#byVendor">Vendor</a></li>
									<li><a data-toggle="tab" href="#byDirectPAgent">Purchase
											Agent (Direct)</a></li>
									<li><a data-toggle="tab" href="#byJobber">Jobber</a></li>
									<!-- <li><a data-toggle="tab" href="#bySalesAgent">Sales
											Agent</a></li>
									<li><a data-toggle="tab" href="#byViaPAgent">Purchase
											Agent (Via)</a></li> -->
								</ul>
								<div class="tab-content">
									<div id="byVendor" class="tab-pane fade active in">
										<br>
										<table cellspacing="0" width="100%" class="display note">
											<thead>
												<tr>
													<th>#</th>
													<th>Vendor Name</th>
													<th>Company Name</th>
													<th>Phone1</th>
													<th>Phone2</th>
													<th>Current Credit</th>
													<th></th>
												</tr>
											</thead>
											<tbody style="height: 300px;">
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllVendorsByAssendingMaxPurchase('Vendor')}"
													var="vendor">
													<c:if test="${vendor.vendorType.type=='Vendor'}">
														<c:if test="${vendor.name!='Production Vendor'}">
															<tr>
																<td>${count}</td>
																<td>${vendor.name}</td>
																<td>${vendor.companyName}</td>
																<td>${vendor.ph1}</td>
																<td>${vendor.ph2}</td>
																<td><fmt:formatNumber var="currentCredit"
																		value="${sessionScope['ejb'].getLastVoucherDetailsByVendorId(vendor.id).getTotalCreditNote()}"
																		maxFractionDigits="2" groupingUsed="false" />
																	${currentCredit}</td>
																<td>
																	<form action="creditNoteByVendorName" method="post"
																		id="cnView${vendor.id}">
																		<a href="#" onclick="creditNoteViewF('${vendor.id}');"><input
																			type="hidden" value="${vendor.id}" name="vId"><input
																			type="hidden" value="${vendor.name}"
																			name="vendorName"><img alt=""
																			src="images/eye.png" height="25px"></a>
																	</form>
																</td>
															</tr>
														</c:if>
													</c:if>
													<c:set var="count" value="${count+1}" />
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div id="byDirectPAgent" class="tab-pane fade active">
										<br>
										<table cellspacing="0" width="100%" class="display note">
											<thead>
												<tr>
													<th>#</th>
													<th>Agent Name</th>
													<th>Company Name</th>
													<th>Phone1</th>
													<th>Phone2</th>
													<th>Current Credit</th>
													<th></th>
												</tr>
											</thead>
											<tbody style="height: 300px;">
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllVendorsByAssendingMaxPurchase('Purchase Agent')}"
													var="vendor">
													<c:if test="${vendor.vendorType.type=='Purchase Agent'}">
														<tr>
															<td>${count}</td>
															<td>${vendor.name}</td>
															<td>${vendor.companyName}</td>
															<td>${vendor.ph1}</td>
															<td>${vendor.ph2}</td>
															<td><fmt:formatNumber var="currentCredit"
																	value="${sessionScope['ejb'].getLastVoucherDetailsByVendorId(vendor.id).getTotalCreditNote()}"
																	maxFractionDigits="2" groupingUsed="false" />
																${currentCredit}</td>
															<td>
																<form action="creditNoteByAgentName" method="post"
																	id="cnView${vendor.id}">
																	<a href="#" onclick="creditNoteViewF('${vendor.id}');"><input
																		type="hidden" value="${vendor.id}" name="paId"><input
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
									<div id="byJobber" class="tab-pane fade active">
										<br>
										<table cellspacing="0" width="100%" class="display note">
											<thead>
												<tr>
													<th>#</th>
													<th>Jobber Name</th>
													<th>Company Name</th>
													<th>Phone1</th>
													<th>Phone2</th>
													<th>Current Credit</th>
													<th></th>
												</tr>
											</thead>
											<tbody style="height: 300px;">
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllVendorsByType('Jobber')}"
													var="vendor">
													<c:if test="${vendor.vendorType.type=='Jobber'}">
														<tr>
															<td>${count}</td>
															<td>${vendor.name}</td>
															<td>${vendor.companyName}</td>
															<td>${vendor.ph1}</td>
															<td>${vendor.ph2}</td>
															<td><fmt:formatNumber var="currentCredit"
																	value="${sessionScope['ejb'].getLastVoucherDetailsByVendorId(vendor.id).getTotalCreditNote()}"
																	maxFractionDigits="2" groupingUsed="false" />
																${currentCredit}</td>
															<td>
																<form action="creditNoteByJobber" method="post"
																	id="cnView${vendor.id}">
																	<a href="#" onclick="creditNoteViewF('${vendor.id}');"><input
																		type="hidden" value="${vendor.id}" name="jId"><input
																		type="hidden" value="${vendor.name}" name="jobberName"><img
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
									<div id="bySalesAgent" class="tab-pane fade active">
										<br>
										<table cellspacing="0" width="100%" class="display note">
											<thead>
												<tr>
													<th>#</th>
													<th>Agent Name</th>
													<th>Company Name</th>
													<th>Phone1</th>
													<th>Phone2</th>
													<th>Current Credit</th>
													<th></th>
												</tr>
											</thead>
											<tbody style="height: 300px;">
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllVendorsByAssendingMaxPurchase('Sales Agent')}"
													var="vendor">
													<c:if test="${vendor.vendorType.type=='Sales Agent'}">
														<tr>
															<td>${count}</td>
															<td>${vendor.name}</td>
															<td>${vendor.companyName}</td>
															<td>${vendor.ph1}</td>
															<td>${vendor.ph2}</td>
															<td><fmt:formatNumber var="currentCredit"
																	value="${sessionScope['ejb'].getCurrentCreditNote4ViaAgentByAgentId(vendor.id)}"
																	maxFractionDigits="2" groupingUsed="false" />
																${currentCredit}</td>
															<td>
																<form action="creditNoteBySalesAgentName" method="post"
																	id="cnView${vendor.id}">
																	<a href="#" onclick="creditNoteViewF('${vendor.id}');"><input
																		type="hidden" value="${vendor.id}" name="saId"><input
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
									<div id="byViaPAgent" class="tab-pane fade active">
										<br>
										<table cellspacing="0" width="100%" class="display note">
											<thead>
												<tr>
													<th>#</th>
													<th>Agent Name</th>
													<th>Company Name</th>
													<th>Phone1</th>
													<th>Phone2</th>
													<th>Current Credit</th>
													<th></th>
												</tr>
											</thead>
											<tbody style="height: 300px;">
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllVendorsByAssendingMaxPurchase('Purchase Agent')}"
													var="vendor">
													<c:if test="${vendor.vendorType.type=='Purchase Agent'}">
														<tr>
															<td>${count}</td>
															<td>${vendor.name}</td>
															<td>${vendor.companyName}</td>
															<td>${vendor.ph1}</td>
															<td>${vendor.ph2}</td>
															<td><fmt:formatNumber var="currentCredit"
																	value="${sessionScope['ejb'].getCurrentCreditNote4ViaAgentByAgentId(vendor.id)}"
																	maxFractionDigits="2" groupingUsed="false" />
																${currentCredit}</td>
															<td>
																<form action="creditNoteByViaPurchaseAgentName"
																	method="post" id="cnViewVPA${vendor.id}">
																	<a href="#"
																		onclick="creditNoteViewFVPA('${vendor.id}');"><input
																		type="hidden" value="${vendor.id}" name="paId"><input
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$("#debitCreditNote").attr("id", "activeSubMenu");
			$("#creditNote").attr("style", "color: #6a94ff;");
		});
		function creditNoteViewF(id) {
			$("#cnView" + id).submit();
		}
		function creditNoteViewFVPA(id) {
			$("#cnViewVPA" + id).submit();
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
			var table = $('.note').DataTable({
				"scrollY" : 300,
				"scrollX" : true,
				"bPaginate" : false,
				dom : 'Bfrtip',
				buttons : [ 'copy', 'excel', 'print' ]
			});

			/* table.on('draw', function() {
				var body = $(table.table().body());

				body.unhighlight();
				body.highlight(table.search());
			}); */
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
