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
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Job Assignment Search</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area">
									<form role="form" class="sec" action="jobAssignSearchByDate"
										method="post">
										<!-- <div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Job Challan Number :</label> <input type=""
														placeholder="Enter Challan Number" id=""
														class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Jobber Name :</label> <input type=""
														placeholder="Enter Jobber Name :" id=""
														class="form-control">
												</div>
											</div>
										</div> -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="">Search between two dates : (Start
														Date)</label> <input type="text" placeholder="Enter First Date"
														id="datepicker" class="form-control" name="fDate"
														id="fDate">
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label for="">(End Date)</label> <input type="text"
														placeholder="Enter last date" id="datepicker1"
														class="form-control" name="lDate" id="lDate">
												</div>
											</div>
										</div>

										<button class="btn green pull-right" type="submit">Search</button>
									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Job Assigned No.</th>
												<th>Assigned Date</th>
												<th>Est. Submission Date</th>
												<th>Number of Items</th>
												<th>Quantity</th>
											</tr>
										</thead>
										<!-- <tbody>
											<tr>
												<td>1</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td><img alt="" src="images/eye.png" height="25px"></td>
											</tr>
										</tbody> -->
										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['jobAssignList']}"
											var="jobAssignByDate">
											<tbody>
												<tr>
													<td>${count}</td>
													<td>${jobAssignByDate.challanNumber}</td>
													<td><fmt:formatDate
															value="${jobAssignByDate.assignDate}" pattern="dd-MM-yy" /></td>
													<td><fmt:formatDate
															value="${jobAssignByDate.estimatedCompletionDate}"
															pattern="dd-MM-yy" /></td>
													<td>${jobAssignByDate.jobAssignmentProducts.size()}</td>
													<c:set value="${0}" var="totqty"/>
													<c:forEach items="${jobAssignByDate.jobAssignmentProducts}" var="proDet">
													<c:set value="${totqty+proDet.qty}" var="totqty"/>
													</c:forEach>
													<td>${totqty}</td>
													<td><img alt="" src="images/eye.png" height="25px"></td>
												</tr>
											</tbody>
											<c:set var="count" value="${count+1}" />
										</c:forEach>
									</table>
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#jobs").attr("id", "activeSubMenu");
			$("#jSearch").attr("style", "color: red;");
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>