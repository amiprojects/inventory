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
			<c:if test="${page.name.equals('Dashboard')}">
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
									<div class="col-md-3">
										<div class="main-title">
											<h1>Dashboard</h1>
											<h5>Welcome back</h5>
											<span><i class="fa fa-map-marker"></i>India</span>
										</div>
									</div>
									<div class="col-md-6" style="margin-top: 33px;">
										<c:if test="${sessionScope['ejb'].is21Days()=='true'}">
											<!-- background-color: #ff0000; color: #F0F0F0; -->
											<div style="color: #ff0000;">
												<h4>Validity will be ended on
													${sessionScope['ejb'].getAllStoct().get(0).getEndDate()} .
													Please contact to your vendor...</h4>
											</div>
										</c:if>
									</div>
									<div class="col-md-3">
										<div id="reportrange" class="date-range">20/0/116 -
											12:24:6</div>
									</div>
								</div>
							</div>
							<!-- title Date Range -->

							<!-- Stats Counter Sec-->
							<div class="row">
								<div class="masonary-grids">

									<div class="col-md-4">
										<a href="purchasingPurchaseEntry.jsp">
											<div class="stats-counter">
												<img alt="purchase Entry" src="images/purchase.jpg"
													style="height: 179px; width: 330px;"> <i
													class="fa fa-user red"></i>
												<h4 style="color: red">Purchase Entry</h4>
											</div>
										</a>
									</div>


									<div class="col-md-4">
										<a href="salesSalesEntry.jsp">
											<div class="stats-counter">
												<img alt="sales Entry" src="images/sales.jpg"
													style="height: 179px; width: 330px;"> <i
													class="fa fa-user red"></i>
												<h4 style="color: red">Sales Entry</h4>
											</div>
										</a>
									</div>


									<div class="col-md-4"></div>


									<c:if test="${sessionScope['user']=='adminProduction'}">
										<div class="col-md-4">
											<a href="jobAssign.jsp">
												<div class="stats-counter">
													<img alt="sales Entry" src="images/jobs.PNG"
														style="height: 179px; width: 330px;"> <i
														class="fa fa-user red"></i>
													<h4 style="color: red">Job Assignment</h4>
												</div>
											</a>
										</div>
									</c:if>


									<div class="col-md-4">
										<a href="stockView.jsp">
											<div class="stats-counter">
												<img alt="sales Entry" src="images/stock.jpg"
													style="height: 179px; width: 330px;"> <i
													class="fa fa-user red"></i>
												<h4 style="color: red">Stock View</h4>
											</div>
										</a>
									</div>
									<div class="col-md-4"></div>


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
	<script>
		$(document).ready(function() {
			$("#dash").attr("id", "activeSubMenu");
			$("#sDash").attr("style", "color: #6a94ff;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>
	<script type="text/javascript">
		function random_num(field, interval, range) {

			setInterval(function() {
				var chars = "0123456789";
				var string_length = range;
				var randomstring = '';
				for (var i = 0; i < string_length; i++) {
					var rnum = Math.floor(Math.random() * chars.length);
					randomstring += chars.substring(rnum, rnum + 1);
				}
				var a = jQuery("#" + field).html(randomstring);
				console.log(a);
			}, interval);
		};
	</script>
	<script>
		jQuery(document).ready(function() {
			random_num('random', 3000, 3);
		});
	</script>

	<script type="text/javascript">
		function display_c() {
			var refresh = 1000; // Refresh rate in milli seconds
			mytime = setTimeout('display_ct()', refresh)
		}

		function display_ct() {
			var x = new Date()
			//var x1=x.toUTCString();// changing the display to UTC string
			var x1 = x.getDate() + "/"
					+ Number(Number(x.getMonth()) + Number(1)) + "/"
					+ x.getFullYear();
			x1 = x1 + " - " + x.getHours() + ":" + x.getMinutes() + ":"
					+ x.getSeconds();
			document.getElementById('reportrange').innerHTML = x1;
			tt = display_c();
		}
		$(document).ready(function() {
			display_ct();

			$("#dash").attr("id", "activeSubMenu");
			$("#sDash").attr("style", "color: #6a94ff;");

		});
	</script>

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>