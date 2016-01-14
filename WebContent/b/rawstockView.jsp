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
<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

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
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Stock')}">
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
												style="right: -470px; font-size: 20px; position: absolute;">
												<b>Stock Table:</b>
											</p></li>
									</ul>
								</div>
								<div class="row">
									<div class="widget-area" style="width: 34%;">
										<form role="form" class="sec">
											<div class="form-group">
												<label for="" class="">Product Code: </label> <input
													type="text" placeholder="" id="prodcode"
													class="form-control"> <label for="" class="">Product
													Description: </label> <input type="text" placeholder=""
													id="prodesc" class="form-control"> <label for=""
													class="">Department/Sub Department/Category: </label> <input
													type="text" placeholder="" id="deptcat"
													class="form-control">

											</div>


											<button class="btn green btn-default" type="submit">Search
											</button>
											<button class="btn green btn-default" type="submit">Show
												All</button>
										</form>
										<br> <br>



									</div>
									<div class="widget-area" style="width: 66%">
										<div class="breadcrumbs">
											<ul>
												<li><a title="">Stock View : </a></li>
											</ul>
										</div>



										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>Product Code:</th>
													<th>Product Description:</th>
													<th>Quantity</th>
													<th>UOM</th>
													<th>MRP</th>
													<th>WSP</th>
													<th></th>

												</tr>
											</thead>
											<tbody>
												<tr>
													<td>13 Assassins</td>
													<td>Takashi Miike</td>
													<td>Takashi Miike</td>
													<td>Takashi Miike</td>
													<td>Takashi Miike</td>
													<td>Takashi Miike</td>
													<td></td>
													<td><img alt="" src="images/eye.png" height="25px"></td>

												</tr>
											</tbody>
										</table>


									</div>
								</div>
								<div class="widget-area" style="width: 34%;">
									<table class="table">
										<tbody>
											<tr>
												<td>

													<table cellspacing="0" cellpadding="1" width="304">
														<tbody>
															<tr style="">
																<th>Product Code</th>
																<th>Product Description</th>

															</tr>
														</tbody>
													</table>

												</td>
											</tr>
											<tr>
												<td>
													<div
														style="width: 293px; height: 310px; overflow-x: none; overflow-y: scroll;">
														<table cellspacing="0" cellpadding="1" width="300">
															<tbody>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>

																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="" col-md-9" style="width: 300px; height: 250px;">
									<div class="widget-area"
										style="width: 100%; height: 20%; float: left;">
										<label>Product Code</label> <label>Product Description</label>
									</div>

									<div class="widget-area"
										style="width: 100%; height: 80%; float: left; overflow-y: scroll;">
										<div
											style="width: 48%; height: 100%; float: left; overflow-x: scroll; overflow-y: none;">
											<ul>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
												<li>789456123</li>
											</ul>
										</div>
										<div
											style="width: 48%; height: 100%; float: left; overflow-x: scroll; overflow-y: none;">
											<ul>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
												<li>466545644</li>
											</ul>

										</div>
									</div>

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
			$("#stock").attr("id", "activeSubMenu");
			$("#sStock").attr("style", "color: #6a94ff;");
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>