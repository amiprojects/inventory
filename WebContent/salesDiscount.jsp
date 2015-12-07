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
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 39px">
							<ul>
								<li><p
										style="right: -747px; font-size: 20px; position: absolute;">
										<b>Discount</b>
									</p></li>
							</ul>
						</div>
						<br> <br>

						<div class="widget-area">
							<div class="col-md-12">


								<div class="row">
									<div class="col-md-6">


										<a title=""><button type="button"
												class="btn btn-info btn-lg" data-toggle="modal"
												data-target="#newDiscount">New</button> </a>
									</div>
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Description</th>
												<th>Type</th>
												<th>Value</th>
												<th>Taxable</th>
												<th>Income Account</th>
												<th>Expense Account</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td><input type="checkbox"></td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td><input type="checkbox"></td>
											</tr>
										</tbody>
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
	</div>
	<!-- main -->
	<div class="modal fade" role="dialog" class="modal fade" role="dialog"
		id="newDiscount" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Discount</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="sec">
						<div class="row">
							<div class="col-md-4">Name :</div>
							<div class="col-md-8">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">Description :</div>
							<div class="col-md-8">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">Income Account :</div>
							<div class="col-md-8">
								<select class="form-control">
									<option>---</option>
									<option>---</option>
									<option>---</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">Expense Account :</div>
							<div class="col-md-8">
								<select class="form-control">
									<option>---</option>
									<option>---</option>
									<option>---</option>
								</select>
							</div>
						</div>
						<div class="widget-area">
							<div class="breadcrumbs">
								<ul>
									<li><a title="" class="font">Discount Type</a></li>
								</ul>
								<hr>
							</div>
							<div class="row">
								<div class="col-md-4">
									<input type="radio" name="discountType" value="percentage">Percentage
									:
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<input type="radio" name="discountType" value="amount">Amount
									:
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
						<input type="checkbox">Taxable <br> <input
							type="checkbox">Active
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default">OK</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				</div>
				</form>
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
		$(document).ready(function() {
			$("#sales").attr("id", "activeSubMenu");
			$("#sSalesDiscount").attr("style", "color: red;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>