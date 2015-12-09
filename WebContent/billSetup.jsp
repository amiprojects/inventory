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
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
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
								<div class="widget-area">
									<div>
										<h1>Purchase Invoice Setup</h1>
									</div>
									<div class="col-md-3">
										<label>Purchase Invoice Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;" style="text-align:center;">KK&nbsp;/&nbsp;PUR&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										
										<input type="text" id="pcomname" style="width: 50px" name="com" value="KK" readonly="readonly"></input>											
										<input type="text" name="ptype" id="ptype" readonly="readonly" value="PUR" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="pyear" id="pyear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="pmonth" id="pmonth" style="width: 50px" value="12"></input>
									    <input type="text" readonly="readonly" name="pautonum" id="pautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="psuffix" id="psuffix" style="width: 50px" value="001" readonly="readonly"></input>
										
										<a href="#" onclick="editPurchaseInvoce()"> <img src="img/edit.png"
											height="29px" width="29px">
										</a>

									</div>


									<br> <br> <br>
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="c-btn medium gray">save</button>

										</div>
									</div>


								</div>
								<div class="widget-area">
									<div>
										<h1>Sales Invoice Setup</h1>
									</div>
									<div class="col-md-3">
										<label>Sales Invoice Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;">KK&nbsp;/&nbsp;INV&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<div class="col-md-8">
										<label>Present Setup:</label> <br> 
										<input type="text" style="width: 50px" name="scomname" id="scomname" value="KK" readonly="readonly"></input>
										<input type="text" name="stype" id="stype" readonly="readonly" value="INV" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="syear" id="syear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="smonth" id="smonth" style="width: 50px" value="12"></input>
										<input type="text" readonly="readonly" name="sautonum" id="sautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="ssuffix" id="ssuffix" style="width: 50px" value="001" readonly="readonly"></input>		
										<a href="#" onclick="editSalesInvoice()"> <img src="img/edit.png"
											height="29px" width="29px">
										</a>

									</div>


									<br> <br> <br>
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="c-btn medium gray">save</button>

										</div>
									</div>


								</div>
								<div class="widget-area">
									<div>
										<h1>Jobber Challan</h1>
									</div>
									<div class="col-md-3">
										<label>Jobber Challan Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;">KK&nbsp;/&nbsp;JOB&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										<input type="text"style="width: 50px" name="jcomname" id="jcomname" value="KK" readonly="readonly"></input>
										<input type="text" name="jtype" id="jtype" readonly="readonly" value="JOB" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="jyear" id="jyear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="jmonth" id="jmonth" style="width: 50px" value="12"></input>
										<input type="text"readonly="readonly" name="jautonum" id="jautonum" style="width: 50px" value="0091"></input>	
										<input type="text" name="jsuffix" id="jsuffix" style="width: 50px" value="001" readonly="readonly"></input>											
										<a href="#" onclick="editJobberChallan()"> <img src="img/edit.png"
											height="29px" width="29px">
										</a>

									</div>


									<br> <br> <br>
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="c-btn medium gray">save</button>

										</div>
									</div>


								</div>
								<div class="widget-area">
									<div>
										<h1>Road Challan</h1>
									</div>
									<div class="col-md-3">
										<label>Road Challan Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;">KK&nbsp;/&nbsp;ROAD&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										<input type="text" style="width: 50px" name="rcomname" id="rcomname" value="KK"></input>
										<input type="text" name="rtype" id="rtype" readonly="readonly" value="ROAD" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="ryear" id="ryear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="rmonth" id="rmonth" style="width: 50px" value="12"></input>
										<input type="text" readonly="readonly" name="rautonum" id="rautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="rsuffix" id="rsuffix" style="width: 50px" value="001"></input>
										<a href="#" onclick="editRoadChallan()"> <img src="img/edit.png"
											height="29px" width="29px">
										</a>

									</div>


									<br> <br> <br>
									<div class="row">
										<div class="col-md-3">
											<button type="button" class="c-btn medium gray">save</button>

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


	<!-- main -->



	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupBill").attr("style", "color: red;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		
		function editPurchaseInvoce(){
			$('#pcomname').prop("readonly",false);
			$('#psuffix').prop("readonly",false);
		}
		
		function editSalesInvoice(){
			$('#scomname').prop("readonly",false);
			$('#ssuffix').prop("readonly",false);
		}
		
		function editJobberChallan(){
			$('#jcomname').prop("readonly",false);
			$('#jsuffix').prop("readonly",false);
		}
		
		function editRoadChallan(){
			$('#rcomname').prop("readonly",false);
			$('#rsuffix').prop("readonly",false);
		}
		
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>