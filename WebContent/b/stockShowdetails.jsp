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
<link rel="stylesheet" href="bootstrapcdn.css">
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

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

<!-- Script -->

<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
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

<script type="text/javascript">
	$(document).ready(function() {
		$("#stock").attr("id", "activeSubMenu");
		$("#sStock").attr("style", "color: red;");
		$("#step8").hide();

	});
</script>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script src="js/jquery-ui/jquery-ui.js"></script>


</head>
<body>
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
	<c:set var="purchasePro"
		value="${sessionScope['ejb'].getPurchase_Product_DetailsByProId(requestScope['proid1'])}" />
		<c:set var="salesPro"
		value="${sessionScope['ejb'].getSales_Product_DetailsByProId(requestScope['proid1'])}" />
		
	<c:set var="jobProList"
		value="${sessionScope['ejb'].getJobAssignmentProductDetailsByproductId(requestScope['proid1'])}"/>
		
		
		

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">

								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Stock Details</b>
											</p></li>
									</ul>
								</div>


								<div class="widget-area" style="width: 100%">
									<c:set
										value="${sessionScope['ejb'].getProductDetailById(requestScope['proid1'])}"
										var="p" />
									<h4 align="center">Product Code:</h4>
									<h3 align="center">${p.code}</h3>
									<br> <br>

									<ul class="nav nav-tabs">
										<li class="active" id="detl"><a data-toggle="tab"
											href="#purchase">Purchase</a></li>
										<li><a data-toggle="tab" href="#Sales">Sales</a></li>
										<li><a data-toggle="tab" href="#jobber">Jobber</a></li>
										<li><a data-toggle="tab" href="#Details">Details</a></li>
										<li><a data-toggle="tab" href="#Image">Image</a></li>
										<li><a data-toggle="tab" href="#Attribute">Attribute</a></li>
									</ul>
									<div class="tab-content">
<!-- **********************************************************************************jobber*****************************************************************************-->

										<div id="jobber" class="tab-pane fade">
											<div class="widget-area">
												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Jobber Name</th>

															<th>Jobber description</th>

															<th>Quantity</th>

															<th>Date</th>

														</tr>
													</thead>
													<tbody>
														<tr>
														<c:forEach items="${jobProList}" var="jobPro">
															
																<td>${jobPro.vendor.name}</td>
																<td>${jobPro.workDescription}</td>
																<td>${jobPro.qty}</td>
																<td><fmt:formatDate
																		value="${jobPro.jobRecievedDetails.recievingDate}"
																		pattern="dd-MM-yyyy" /></td>

															</c:forEach>
														</tr>
													</tbody>

												</table>


											</div>
											<br>

										</div>
										<!-- .......................................*************************purchase************************************************...................................... -->
										<div id="purchase" class="tab-pane fade active in">
											<div class="widget-area">

												<table class="table table-striped table-bordered"
													style="height: 110px">
													<thead>
														<tr>
															<th>Purchase Date</th>

															<th>Vendor Name</th>

															<th>Quantity</th>


															<th>Remaining Quantity</th>
														</tr>
													</thead>
													<tbody style="height: 90px; overflow-y: scroll">
														<c:forEach items="${purchasePro}" var="purPro">
															<tr>
																<td><fmt:formatDate
																		value="${purPro.purchase_Entry.purchase_date}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${purPro.purchase_Entry.vendor.name}</td>
																<td>${purPro.quantity}</td>

																<td>${purPro.remaining_quantity}</td>


															</tr>
														</c:forEach>

													</tbody>

												</table>

											</div>
											<br>

										</div>
										<!-- .......................................**********************Sales****************************************************...................................... -->
										<div id="Sales" class="tab-pane fade ">
											<div class="widget-area">

												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Customer Name</th>

															<th>Quantity</th>
															<th>Date</th>
														</tr>
													</thead>
													<tbody><c:forEach items="${salesPro}" var="salesPro1">
														<tr>
															<td>${salesPro1.salesEntry.customer.name}</td>
															<td>${salesPro1.quantity}</td>
															<td><fmt:formatDate
																		value="${salesPro1.salesEntry.sales_date}"
																		pattern="dd-MM-yyyy" /></td>
														</tr></c:forEach>
													</tbody>
												</table>
											</div>
											<br> <br>
										</div>
										<!-- .......................................**********************Details****************************************************...................................... -->



										<div id="Details" class="tab-pane fade">
											<br> <br>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Code:</label> <input
														type="text" readonly value="${p.code}"
														class="form-control"><br>
												</div>


												<div class="form-group">
													<label for="exampleInputEmail1">Universal Product
														code:</label> <input type="text" value="${p.universalCode}"
														readonly class="form-control"><br>
												</div>
											</div>
											<div class="col-md-6">

												<div class="form-group">
													<label for="exampleInputEmail1">Description:</label> <input
														type="text" readonly value="${p.description} "
														class="form-control"><br>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Unit Of
														Measurement:</label> <input type="text" readonly
														value="${p.qtyUnit.name} " class="form-control"><br>
												</div>

											</div>
										</div>

										<!-- .......................................**********************Image****************************************************...................................... -->



										<div id="Image" class="tab-pane fade">
											<c:set
												value="${sessionScope['ejb'].getAllProductImageByProductId(requestScope['proid1'])}"
												var="pImage" />
											<br> <br>
											<div style="width: 927px; height: 176px; overflow: scroll;">
												<c:forEach items="${pImage}" var="image">
													<img width="100" height="100" style="" alt="ProductImage"
														src="data:image/jpeg;base64,${image.getImageAsString()}">
												</c:forEach>
											</div>

										</div>



										<!-- .......................................**********************Attribute****************************************************...................................... -->

										<div id="Attribute" class="tab-pane fade">

											<br> <br>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 1:</label> <input
														type="text" value="${p.category.attrNmae1}" readonly
														class="form-control"><br>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 2:</label> <input
														type="text" value="${p.category.attrNmae2}" readonly
														class="form-control"><br>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 3:</label> <input
														type="text" value="${p.category.attrNmae3}" readonly
														class="form-control"><br>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 4:</label> <input
														type="text" value="${p.category.attrNmae4}" readonly
														class="form-control"><br>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 5:</label> <input
														type="text" readonly value="${p.category.attrNmae5}"
														class="form-control"><br>
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Attribute 6:</label> <input
														type="text" readonly value="${p.category.attrNmae6}"
														class="form-control"><br>
												</div>
											</div>



										</div>
										<!-- ........................................................................************************************..............	 -->
									</div>
								<a href="stockView.jsp"><button class="btn blue btn-default" style="float: right">BACK</button></a>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>