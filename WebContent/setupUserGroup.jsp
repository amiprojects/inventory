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

			<c:if test="${page.name.equals('User Group')}">
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
								<h3 style="margin-top: 11px;">User Group</h3>

							</div>

							<div class="widget-area"
								style="height: 500px; overflow: auto; width: 60%; float: left;">
								<form action="createUserGroup" method="post"
									id="createUserGroupId">
									<div class="col-md-9">
										<div class="col-md-1"
											style="margin-right: 0px; padding-right: 0px;">
											<font color='red' size='4'><b>*</b></font>
										</div>
										<div class="col-md-11"
											style="margin-left: 0px; padding-left: 0px;">
											<input type="text" placeholder="Enter user group name:"
												name="userGroupName"
												onkeypress="return blockSpecialChar(event)"
												id="userGroupName" class="form-control">
										</div>
									</div>
									<div class="col-md-3">
										<input type="button" value="Create Group"
											class="btn green pull-right" onclick="userGroupSubmit();">
									</div>
									<br> <br>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
											color="red" size="4">*</font>
										<!-- <a href="#"
											id="tree-expand-all">Expand all</a> | <a href="#"
											id="tree-collapse-all">Collapse all</a> -->
										<b>Select Pages:</b>
									</p>
									<ul id="tree">
										<c:forEach items="${sessionScope['ejb'].getAllModule()}"
											var="module">
											<li>
												<!-- <input type="checkbox" value=""> -->${module.name}
												<ul>
													<c:forEach items="${module.pageLists}" var="page">
														<li><input name="pageId" type="checkbox"
															class="isSelected" value="${page.id}">${page.name}</li>
													</c:forEach>
												</ul>
											</li>
										</c:forEach>
									</ul>
								</form>
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
							</div>

							<div class="widget-area"
								style="height: 500px; overflow: auto; width: 40%; float: left;">
								<h2>User Group</h2>
								<ul>
									<c:forEach
										items="${sessionScope['ejb'].getAllUserGroupByCompany(compInfo.id)}"
										var="ug">
										<li><a href="#" onclick="viewUser('${ug.id}');">${ug.groupName}</a></li>

										<div id="userGroup${ug.id}" class="modal fade" role="dialog"
											style="top: 25px;">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Update User Group</h4>
													</div>
													<div class="modal-body">
														<form action="updateUserGroup" method="post">
															<div class="col-md-8">
																<input type="hidden" name="usrGpId" value="${ug.id}">
																<input type="text" name="userGroupName"
																	onkeypress="return blockSpecialChar(event)"
																	class="form-control" value="${ug.groupName}">
															</div>
															<div class="col-md-4">
																<input type="submit" value="Update Group"
																	class="btn green pull-right">
															</div>
															<p></p>
															<ul id="tree">
																<c:forEach
																	items="${sessionScope['ejb'].getAllModuleListAccordingUserGroupId(ug.id)}"
																	var="module">
																	<li>${module.name}
																		<ul>
																			<c:set value="${ug.pageLists}" var="pglst" />

																			<c:forEach items="${module.pageLists}" var="page">
																				<c:choose>

																					<c:when test="${page.contains}">
																						<li><input name="pageId" type="checkbox"
																							checked="checked" value="${page.id}">${page.name}</li>
																					</c:when>
																					<c:otherwise>
																						<li><input name="pageId" type="checkbox"
																							value="${page.id}">${page.name}</li>
																					</c:otherwise>

																				</c:choose>
																			</c:forEach>
																		</ul>
																	</li>
																</c:forEach>
															</ul>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>



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
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupUgroup").attr("style", "color: #6a94ff;");
			//$('#tree').abixTreeList();
		});
		function viewUser(id) {
			$("#userGroup" + id).modal();
		}
		function userGroupSubmit() {
			var i = 0;
			$(".isSelected").each(function() {
				if ($(this).is(':checked')) {
					i = 1;
				}
			});
			if ($("#userGroupName").val() == "") {
				alert("Enter user group name...");
			} else if (i == 0) {
				alert("Select pages to give access...");
			} else {
				$("#createUserGroupId").submit();
			}
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