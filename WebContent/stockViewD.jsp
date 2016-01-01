<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,500,700,900'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

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

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if test="${!sessionScope['user'].equals('admin')}">
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
							
								 <div class="breadcrumbs" style="height: 50px; text-align: center;">
									<h3 style="    margin-top: 11px;">Stock View</h3>
												
											
								</div>


								<div class="row">
									<div class="widget-area" style="width: 40%; height: 550px">
										<h3>Stock Search</h3>
										<br> <br>
										<div class="form-group">
											<form action="goStockView" method="post">
												<label for="" class="">Product Code: </label> <input
													type="text" id="prodcode" name="pCodeSearch"
													class="form-control"> <label class="">Product
													Description: </label> <input type="text" id="prodesc"
													name="pDesSearch" class="form-control"> <label
													class="">Category: </label> <input type="text" id="deptcat"
													name="pCatSearch" class="form-control">

												<!-- 
											<form action="stockView.jsp">
												<table>
													<tr>
														<td><b>Product code</b></td>
														<td><input type="text" placeholder="Search by Code"
															style="text-transform: uppercase;" id="pCodeSearch"
															name="pCodeSearch"></td>
														<td>&nbsp;<input type="submit" value="Search">
														</td>
													</tr>
													<tr>
														<td>&nbsp;&nbsp;&nbsp;</td>
													</tr>
												</table>
											</form>
											<form action="stockViewD.jsp">
												<table>
													<tr>
														<td><b>Description</b></td>
														<td>&nbsp;&nbsp;&nbsp;<input type="text"
															placeholder="Search by Code"
															style="text-transform: uppercase;" id="pCodeSearch"
															name="pCodeSearch"></td>
														<td>&nbsp;<input type="submit" value="Search">
														</td>
													</tr>
													<tr>
														<td>&nbsp;&nbsp;&nbsp;</td>
													</tr>
												</table>
											</form>
											<form action="stockViewC.jsp">
												<table>
													<tr>
														<td><b>Category</b></td>
														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
															type="text" placeholder="Search by Code"
															style="text-transform: uppercase;" id="pCodeSearch"
															name="pCodeSearch"></td>
														<td>&nbsp;<input type="submit" value="Search"></td>
													</tr>
													<tr>
														<td>&nbsp;&nbsp;&nbsp;</td>
													</tr>
												</table>
											</form> -->

												<br> <input class="btn green btn-default" type="submit"
													value="Search">
													<a href="stockView.jsp">  <input class="btn green btn-default" type="button" value="Show All"></a>
											</form>
										</div>




										<br> <br>



									</div>
									<div class="widget-area" style="width: 60%; height: 550px">

										<h3>Stock</h3>

										<br>
										<div
											style="overflow-y: scroll; overflow-x: hidden; height: 470px">

											<table id="stream_table"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>#</th>
														<th>Product Code:</th>
														<th>Product Description:</th>
														<th>UOM</th>
														<th>Quantity</th>
													 <th>WSP</th>
														<th>MRP</th> 

														<th></th>

													</tr>
												</thead><%-- <c:forEach items="${requestScope['ami']}" var="amiProStock"> --%>
													<tbody>
													<c:set var="count" value="${1}" />
													<%-- <c:forEach
														items="${param.pCodeSearch.equals(null)?sessionScope['ejb'].getAllProductDetail():sessionScope['ejb'].getProductDetailsByCodeDescriptionCategory(param.pCodeSearch)}"
														var="pro"> --%>
													<%-- 	<c:forEach items="${requestScope['ami']}" var="amiProStock"> --%>
													<c:forEach items="${requestScope['ami']}" var="amiProStock">
														<c:set var="qty" value="${amiProStock.isSaleble()?sessionScope['ejb'].getReadyGoodsStocktDetailByProductId(amiProStock.id).remainingQty:sessionScope['ejb'].getRawMaterialStocktDetailByProductId(amiProStock.id).remainingQty}" />
														<c:choose>
														<c:when test="${qty==0}">
														<tr >
															<td style="color: red ;">${count}</td>
															<td style="color: red ;">${amiProStock.code}</td>
															<td style="color: red ;">${amiProStock.description}</td>
															<td style="color: red ;">${amiProStock.qtyUnit.name}</td>
															<td style="color: red ;">${qty}</td>
															<c:set var="purSize"
																value="${amiProStock.purchase_Product_Details.size()}" />
															<td style="color: red ;">${purSize>0?amiProStock.purchase_Product_Details.get(purSize-1).wsp:'nill'}</td>
															<td style="color: red ;">${purSize>0?amiProStock.purchase_Product_Details.get(purSize-1).mrp:'nill'}</td>
															<td style="color: red ;"><form action="stockDetailShow" method="post"
																	id="StockDetails${amiProStock.id}">
																	<a href="#"
																		onclick="showDetails('${amiProStock.id}');"><input
																		type="hidden" value="${amiProStock.id}" name="proId"><img
																		alt="" src="images/eye.png" height="25px"></a>
																</form></td>
														</tr>
														</c:when>
														<c:otherwise>
														<tr>
															<td>${count}</td>
															<td>${amiProStock.code}</td>
															<td>${amiProStock.description}</td>
															<td>${amiProStock.qtyUnit.name}</td>
															<td>${qty}</td>
															<c:set var="purSize"
																value="${amiProStock.purchase_Product_Details.size()}" />
															<td>${purSize>0?amiProStock.purchase_Product_Details.get(purSize-1).wsp:'nill'}</td>
															<td>${purSize>0?amiProStock.purchase_Product_Details.get(purSize-1).mrp:'nill'}</td>
															<td><form action="stockDetailShow" method="post"
																	id="StockDetails${amiProStock.id}">
																	<a href="#"
																		onclick="showDetails('${amiProStock.id}');"><input
																		type="hidden" value="${amiProStock.id}" name="proId"><img
																		alt="" src="images/eye.png" height="25px"></a>
																</form></td>
														</tr>
														
														</c:otherwise>
														</c:choose>
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
		</div>
		<!-- Page Container -->
	
	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#stock").attr("id", "activeSubMenu");
			$("#sStock").attr("style", "color: red;");
			$("#step8").hide();

		});
		function showDetails(id) {
			//alert(id);
			$("#StockDetails" + id).submit();
		}

		function viewPage() {
			window.location = 'productDisplay.jsp';
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>