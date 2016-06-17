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

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jSearch").attr("style", "color: #6a94ff;");
	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
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

			<c:if test="${page.name.equals('Job Search')}">
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

	<c:set var="jobAssi"
		value="${sessionScope['ejb'].getJobAssignmentById(requestScope['joId'])}" />

	<div class="main" style="height: 664px;">
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Job Assign View</h3>
							</div>

							<div class="widget-area">
								<div class="col-md-12">
									<div class="col-md-6">

										<div class="col-md-12">
											<b class="font">Jobber Name :</b> <input readonly="readonly"
												type="text" placeholder="" name="" id=""
												class="form-control" value="${jobAssi.vendor.name}">

										</div>
										<div class="col-md-12">

											&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
											<textarea rows="9" cols="" id="" class="form-control"
												readonly="readonly">
													Address: ${jobAssi.vendor.address}
													Phone Number:${jobAssi.vendor.ph1}
													Email Number:${jobAssi.vendor.email}
													Company Name:${jobAssi.vendor.companyName}
														
														</textarea>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Design No. :</label> <input
												readonly="readonly" type="text"
												value="${jobAssi.jobPlan.designCostSheet.designNumber}"
												name="" id="" class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="font">Job Plan No. :</label> <input
												readonly="readonly" type="text"
												value="${jobAssi.jobPlan.id}" name="" id=""
												class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="font">Job Challan no :</label> <input
												readonly="readonly" type="text"
												value="${jobAssi.challanNumber}" name="" id=""
												class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="font">Asigned Date :</label> <input
												readonly="readonly" type="text" placeholder=""
												value=<fmt:formatDate
																			value="${jobAssi.assignDate}"
																			pattern="dd-MM-yyyy" />
												name="" id="" class="form-control">
										</div>
									</div>

									<table id="" class=" table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Product code</th>
												<th>Product Description</th>
												<th>Quantity</th>
												<th>Remaining Quantity</th>
												<th>UOM</th>
												<th>Total Product Amount</th>
												<th>Item</th>
												<th>Job</th>
												<th>Total Job Qty</th>
												<th>Job Rate</th>
												<th>Job Amount</th>
												<th>Status</th>
											</tr>
										</thead>
										<c:set var="total" value="${total+jppL.remaninQty}" />
										<tbody>
											<c:set var="count" value="${1}" />
											<c:set var="totProCost" value="${0}" />
											<c:set var="totJobCost" value="${0}" />
											<c:forEach var="jobp"
												items="${jobAssi.jobAssignmentProducts}">
												<tr>
													<td>${count}</td>
													<td>${jobp.productsForDesignCostSheet.productDetail.code}</td>
													<td>${jobp.productsForDesignCostSheet.productDetail.description}</td>
													<td>${jobp.qty}</td>
													<td>${jobp.remaninQty}</td>
													<td>${jobp.productsForDesignCostSheet.productDetail.qtyUnit.name}</td>
													<td><fmt:formatNumber var="totProAmount"
															value="${jobp.jobPlanProducts.totalProductCost}"
															maxFractionDigits="2" groupingUsed="false" />${totProAmount}</td>
													<td>${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobp.productsForDesignCostSheet.id).itemDetails.name}</td>
													<td><c:forEach items="${jobp.jobAssignmentJobDetails}"
															var="jobProjob">
																				${jobProjob.jobType.jobName}<hr>
														</c:forEach></td>
													<td><c:forEach items="${jobp.jobAssignmentJobDetails}"
															var="jobProjob">
															<span id="remainQtyRe${jobProjob.id}">${jobProjob.qty}</span>
															<hr>
														</c:forEach></td>
													<td><c:forEach items="${jobp.jobAssignmentJobDetails}"
															var="jobProjob">
																				${jobProjob.rate}<hr>
														</c:forEach></td>
													<td><c:forEach items="${jobp.jobAssignmentJobDetails}"
															var="jobProjob">
																				${jobProjob.ammount}<hr>
														</c:forEach></td>
													<%-- <td><c:forEach items="${jobp.jobAssignmentJobDetails}"
															var="jobProjob">
															${jobProjob.qty-jobProjob.remQty}
															<hr>
														</c:forEach></td> --%>
													<c:choose>
														<c:when test="${jobp.remaninQty==0}">
															<td><b>Received</b></td>
														</c:when>
														<c:otherwise>
															<td><b>Processing</b></td>
														</c:otherwise>
													</c:choose>
													<c:set var="count" value="${count+1}" />
													<c:set var="total" value="${total+jobp.qty}" />
													<c:set var="totalt" value="${totalt+jobp.remaninQty}" />
													<c:set var="totProCost"
														value="${totProCost+jobp.jobPlanProducts.totalProductCost}" />
													<c:set var="totJobCost"
														value="${totJobCost+jobp.totalJobCost}" />
												</tr>
											</c:forEach>


											<tr>
												<td colspan="2">Total No. Of Items:</td>
												<td><h4>${count-1}</h4></td>
												<td>Total Quantity:</td>
												<td><h4>
														<fmt:formatNumber var="totalQ" value="${total}"
															maxFractionDigits="3" groupingUsed="false" />${totalQ}</h4></td>
												<td>Total Remaining:</td>
												<td><h4>
														<fmt:formatNumber var="totalRQ" value="${totalt}"
															maxFractionDigits="3" groupingUsed="false" />${totalRQ}</h4></td>
												<td colspan="2">Total Product Cost:</td>
												<td><h4>
														<fmt:formatNumber var="totPC" value="${totProCost}"
															maxFractionDigits="2" groupingUsed="false" />${totPC}</h4></td>
												<td colspan="2">Total Job Cost:</td>
												<td><h4>
														<fmt:formatNumber var="totJC" value="${totJobCost}"
															maxFractionDigits="2" groupingUsed="false" />${totJC}</h4></td>
											</tr>
										</tbody>
									</table>
									<br>
								</div>
							</div>
							<div class="widget-area">
								<div class="col-md-12">
									<div class="breadcrumbs"
										style="height: 50px; text-align: center;">
										<h3 style="margin-top: -13px; float: left;">Job Received
											Details:</h3>
									</div>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Received Date</th>
												<th>Received challan no.</th>
												<th>Product Code</th>
												<th>Product Description</th>
												<th>Product Qty</th>
												<th>UOM</th>
											</tr>
										</thead>

										<c:set var="j" value="${1}"></c:set>
										<c:forEach var="jobReceive"
											items="${jobAssi.jobRecievedDetails}">
											<tbody>
												<tr>
													<td>${j}</td>
													<td><fmt:formatDate
															value="${jobReceive.recievingDate}" pattern="dd-MM-yy" />
													</td>
													<td><a href="#"
														onclick="viewInvoice(${jobReceive.id});"><b>${jobReceive.challanNumber}</b><br>
															<input type="button" class="btn btn-primary small"
															value="Print"></a></td>
													<td><c:forEach var="jobReceivedProd"
															items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.code}
														<hr>
														</c:forEach></td>
													<td><c:forEach var="jobReceivedProd"
															items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.description}
														<hr>
														</c:forEach></td>
													<td><c:forEach var="jobReceivedProd"
															items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.qtyReturn}
														<hr>
														</c:forEach></td>
													<td><c:forEach var="jobReceivedProd"
															items="${jobReceive.jobRecieveProductsDetails}">																	
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.qtyUnit.name}
														<hr>
														</c:forEach></td>
												</tr>
											</tbody>
											<c:set var="j" value="${j+1}" />
										</c:forEach>
									</table>

								</div>
							</div>
							<br>
							<div class="col-md-12" style="margin-top: 10px;">
								<table style="float: left;">
									<tr>
										<td><input type="button" class="btn btn-primary large"
											value="Print" onclick="viewInvoiceJAC(${jobAssi.id});"></td>
									</tr>
								</table>
								<table style="float: right;">
									<tr>
										<td>Surcharge :</td>
										<td><input type="number" name="surcharge"
											value="${jobAssi.surcharge}" id="surcharge"
											onkeyup="surchargeF();" autocomplete="off"
											readonly="readonly"></td>
									</tr>
									<tr>
										<td>
											<!-- Profit  --> <select style="display: none;"
											name="profitType" id="profitType" onchange="profitTypeF();">
												<option value="profitPer">%</option>
												<option value="profitFlat">Flat</option>
										</select> <!-- : -->
										</td>
										<td><input type="hidden" name="profitVal" value="0.00"
											id="profitVal" onkeyup="profitValF();" autocomplete="off"></td>
									</tr>
									<tr>
										<td>
											<!-- Profit Value : -->
										</td>
										<td><input type="hidden" name="totProfit" value="0.00"
											id="totProfit" readonly="readonly" autocomplete="off"></td>
									</tr>
									<tr>
										<td>GrandTotal :</td>
										<td><input type="number" name="grandtot"
											value="${jobAssi.grandTotal}" readonly="readonly"
											id="grandtot"><input type="hidden" name="gtot"
											value="0.00" readonly="readonly" id="gtot"><input
											type="hidden" name="gt" value="0.00" readonly="readonly"
											id="gt"></td>
									</tr>
								</table>
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript">
		function viewInvoice(id) {
			window.open("JobReceiveChallan.jsp?id=" + id, 'name',
					'width=900,height=700').print();
		}
		
		function viewInvoiceJAC(id){
			window
			.open(
					"JobChalanForAssignment.jsp?id="+id,
					'name', 'width=900,height=700').print();			
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
