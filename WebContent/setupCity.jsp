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

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />

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
	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="widget-area">
								<div class="row">
									<div class="col-md-6">
										<div class="widget-area">
											<form action="#">
												<div class="row">
													<div class="col-md-4">City name :</div>
													<div class="col-md-6">
														<input type="text" class="form-control">
													</div>
													<div class="col-md-2">
														<input class="btn green pull-left" type="submit"
															value="Add">
													</div>
												</div>
											</form>
											<br>
											<form action="#">
												<div class="row">
													<div class="col-md-4">State name :</div>
													<div class="col-md-6">
														<input type="text" class="form-control">
													</div>
													<div class="col-md-2">
														<input class="btn green pull-left" type="button"
															onclick="statePopup();" value="Add">
													</div>
												</div>
												<div id="createState" style="top: 25px;">
													<div class="modal-dialog" style="z-index: 1">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" onclick="closed();">&times;</button>
																<h4 class="modal-title">State Ctreation</h4>
															</div>
															<div class="modal-body">

																<span>The state belongs to:</span><input id="country"
																	type="text" name="name"> <input type="submit"
																	value="create">

															</div>
															<div class="modal-footer"></div>
														</div>

													</div>
												</div>
											</form>
											<br>
											<form action="addCountry">
												<div class="row">
													<div class="col-md-4">Country name :</div>
													<div class="col-md-6">
														<input type="text" class="form-control" name="name">
													</div>
													<div class="col-md-2">
														<input class="btn green pull-left" type="submit"
															value="Add">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget-area">
											<div class="tree-list">
												<p>
													<a href="#" id="tree-expand-all">Expand all</a> | <a
														href="#" id="tree-collapse-all">Collapse all</a>
												</p>
												<!-- Listing directory ZendX from ZendFramework library -->
												<ul id="tree">
													<c:forEach items="${sessionScope['ejb'].getAllCountry()}" var="contry">
														<li>${contry.countryName}
															<ul>
																<li>Resource
																	<ul>
																		<li>Jquery.php</li>
																	</ul>
																</li>
															</ul>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<p>${requestScope['msg']}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
			$("#createState").hide();
		});

		$(function() {
			$("#country").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "getcountry",
						dataType : "json",
						data : {
							term : request.term
						},
						success : function(data) {
							response($.map(data, function(item) {
								return {
									value : item.name
								}
							}));
						}
					});
				}
			});
		});
		function statePopup() {
			$("#createState").show();
		}
		function closed() {
			$("#createState").hide();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>