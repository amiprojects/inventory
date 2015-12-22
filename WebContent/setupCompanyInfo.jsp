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
	<c:set var="compInfo" value="${sessionScope['ejb'].getCompanyInfo()}" />

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs" style="height: 41px">
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
										<li id="info1 " class="active"><a data-toggle="tab"
											href="#comp">Company details</a></li>
										<li id="info2"><a data-toggle="tab" href="#tax">Tax
												details</a></li>
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
																	placeholder="Enter Company Name" class="form-control"
																	readonly="readonly" value="${compInfo.compname}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company
																	Email:</label> <input type="text" name="email" id="email"
																	onchange="check();" placeholder="Enter Company Email"
																	class="form-control" readonly="readonly"
																	value="${compInfo.email}"><br>
															</div>
															<!-- <input type="text" id="email" name="email"  /> -->
														</div>



														<div class="col-md-6">
															<label for="exampleInputEmail1">Company Mobile
																No:</label> <input type='text' name="mono" id="mobile"
																maxlength="10" minlength="10"
																onChange="this.value = minmax(this.value, 999999999, 9999999999)"
																placeholder="Eg. 9xxxxxxxxx" class="form-control"
																readonly="readonly" value="${compInfo.mobile}"><br>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Company Phone
																	No:</label> <input type='number' name="phno" id="phone"
																	placeholder="Enter Phone Number" class="form-control"
																	readonly="readonly" value="${compInfo.phone}"><br>




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
																	placeholder="Enter city" class="form-control"
																	readonly="readonly" value="${compInfo.city}"><br>

																<input type="hidden" name="vendorCityId"
																	value="${compInfo.city}" id="vendorCityId">
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> State:</label> <select
																	name="state" id="state"></select> <input type="hidden"
																	name="state1" readonly="readonly"
																	value="${compInfo.state}"><br>
															</div>
														</div>


														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1"> Upload logo:</label>
																<div>
																	<img id="image" alt=""
																		src="data:image/jpeg;base64,${compInfo.getImageAsString()}"
																		style="width: 100px; height: 50px;">
																</div>
															</div>
															<div id="companyLogo">
																<input type="file" name="proImg" size="50" id="image"
																	onchange="readURL(this);" value="${compInfo.image}">
															</div>
														</div>

													</div>



												</div>

												<div align="left" id="companyinfo">
													<input class="btn btn-primary large" type="button"
														onclick="activatefields();" value="Edit">
												</div>
												<div align="right">
													<button class="btn btn-primary midium" type="button"
														onclick="detailButtonNext()">Next</button>
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
																	type="text" name="vatno" id="vat"
																	placeholder="Enter Company VAT No" class="form-control"
																	readonly="readonly" value="${compInfo.vatno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">VAT
																	Registration Date:</label> <input type="text" name="vatdate"
																	id="vatdate" class="form-control"
																	placeholder="Enter Company VAT Registration Date"
																	readonly="readonly" value="${compInfo.vatdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">CST No:</label> <input
																	type="text" name="cstno" id="cst"
																	placeholder="Enter Company CST No" class="form-control"
																	readonly="readonly" value="${compInfo.cstno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">CST
																	Registration Date:</label> <input type="text" name="cstDate"
																	id="cstdate" class="form-control"
																	placeholder="Enter Company CST Registration Date"
																	readonly="readonly" value="${compInfo.cstdate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">TIN No:</label> <input
																	type="text" name="tinno" id="tin"
																	placeholder="Enter Company TIN No" class="form-control"
																	readonly="readonly" value="${compInfo.tinno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">TIN
																	Registration Date:</label> <input type="text" name="tinDate"
																	placeholder="Enter Company TIN Registration Date"
																	id="tindate" class="form-control" readonly="readonly"
																	value="${compInfo.tindate}"><br>
															</div>
														</div>
														<div class="col-md-6">
															<div>
																<label for="exampleInputEmail1">Service Tax No:</label>
																<input type="text" name="servicet" id="service"
																	placeholder="Enter Company Service tax"
																	class="form-control" readonly="readonly"
																	value="${compInfo.servicetaxno}"><br>
															</div>
														</div>

														<div class="col-md-6">
															<div>
																<label for="exampleInputPassword1">Service Tax
																	Registration Date:</label> <input type="text"
																	placeholder="Enter Company Service Tax Registration Date"
																	name="serviceDate" id="servicedate"
																	class="form-control" readonly="readonly"
																	value="${compInfo.servtaxdate}"><br>
															</div>
														</div>


														<div>
															<button style="float: right" class="btn green pull-right"
																type="submit" onclick="submitCompmanyDetails();">Submit</button>
															<button
																style="margin-left: 14px; margin-top: 1px; float: left"
																class="btn btn-primary midium" type="button"
																onclick="addressButtonPrev()">Back</button>
														</div>

													</div>
												</div>
											</div>

										</div>
									</div>
								</form>
							</div>

							<!-- <div align="right" class="col-md-12">
									<input class="btn btn-primary large" type="button"
										onclick="activatefields();" value="Edit">
								</div> -->

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Content Sec -->
	</div>
	<!-- Page Container -->

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
			$("#companyinfo").show();
			$("#companyLogo").hide();
			$("#sSetupComp").attr("style", "color: red;");
		});
		$(function() {
			$("#datepicker").datepicker();
		});

		function activatefields() {
			$('#compname').attr("readonly", false);
			$('#email').attr("readonly", false);
			$('#mobile').attr("readonly", false);
			$('#phone').attr("readonly", false);
			$('#addr').attr("readonly", false);
			$('#cityname').attr("readonly", false);
			//	$('#state').attr("readonly", false);
			$('#vat').attr("readonly", false);
			$('#cst').attr("readonly", false);
			$('#tin').attr("readonly", false);
			$('#service').attr("readonly", false);
			$('#vatdate').attr("readonly", false);
			$('#cstdate').attr("readonly", false);
			$('#tindate').attr("readonly", false);
			$('#servicedate').attr("readonly", false);
			$("#companyinfo").hide();
			$('#imageUP').attr("readonly", false);
			$("#companyLogo").show();

		}
		function verifyEmail() {
			var email = jQuery('#compemail').val();
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
					$('#image').attr('src', e.target.result).width(120).height(
							85);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		/* 	function checkMobile() {
				var number = jQuery('#mobile').val();
				var splchars = /^[0-9-+]+$/;
				if (splchars.test(number)) {
					return true;
				} else {
					alert("Illegal characters detected!");
					return false;
				}
			} */
		function checkPhone() {
			var number = jQuery('#phone').val();
			var splchars = /^[0-9-+]+$/;
			if (splchars.test(number)) {
				return true;
			} else {
				alert("Illegal characters detected!");
				return false;

			}

		}

		function submitCompmanyDetails() {

			if ($("#compname").val() == 0) {
				alert("please select Company name");
			} else if ($("#mobile").val() == "") {
				alert("please select Mobile Number");
			} else if ($("#addr").val() == "") {
				alert("please select Address");
			} else if ($("#email").val() == "") {
				alert("please select email");
			} else if ($("#phone").val() == "") {
				alert("please select Phone");
			} else if ($("#cityname").val() == "") {
				alert("please select cityname");
			} else if ($("#vat").val() == "") {
				alert("please select VAT");
			} else if ($("#cst").val() == "") {
				alert("please select CST");
			} else if ($("#tin").val() == "") {
				alert("please select TIN");
			} else if ($("#service").val() == "") {
				alert("please select Service Tax");
			} else if ($("#vatdate").val() == "") {
				alert("please select VAT resistration Date");
			} else if ($("#cstdate").val() == "") {
				alert("please select CST resistration Date");
			} else if ($("#tinDate").val() == "") {
				alert("please select TIN resistration Date");
			} else if ($("#servicedate").val() == "") {
				alert("please select Service resistration Date");
			}

			else {
				$("#companydetails").submit();
			}

			/* $("#companydetails").submit(); */
		}
	</script>
	<script type="text/javascript">
		function minmax(value, min, max) {
			if (parseInt(value) < min || isNaN(value)) {
				alert("10 digit number")
				return null;
			} else if (parseInt(value) > max) {
				alert("10 digit number")
				return value;
			} else
				return value;
		}
	</script>

	<script type="text/javascript">
		function check() {
			var email_x = document.getElementById("email").value;
			filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (filter.test(email.value)) {

				return true;
			} else {

				alert("dff00");
				document.getElementById("email").value = "";
				return false;
			}
		}
	</script>
	<script type="text/javascript">
		function addressButtonPrev() {
			$("#info2").removeAttr("class");
			$("#tax").attr("class", "tab-pane fade");
			$("#info1").attr("class", "active");
			$("#comp").attr("class", "tab-pane fade active in");
		}
		function detailButtonNext() {
			$("#info1").removeAttr("class");
			$("#comp").attr("class", "tab-pane fade");
			$("#info2").attr("class", "active");
			$("#tax").attr("class", "tab-pane fade active in");
		}
	</script>
	<script type="text/javascript">
		$(function() {
			$("#cityname").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getCityByName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.cityName,
									id : item.id
								});
							}));
						}

					});
				},
				change : function(event, ui) {
					alert('hello');
					if (ui.item == null) {
						$(this).val("");
						$("#vendorCityId").val("");
					} else {
						alert(ui.item.id);
						 $.ajax({
							url:"getStateByCityName",
							dataType:"json",
							data:{nm:ui.item.value},
							success:function(data1){
								$("#state").empty();
								$.map(data1,function(item1){
									alert(item1.stateName);
									$("#state").append("<option>"+item1.stateName+"</option>");
								});
							},
							error:function(a,b,c){
								alert(a+b+c);
							}
						});
						$("#vendorCityId").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					$("#vendorCityId").val(ui.item.id);
				}
			});
		});
	</script>

	<!-- <script type="text/javascript">
	
	$(function() {
		$("#descriptionName").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "getProductByDescription",
					dataType : "json",
					data : {
						descriptionName : request.term
					},
					success : function(data) {
						response($.map(data, function(item) {
							return {
								value : item.code,
								id : item.id,

							}
						}));
					}
				});
			},
			select : function(item, ui) {
				viewProduct(ui.item.id);
			}
		})

	});
	</script> -->
	<!-- <script type="text/javascript">
$(document)
.ready(
		function() {
			$("#companyinfo").show();
		}
);


function activatefields() {
	$("#companyinfo").modal('hide');
}
</script> -->


</body>


</html>