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
<!-- Script -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>

<script src="js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#prnt")
				.autocomplete(
						{
							source : function(req, resp) {
								$.ajax({
									url : "getAllDepartments",
									dataType : "json",
									data : {
										name : req.term
									},
									success : function(data) {
										resp($.map(data, function(item) {
											return {
												value : item.name,
												id : item.id,
												status : item.status,
												pname : item.pName
											}
										}));
									}
								});
							},
							change : function(event, ui) {
								if (ui.item == null) {
									$(this).val("");
									$("#id").val("");
									$('#status').val("");
									$("#perentOfSubDept").html("");
									$("#attr1").prop("disabled", true);
									$("#attr2").prop("disabled", true);
									$("#attr3").prop("disabled", true);
									$("#attr4").prop("disabled", true);
									$("#attr5").prop("disabled", true);
									$("#attr6").prop("disabled", true);
								} else {
									$("#id").val(ui.item.id);
									$('#status').val(ui.item.status);
									if (ui.item.status == "2") {
										$("#perentOfSubDept").html(
												'Perent Department: '
														+ ui.item.pname);
										$("#attr1").prop("disabled", false);

										$("#attr1Star")
												.html(
														"Attribute 1:<font color='red' size='4'>*</font>");
										/* $("#attr2").prop("disabled", false);
										$("#attr3").prop("disabled", false);
										$("#attr4").prop("disabled", false);
										$("#attr5").prop("disabled", false);
										$("#attr6").prop("disabled", false); */
									} else {
										$("#perentOfSubDept").html("");
										$("#attr1").prop("disabled", true);
										$("#attr2").prop("disabled", true);
										$("#attr3").prop("disabled", true);
										$("#attr4").prop("disabled", true);
										$("#attr5").prop("disabled", true);
										$("#attr6").prop("disabled", true);

										$("#attr1Star").html("Attribute 1:");
									}
								}
							},
							select : function(event, ui) {
								if (ui.item == null) {
									$(this).val("");
									$("#id").val("");
									$('#status').val("");
									$("#attr1").prop("disabled", true);
									$("#attr2").prop("disabled", true);
									$("#attr3").prop("disabled", true);
									$("#attr4").prop("disabled", true);
									$("#attr5").prop("disabled", true);
									$("#attr6").prop("disabled", true);
								} else {
									$("#id").val(ui.item.id);
									$('#status').val(ui.item.status);
									if (ui.item.status == "2") {
										$("#perentOfSubDept").html(
												'Perent Department: '
														+ ui.item.pname);
										$("#attr1").prop("disabled", false);
										/* $("#attr2").prop("disabled", false);
										$("#attr3").prop("disabled", false);
										$("#attr4").prop("disabled", false);
										$("#attr5").prop("disabled", false);
										$("#attr6").prop("disabled", false); */
									} else {
										$("#perentOfSubDept").html("");
										$("#attr1").prop("disabled", true);
										$("#attr2").prop("disabled", true);
										$("#attr3").prop("disabled", true);
										$("#attr4").prop("disabled", true);
										$("#attr5").prop("disabled", true);
										$("#attr6").prop("disabled", true);
									}
								}
							}
						});
	});
	function addBtn() {
		if ($("#dName").val() != "") {
			if ($('input[name=parent]:checked').val() == 'n') {
				$.ajax({
					type : "post",
					url : "createDept",
					data : {
						name : $("#dName").val()
					},
					success : function(data) {
						window.location = "setupDepartment.jsp";
					}
				});
			} else if ($("#prnt").val() != "") {
				if ($('#status').val() == "1") {
					$.ajax({
						type : "post",
						url : "createSubDept",
						data : {
							name : $("#dName").val(),
							deptId : $("#id").val()
						},
						success : function(data) {
							window.location = "setupDepartment.jsp";
						}
					});
				} else if ($('#status').val() == "2") {
					if ($("#attr1").val() != 0 || $("#attr2").val() != 0
							|| $("#attr3").val() != 0 || $("#attr4").val() != 0
							|| $("#attr5").val() != 0 || $("#attr6").val() != 0) {
						$.ajax({
							type : "post",
							url : "createCategory",
							data : {
								name : $("#dName").val(),
								subDeptId : $("#id").val(),
								attr1 : $("#attr1").val(),
								attr2 : $("#attr2").val(),
								attr3 : $("#attr3").val(),
								attr4 : $("#attr4").val(),
								attr5 : $("#attr5").val(),
								attr6 : $("#attr6").val()
							},
							success : function(data) {
								window.location = "setupDepartment.jsp";
							}
						});
					} else {
						alert("Please insert atleast one attribute");
					}
				} else {
					alert("invalid denomination.");
				}
			} else {
				alert("Please enter parent name");
			}
		} else {
			alert("Please enter Department name")
		}

	}
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			if ($('#msg').html() == "error: Transaction aborted") {
				($('#msg').html("Can not delete due to used in somewhere..."));
			}
		}
	});
</script>
</head>
<body>
	<script>
		var i = 0;
	</script>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if
				test="${page.name.equals('Department/Sub-Department/Category')}">
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
								<h3 style="margin-top: 11px;">Department/Sub-Department/Category</h3>


							</div>

							<div class="widget-area">
								<div class="col-md-12">
									<div class="widget-area" style="width: 70%">
										<form action="#">
											<input type="hidden" value="" id="status"> <input
												type="hidden" value="" id="id">
											<div class="widget-area" style="width: 60%">
												<div class='toast' style='display: none'>
													<h3 id="msg">${requestScope['msg']}</h3>
												</div>
												<div class="breadcrumbs">
													<ul>
														<li>Add Department</li>
													</ul>
												</div>
												<span>Department name:<font color="red" size="4">*</font>
												</span> <input type="text"
													onkeypress="return blockSpecialChar(event)" id="dName"
													class="form-control"> <span>Parent</span>&nbsp; <input
													type="radio" name="parent" value="y">&nbsp;Y &nbsp;<input
													type="radio" name="parent" value="n" checked="checked">&nbsp;N
												<br> <span id="parentNameStar">Parent name: </span><span
													id="perentOfSubDept"></span> <input type="text"
													class="form-control"
													onkeypress="return blockSpecialChar(event)" id="prnt"
													disabled="disabled"><br> <input type="button"
													value="submit" onclick="addBtn()"
													class="btn green pull-right">
											</div>
											<div class="widget-area" style="width: 40%">
												<label for="" class="font"><span id="attr1Star">Attribute
														1:</span></label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr1"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr1F();"><label for="" class="font">Attribute
													2:</label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr2"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr2F();"><label for="" class="font">Attribute
													3:</label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr3"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr3F();"><label for="" class="font">Attribute
													4:</label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr4"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr4F();"><label for="" class="font">Attribute
													5:</label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr5"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr5F();"><label for="" class="font">Attribute
													6:</label><input type="text" class="form-control" placeholder=""
													disabled="disabled" id="attr6"
													onkeypress="return blockSpecialChar(event)"
													onchange="attr6F();">
											</div>
										</form>
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
												<c:forEach
													items="${sessionScope['ejb'].getAllDepartments()}"
													var="dept">
													<li>${dept.name}<a href="deleteDept?id=${dept.id}"><span
															style="color: red;">X</span></a>
														<ul>
															<c:forEach
																items="${sessionScope['ejb'].getAllSubDepartmentsByDepartmentId(dept.id)}"
																var="subDept">
																<li>${subDept.name}<a
																	href="deleteSubDept?id=${subDept.id}"><span
																		style="color: red;">X</span></a>
																	<ul>

																		<c:forEach var="cat"
																			items="${sessionScope['ejb'].getAllCategoryBySubDepartmentId(subDept.id)}">
																			<li>${cat.name}<a
																				href="deleteCategory?id=${cat.id}"><span
																					style="color: red;">X</span></a>
																				<ul>
																					<%-- <c:forEach var="pro"
																						items="${sessionScope['ejb'].getAllProductDetailByCategoryId(cat.id)}">
																						<li>${pro.description}</li>
																					</c:forEach> --%>
																					<c:if test="${cat.attrNmae1!=null}">
																						<li>${cat.attrNmae1}</li>
																					</c:if>
																					<c:if test="${cat.attrNmae2!=null}">
																						<li>${cat.attrNmae2}</li>
																					</c:if>
																					<c:if test="${cat.attrNmae3!=null}">
																						<li>${cat.attrNmae3}</li>
																					</c:if>
																					<c:if test="${cat.attrNmae4!=null}">
																						<li>${cat.attrNmae4}</li>
																					</c:if>
																					<c:if test="${cat.attrNmae5!=null}">
																						<li>${cat.attrNmae5}</li>
																					</c:if>
																					<c:if test="${cat.attrNmae6!=null}">
																						<li>${cat.attrNmae6}</li>
																					</c:if>
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
					<form action="createDept" method="post">
						<input type="text" name="name"> <input type="submit"
							value="add">
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>

	<script>
		$("input:radio[name=parent]")
				.click(
						function() {
							var value = $(this).val();
							//alert(value);
							if (value == "y") {
								$("#prnt").prop("disabled", false);

								$("#parentNameStar")
										.html(
												"Parent name:<font color='red' size='4'>*</font>");
							} else {
								$("#prnt").prop("disabled", true);

								$("#parentNameStar").html("Parent name:");
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
		function attr1F() {
			$("#attr2").prop("disabled", false);
			//$("#attr1").prop("disabled", true);
		}
		function attr2F() {
			$("#attr3").prop("disabled", false);
			//$("#attr2").prop("disabled", true);
		}
		function attr3F() {
			$("#attr4").prop("disabled", false);
			//$("#attr3").prop("disabled", true);
		}
		function attr4F() {
			$("#attr5").prop("disabled", false);
			//$("#attr4").prop("disabled", true);
		}
		function attr5F() {
			$("#attr6").prop("disabled", false);
			//$("#attr5").prop("disabled", true);
		}
		function attr6F() {
			//$("#attr6").prop("disabled", true);
		}
	</script>

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupDept").attr("style", "color: #6a94ff;");
			$('#tree').abixTreeList();
		});
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
