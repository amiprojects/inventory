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
	width: 80%;
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
								<h3 style="margin-top: 11px;">Stock Report</h3>
							</div>

							<div class="widget-area">
								<div class="col-md-12">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#aStock">Ageing
												Stock</a></li>
										<li><a data-toggle="tab" href="#pStock">Product Stock</a></li>
										<!-- <li><a data-toggle="tab" href="#cStock">Critical Stock</a></li> -->

									</ul>
									<div class="tab-content">

										<!-- .......................................**********************General****************************************************...................................... -->


										<div id="aStock" class="tab-pane fade active in">

											<br> <br>
											<table class="table table-bordered display" id=""
												cellspacing="0" width="100%">
												<thead>
													<tr>

														<th style="text-align: center;" colspan="3">Item
															Details</th>
														<th style="text-align: center;">Total</th>
														<th style="text-align: center;"><45</th>
														<th style="text-align: center;">45 to 90</th>
														<th style="text-align: center;">>90</th>

													</tr>
													<tr>

														<th>Product Code</th>
														<th>WSP</th>
														<th>MRP</th>
														<th>Quantity</th>
														<th>Quantity</th>
														<th>Quantity</th>
														<th>Quantity</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach
														items="${sessionScope['ejb'].getAllProductDetailByCompany()}"
														var="amiProStock1">
														<fmt:formatNumber var="qty"
															value="${!amiProStock1.isRaw()?sessionScope['ejb'].getReadyGoodsStocktDetailByProductIdAndCompany(amiProStock1.id).remainingQty:sessionScope['ejb'].getRawMaterialStocktDetailByProductIdAndCompany(amiProStock1.id).remainingQty}"
															maxFractionDigits="3" groupingUsed="false" />
														<tr>
															<td>${amiProStock1.code}</td>

															<c:set var="purSize"
																value="${amiProStock1.purchase_Product_Details.size()}" />

															<td><fmt:formatNumber var="wsp"
																	value="${purSize>0?amiProStock1.purchase_Product_Details.get(purSize-1).wsp:'nill'}"
																	maxFractionDigits="2" groupingUsed="false" /> ${wsp}</td>
															<td><fmt:formatNumber var="mrp"
																	value="${purSize>0?amiProStock1.purchase_Product_Details.get(purSize-1).mrp:'nill'}"
																	maxFractionDigits="2" groupingUsed="false" /> ${mrp}</td>
															<td>${qty}</td>
															<c:set value="${0}" var="remainqt" />

															<c:forEach
																items="${sessionScope['ejb'].getAgeingPurProductDetailsLes45daysbyproId(amiProStock1.id)}"
																var="rem">
																<fmt:formatNumber var="remainqt"
																	value="${remainqt+rem.remaining_quantity}"
																	maxFractionDigits="3" groupingUsed="false" />
															</c:forEach>
															<td>${remainqt}</td>
															<c:set value="${0}" var="remainqtt" />

															<c:forEach
																items="${sessionScope['ejb'].getAgeingPurProductDetailsBet45and90daysbyproId(amiProStock1.id)}"
																var="rem1">
																<fmt:formatNumber var="remainqtt"
																	value="${remainqtt+rem1.remaining_quantity}"
																	maxFractionDigits="3" groupingUsed="false" />
															</c:forEach>
															<td>${remainqtt}</td>
															<c:set value="${0}" var="remainqttt" />

															<c:forEach
																items="${sessionScope['ejb'].getAgeingPurProductDetailsGre90daysbyproId(amiProStock1.id)}"
																var="rem2">
																<fmt:formatNumber var="remainqttt"
																	value="${remainqttt+rem2.remaining_quantity}"
																	maxFractionDigits="3" groupingUsed="false" />
															</c:forEach>
															<td>${remainqttt}</td>


														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div id="pStock" class="tab-pane fade">
											<br> <br>
											<table class="table table-bordered display" id=""
												cellspacing="0" width="100%">

												<thead>
													<tr>
														<th>#</th>
														<th>Product code:</th>
														<th>Product Description:</th>
														<th>UOM</th>
														<th>Quantity</th>
														<th>WSP</th>
														<th>MRP</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="count" value="${1}" />
													<c:forEach
														items="${sessionScope['ejb'].getAllProductDetailByCompany()}"
														var="amiProStock1">
														<c:if
															test="${amiProStock1.purchase_Product_Details.size()>0}">
															<fmt:formatNumber var="qty"
																value="${!amiProStock1.isRaw()?sessionScope['ejb'].getReadyGoodsStocktDetailByProductIdAndCompany(amiProStock1.id).remainingQty:sessionScope['ejb'].getRawMaterialStocktDetailByProductIdAndCompany(amiProStock1.id).remainingQty}"
																maxFractionDigits="3" groupingUsed="false" />
															<tr>
																<td>${count}</td>
																<td>${amiProStock1.code}</td>
																<td>${amiProStock1.description}</td>
																<td>${amiProStock1.qtyUnit.name}</td>
																<td>${qty}</td>
																<c:set var="purSizeq"
																	value="${amiProStock1.purchase_Product_Details.size()}" />
																<td>
																	<fmt:formatNumber var="wsp"
																		value="${purSizeq>0?amiProStock1.purchase_Product_Details.get(purSizeq-1).wsp:'nill'}"
																		maxFractionDigits="2" groupingUsed="false" /> ${wsp}
																</td>
																<td>
																	<fmt:formatNumber var="mrp"
																		value="${purSizeq>0?amiProStock1.purchase_Product_Details.get(purSizeq-1).mrp:'nill'}"
																		maxFractionDigits="2" groupingUsed="false" /> ${mrp}
																</td>
															</tr>
															<c:set var="count" value="${count+1}" />
														</c:if>
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
			/* $('#table2').DataTable({
				"scrollY" : 200,
				"scrollX" : true
			});
			$('#table1').DataTable({
				"scrollY" : 200,
				"scrollX" : true
			});		 */
			$('table.display').DataTable({
				fixedHeader : {
					header : true,
					footer : true
				}
			});
		});
	</script>

</body>
</html>
