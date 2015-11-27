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
	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="widget-area">
								<form action="addTax">
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">City Name :</label> <input
												type="text" placeholder="Enter tax name" id="" name="name"
												class="form-control">
										</div>
									</div>
									<!-- <div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Value :</label> <input type="text"
												placeholder="" id="" name="value" class="form-control">
										</div>
									</div> -->

									<input class="btn green pull-right" type="submit" value="Add">
								</form>
								<%-- <p>${requestScope['msg']}</p> --%>
								<div class="col-md-6">
									<div class="widget-area">
										<form action="addTaxGroup">
											<div style="height: 310px; overflow: auto;">
												City1<br>
												City1<br>
												City1<br>
											</div>
											<div id="newTaxGroup" class="modal fade" role="dialog"
												style="top: 25px;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">State</h4>
														</div>
														<div class="modal-body">
															<div class="widget-area">

																<div class="form-group">
																	<label for="" class="font">State Name :</label> <input
																		type="text" placeholder="Enter tax group name" id=""
																		name="name" class="form-control">
																</div>
																<input class="btn green pull-right" type="submit"
																	value="Create">
															</div>
														</div>
														<div class="modal-footer">
															<!-- <button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button> -->
														</div>
													</div>

												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="col-md-6">
									<div class="widget-area">
										<button type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#newTaxGroup">Create
											Tax Group</button>
										<div class="widget-area"
											style="height: 200px; overflow: auto;">
											<c:forEach
												items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
												var="taxGroup">
												<br>
												<span onclick="showTaxes('${taxGroup.name}');">
													${taxGroup.name}</span>
												<div id="taxList${taxGroup.name}" class="modal fade"
													role="dialog" style="top: 25px;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">City list</h4>
															</div>
															<div class="modal-body">
																<c:forEach
																	items="${sessionScope['ejb'].getTax_Type_GroupById(taxGroup.name).taxes}"
																	var="tax">
																	<br>${tax.name} 
						</c:forEach>
															</div>
															<div class="modal-footer">
																<!-- <button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button> -->
															</div>
														</div>

													</div>
												</div>
											</c:forEach>
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
		function showTaxes(tg) {

			/* alert(tg); */
			$("#taxList" + tg).modal('show');
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>