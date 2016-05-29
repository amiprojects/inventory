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
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/dataTables.searchHighlight.css" />
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
	width: 16.6% !important;
	text-align: left !important;
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



	<c:set var="customer"
		value="${sessionScope['ejb'].getCustomerEntryById(param.id)}" />

	<div class="main" style="height: 664px;">
		<%@include file="includeLeftOrTop.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">


							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Customer Ledger</h3>
							</div>

							<div class="widget-area">
								<div class="col-md-12">
									<h3 align="center" style="color: gray;">Customer Name:
										${customer.name}</h3>

									<table id="example" class="display nowrap" cellspacing="0"
										width="100%">

										<thead>
											<tr>

												<th>Date</th>
												<th>Particulars</th>
												<th align="left">Type</th>
												<th>Voucher Number</th>
												<th>Debit Amount</th>

												<th>Credit Amount</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total1" value="${0}" />
											<c:set var="total2" value="${0}" />
											<c:set var="total3" value="${0}" />
											<c:set var="total4" value="${0}" />

											<c:forEach
												items="${sessionScope['ejb'].getAllSalesEntrybyCustomerID(param.id)}"
												var="salCus">
												<tr>
													<td><fmt:formatDate value="${salCus.sales_date}"
															pattern="dd-MM-yyyy" /></td>
													<td>${salCus.paymentDetails.get(0).paymentType.type}<br>
														<br>kaanish
													</td>
													<td>Sales</td>
													<td>${salCus.challanNumber}</td>
													<td>${salCus.totalCost}<br> <br>0
													</td>
													<td>0<br> <br> <c:set var="lastPayment"
															value="${sessionScope['ejb'].getPaymentDetailsBySalesEntryId(salCus.id).get(0)}"></c:set>
														<c:set var="currentDue"
															value="${lastPayment.totalAmount-lastPayment.paidAmount}"></c:set>
														${salCus.totalCost-currentDue} <%-- ${salCus.paymentDetails.get(0).paidAmount} --%>
													</td>

												</tr>
												<c:set var="total1" value="${total1 + salCus.totalCost}" />
												<%-- <c:set var="total2"
													value="${total2 + salCus.paymentDetails.get(0).paidAmount}" /> --%>
												<c:set var="total2"
													value="${total2 + salCus.totalCost-currentDue}" />
											</c:forEach>

											<c:forEach
												items="${sessionScope['ejb'].getAllSalesReEntrybyCustomerID(param.id)}"
												var="salCusR">
												<tr>
													<td><fmt:formatDate value="${salCusR.returnDate}"
															pattern="dd-MM-yyyy" /></td>
													<td>Debit note <br> <br>kaanish
													</td>
													<td>Sales Return</td>
													<td>${salCusR.challanNumber}</td>
													<td>0<br> <br>${salCusR.totalReCost}</td>
													<td>${salCusR.totalReCost}<br> <br>0
													</td>
												</tr>
												<c:set var="total3" value="${total3 + salCusR.totalReCost}" />
												<c:set var="total4"
													value="${total4 + salCusR.totalReCost}" />
											</c:forEach>
										</tbody>

										<tfoot>
											<tr>

												<th>&nbsp;</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
												<th><h4>Total:</h4></th>
												<th><h4>${total3+total1}</h4></th>
												<th><h4>${total2+total4}</h4></th>

											</tr>
										</tfoot>




									</table>
								</div>

							</div>
						</div>
					</div>
					<!-- Content Sec -->
				</div>
				<!-- Page Container -->
			</div>
			<!-- main -->
		</div>
	</div>
	<!-- Script -->

	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
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

	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#example').DataTable({

				"scrollY" : 300,
				"scrollX" : true,
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'print' ]
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
