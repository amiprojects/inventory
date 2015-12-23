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
	
	<c:if test="${!sessionScope['user'].equals('admin')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if
				test="${page.name.equals('Bill Setup')}">
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
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set value="${sessionScope['ejb'].getLastBillSetupBySufix('PUR')}" var="pur"/>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										<form action="addBillSetup" method="post" id="addpurchaseinvoice">
										<input type="text" id="pcomname" style="width: 50px" name="comname" id=pcomname readonly="readonly" value="${pur.companyInitial}"></input>											
										<input type="text" name="type" id="ptype" readonly="readonly" value="PUR" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="year" id="pyear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="month" id="pmonth" style="width: 50px" value="12"></input>
									    <input type="text" readonly="readonly" name="autonum" id="pautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="suffix" id="psuffix" style="width: 50px" readonly="readonly" value="${pur.sufix}"></input>
										<div  id="purInvImgEdit" style="display: block;"><a href="#" onclick="editPurchaseInvoce()"> <img src="img/edit.png"height="29px" width="29px"></a></div>
										<div style="display: none;" id="purInvImgAdd"><a href="#" onclick="addPurchaseInvoice();"> <img src="img/add.png"height="29px" width="29px"></a></div>
										</form>
									</div>
									<br> <br> <br>
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
									
									<c:set value="${sessionScope['ejb'].getLastBillSetupBySufix('INV')}" var="inv"/>
									<div class="col-md-8">
										<label>Present Setup:</label> <br> 
										<form action="addBillSetup" method="post" id="addsalesinvoice">
										<input type="text" style="width: 50px" name="comname" id="scomname" readonly="readonly" value="${inv.companyInitial}"></input>
										<input type="text" name="type" id="stype" readonly="readonly" value="INV" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="year" id="syear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="month" id="smonth" style="width: 50px" value="12"></input>
										<input type="text" readonly="readonly" name="autonum" id="sautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="suffix" id="ssuffix" style="width: 50px" readonly="readonly" value="${inv.sufix}"></input>		
										<div  id="salInvImgEdit" style="display: block;"><a href="#" onclick="editSalesInvoice()"> <img src="img/edit.png"height="29px" width="29px"></a></div>
										<div style="display: none;" id="salInvImgAdd"><a href="#" onclick="addSalesInvoice();"> <img src="img/add.png"height="29px" width="29px"></a></div>
										</form>

									</div>
									<br> <br> <br>
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
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align:left;">Company Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									
									<c:set value="${sessionScope['ejb'].getLastBillSetupBySufix('JOB')}" var="job"/>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										<form action="addBillSetup" method="post" id="addjobberchallan">
										<input type="text"style="width: 50px" name="comname" id="jcomname" readonly="readonly" value="${job.companyInitial}"></input>
										<input type="text" name="type" id="jtype" readonly="readonly" value="JOB" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="year" id="jyear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="month" id="jmonth" style="width: 50px" value="12"></input>
										<input type="text"readonly="readonly" name="autonum" id="jautonum" style="width: 50px" value="0091"></input>	
										<input type="text" name="suffix" id="jsuffix" style="width: 50px"  readonly="readonly" value="${job.sufix}"></input>											
										<div  id="jobChaImgEdit" style="display: block;"><a href="#" onclick="editJobberChallan()"> <img src="img/edit.png"height="29px" width="29px"></a></div>
										<div style="display: none;" id="jobChaImgAdd"><a href="#" onclick="addJobberChallan();"> <img src="img/add.png"height="29px" width="29px"></a></div>
										</form>

									</div>
									<br> <br> <br>
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
									<c:set value="${sessionScope['ejb'].getLastBillSetupBySufix('ROAD')}" var="road"/>
									<div class="col-md-9">
										<label>Present Setup:</label> <br> 
										<form action="addBillSetup" method="post" id="addroadchallan">
										<input type="text" style="width: 50px" name="comname" readonly="readonly" id="rcomname" value="${road.companyInitial}"></input>
										<input type="text" name="type" id="rtype" readonly="readonly" value="ROAD" style="width: 50px"></input>
										<input type="text" readonly="readonly" name="year" id="ryear" style="width: 50px" value="15-16"></input>
										<input type="text" readonly="readonly" name="month" id="rmonth" style="width: 50px" value="12"></input>
										<input type="text" readonly="readonly" name="autonum" id="rautonum" style="width: 50px" value="0091"></input>
										<input type="text" name="suffix" id="rsuffix" readonly="readonly" style="width: 50px" value="${road.sufix}"></input>
										<div  id="roadChaImgEdit" style="display: block;"><a href="#" onclick="editRoadChallan()"> <img src="img/edit.png"height="29px" width="29px"></a></div>
										<div style="display: none;" id="roadChaImgAdd"><a href="#" onclick="addRoadChallan();"> <img src="img/add.png"height="29px" width="29px"></a></div>
										</form>

									</div>
									<br> <br> <br>
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
	function addPurchaseInvoice(){
		$("#addpurchaseinvoice").submit();
	}
	
	function addSalesInvoice(){
		$("#addsalesinvoice").submit();
	}
	function addJobberChallan(){
		$("#addjobberchallan").submit();
	}
	function addRoadChallan(){
		$("#addroadchallan").submit();
	}
	
	
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupBill").attr("style", "color: red;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		
		function editPurchaseInvoce(){
			$("#purInvImgEdit").attr("style","display: none;");
			$("#purInvImgAdd").attr("style","display: block;");
			$('#pcomname').attr("readonly",false);
			$('#psuffix').attr("readonly",false);
		}
		
		function editSalesInvoice(){
			$("#salInvImgEdit").attr("style","display:none");
			$("#salInvImgAdd").attr("style","display:block");
			$('#scomname').attr("readonly",false);
			$('#ssuffix').attr("readonly",false);
		}
		
		function editJobberChallan(){
			$("#jobChaImgEdit").attr("style","display:none");
			$("#jobChaImgAdd").attr("style","display:block");
			$('#jcomname').attr("readonly",false);
			$('#jsuffix').attr("readonly",false);
		}
		
		function editRoadChallan(){
			$("#roadChaImgEdit").attr("style","display:none");
			$("#roadChaImgAdd").attr("style","display:block");
			$('#rcomname').attr("readonly",false);
			$('#rsuffix').attr("readonly",false);
		}
		
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>