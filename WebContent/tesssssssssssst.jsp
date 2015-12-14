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
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Setup unit of measurement</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area" style="width: 30%">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Name : </label> <input type="text"
												placeholder="" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Abbrev : </label> <input type="text"
												placeholder="" id="" class="">
										</div>

										<button class="btn green btn-default" type="submit">Search
										</button>
										<button class="btn green btn-default" type="submit">Advanced
											Search</button>
									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Abbrev</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:set var="count" value="${1}" />
											<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
												var="unit">
												<tr>
													<td>${count}</td>
													<td>${unit.name}</td>
													<td>${unit.abbreviation}</td>
													<td><a href="#" onclick="viewQtyUnit('${unit.id}');"><img
															alt="click to view" src="images/eye.png" height="20"></a></td>
												</tr>
												<c:set var="count" value="${count+1}" />
										
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="widget-area" style="width: 70%">
									

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#general">General</a></li>
										
									</ul>
									<br>
									<div class="tab-content">
										<div id="general" class="tab-pane fade active in">
											<div class="row">
												<div class="col-md-2">Abreve :</div>
												<div class="col-md-10">
													<input type="text" id="Abreve" readonly="readonly"
														class="form-control">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Name :</div>
												<div class="col-md-10">
													<input type="text" id="unitName" readonly="readonly"
														class="form-control"> <input type="hidden"
														id="unitNameId" value=""> <input type="hidden"
														id="unitNameId1" value="">
												</div>
											</div>
											<div class="row">
												<div class="col-md-2">Description</div>
												<div class="col-md-10">
													<textarea rows="" cols="" class="form-control"
														readonly="readonly" id="DisplayDescription"></textarea>
												</div>
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
	</div>

	<!-- main -->

	<div id="newUOM" class="modal fade" role="dialog" style="top: 25px;">
		<form action="addUOM" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">New Unit of Measurements :</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-3">Select UOM type :</div>
							<div class="col-md-7">
								<select class="form-control" id="qtyUnitTypeId"
									name="qtyUnitTypeId">
									<c:forEach items="${sessionScope['ejb'].getAllQtyUnitTypes()}"
										var="qtyUnitType">
										<option value="${qtyUnitType.id}">${qtyUnitType.name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- <div class="col-md-2">
								<button type="button" class="btn btn-info btn-sm"
									data-toggle="modal" data-target="#nameUOM">Add</button>
							</div> -->
						</div>
						<div class="row">
							<div class="col-md-3">Abbreviation :</div>
							<div class="col-md-9">
								<input type="text" name="abbreviation" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">Name UOM :</div>
							<div class="col-md-9">
								<input type="text" name="name" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">UOM Description :</div>
							<div class="col-md-9">
								<textarea rows="" cols="" name="description"
									class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-default" value="Submit">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="nameUOM" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="close1" class="close">&times;</button>
					<h4 class="modal-title">Add new UOM type :</h4>
				</div>
				<div class="modal-body">
					<span>Name :</span> <input type="text" id="UOMname"
						class="form-control">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="UOMnameSave">Save</button>
					<button type="button" class="btn btn-default" id="close">Close</button>
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

	<script type="text/javascript">
		var unit1;
		var unit2;

		
		function addNewConversion() {
			$("#addCon" + $("#unitNameId").val()).modal("show");
		}
	

		function viewQtyUnit(id) {
			$
					.ajax({
						type : "post",
						url : "getQtyUnit",
						data : {
							id : id
						},
						dataType : "json",
						success : function(data) {
							$("#Abreve").val(data.abbreviation);
							$("#unitName").val(data.name);
							$("#DisplayDescription").val(data.description);
							
							
							
							
						}

					});
		}
		

		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupUOM").attr("style", "color: red;");
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});

		$("#close").click(function() {
			$("#nameUOM").modal("hide");
		});
		$("#close1").click(function() {
			$("#nameUOM").modal("hide");
		});
		

		
	</script>
	<div class='toast' style='display: none'>
		<h3 id="msg">${requestScope['msg']}</h3>
	</div>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>