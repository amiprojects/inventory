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
	<c:set var="compInfo" value="${sessionScope['ejb'].getCompanyInfo()}"/>
	
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs" style="height: 39px">
								<ul>
									<li><p
											style="right: -741px; font-size: 20px; position: absolute;">
											<b>Company Details</b>
										</p></li>
								</ul>
							</div>
							<div class="widget-area">
								<form action="updateCompanyInfo" enctype="multipart/form-data"
									method="post" id="companydetails">
								<input type="hidden" value="${compInfo.id}" name="companyId">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#comp">Company
												details</a></li>
										<li><a data-toggle="tab" href="#tax">Tax details</a></li>
									</ul>
									<div class="tab-content">
										<div id="comp" class="tab-pane fade active in">
											<div class="widget-area">

												<div class="wizard-form-h">

													<div id="step-1">



														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Company Name:</label> <input
																	type="text" name="name" id="compname"
																	placeholder="Enter Company Name" required="requied"
																	class="form-control" readonly="readonly"
																	value="${compInfo.compname}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company
																	Email:</label> <input type="email" name="email" id="compemail"
																	placeholder="Enter Company Email" required
																	class="form-control" readonly="readonly" value="${compInfo.email}"
																	onchange="verifyEmail();"><br>
															</div>

														</div>

														<div class="col-md-6">
															<label for="exampleInputEmail1">Company Mobile
																No:</label> <input type='number' pattern="[0-9]{10,10}" name="mono"
																id="mobile" placeholder="Eg. +9900000000" minlength="10"
																maxlength="10" required class="form-control"
																readonly="readonly" value="${compInfo.mobile}" onkeyup="checkMobile();"
																value="${compInfo.mobile}"><br>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company Phone
																	No:</label> <input type='number' pattern="[0-9]{10,10}"
																	name="phno" id="phone" placeholder="Eg. +9900000000"
																	minlength="10" maxlength="10" required
																	class="form-control" readonly="readonly" value="${compInfo.phone}"
																	onkeyup="checkPhone();"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company
																	Address:</label><br>
																<textarea name="adress" id="addr" rows="5" cols="59"
																	readonly="readonly">${compInfo.addr}</textarea>
																<br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> City:</label> <input
																	type="text" name="city" id="cityname"
																	placeholder="Enter city" required class="form-control"
																	readonly="readonly" value="${compInfo.city}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> State:</label> <input
																	type="text" name="state" id="statename"
																	placeholder="Enter State" required class="form-control"
																	readonly="readonly" value="${compInfo.state}"><br>
															</div>
														</div>


														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> Upload logo:</label>
																<div>
																	<img id="image" alt="" src="data:image/jpeg;base64,${compInfo.getImageAsString()}" style="width:100px;height:50px;">
																</div>
															</div>
															<input type="file" name="proImg" size="50" id="image"
																required onchange="readURL(this);" value="${compInfo.image}">
														</div>
														
													</div>

												</div>

											</div>
										</div>
										<div id="tax" class="tab-pane fade ">
											<div class="widget-area">

												<div class="wizard-form-h">

													<div id="step-1">
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">VAT No:</label> <input
																	type="number" name="vatno" id="vat"
																	placeholder="Enter Company VAT No" required
																	class="form-control" readonly="readonly" value="${compInfo.vatno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">VAT
																	Registration Date:</label> <input type="text" name="vatdate"
																	id="vatdate" required class="form-control"
																	readonly="readonly" value="${compInfo.vatdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">CST No:</label> <input
																	type="number" name="cstno" id="cst"
																	placeholder="Enter Company CST No" required
																	class="form-control" readonly="readonly" value="${compInfo.cstno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">CST
																	Registration Date:</label> <input type="text" name="cstDate"
																	id="cstdate" required class="form-control"
																	readonly="readonly" value="${compInfo.cstdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">TIN No:</label> <input
																	type="number" name="tinno" id="tin"
																	placeholder="Enter Company TIN No" required
																	class="form-control" readonly="readonly" value="${compInfo.tinno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">TIN
																	Registration Date:</label> <input type="text" name="tinDate"
																	id="tindate" required class="form-control"
																	readonly="readonly" value="${compInfo.tindate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Service Tax No:</label>
																<input type="number" name="servicet" id="service"
																	placeholder="Enter Company Name" required
																	class="form-control" readonly="readonly" value="${compInfo.servicetaxno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Service Tax
																	Registration Date:</label> <input type="text"
																	name="serviceDate" id="servicedate" required
																	class="form-control" readonly="readonly" value="${compInfo.servtaxdate}"><br>
															</div>
														</div>


														<div class="col-md-6">
															<button class="btn btn-primary large" type="submit"
																onclick="submitCompmanyDetails();">Submit</button>

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div class="col-md-6">
						                <input class="btn btn-primary large" type="button" onclick="activatefields();" value="Edit">
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(document).ready(function() {
			$("#setup").attr("id", "activeSubMenu");
			$("#sSetupComp").attr("style", "color: red;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		
		 function activatefields(){
			 $('#compname').attr("readonly",false);
			 $('#compemail').attr("readonly",false);
			 $('#mobile').attr("readonly",false);
			 $('#phone').attr("readonly",false);
			 $('#addr').attr("readonly",false);
			 $('#cityname').attr("readonly",false);
			 $('#statename').attr("readonly",false);
			 $('#vat').attr("readonly",false);
			 $('#cst').attr("readonly",false);
			 $('#tin').attr("readonly",false);
			 $('#service').attr("readonly",false);
			 $('#vatdate').attr("readonly",false);
			 $('#cstdate').attr("readonly",false);
			 $('#tindate').attr("readonly",false);
			 $('#servicedate').attr("readonly",false);
			 
		 }
		 function verifyEmail(){
			 var email=jQuery('#compemail').val();
			 var eml = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
				
				if (eml.test($.trim($("#email").val())) == false) {
		          alert("Please enter valid email address.");
		          $("#email").focus();
		          return false;
		        }
			 
		 }
		 function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#image').attr('src', e.target.result).width(120).height(85);
					};

					reader.readAsDataURL(input.files[0]);
				}
			}
		 function checkMobile(){
			 var number=jQuery('#mobile').val();			 
			 var splchars = /^[0-9-+]+$/;			 
			 if (splchars.test(number)) {
				         return true;
				     }
		      else {
						alert("Illegal characters detected!");
				         return false;
				     }
		 }
		 function checkPhone(){
			 var number=jQuery('#phone').val();
			 var splchars = /^[0-9-+]+$/;
			 if (splchars.test(number)) {
		         return true;
		     }
             else {
				alert("Illegal characters detected!");
		         return false;
		 
		     }
			 
		 }
		 
         function submitCompmanyDetails(){
			 $("#companydetails").submit();
		 }
	</script>
</body>


</html>