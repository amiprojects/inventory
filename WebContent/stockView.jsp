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

			<c:if
				test="${page.name.equals('Stock')}">
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
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -470px; font-size: 20px; position: absolute;">
												<b>Stock Table:</b>
											</p></li>
									</ul>
								</div>
								<div class="row">
									<div class="widget-area" style="width: 34%;height: 550px">
										<form role="form" class="sec">
											<div class="form-group">
												<label for="" class="">Product Code: </label> <input
													type="text" placeholder="" id="prodcode"
													class="form-control"> <label for="" class="">Product
													Description: </label> <input type="text" placeholder=""
													id="prodesc" class="form-control"> <label for=""
													class="">Department/Sub Department/Category: </label> <input
													type="text" placeholder="" id="deptcat"
													class="form-control">

											</div>


											<button class="btn green btn-default" type="submit">Search
											</button>
											<button class="btn green btn-default" type="submit">Show
												All</button>
										</form>
										<br> <br>



									</div>
									<div class="widget-area" style="width: 66%; height: 550px">
										
										<h4>Stock View : </h4>
										
<br>
<div  style=" position:absolute; overflow-y:scroll;overflow-x:hidden; height : 490px">

										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>Product Code:</th>
													<th>Product Description:</th>
													<th>Quantity</th>
													<th>UOM</th>
													<th>MRP</th>

													<th></th>

												</tr>
											</thead>
											<tbody>
												<c:set var="count" value="${1}" />
												<c:forEach
													items="${sessionScope['ejb'].getAllProductDetail()}"
													var="pro">
													<tr>
														<td>${count}</td>
														<td>${pro.code}</td>
														<td>${pro.description}</td>
														<td>${pro.qtyUnit.name}</td>
														<td>${pro.isSaleble()?sessionScope['ejb'].getReadyGoodsStocktDetailByProductId(pro.id).remainingQty:sessionScope['ejb'].getRawMaterialStocktDetailByProductId(pro.id).remainingQty}</td>
														<td>${pro.code}</td>
														<td><form action="stockDetailShow" method="post"
																id="StockDetails${pro.id}">
																<a href="#" onclick="showDetails('${pro.id}');"><input
																	type="hidden" value="${pro.id}" name="proId"><img
																	alt="" src="images/eye.png" height="25px"></a>
															</form></td>
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