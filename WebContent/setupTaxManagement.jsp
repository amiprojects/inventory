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
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
</head>
<body>
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
											<b>Tax Management</b>
										</p></li>
								</ul>
							</div>
							<div class="widget-area">
								<form action="addTax" method="post">
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Tax Name :</label> <input
												type="text" placeholder="Enter tax name" id="" name="name"
												class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Value :</label> <input type="text"
												placeholder="" id="" name="value" class="form-control">
										</div>
									</div>

									<input class="btn green pull-right" type="submit" value="Add">
								</form>
								<%-- <p>${requestScope['msg']}</p> --%>
								<div class="col-md-6">
									<div class="widget-area">
										<form action="addTaxGroup" method="post">
											<div style="height: 310px; overflow: auto;">
												<c:forEach items="${sessionScope['ejb'].getAllTax()}"
													var="tax">
													<input type="checkbox" value="${tax.name}" name="tax">${tax.name}&nbsp;
													<a href="#" onclick="editTax('${tax.name}','${tax.value}')"><img
														src="img/edit.png" height="16px" width="16px"></a>&nbsp;
													<a href="deleteTax?id=${tax.name}"> <img src="img/cross.png" height="16px"
														width="16px"></a>
													<br>
												</c:forEach>
											</div>
											<div id="newTaxGroup" class="modal fade" role="dialog"
												style="top: 25px;">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Create Tax Group</h4>
														</div>
														<div class="modal-body">
															<div class="widget-area">

																<div class="form-group">
																	<label for="" class="font">Tax Group Name :</label> <input
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
												<ul>
													<li><span onclick="showTaxes('${taxGroup.name}');">

															${taxGroup.name}</span>&nbsp;<a
														href="tax1.jsp?id=${taxGroup.name}"> <img
															src="img/edit.png" height="16px" width="16px"></a>&nbsp;<a
														href="#"> <img src="img/cross.png" height="16px"
															width="16px"></a></li>

												</ul>
												<div id="taxList${taxGroup.name}" class="modal fade"
													role="dialog" style="top: 25px;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Tax list</h4>
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
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
								<%-- <p>${requestScope['msg']}</p> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->

	<div id="editTaxDiv" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="editTax">
					<input type="hidden" name="id" value="" id="id1">
						<span>Tax name : </span> <input type="text" class="form-control" name="name" value="" id="name1">
						<span>Tax Value : </span> <input type="text" class="form-control" name="value" value="" id="value1">
						<input type="submit" class="btn btn-default" value="Update">
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
		function showTaxes(tg) {

			/* alert(tg); */
			$("#taxList" + tg).modal('show');
		}

		function editTax(taxnm, taxval) {
			
			$('#id1').val(taxnm);
			$('#name1').val(taxnm);
			$('#value1').val(taxval);
			$("#editTaxDiv").modal('show');
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
