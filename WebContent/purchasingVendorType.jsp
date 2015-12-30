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
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchVtype").attr("style", "color: red;");
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
	<c:if test="${!sessionScope['user'].equals('admin')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if
				test="${page.name.equals('Vendor Management')}">
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
									<h3 style=" margin-top: 11px;">Purchasing Vendor Type</h3>
												
											
								</div>
						
							
								<div class="widget-area"><div class="col-md-12">
									<form action="newVendorType" method="get">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" class="font">Vendor type :</label> <input
													type="text" placeholder="Enter vendor type" id=""
													name="name" class="form-control">
											</div>
										</div>
										<br> <input class="btn green pull-left" type="submit"
											value="Add">
									</form>
									<div class="widget-area" style="height: 300px; overflow: auto;">

										<c:forEach items="${sessionScope['ejb'].getAllVendorType()}"
											var="vendorType">
											<ul>
												<li>${vendorType.type}&nbsp;<a href="#"
													onclick="editVendorType('${vendorType.id}','${vendorType.type}')">
														<img src="img/edit.png" height="16px" width="16px">
												</a>&nbsp;<a href="deleteVendorType?id=${vendorType.id}"> <img
														src="img/cross.png" height="16px" width="16px"></a>
												</li>
											</ul>
										</c:forEach>

										<!-- Vendor type 1<br> Vendor type 1<br> Vendor type 1<br> -->
									</div>
									<%-- <p>${requestScope['msg']}</p> --%>
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
	<!-- main -->

	<div id="editVendorTypeDialog" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="editVendorType" method="post">
						<input type="hidden" name="id" value="" id="id1"> <span>Vendor
							type : </span> <input type="text" class="form-control" name="name"
							value="" id="type1"> <input type="submit"
							class="btn btn-default" value="Update">
					</form>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});

		function editVendorType(vId, vType) {

			$('#id1').val(vId);
			$('#type1').val(vType);
			$("#editVendorTypeDialog").modal('show');
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>