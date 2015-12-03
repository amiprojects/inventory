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
<link rel="stylesheet" href="bootstrapcdn.css">
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>

<script src="maxcdn.bootstrapcdn.js"></script>

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
<!-- Script -->

<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>

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

<!-- <script type="text/javascript">
$(document).ready(function(){
	$('#dashSing').removeAttr("class");
	$('#dashSub').removeAttr("style","display: none;");
	$('#purSing').attr("class","active");
	$('#purSub').attr("style","display: block !important;");
});
</script> -->
<script type="text/javascript">
	function bankButtonPrev() {
		$("#bAcc").removeAttr("class");
		$("#bankAccount").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	function vendorButtonPrev() {
		$("#vAcc").removeAttr("class");
		$("#vendorAccount").attr("class", "tab-pane fade");
		$("#addr").attr("class", "active");
		$("#address").attr("class", "tab-pane fade active in");
	}

	function vendorButtonNext() {
		$("#vAcc").removeAttr("class");
		$("#vendorAccount").attr("class", "tab-pane fade");
		$("#bAcc").attr("class", "active");
		$("#bankAccount").attr("class", "tab-pane fade active in");
	}

	function detailButtonPrev() {
		$("#detl").removeAttr("class");
		$("#detail").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	function detailButtonNext() {
		$("#detl").removeAttr("class");
		$("#detail").attr("class", "tab-pane fade");
		$("#addr").attr("class", "active");
		$("#address").attr("class", "tab-pane fade active in");
	}

	function addressButtonPrev() {
		$("#addr").removeAttr("class");
		$("#address").attr("class", "tab-pane fade");
		$("#detl").attr("class", "active");
		$("#detail").attr("class", "tab-pane fade active in");
	}

	function addressButtonNext() {
		$("#addr").removeAttr("class");
		$("#address").attr("class", "tab-pane fade");
		$("#vAcc").attr("class", "active");
		$("#vendorAccount").attr("class", "tab-pane fade active in");
	}

	/* 	$("#bankButonNext").click(function() {
	 alert("hi");
	 /* $("#bAcc").removeAttr("class");
	 $("#vAcc").attr("class", "active");
	 $("#bankAccount").removeAttr("class");
	 $("#vendorAccount").attr("class", "tab-pane fade active in");
	 }); */
</script>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0

		/* , onSelect : function() {
				$("#datepicker").prop('readonly', "readonly");
			} */
		});
	});

	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker3").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
</script>

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
												<b>Vendor Details</b>
											</p></li>
									</ul>
								</div>

								<div class="widget-area" style="width: 28%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Name : </label> <input type="text"
												placeholder="" id="" class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="">City/State : </label>
											<div class="row">
												<div class="col-md-8">
													<input type="text" placeholder="" id=""
														class="form-control">
												</div>
												<div class="col-md-4">
													<select class="form-control">
														<option>---</option>
														<option>---</option>
														<option>---</option>
														<option>---</option>
														<option>---</option>
													</select>
												</div>
											</div>
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
												<th>Number</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Name</td>
												<td>Number</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="widget-area" style="width: 72%">
									<%-- <p>${requestScope['msg']}</p> --%>
									<form role="form" class="sec" action="addVendor" method="post">
										<ul class="nav nav-tabs">
											<li class="active" id="detl"><a data-toggle="tab"
												href="#detail">Details</a></li>
											<li id="addr"><a data-toggle="tab" href="#address">Address</a></li>
											<li id="vAcc"><a data-toggle="tab" href="#vendorAccount">Vendor
													Account Info</a></li>
											<li id="bAcc"><a data-toggle="tab" href="#bankAccount">Bank
													Account info</a></li>
											<li id="prts"><a data-toggle="tab" href="#part">Parts</a></li>
										</ul>
										<div class="tab-content">
											<div id="bankAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="col-md-3">
														<b>Bank Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankName"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>A/C no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankAccNo"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>Branch:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankBranch"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>City:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankCity"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>IFSC no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankIFSC"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>MICR no.:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankMICR"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>RTGS code:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="bankRTGS"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>Check lebel:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control"
															name="bankCheckLebel" required="required">
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="bankButtonPrev();">
													<!-- <input
														class="btn green pull-left" type="button" value="Next"
														onclick="partButtonNext();"> -->
													<button class="btn green pull-right" type="submit">Finish</button>
												</div>
												<!-- <div class="col-md-12">
													<input type="button" value="Next"
														class="btn green pull-right" onclick="bankButonNext();">
												</div> -->
											</div>
											<div id="vendorAccount" class="tab-pane fade">
												<div class="widget-area">
													<div class="row">
														<div class="col-md-5">
															<b>VAT no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorVATno" required="required">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>VAT registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorVATregDate" required="required"
																id="datepicker" readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorCSTno" required="required">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>CST registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorCSTregDate" required="required"
																id="datepicker1" readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>PAN no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorPANno" required="required">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorExciseRegNo" required="required">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Excise registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorExciseRegDate" required="required"
																id="datepicker2" readonly="readonly">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration no.:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorServiceTaxRegNo" required="required">
														</div>
													</div>

													<div class="row">
														<div class="col-md-5">
															<b>Service tax registration date:</b>
														</div>
														<div class="col-md-7">
															<input type="text" class="form-control"
																name="vendorServiceTaxRegDate" required="required"
																id="datepicker3" readonly="readonly">
														</div>
													</div>
													<div class="row">
														<div class="col-md-5">
															<b>Tax group id:</b>
														</div>
														<div class="col-md-7">
															<select class="form-control" name="taxTypeGroupId">
																<c:forEach
																	items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
																	var="taxTypeGroup">
																	<option value="${taxTypeGroup.name}">${taxTypeGroup.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input type="button" value="Next"
														class="btn green pull-right" onclick="vendorButtonNext();">
													<input type="button" value="Previous"
														class="btn green pull-left" onclick="vendorButtonPrev();">
												</div>
											</div>

											<div id="detail" class="tab-pane fade active in">
												<div class="widget-area">

													<div class="col-md-3">
														<b>Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorName"
															required="required">
													</div>
													<br>
													<div class="col-md-3">
														<b>Company Name:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control"
															name="vendorCompanyName" required="required">
													</div>

													<div class="col-md-3">
														<b>Ph No1:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorPh1"
															required="required">
													</div>

													<div class="col-md-3">
														<b>Ph No2:</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorPh2"
															required="required">
													</div>

													<div class="col-md-3">
														<b>Email :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorMail"
															required="required">
													</div>

													<div class="col-md-3">
														<b>Alias name :</b>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" name="vendorAlias"
															required="required">
													</div>

													<div class="col-md-3">
														<b>Vendor type :</b>
													</div>
													<div class="col-md-9">
														<!-- <select class="form-control">
															<option>Supplier</option>
															<option>Agent</option>
															<option>Jobber</option>
															<option>Transporter</option>
														</select> -->
														<select class="form-control" name="vendorType">
															<c:forEach
																items="${sessionScope['ejb'].getAllVendorType()}"
																var="vType">
																<option value="${vType.id}">${vType.type}</option>
															</c:forEach>
														</select>
													</div>

													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font">Change History</a></li>
														</ul>
														<hr>
													</div>

													<div class="row">
														<b>Last modified date :</b>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<!-- <input class="btn green pull-left" type="button"
														value="Previous" onclick="detailButtonPrev();"> -->
													<input class="btn green pull-right" type="button"
														value="Next" onclick="detailButtonNext();">
												</div>
											</div>
											<div id="address" class="tab-pane fade ">
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Address</h6></a></li>
														</ul>
													</div>
													<textarea rows="" cols="" class="form-control"
														name="vendorAddress" required="required"></textarea>
													<div class="row">
														<div class="col-md-3">City :</div>
														<div class="col-md-9">
															<input type="text" class="form-control" name="vendorCity"
																required="required">
														</div>
													</div>
													<div class="row">
														<div class="col-md-3">Pin code :</div>
														<div class="col-md-9">
															<input type="text" class="form-control" name="vendorPin"
																required="required">
														</div>
													</div>
												</div>
												<br>
												<div class="col-md-12">
													<input class="btn green pull-left" type="button"
														value="Previous" onclick="addressButtonPrev();"> <input
														class="btn green pull-right" type="button" value="Next"
														onclick="addressButtonNext();">
												</div>
											</div>
											<div id="part" class="tab-pane fade ">
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Purchase
																		History</h6></a></li>
														</ul>
													</div>
													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Part Number</th>
																<th>Vendor number</th>
																<th>Last cost</th>
																<th>UOM</th>
																<th>Last date</th>
																<th>Lead time</th>
																<th>Description</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>1</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="widget-area">
													<div class="breadcrumbs">
														<ul>
															<li><a title="" class="font"><h6>Vendor
																		cost rules</h6></a></li>
														</ul>
													</div>
													<table id="stream_table"
														class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Name</th>
																<th>Part Number</th>
																<th>Qty</th>
																<th>Part UOM</th>
																<th>Unit cost</th>
																<th>Total cost</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>1</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
																<td>---</td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>

											</div>

										</div>
									</form>
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>