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
												style="right: -350px; font-size: 20px; position: absolute;">
												<b>Department/Sub-Department/Category</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area">
									<div class="widget-area" style="width: 70%">
										<div class="widget-area" style="width: 60%">
											<div class="breadcrumbs">
												<ul>
													<li>Add Department</li>
												</ul>
											</div>
											<span>Department name: </span> <input type="text"
												class="form-control"> <span>Parent</span>&nbsp; <input
												type="radio" name="parent" value="y">&nbsp;Y &nbsp;<input
												type="radio" name="parent" value="n">&nbsp;N <br>
											<span>Parent name: </span> <input type="text"
												class="form-control" id="prnt" disabled="disabled">
										</div>
										<div class="widget-area" style="width: 40%">
											<input type="text" class="form-control"
												placeholder="Attribute name 1" disabled="disabled"><input type="text"
												class="form-control" placeholder="Attribute name 2" disabled="disabled"><input
												type="text" class="form-control"
												placeholder="Attribute name 3" disabled="disabled"><input type="text"
												class="form-control" placeholder="Attribute name 4" disabled="disabled"><input
												type="text" class="form-control"
												placeholder="Attribute name 5" disabled="disabled"><input type="text"
												class="form-control" placeholder="Attribute name 6" disabled="disabled">
										</div>
									</div>
									<div class="widget-area" style="width: 30%">
										<!-- <h2 class="widget-title">
											<strong>Tree</strong> List
										</h2> -->
										<div class="tree-list">
											<p>
												<a href="#" id="tree-expand-all">Expand all</a> | <a
													href="#" id="tree-collapse-all">Collapse all</a>
											</p>
											<!-- Listing directory ZendX from ZendFramework library -->
											<ul id="tree">
												<li onclick="addDept();">create Department</li>
												<c:forEach
													items="${sessionScope['ejb'].getAllDepartments()}"
													var="dept">
													<li>${dept.name}<a href="deleteDept?id=${dept.id}"><span
															style="color: red;">X</span></a>
														<ul>
															<li onclick="createSubDept('${dept.id}');">Create
																Sub-Department

																<div id="createSubDept${dept.id}" class="modal fade"
																	role="dialog" style="top: 25px;">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close"
																					data-dismiss="modal">&times;</button>
																				<h4 class="modal-title">Tax list</h4>
																			</div>
																			<div class="modal-body">
																				<form action="createSubDept">
																					<input type="hidden" name="deptId"
																						value="${dept.id}"> <input type="text"
																						name="name"> <input type="submit"
																						value="add">
																				</form>
																			</div>
																			<div class="modal-footer"></div>
																		</div>

																	</div>
																</div>

															</li>
															<c:forEach
																items="${sessionScope['ejb'].getAllSubDepartmentsByDepartmentId(dept.id)}"
																var="subDept">
																<li>${subDept.name}<a
																	href="deleteSubDept?id=${subDept.id}"><span
																		style="color: red;">X</span></a>
																	<ul>
																		<li onclick="createCategory('${subDept.id}');">Create
																			Category

																			<div id="createCategory${subDept.id}"
																				class="modal fade" role="dialog" style="top: 25px;">
																				<div class="modal-dialog">
																					<div class="modal-content">
																						<div class="modal-header">
																							<button type="button" class="close"
																								data-dismiss="modal">&times;</button>
																							<h4 class="modal-title">Create Category</h4>
																						</div>
																						<div class="modal-body">
																							<form action="createCategory">
																								<input type="hidden" name="subDeptId"
																									value="${subDept.id}"> <label
																									for="name">Category name</label> <input
																									type="text" name="name"> <label
																									for="attr1">Attribute name1</label> <input
																									type="text" name="attr1"> <label
																									for="attr2">Attribute name2</label> <input
																									type="text" name="attr2"> <label
																									for="attr3">Attribute name3</label> <input
																									type="text" name="attr3"> <label
																									for="attr4">Attribute name4</label> <input
																									type="text" name="attr4"> <label
																									for="attr5">Attribute name5</label> <input
																									type="text" name="attr5"> <label
																									for="attr6">Attribute name6</label> <input
																									type="text" name="attr6"> <input
																									type="submit" value="add">
																							</form>
																						</div>
																						<div class="modal-footer"></div>
																					</div>

																				</div>
																			</div>

																		</li>
																		<c:forEach var="cat"
																			items="${sessionScope['ejb'].getAllCategoryBySubDepartmentId(subDept.id)}">
																			<li>${cat.name}<a
																				href="deleteCategory?id=${cat.id}"><span
																					style="color: red;">X</span></a>
																				<ul>
																					<li onclick="createProduct('${cat.id}');">Create
																						Product

																						<div id="createProduct${cat.id}"
																							class="modal fade" role="dialog"
																							style="top: 25px;">
																							<div class="modal-dialog">
																								<div class="modal-content">
																									<div class="modal-header">
																										<button type="button" class="close"
																											data-dismiss="modal">&times;</button>
																										<h4 class="modal-title">Tax list</h4>
																									</div>
																									<div class="modal-body">
																										<form action="createProduct">
																											<span>Product type : </span><select
																												class="form-control" name="name">
																												<option value="raw">Raw</option>
																												<option value="ready">Ready</option>
																											</select> <span>Product name : </span><input
																												type="text" class="form-control"
																												name="productName"> <span>Product
																												code : </span><input type="text"
																												class="form-control" name="productCode">
																											<input type="hidden" name="catId"
																												value="${cat.id}"> <input
																												type="submit" value="Save"
																												class="btn green pull-right" name="catId">
																										</form>
																									</div>
																									<div class="modal-footer"></div>
																								</div>

																							</div>
																						</div>
																					</li>

																					<c:forEach var="cat"
																						items="${sessionScope['ejb'].getAllProductDetailByCategoryId(cat.id)}">
																						<li>${cat.name}</li>
																					</c:forEach>
																				</ul>
																			</li>
																		</c:forEach>
																	</ul>
																</li>
															</c:forEach>
														</ul>
													</li>
												</c:forEach>
											</ul>
										</div>
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

	<!-- main -->
	<div id="createDept" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Tax list</h4>
				</div>
				<div class="modal-body">
					<form action="createDept">
						<input type="text" name="name"> <input type="submit"
							value="add">
					</form>
				</div>
				<div class="modal-footer"></div>
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
		$("input:radio[name=parent]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "y") {
				$("#prnt").prop("disabled", false);
			} else {
				$("#prnt").prop("disabled", true);
			}
		});

		$(function() {
			$("#datepicker").datepicker();
		});
		function addDept() {
			$("#createDept").modal('show');
		}
		function createSubDept(id) {
			$("#createSubDept" + id).modal('show');
		}
		function createCategory(id) {
			$("#createCategory" + id).modal('show');
		}
		function createProduct(id) {
			$("#createProduct" + id).modal('show');
		}
	</script>

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>