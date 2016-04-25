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
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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

			<c:if test="${page.name.equals('Bill Setup')}">
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
								<h3 style="margin-top: 11px;">Bill Setup</h3>
							</div>

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
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PUR', compInfo.id)}"
										var="pur" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addpurchaseinvoice">
											<input type="text" id="pcomname" style="width: 50px"
												name="comname" id=pcomname readonly="readonly"
												value="${pur.companyInitial}"></input> <input type="text"
												name="type" id="ptype" readonly="readonly" value="PUR"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="pyear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="pmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="pautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="psuffix" style="width: 50px"
												readonly="readonly" value="${pur.sufix}"></input>
											<div id="purInvImgEdit" style="display: block;">
												<a href="#" onclick="editPurchaseInvoce()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="purInvImgAdd">
												<a href="#" onclick="addPurchaseInvoice();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>
									</div>
									<br> <br> <br>
								</div>
								<div class="widget-area">
									<div>
										<h1>Purchase Return Invoice Setup</h1>
									</div>
									<div class="col-md-3">
										<label>Purchase Return Invoice Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;" style="text-align:center;">KK&nbsp;/&nbsp;RPUR&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('RPUR', compInfo.id)}"
										var="pur" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addpurchaseretinvoice">
											<input type="text" id="pRetcomname" style="width: 50px"
												name="comname" readonly="readonly"
												value="${pur.companyInitial}"></input> <input type="text"
												name="type" id="ptype" readonly="readonly" value="RPUR"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="pyear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="pmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="pautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="pRetsuffix" style="width: 50px"
												readonly="readonly" value="${pur.sufix}"></input>
											<div id="purRetInvImgEdit" style="display: block;">
												<a href="#" onclick="editPurchaseReturnInvoce()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="purRetInvImgAdd">
												<a href="#" onclick="addPurchaseReturnInvoice();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>
									</div>
									<br> <br> <br>
								</div>
								<%-- <div class="widget-area">
									<div>
										<h1>Purchase Order Invoice Setup</h1>
									</div>
									<div class="col-md-3">
										<label>Purchase Order Invoice Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;" style="text-align:center;">KK&nbsp;/&nbsp;PURO&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PURO', compInfo.id)}"
										var="pur" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addpurchaseorderinvoice">
											<input type="text" style="width: 50px" name="comname"
												id=pormname readonly="readonly"
												value="${pur.companyInitial}"></input> <input type="text"
												name="type" id="ptype" readonly="readonly" value="PURO"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="pyear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="pmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="pautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="posuffix" style="width: 50px"
												readonly="readonly" value="${pur.sufix}"></input>
											<div id="purOrdrInvImgEdit" style="display: block;">
												<a href="#" onclick="editPurchaseOrderInvoce()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="purOrImgAdd">
												<a href="#" onclick="addPurchaseOrderInvoice();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>
									</div>
									<br> <br> <br>
								</div> --%>



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
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>

									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('INV', compInfo.id)}"
										var="inv" />
									<div class="col-md-8">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post" id="addsalesinvoice">
											<input type="text" style="width: 50px" name="comname"
												id="scomname" readonly="readonly"
												value="${inv.companyInitial}"></input> <input type="text"
												name="type" id="stype" readonly="readonly" value="INV"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="syear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="smonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="sautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="ssuffix" style="width: 50px"
												readonly="readonly" value="${inv.sufix}"></input>
											<div id="salInvImgEdit" style="display: block;">
												<a href="#" onclick="editSalesInvoice()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="salInvImgAdd">
												<a href="#" onclick="addSalesInvoice();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>

									</div>
									<br> <br> <br>
								</div>

								<div class="widget-area">
									<div>
										<h1>Sales Return Invoice Setup</h1>
									</div>
									<div class="col-md-3">
										<label>Sales Return Invoice Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;">KK&nbsp;/&nbsp;SRINV&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12&nbsp;/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Invoice
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>

									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('SRINV', compInfo.id)}"
										var="inv" />
									<div class="col-md-8">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addRfsalesinvoice">
											<input type="text" style="width: 50px" name="comname"
												id="scomnameR" readonly="readonly"
												value="${inv.companyInitial}"></input> <input type="text"
												name="type" id="stype" readonly="readonly" value="SRINV"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="syear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="smonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="sautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="ssuffixR" style="width: 50px"
												readonly="readonly" value="${inv.sufix}"></input>
											<div id="salInvImgEditR" style="display: block;">
												<a href="#" onclick="editSalesRInvoice()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="salInvImgAddR">
												<a href="#" onclick="addSalesRInvoice();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
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
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>

									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('JOB', compInfo.id)}"
										var="job" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addjobberchallan">
											<input type="text" style="width: 50px" name="comname"
												id="jcomname" readonly="readonly"
												value="${job.companyInitial}"></input> <input type="text"
												name="type" id="jtype" readonly="readonly" value="JOB"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="jyear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="jmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="jautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="jsuffix" style="width: 50px"
												readonly="readonly" value="${job.sufix}"></input>
											<div id="jobChaImgEdit" style="display: block;">
												<a href="#" onclick="editJobberChallan()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="jobChaImgAdd">
												<a href="#" onclick="addJobberChallan();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>

									</div>
									<br> <br> <br>
								</div>

								<div class="widget-area">
									<div>
										<h1>Jobber Receive Challan</h1>
									</div>
									<div class="col-md-3">
										<label>Jobber Receive Challan Sample:</label>
									</div>
									<br>
									<div class="col-md-8">
										<label style="font-size: 30px;">KK&nbsp;/&nbsp;JOBR&nbsp;/&nbsp;15-16&nbsp;/&nbsp;12/&nbsp;0091&nbsp;/&nbsp;001</label><br>
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="img/th_1.jpg" height="33px" width="33px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('JOBR', compInfo.id)}"
										var="job" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post"
											id="addjobberrechallan">
											<input type="text" style="width: 50px" name="comname"
												id="jrcomname" readonly="readonly"
												value="${job.companyInitial}"></input> <input type="text"
												name="type" id="jtype" readonly="readonly" value="JOBR"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="jyear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="jmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="jautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="jrsuffix" style="width: 50px"
												readonly="readonly" value="${job.sufix}"></input>
											<div id="jobChaReImgEdit" style="display: block;">
												<a href="#" onclick="editJobberReChallan()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="jobChaReImgAdd">
												<a href="#" onclick="addJobberReChallan();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>

									</div>
									<br> <br> <br>
								</div>

								<%-- <div class="widget-area">
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
										<h5 style="text-align: left;">Company
											Name&nbsp;&nbsp;/&nbsp;&nbsp;Challan
											Type&nbsp;&nbsp;/&nbsp;&nbsp;Year&nbsp;&nbsp;/&nbsp;&nbsp;Month&nbsp;&nbsp;/&nbsp;&nbsp;Auto
											Number&nbsp;&nbsp;/&nbsp;&nbsp;Suffix</h5>
									</div>
									<c:set
										value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('ROAD', compInfo.id)}"
										var="road" />
									<div class="col-md-9">
										<label>Present Setup:</label> <br>
										<form action="addBillSetup" method="post" id="addroadchallan">
											<input type="text" style="width: 50px" name="comname"
												readonly="readonly" id="rcomname"
												value="${road.companyInitial}"></input> <input type="text"
												name="type" id="rtype" readonly="readonly" value="ROAD"
												style="width: 50px"></input> <input type="text"
												readonly="readonly" name="year" id="ryear"
												style="width: 50px" value="15-16"></input> <input
												type="text" readonly="readonly" name="month" id="rmonth"
												style="width: 50px" value="12"></input> <input type="text"
												readonly="readonly" name="autonum" id="rautonum"
												style="width: 50px" value="0091"></input> <input type="text"
												name="suffix" id="rsuffix" readonly="readonly"
												style="width: 50px" value="${road.sufix}"></input>
											<div id="roadChaImgEdit" style="display: block;">
												<a href="#" onclick="editRoadChallan()"> <img
													src="img/edit.png" height="29px" width="29px"></a>
											</div>
											<div style="display: none;" id="roadChaImgAdd">
												<a href="#" onclick="addRoadChallan();"> <img
													src="img/add.png" height="29px" width="29px"></a>
											</div>
										</form>

									</div>
									<br> <br> <br>
								</div> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- main -->

	<c:set var="isAdmin" value="1"></c:set>
	<c:set var="canEdit" value="0" />
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">
			<c:if test="${page.name.equals('Bill Setup Edit')}">
				<c:set var="canEdit" value="1" />
			</c:if>
		</c:forEach>
		<c:set var="isAdmin" value="0"></c:set>
	</c:if>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/numericInput.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		function addPurchaseInvoice() {
			$("#addpurchaseinvoice").submit();
		}

		function addPurchaseReturnInvoice() {
			$("#addpurchaseretinvoice").submit();
		}

		function addSalesInvoice() {
			$("#addsalesinvoice").submit();
		}
		function addSalesRInvoice() {
			$("#addRfsalesinvoice").submit();
		}
		function addJobberChallan() {
			$("#addjobberchallan").submit();
		}
		function addJobberReChallan() {
			$("#addjobberrechallan").submit();
		}
		function addRoadChallan() {
			$("#addroadchallan").submit();
		}
		function addPurchaseOrderInvoice() {
			$("#addpurchaseorderinvoice").submit();
		}
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupBill").attr("style", "color: #6a94ff;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});

		function editPurchaseInvoce() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#purInvImgEdit").attr("style", "display: none;");
				$("#purInvImgAdd").attr("style", "display: block;");
				$('#pcomname').attr("readonly", false);
				$('#psuffix').attr("readonly", false);
			}
		}

		function editPurchaseReturnInvoce() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#purRetInvImgEdit").attr("style", "display: none;");
				$("#purRetInvImgAdd").attr("style", "display: block;");
				$('#pRetcomname').attr("readonly", false);
				$('#pRetsuffix').attr("readonly", false);
			}
		}

		function editSalesInvoice() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#salInvImgEdit").attr("style", "display:none");
				$("#salInvImgAdd").attr("style", "display:block");
				$('#scomname').attr("readonly", false);
				$('#ssuffix').attr("readonly", false);
			}
		}

		function editSalesRInvoice() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#salInvImgEditR").attr("style", "display:none");
				$("#salInvImgAddR").attr("style", "display:block");
				$('#scomnameR').attr("readonly", false);
				$('#ssuffixR').attr("readonly", false);
			}
		}

		function editJobberChallan() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#jobChaImgEdit").attr("style", "display:none");
				$("#jobChaImgAdd").attr("style", "display:block");
				$('#jcomname').attr("readonly", false);
				$('#jsuffix').attr("readonly", false);
			}
		}

		function editJobberReChallan() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#jobChaReImgEdit").attr("style", "display:none");
				$("#jobChaReImgAdd").attr("style", "display:block");
				$('#jrcomname').attr("readonly", false);
				$('#jrsuffix').attr("readonly", false);
			}
		}

		function editRoadChallan() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#roadChaImgEdit").attr("style", "display:none");
				$("#roadChaImgAdd").attr("style", "display:block");
				$('#rcomname').attr("readonly", false);
				$('#rsuffix').attr("readonly", false);
			}
		}

		function editPurchaseOrderInvoce() {
			if ("${isAdmin}" == 0 && "${canEdit}" == 0) {
				alert("You have no permission to edit this!");
			} else {
				$("#purOrdrInvImgEdit").attr("style", "display: none;");
				$("#purOrImgAdd").attr("style", "display: block;");
				$('#pormname').attr("readonly", false);
				$('#posuffix').attr("readonly", false);
			}
		}
	</script>
	<script>
		$(function() {

			$("#ssuffixR").numericInput({

				allowFloat : false, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
