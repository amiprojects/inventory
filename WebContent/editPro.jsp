
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- tost msg -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />







<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	
	
	<c:if test="${!sessionScope['user'].equals('admin')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('MaterialPartDetailsGenerals')}">
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
	<c:set var="editpro"
		value="${sessionScope['ejb'].getProductDetailsById(param.id)}" />

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
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Product/Material Update</b>
											</p></li>
									</ul>
								</div>


								<div class="widget-area" style="width: 100%">



									<form id="editSumPro" action="editproductSummary" method="post">

										<input type="hidden" value="${param.id}" name="productid"
											id="productid">


										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInputEmail1">Products Code:</label> <input
													type="text" value="${editpro.code}" name="productCode123"
													class="form-control"><br>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">Description:</label> <input
													type="text" name="description123"
													value="${editpro.description}" class="form-control"><br>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInputEmail1">Universal Product
													Code: </label> <input type="text" value="${editpro.universalCode}"
													name="upc123" class="form-control"><br>
											</div>
											
											 <div class="form-group">
												<label for="exampleInputEmail1">Unit Of Measurement:</label>
												<%--<input type="text" value="${editpro.qtyUnit.id}"
													name="uom123" class="form-control"><br>
											 --%>
											<select  name="uom123" id="uomO"
												 class="form-control"
												style="width: 431px; height: 34px">
												
												<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
													var="qqty">
													<option value="${qqty.id}">${qqty.name}</option>
												</c:forEach>


											</select></div>
										



											<input style="float: right;" class="btn green btn-default"
												type="submit" value="submit">
										</div>

									</form>


									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});
		$(document).ready(function() {
			$("#prodact").attr("id", "activeSubMenu");
			$("#sProduct").attr("style", "color: red;");
		});
	</script>

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>