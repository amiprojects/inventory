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
							<div class="col-md-12">

								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b> Country/State/City</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area" style="width: 25%;">
									<form action="addCountry">
										<h3>Country</h3>
										<br> <label for="exampleInputEmail1">Name:</label> <input
											id="creConName" type="text" class="form-control" name="name"
											onkeyup="crecontxt();"> <input id="creConbtn"
											class="btn btn-info mini"
											style="left: 173px; position: absolute;" type="submit"
											value="Add" disabled="disabled"> <br> <br>
										<div
											style="overflow-y: scroll; width: 193px; height: 317px; border: 1px solid rgba(119, 119, 119, 0.73);">


											<ul>
												<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
													var="contry">
													<li>${contry.countryName}</li>
												</c:forEach>
											</ul>




										</div>

									</form>

								</div>


								<div class="widget-area" style="width: 25%;">
									<form action="addState">
										<h3>State</h3>
										<br> <label for="exampleInputEmail1">Name:</label> <input
											id="creConName" type="text" class="form-control" name="name"
											onkeyup="crecontxt();">


										<input style="left: 173px; position: absolute;"
											class="btn btn-info mini" type="submit" value="Add">

										<br> <span><b>Country:</b></span><select name="countryid"
											style="width: 185px; height: 30px;">
											<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
												var="contry">
												<option value="${contry.id}">${contry.countryName}</option>
											</c:forEach>
										</select> <br> <br>
										<div
											style="overflow-y: scroll; width: 193px; height: 267px; border: 1px solid rgba(119, 119, 119, 0.73);">


											<ul>
												<c:forEach items="${sessionScope['ejb'].getAllState()}"
													var="stst">
													<li>${stst.stateName}</li>
												</c:forEach>
											</ul>




										</div>



									</form>
								</div>
								
								
								<div class="widget-area" style="width: 25%;">
									<h3>City</h3>
									<br> <label for="exampleInputEmail1">Name:</label> <input
										class="form-control" type="text" name="city"
										style="text-transform: uppercase;">
									<button style="left: 173px; position: absolute;"
										class="btn btn-info mini" type="button">Add</button>

									<br> <span><b>Country:</b></span><br> <select
										style="width: 185px; height: 30px;"><option>India</option></select>
									<br> <br> <span><b>State:</b></span><select
										style="width: 185px; height: 30px;"><option>West
											Bengal</option></select> <br> <br>
									<textarea style="overflow-y: scroll;" rows="10" cols="24"></textarea>




								</div>
								<div class="widget-area" style="width: 25%">
									<div class="tree-list"><h3>Tree List</h3>
										<p>
											<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
												id="tree-collapse-all">Collapse all</a>
										</p>
										<!-- Listing directory ZendX from ZendFramework library -->
										<ul id="tree">
											<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
												var="contry">
												<li>${contry.countryName}<a href="#"
													onclick="deleteCountry(${contry.id},'${contry.countryName}')"><span
														style="color: red;">X</span></a>
													<ul>
														<c:forEach var="state"
															items="${sessionScope['ejb'].getAllStatesByCountryId(contry.id)}">
															<li>${state.stateName}
																<ul>
																	<li>Jquery.php</li>
																</ul>
															</li>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
										</ul>
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


	<!-- Content Sec -->

	<!-- Page Container -->

	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
			$("#createState").hide();
		});

		function crecontxt() {
			if ($('#creConName').val() != "") {
				$('#creConbtn').prop("disabled", false);
			} else {
				$('#creConbtn').prop("disabled", true);
			}
		}
		function stateNameKeyUp() {
			if ($('#stateName').val() != "") {
				$('#stateNameBtn').prop("disabled", false);
			} else {
				$('#stateNameBtn').prop("disabled", true);
			}
		}
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
									value : item.countryName,
									id : item.id
								}
							}));
						}
					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$('#countryForStatebtn').prop("disabled", true);
					} else {
						$("#countryId").val(ui.item.id);
						$('#countryForStatebtn').prop("disabled", false);
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$('#countryForStatebtn').prop("disabled", true);
					} else {
						$("#countryId").val(ui.item.id);
						$('#countryForStatebtn').prop("disabled", false);
					}
				}
			});
		});
		function statePopup() {
			$("#createState").show();
		}
		function closed() {
			$("#createState").hide();
		}
		function deleteCountry(id,c){
			y=confirm("Do you want to delete country: "+c);
			if(y==true){
				window.location="deleteCountry?id="+id;
			}
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
