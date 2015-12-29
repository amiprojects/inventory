<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if test="${!sessionScope['user'].equals('admin')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Assignment')}">
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
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Job Assignment Search</b>
											</p></li>
									</ul>
								</div>
							</div>
							<div class="widget-area">

								<div class="col-md-12">
									<table>
										<tr>

											<td><h4>Enter Jobber Challan Id:</h4></td>
											<td>&nbsp;&nbsp;</td>
											<td width="380px"><input class="form-control"
												type="text" id="jChallan" name="jChallan"></td>
											<td>&nbsp;&nbsp;&nbsp;</td>
											<td><button class="btn btn-info btn-sm" onclick="jRec()">Go</button></td>
										</tr>
									</table>
								</div>
								<br> <br> <br> <br>
								<div class="col-md-12" style="width: 100%;" id="jrecive">
									<div class="col-md-6">

										<table>
											<tr>
												<td><h5>Jobber Name:</h5></td>
												<td>&nbsp;</td>
												<td>...............</td>

											</tr>
											<tr>
												<td><h5>Jobber Details:</h5></td>
												<td>&nbsp;</td>
												<td>..........</td>

											</tr>
										</table>

									</div>


									<div class="col-md-6">

										<table>
											<tr>
												<td><h5>Job Challan ID:</h5></td>
												<td>&nbsp;</td>
												<td>...............</td>

											</tr>
											<tr>
												<td><h5>Assigned Date:</h5></td>
												<td>&nbsp;</td>
												<td>..........</td>

											</tr>
										</table>

									</div>
								</div>
								<div class="col-md-12" style="width: 100%;" id="jrecive">
									<table cellspacing="0" cellpadding="0" border="0" width="325">
										<tr>
											<td>
												<table cellspacing="0" cellpadding="1" border="1"
													width="100%">
													<tr style="color: white; background-color: #ccccb3">
														<th>Header 1</th>
														<th>Header 2</th>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<div style="width: 320px; height: 60px; overflow: auto;">
													<table cellspacing="0" cellpadding="1" border="1"
														width="100%">
														<tr>
															<td>new item</td>
															<td>new item</td>
														</tr>
														<tr>
															<td>new item</td>
															<td>new item</td>
														</tr>
														<tr>
															<td>new item</td>
															<td>new item</td>
														</tr>
														<tr>
															<td>new item</td>
															<td>new item</td>
														</tr>
													</table>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Script -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jR").attr("style", "color: red;");
		$("#jrecive").hide();
	});
</script>
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy"
		});
	});
</script>
<script>
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy"
		});
	});
</script>

<script type="text/javascript">
	function jRec() {

		$("#jrecive").show();

	}
</script>
</html>