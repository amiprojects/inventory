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

<link rel="stylesheet" href="css/toast.css" type="text/css" />
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
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminProduction' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('User')}">
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
	<c:set var="compInfo"
		value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />
	<div class="main" style="height: 664px;">
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">User</h3>
							</div>

							<div class="widget-area" style="width: 100%">
								<div class="col-md-12">
									<div class="widget-area"
										style="height: 500px; overflow: auto; width: 70%; float: left;">
										<form action="createNewUser" method="post" id="createUser">
											<div class="col-md-4">
												<span>User Id:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="userId" type="text" class="form-control">
											</div>

											<div class="col-md-4">
												<span>Name:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="name" type="text" class="form-control">
											</div>
											<div class="col-md-4">
												<span>Password:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="pass" type="password" class="form-control">
											</div>
											<div class="col-md-4">
												<span>Confirm Password:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="conPass" type="password" class="form-control">
											</div>

											<div class="col-md-12"></div>
											<div class="col-md-4">
												<span>Mobile:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="mobile" type="text" maxlength="10"
													class="form-control">
											</div>
											<div class="col-md-4">
												<span>User Group:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<select class="form-control" name="ugid">
													<option value="0">Select a user group</option>
													<c:forEach
														items="${sessionScope['ejb'].getAllUserGroupByCompany(compInfo.id)}"
														var="ug">
														<option value="${ug.id}">${ug.groupName}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-4">
												<span>Security Que1:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<select class="form-control" name="sqId1">
													<option value="0">Select Security Que from group1</option>
													<c:forEach
														items="${sessionScope['ejb'].getSecurityQuestionsByGroup('First')}"
														var="sq1">
														<option value="${sq1.id}">${sq1.question}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-4">
												<span>Answer:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="ans1" id="ans1" type="text"
													class="form-control">
											</div>
											<div class="col-md-4">
												<span>Security Que2:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<select class="form-control" name="sqId2">
													<option value="0">Select Security Que from group2</option>
													<c:forEach
														items="${sessionScope['ejb'].getSecurityQuestionsByGroup('Favourite')}"
														var="sq2">
														<option value="${sq2.id}">${sq2.question}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-4">
												<span>Answer:<font color="red" size="4">*</font></span>
											</div>
											<div class="col-md-8">
												<input name="ans2" id="ans2" type="text"
													class="form-control">
											</div>

											<div class="col-md-12">
												<input name="name" onclick="submit1();" type="button"
													class="btn green pull-right" value="Create">
											</div>
										</form>
										<div class="col-md-12"></div>

										<div class='toast' style='display: none'>
											<h3 id="msg">${requestScope['msg']}</h3>
										</div>
									</div>
									<div class="widget-area"
										style="height: 500px; overflow: auto; width: 30%; float: left;">
										<ul>
											<c:forEach items="${sessionScope['ejb'].getAllUsers()}"
												var="user">
												<c:if test="${user.companyInfo.id == compInfo.id}">
													<c:if
														test="${!(user.userId=='adminKaanish' || user.userId=='adminProduction' || user.userId=='adminKainat')}">
														<li><a href="#" onclick="userEdit('${user.userId}');">${user.name}</a></li>
													</c:if>
													<div id="edit${user.userId}" class="modal fade"
														role="dialog" style="top: 25px;">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Update User</h4>
																</div>
																<div class="modal-body">
																	<form action="updateUser" method="post">
																		<input type="hidden" value="${user.userId}"
																			name="userId">

																		<div class="col-md-12">
																			<select class="form-control" name="ugid">
																				<option value="0">Select a user group</option>
																				<c:forEach
																					items="${sessionScope['ejb'].getAllUserGroup()}"
																					var="ug">
																					<c:choose>
																						<c:when test="${ug.id==user.userGroup.id}">
																							<option value="${ug.id}" selected="selected">${ug.groupName}</option>
																						</c:when>
																						<c:otherwise>
																							<option value="${ug.id}">${ug.groupName}</option>
																						</c:otherwise>
																					</c:choose>

																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-md-12">
																			<input type="submit" class="btn green pull-right"
																				value="Update">
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Close</button>
																</div>
															</div>

														</div>
													</div>
												</c:if>
											</c:forEach>
										</ul>
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
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupUser").attr("style", "color: #6a94ff;");
		});

		function submit1() {
			var uid = $('[name="userId"]').val();
			var name = $('[name="name"]').val();
			var pass = $('[name="pass"]').val();
			var conPass = $('[name="conPass"]').val();
			var mobile = $('[name="mobile"]').val();
			var ugid = $('[name="ugid"]').val();
			var sqId1 = $('[name="sqId1"]').val();
			var sqId2 = $('[name="sqId2"]').val();

			/* if (ugid != 0) { */
			if (pass == conPass) {
				if (uid != "" && name != "" && mobile != "" && ugid != 0
						&& sqId1 != 0 && sqId2 != 0 && $("#ans1").val() != ""
						&& $("#ans2").val() != "") {
					$("#createUser").submit();
				} else {
					alert("please select all field and do not left any field blank.");
				}
			} else {
				alert('password mismatch!');
			}
			/* } else {
				alert('please select a user group');
			} */
		}
		function userEdit(id) {
			$("#edit" + id).modal('show');
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>