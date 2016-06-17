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
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/dataTables.searchHighlight.css" />
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
			<c:if test="${page.name.equals('Notifications')}">
				<c:set var="i" value="5" />
			</c:if>
		</c:forEach>
		<c:if test="${i!=5}">
			<script type="text/javascript">
				alert('you have no permission to view this page');
				window.location = "index.jsp";
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
				<div class="row">
					<div class="masonary-grids">
						<div class="container">
							<div class="title-date-range">
								<div class="row">
									<div class="col-md-6">
										<div class="main-title">
											<h1>Notifications</h1>
										</div>
									</div>
								</div>
							</div>

							<!-- Stats Counter Sec-->
							<div class="row">
								<div class="masonary-grids">
									<div class="stats-counter">

										<c:set var="count" value="${0}" />

										<c:forEach var="i"
											items="${sessionScope['ejb'].getNotifications()}">

											<c:if test="${i.notificationName!=temp && count!=0}">
												</tbody>
												</table>

											</c:if>


											<c:if test="${i.notificationName!=temp}">
												<table class="notification_tbl display">
													<thead>
														<tr>
															<th><h2>${i.notificationName}</h2></th>
														</tr>
													</thead>
													<tbody>
														</c:if>
														<tr>
															<td><a href="${i.link}" style="float: left;">${i.description}</a></td>
														</tr>
														<c:set value="${i.notificationName}" var="temp" />

														<c:set var="count" value="${count+1}" />

														</c:forEach>
														</div>
														</div>
														<!-- END -->
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
														<script src="js/jquery-ui/jquery-ui.js"></script>

														<script src="js/jquery.dataTables.min.js"></script>
														<script src="js/dataTables.fixedHeader.min.js"></script>
														<script src="js/buttons.flash.min.js"></script>
														<script src="js/buttons.html5.min.js"></script>
														<script src="js/buttons.print.min.js"></script>
														<script src="js/dataTables.buttons.min.js"></script>
														<script src="js/jszip.min.js"></script>
														<script src="js/vfs_fonts.js"></script>
														<script src="js/pdfmake.min.js"></script>
														<script src="js/dataTables.searchHighlight.min.js"></script>
														<script src="js/pdfmake.min.js"></script>
														<script src="js/jquery.highlight.js"></script>
														<script type="text/javascript"
															src="js/dist/sweetalert2.min.js"></script>
</body>
<script>
	$(document).ready(function() {
		$("#noti").attr("id", "activeSubMenu");
		$("#sNoti").attr("style", "color: #6a94ff;");
		$(".notification_tbl").DataTable({
			"aaSorting" : [],
			"scrollX" : true,
			"paging" : false
		});
	});
</script>
</html>