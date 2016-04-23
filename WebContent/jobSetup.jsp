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
		$("#jobSetup").attr("style", "color: #6a94ff;");
		$("#setup").attr("id", "activeSubMenu");
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
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

			<c:if test="${page.name.equals('Job Setup')}">
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
							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Job Setup Management</h3>
							</div>
							<div class="widget-area">
								<div class="widget-area"
									style="height: 380px; overflow: auto; width: 50%;">
									<form action="setJobTypes" method="post">
										<div class="col-md-12">
											<div class="form-group">
												<label for="" class="font">Job Name :<font
													color="red" size="4">*</font></label> <input type="text"
													placeholder="Enter job name" id=""
													onkeypress="return blockSpecialChar(event)" name="name"
													class="form-control" required>
											</div>
										</div>
										<div class="col-md-11">
											<div class="form-group">
												<label for="" class="font">Job Description :</label>
												<textarea rows="" cols="" name="jobDesc"
													onkeypress="return blockSpecialChar(event)"></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<input class="btn green pull-left" type="submit" value="Add">
										</div>
									</form>
								</div>
								<div class="widget-area" style="width: 50%;">
									<table class="table">
										<thead>
											<tr>
												<th width="30%">Job name</th>
												<th width="35%">Job Description</th>
												<th width="20%">Edit</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${sessionScope['ejb'].getAllJobTypes()}"
												var="jobtype">
												<tr>
													<td>${jobtype.jobName}</td>
													<td>${jobtype.jobDescription}</td>
													<td><a href="#"
														onclick="editJobTypes('${jobtype.id}')"><img alt=""
															src="img/edit.png"></a></td>
												</tr>
												<div id="jobEdit${jobtype.id}" class="modal fade"
													role="dialog" style="top: 25px;">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Edit Job Types</h4>
															</div>
															<div class="modal-body">
																<form action="updateJob" method="post"
																	id="updateJobId${jobtype.id}">
																	<input type="hidden" value="${jobtype.id}" name="id">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label for="name" class="font">Job Name :</label> <input
																				type="text" placeholder="Enter job name" id=""
																				name="name"
																				onkeypress="return blockSpecialChar(event)"
																				value="${jobtype.jobName}" class="form-control"
																				required> <input type="hidden"
																				id="jobUsedSize${jobtype.id}"
																				value="${jobtype.jobsForDesignCostSheets.size()}">
																		</div>
																	</div>
																	<div class="col-md-12">
																		<div class="form-group">
																			<label for="" class="font">Job Description :</label>
																			<textarea rows="" cols="" name="jobDesc"
																				onkeypress="return blockSpecialChar(event)">${jobtype.jobDescription}</textarea>
																		</div>
																	</div>
																	<div class="col-md-12">
																		<input class="btn green pull-left" type="button"
																			value="Update" onclick="cancelF('${jobtype.id}');">
																	</div>
																</form>
															</div>
															<div class="modal-footer"></div>
														</div>

													</div>
												</div>
											</c:forEach>
										</tbody>
									</table>
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

	<div id="cancelOrNot" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- <h4 class="modal-title">Modal Header</h4> -->
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>This job is used in somewhere. On update, the job
									name will be changed everywhere it is being used. Do you want
									to update?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-success medium" id="yesC">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noC">No</button>
							</div>
						</div>
					</div>
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
	<script src="js/tinymce.min.js"></script>
	<script>
		tinymce.init({
			selector : 'textarea'
		});
		function editJobTypes(id) {
			$("#jobEdit" + id).modal('show');
		}

		function cancelF(id) {
			if ($("#jobUsedSize" + id).val() > 0) {
				$("#cancelOrNot").modal("show");
			} else {
				$("#updateJobId" + id).submit();
			}
			$("#yesC").click(function() {
				$("#updateJobId" + id).submit();
			});
			$("#noC").click(function() {
				$("#cancelOrNot").modal("hide");
			});
		}
	</script>
	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
