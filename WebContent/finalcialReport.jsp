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

<!-- <link rel="stylesheet" href=style.css> -->
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">

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
</style>
<style>
div.dataTables_wrapper {
	width: 100%;
	margin: 0 auto;
}

table {
	width: 100% !important;
}

th {
	width: 16.66% !important;
	text-align: center !important;
}

tbody {
	width: 100% !important;
}

td {
	width: 16.66% !important;
	text-align: center !important;
}

tfoot {
	width: 100% !important;
}
</style>

</head>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#reports").attr("id", "activeSubMenu");
		$("#report").attr("style", "color: #6a94ff;");
	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
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

			<c:if test="${page.name.equals('Stock')}">
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
								<h3 style="margin-top: 11px;">Finalcial Report</h3>
							</div>

							<div class="widget-area">
								<div class="col-md-12">


									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#dayBook">DayBook</a></li>
										<li><a data-toggle="tab" href="#profitLoss">Profit-Loss</a></li>
										<li><a data-toggle="tab" href="#ledgerAcount">Ledger
												Account</a></li>

									</ul>
									<div class="tab-content">

										<!-- .......................................**********************DayBook****************************************************......... -->


										<div id="dayBook" class="tab-pane fade active in">
											<br> <br>
											<div>
												<form action="dayBookreport">
													<label>Choose your date:</label>&nbsp;<input type="text"
														readonly="readonly" name="dayBookDate" id="datepicker">
													<input type="submit" value="search">
												</form>
											</div>
											<br> <br>
											<div>
												<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${requestScope['salesEty']}" var="sRepo">
															<tr>
																<td><fmt:formatDate value="${sRepo.sales_date}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${sRepo.customer.name}&nbsp;<br>
																<br>&nbsp;${sRepo.paymentDetails.get(0).paymentType.type}
																</td>
																<td>Sales Payment</td>
																<td>${sRepo.challanNumber}</td>
																<td>${sRepo.totalCost}<br>
																<br>&nbsp;
																</td>
																<td>&nbsp;&nbsp;<br>${sRepo.totalCost}</td>
															</tr>
														</c:forEach>

														<c:forEach items="${requestScope['purchaseEty']}"
															var="pRepo">
															<tr>
																<td><fmt:formatDate value="${pRepo.purchase_date}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${pRepo.vendor.name}&nbsp;<br>
																<br>&nbsp;${pRepo.paymentDetails.get(0).paymentType.type}
																</td>
																<td>Purchase Payment</td>
																<td>${pRepo.challanNumber}</td>
																<td>&nbsp;<br>
																<br>${pRepo.totalCost}</td>
																<td>${pRepo.totalCost}<br>
																<br>&nbsp;
																</td>
															</tr>
														</c:forEach>

													</tbody>

												</table>
											</div>
										</div>

										<div id="profitLoss" class="tab-pane fade"></div>

										<div id="ledgerAcount" class="tab-pane fade">

											<br>
											<br>
											<div class="col-md-12">
												<div class="col-md-4">
													<h4>Select your Ledger Type:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -120px;">
													<h4>
														<select class="form-control" onchange="ledger()" id="ledSel">
															<option value="0">select ledger type</option>
															<option value="vendorLed">Vendor</option>
															<option value="AgentLed">Agent</option>
															<option value="CustomerLed">Customer</option>
														</select>
													</h4>
												</div>

											</div>

											<div class="col-md-12" id="cus">
												<div class="col-md-4">
													<h4>Enter your Customer Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div>
											<div class="col-md-12" id="vend">
												<div class="col-md-4">
													<h4>Enter your vendor Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div>
											<div class="col-md-12" id="agen">
												<div class="col-md-4">
													<h4>Enter your Agent Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div><br><br>
											<div id="custTable">
											<h3 style="float: center;">Name of Customer </h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													</tbody>
													</table>
										</div><br><br>
										<div id="venTable">
										<h3 style="float: center;">Name of Vendor</h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													</tbody>
													</table>
										</div>
										<br><br>
										<div id="agenTable">
										<h3 style="float: center;">Name of Agent</h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													<tr>
													<td></td><td></td>
													</tr>
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
			</div>
			<!-- Page Container -->
		</div>
		<!-- main -->
		<!-- Script -->
		
		<script type="text/javascript" src="js/modernizr.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/enscroll.js"></script>
		<script type="text/javascript" src="js/grid-filter.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.fixedHeader.min.js"></script>

		<script src="js/jquery-ui/jquery-ui.js"></script>
		<script>
			$(document).ready(function() {
				$('table.display').DataTable();
			});
		</script>
		<script type="text/javascript">
			$(function() {
				$("#datepicker").datepicker({
					dateFormat : "dd-mm-yy",
					maxDate : 0,
				});
			});
		</script>
		<script>
		$(document).ready(function() {
			$("#cus").hide();
			$("#vend").hide();
			$("#agen").hide();
			$("#agenTable").hide();
			$("#venTable").hide();
			$("#custTable").hide();
		});
		function ledger(){
		if(	$("#ledSel").val()=="vendorLed"){
			$("#cus").hide();
			$("#vend").show();
			$("#agen").hide();
			$("#agenTable").hide();
			$("#venTable").show();
			$("#custTable").hide();
		}
		else if ($("#ledSel").val()=="AgentLed"){
			$("#cus").hide();
			$("#vend").hide();
			$("#agen").show();
			$("#agenTable").show();
			$("#venTable").hide();
			$("#custTable").hide();
		}
		else if($("#ledSel").val()=="CustomerLed"){
			$("#cus").show();
			$("#vend").hide();
			$("#agen").hide();
			$("#agenTable").hide();
			$("#venTable").hide();
			$("#custTable").show();
		}
		else{
			$("#cus").hide();
			$("#vend").hide();
			$("#agen").hide();
			$("#agenTable").hide();
			$("#venTable").hide();
			$("#custTable").hide();
		}
		
		
		}
		
		</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
