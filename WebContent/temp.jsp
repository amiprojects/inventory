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

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="breadcrumbs" style="height: 39px">
								<ul>
									<li><p
											style="right: -704px; font-size: 20px; position: absolute;">
											<b>User Group</b>
										</p></li>
								</ul>
							</div>
							<div class="widget-area"
								style="height: 500px; overflow: auto; width: 60%; float: left;">
								<form action="#">
									<div class="col-md-8">
										<input type="text" name="userGroupName" class="form-control">
									</div>
									<div class="col-md-4">
										<input type="submit" value="Create Group"
											class="btn green pull-right">
									</div>

									<ul id="tree">
										<c:forEach items="${sessionScope['ejb'].getAllModule()}"
											var="module">
											<li><input type="checkbox" value="">${module.name}
												<ul>
													<c:forEach items="${module.pageLists}" var="page">
														<li><input type="checkbox" value="${page.id}">${page.name}
														</li>
													</c:forEach>
												</ul></li>
										</c:forEach>
									</ul>
								</form>
							</div>
							<div class="widget-area"
								style="height: 500px; overflow: auto; width: 40%; float: left;">
								<h2>User Group</h2>
								<ul>
								<c:forEach items="${sessionScope['ejb'].getAllUserGroup()}" var="ug">
								<li>${ug.groupName}</li>
								</c:forEach>
								</ul>
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

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupUgroup").attr("style", "color: red;");
			$('#tree').abixTreeList();
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>