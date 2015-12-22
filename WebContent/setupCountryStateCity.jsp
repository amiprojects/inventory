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
		$("#setup").attr("id", "activeSubMenu");
		$("#sSetupCity").attr("style", "color: red;");
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
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="breadcrumbs" style="height: 39px">
								<ul>
									<li><p
											style="right: -700px; font-size: 20px; position: absolute;">
											<b> Country/State/City</b>
										</p></li>
								</ul>
							</div>
							<div class="widget-area" style="width: 25%; height: 500px;">
								<form action="addCountry" class="sec">
									<h3>Country</h3>
									<input class="btn green pull-left" type="button"
										onclick="countryPopup();" value="Add Country">
									<div id="createCountry" style="top: 25px; position: absolute;">
										<div class="modal-dialog" style="z-index: 1">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" onclick="closed();">&times;</button>
													<h4 class="modal-title">Country Ctreation</h4>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-md-1">Name:</div>
														<div class="col-md-10">
															<input id="creConName" type="text" class="form-control"
																name="name" onkeyup="crecontxt();">
														</div>
														<div class="col-md-1">
															<input id="creConbtn" class="btn green pull-right"
																type="submit" value="Add" disabled="disabled">
														</div>
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</form>
								<div class="widget-area"
									style="overflow-y: scroll; height: 350px;">
									<ul>
										<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
											var="contry">
											<li>${contry.countryName}<a href="#"
												onclick="deleteCountry(${contry.id},'${contry.countryName}')">
													<img src="img/cross.png" height="16px" width="16px">
											</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="widget-area" style="width: 25%; height: 500px;">
								<form action="addState" class="sec">
									<h3>State</h3>
									<input class="btn green pull-left" type="button"
										onclick="statePopup();" value="Add State">
									<div id="createState" style="top: 25px; position: absolute;">
										<div class="modal-dialog" style="z-index: 1">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" onclick="closed();">&times;</button>
													<h4 class="modal-title">State Ctreation</h4>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-md-1">Name:</div>
														<div class="col-md-11">
															<input type="text" class="form-control" name="name"
																id="stateName" onkeyup="stateNameKeyUp();">
														</div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-4">The State Belongs to :</div>
														<div class="col-md-6">
															<input id="country" type="text" name="name"
																class="form-control"> <input id="countryId"
																type="hidden" name="id">
														</div>
														<div class="col-md-2">
															<input id="countryForStatebtn" type="submit"
																value="create" disabled="disabled"
																class="btn green pull-right">
														</div>
													</div>
												</div>
												<div class="modal-footer"></div>
											</div>
										</div>
									</div>
								</form>
								<br> <br> <span><b>Select Country:</b></span><select
									class="form-control" name="countryid"
									style="width: 185px; height: 30px;"
									onchange="stateDispByCountry();">
									<option value="0">select country</option>
									<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
										var="contry">
										<option value="${contry.id}">${contry.countryName}</option>
									</c:forEach>
								</select>
								<div class="widget-area"
									style="overflow-y: scroll; height: 292px;" id="states">
									<ul>
										<!-- ***************************state List here displayed******************* -->
									</ul>
								</div>
							</div>


							<div class="widget-area" style="width: 25%; height: 500px;">
								<h3>City</h3>
								<input class="btn green pull-left" type="button"
									onclick="cityPopup();" value="Add City">
								<div id="createCity"
									style="top: 25px; left: 25px; position: absolute;">
									<div class="modal-dialog"
										style="z-index: 1; float: left; width: 200%;">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" onclick="closed();">&times;</button>
												<h4 class="modal-title">City Ctreation</h4>
											</div>
											<div class="modal-body">
												<form action="addCity" class="sec">
													<div class="row">
														<div class="col-md-1">Name:</div>
														<div class="col-md-11">
															<input type="text" class="form-control" name="name"
																id="cityName" onkeyup="cityNameKeyUp();">
														</div>
													</div>
													<br> <b>The City Belongs to :</b>
													<div class="row">
														<div class="col-md-2">Country:</div>
														<div class="col-md-10">
															<input id="country1" type="text" name="name"
																class="form-control">
														</div>

														<div class="col-md-2">State:</div>

														<div class="col-md-8">
															<input id="state" type="text" name="name"
																class="form-control" disabled="disabled"> <input
																id="stateId" type="hidden" name="id">
														</div>

														<div class="col-md-2">
															<input id="cityAddbtn" type="submit" value="create"
																disabled="disabled" class="btn green pull-right">
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer"></div>
										</div>
									</div>
								</div>
								<br> <br> <span><b>Select Country:</b></span><select
									class="form-control" name="countryid3"
									onchange="getStateList();">
									<option value="0">select country</option>
									<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
										var="contry">
										<option value="${contry.id}">${contry.countryName}</option>
									</c:forEach>
								</select> <span><b>Select State:</b></span><select class="form-control"
									name="sateid" id="statelist1" onchange="getCityList();">
									<!-- ********************state option**************************** -->
								</select>
								<div class="widget-area"
									style="overflow-y: scroll; height: 233px;" id="cityList">
									<ul>

									</ul>
								</div>
							</div>


							<div class="widget-area" style="width: 25%; height: 500px;">
								<p>
									<a href="#" id="tree-expand-all">Expand all</a> | <a href="#"
										id="tree-collapse-all">Collapse all</a>
								</p>
								<div class="tree-list"
									style="height: 444px; overflow-y: scroll;">

									<!-- Listing directory ZendX from ZendFramework library -->
									<ul id="tree">
										<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
											var="contry">
											<li>${contry.countryName}<a href="#"
												onclick="deleteCountry(${contry.id},'${contry.countryName}')">
													<img src="img/cross.png" height="16px" width="16px">
											</a>

												<ul>
													<c:forEach var="state"
														items="${sessionScope['ejb'].getAllStatesByCountryId(contry.id)}">
														<li>${state.stateName}
															<ul>
																<c:forEach
																	items="${sessionScope['ejb'].getCityByState(state.id)}"
																	var="city">
																	<li>${city.cityName}</li>
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
							<div class='toast' style='display: none'>
								<h3 id="msg">${requestScope['msg']}</h3>
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
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>

	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
			$("#createCountry").hide();
			$("#createState").hide();
			$("#createCity").hide();
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
		function cityPopup() {
			$("#createCity").show();
		}
		function statePopup() {
			$("#createState").show();
		}
		function countryPopup() {
			$("#createCountry").show();
		}
		function closed() {
			$("#createCountry").hide();
			$("#createState").hide();
			$("#createCity").hide();
		}

		function deleteCountry(id, c) {
			y = confirm("Do you want to delete country: " + c);
			if (y == true) {
				window.location = "deleteCountry?id=" + id;
			}
		}
		function deleteState(id,s){
			//alert(a+b);
			y = confirm("Do you want to delete State : " + s);
			if (y == true) {
				/* $.ajax({
					url:"deleteState",
					type:"post",
					data:{id:id},
					success:function(data){
						alert(data);
						window.location = "setupCountryStateCity.jsp";						
					}
				}); */
				window.location = "deleteState?id=" + id;
			}
		}
		
		function stateDispByCountry(){
			var a=$('[name="countryid"]').val();
			if(a!=0){
				$.ajax({
					url:"getStateByCountry",
					dataType:"json",
					data:{"id":a},
					success:function(data){
						$("#states ul").empty();
						$.each(data,function(index,value){
							$("#states ul").append('<li>'+value.stateName+'<a href="#" onclick="deleteState(\''+value.id+'\',\''+value.stateName+'\')"> <img src="img/cross.png" height="16px" width="16px"></a></li>');
						});
					}
				});
			}else{
				$("#states ul").empty();
				alert("select a country.");
			}
		}
		
		function getStateList(){
			var a=$("[name='countryid3']").val();
			if(a!=0){
				$.ajax({
					url:"getStateByCountry",
					dataType:"json",
					data:{"id":a},
					success:function(data){
						$("#statelist1").empty();
						$("#statelist1").append('<option value="0">select state</option>');
						$.map(data,function(item){
							$("#statelist1").append('<option value="'+item.id+'">'+item.stateName+'</option>');
						});
					}
				});
				
			}else{
				$("#statelist1").empty();
			}
		}
		function getCityList(){
			var a=$('[name="sateid"]').val();//state id
			if(a!=0){
				$.ajax({
					type:"post",
					url:"getCity",
					data:{id:a},
					dataType:"json",
					success:function(data){
						$("#cityList ul").empty();
						$.each(data,function(index,val){
							$("#cityList ul").append('<li>'+val.cityName+'<a href="#" onclick="cityDelete(\''+val.id+'\')"> <img src="img/cross.png" height="16px" width="16px"></a></li><form action="deleteCity" method="post" id="deleteCity'+val.id+'"><input type="hidden" name="id" value="'+val.id+'"></input></form>');
						});
					}
				});
			}else{
				alert("please select a state");
			}
			
		}
		
		function cityDelete(id){
			$("#deleteCity"+id).submit();
		}
		
		
		/**********************************for city add pupose******************************/
		$(function() {
			$("#country1").autocomplete({
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
						$("#state").val("");
						$("#state").prop("disabled",true);
					} else {
						$("#state").prop("disabled",false);
						$("#state").autocomplete({
							source : function(request, response) {
								$.ajax({
									url : "getStateByCountryByStateName",
									dataType : "json",
									data : {
										name : request.term,
										cid:ui.item.id
									},
									success : function(data) {
										response($.map(data, function(item) {
											return {
												value : item.stateName,
												id : item.id
											}
										}));
									}
								});
							},
							select:function(event,ui){
									$("#stateId").val(ui.item.id);
									if($("#cityName").val()!=""){
										$("#cityAddbtn").prop("disabled",false);
									}
								
							},
							change:function(event,ui){
								if(ui.item==null){
									$(this).val("");
									$("#stateId").val("");
									$("#cityAddbtn").prop("disabled",true);
								}else{
									$("#stateId").val(ui.item.id);
									if($("#cityName").val()!=""){
										$("#cityAddbtn").prop("disabled",false);
									}
								}
							}
						});
					}
				},
				select:function(event, ui) {
					if (ui.item != null) {
						$("#state").prop("disabled",false);
					}
				}
			});
		});
		function cityNameKeyUp(){
			if($("#cityName").val()!="" && $("#stateId").val()!=""){
				$("#cityAddbtn").prop("disabled",false);
			}else{
				$("#cityAddbtn").prop("disabled",true);
			}
		}
		
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>