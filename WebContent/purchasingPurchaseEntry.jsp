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
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchEntry").attr("style", "color: red;");
		$("#notpaid").hide();
		$("#semipaid").hide();
		$("#fullpaid").hide();
		$("#cash").hide();
		$("#bank").hide();
		$("#cheque").hide();
		$("#scash").hide();

	});
	function pstatus() {
		var val = $('[name="pstatus"]').val();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'npaid') {
			$("#notpaid").show();
			$("#fullpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'fpaid') {
			$("#fullpaid").show();
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'spaid') {
			$("#semipaid").show();
			$("#notpaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		}
	}
	function fptype() {
		var val = $('[name="fptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#cash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#cash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#cash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#cash").hide();
		}
	}
	function sptype() {
		var val = $('[name="sptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#scash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#scash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#scash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#scash").hide();
		}
	}
</script>
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

							<div class="widget-area">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Purchase Entry</b>
											</p></li>
									</ul>
								</div>
								<div class="col-md-12">
									<form role="form" class="sec" method="post"
										action="purchaseEntry">
										<div class="widget-area">
											<div class="col-md-6">
												<div class="col-md-12">
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <select
														class="form-control" name="vendorType"
														onchange="getVendorNameByType();">
														<c:forEach
															items="${sessionScope['ejb'].getAllVendorType()}"
															var="vType">
															<option value="${vType.id}">${vType.type}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-12">
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
														type="text" class="form-control" id="vName" name="vName">
												</div>
												<div class="col-md-12">
													<!-- <div class="breadcrumbs">
														<ul>
															<li><a title="" class="font">Vendor Details :</a></li>
														</ul>
													</div> -->
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
													<textarea rows="" cols="" id="" class="form-control"
														readonly="readonly"></textarea>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Vendor Bill no :</label> <input
														type="text" placeholder="" id="" class="form-control" readonly="readonly">
												</div>
												<div class="form-group">
													<label for="" class="font">Purchase challan no. :</label>
													<input type="text" placeholder="" id=""
														class="form-control" readonly="readonly">
												</div>
												<div class="form-group">
													<label for="" class="font">Purchase Date :</label> <input
														type="text" id="datepicker" class="form-control">
												</div>
											</div>
										</div>
										<div class="widget-area">
											<input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%">
										</div>
										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>Product code</th>
													<th>Product Description</th>
													<th>Rate</th>
													<th>Qty</th>
													<th>Amount</th>
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
												</tr>
											</tbody>
										</table>
										<div style="width: 40%; float: right;">
											<table id="stream_table"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<td colspan="2">Sub Total :</td>
														<td><input type="number" class="form-control"
															placeholder="0.0" readonly="readonly"></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><select class="form-control">
																<option>TAX type</option>
																<option>TAX type</option>
																<option>TAX type</option>
																<option>TAX type</option>
																<option>TAX type</option>
														</select></td>
														<td>%</td>
														<td><input type="number" class="form-control"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Tax Amount :</td>
														<td><input type="number" class="form-control"
															readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Transport charge :</td>
														<td><input type="number" class="form-control"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Surcharge :</td>
														<td><input type="number" class="form-control"></td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<td colspan="2">Grand Total :</td>
														<td><input type="number" class="form-control"
															placeholder="0.0" readonly="readonly"></td>
													</tr>
												</thead>
											</table>
											<div style="float: right;">
												<input type="button" class="btn green pull-right"
													data-toggle="modal" data-target="#savePurchase"
													value="Save">
											</div>
										</div>
									</form>
									<!-- <input type="radio" name="a" value="x" onclick="first()" id="a">1
									<input type="radio" name="a" value="y" onclick="second()"
										id="b">2 -->
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

	<div id="savePurchase" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Payment Details</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="widget-area">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Select Payment status : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Payment status :</div>
									<div class="col-md-7">
										<div class="sec">
											<select class="form-control" name="pstatus"
												onchange="pstatus()">
												<option value="-" selected="selected">---</option>
												<option value="fpaid">Full paid</option>
												<option value="spaid">Semi paid</option>
												<option value="npaid">not paid</option>
											</select>
										</div>
									</div>
								</div>
								<div class="widget-area" id="fullpaid">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Select Payment type : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-5">Payment type :</div>
										<div class="col-md-7">
											<div class="sec">
												<select class="form-control" name="fptype"
													onchange="fptype()">
													<option value="-" selected="selected">---</option>
													<option value="cash">Cash</option>
													<option value="cheq">Cheque</option>
													<option value="btra">Bank transfer</option>
												</select>
											</div>
										</div>
										<div class="col-md-5">Payment Date :</div>
										<div class="col-md-7">
											<input type="text" id="datepicker1" class="form-control">
										</div>
										<div class="col-md-5">Amount :</div>
										<div class="col-md-7">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<br>
									<div class="breadcrumbs" id="cash">
										<button type="submit" class="btn green pull-right">Save</button>
									</div>
								</div>

								<div id="semipaid">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Select Payment type : </a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-5">Payment type :</div>
										<div class="col-md-7">
											<div class="sec">
												<select class="form-control" name="sptype"
													onchange="sptype()">
													<option value="-" selected="selected">---</option>
													<option value="cash">Cash</option>
													<option value="cheq">Cheque</option>
													<option value="btra">Bank transfer</option>
												</select>
											</div>
										</div>
										<div class="col-md-5">Payment Date :</div>
										<div class="col-md-7">
											<input type="text" id="datepicker" class="form-control">
										</div>
										<div class="col-md-5">Full Amount :</div>
										<div class="col-md-7">
											<input type="text" class="form-control" readonly="readonly">
										</div>
										<div class="col-md-5">Payment Amount :</div>
										<div class="col-md-7">
											<input type="text" class="form-control">
										</div>
										<div class="col-md-5">Due Amount :</div>
										<div class="col-md-7">
											<input type="text" class="form-control" readonly="readonly">
										</div>
									</div>
									<br>
									<div class="breadcrumbs" id="scash">
										<button type="submit" class="btn green pull-right">Save</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6" style="float: right;" id="notpaid">
							<div class="widget-area">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Not Paid : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-4">Due Amount :</div>
									<div class="col-md-8">
										<input type="text" class="form-control" readonly="readonly">
									</div>
								</div>
								<br>
								<div class="breadcrumbs">
									<button type="submit" class="btn green pull-right">Save</button>
								</div>
							</div>
						</div>
						<div class="col-md-6" style="float: right;" id="cheque">
							<div class="widget-area">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Provide Cheque details : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Cheque No. :</div>
									<div class="col-md-7">
										<input type="text" class="form-control">
									</div>
									<div class="col-md-5">Description(if any):</div>
									<div class="col-md-7">
										<textarea rows="" cols="" class="form-control"></textarea>
									</div>
								</div>
								<br>
								<div class="breadcrumbs">
									<button type="submit" class="btn green pull-right">Save</button>
								</div>
							</div>
						</div>
						<div class="col-md-6" style="float: right;" id="bank">
							<div class="widget-area">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Provide Bank transfer details : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Transaction ID :</div>
									<div class="col-md-7">
										<input type="text" class="form-control">
									</div>
									<div class="col-md-5">Description(if any):</div>
									<div class="col-md-7">
										<textarea rows="" cols="" class="form-control"></textarea>
									</div>
								</div>
								<br>
								<div class="breadcrumbs">
									<button type="submit" class="btn green pull-right">Save</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>

	<div id="addProduct" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="close();">&times;</button>
					<h4 class="modal-title">Add Product</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Group</a></li>
								</ul>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-5">Department:</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-5">Sub-Department:</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-5">Category:</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-12">
									<br>
								</div>
								<div class="col-md-5">Product-Code:</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-5">Product Descripsion:</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Attributes</a></li>
								</ul>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-2">Attribute1:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-2">Attribute2:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-2">Attribute3:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-2">Attribute4:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-2">Attribute5:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-2">Attribute6:</div>
								<div class="col-md-10">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="col-md-3">Quantity:</div>
								<div class="col-md-9">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-3">UOM:</div>
								<div class="col-md-9">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-3">Rate:</div>
								<div class="col-md-9">
									<input type="text" class="form-control">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="row">
									&nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" id="sale"
										onclick="salable();"> &nbsp; Is salable
								</div>
								<div class="col-md-2">Wsp:</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="wsp"
										readonly="readonly">
								</div>
								<div class="col-md-2">MRP:</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="mrp"
										readonly="readonly">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 100%;">
							<div class="row">
								&nbsp; &nbsp; <span>Lot no : &nbsp;</span> <input type="radio"
									name="lot" value="yesLot">&nbsp; Yes <input
									type="radio" name="lot" value="noLot">&nbsp; No
							</div>
							<br>
							<div class="row">
								<div class="col-md-2">Lot No. :</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="lotText"
										disabled="disabled">
								</div>
							</div>
							<br>
							<div class="row">
								&nbsp; &nbsp; <span>Serial : &nbsp; </span> <input type="radio"
									name="serial" value="yesSerial">&nbsp; Yes <input
									type="radio" name="serial" value="noSerial">&nbsp; No
							</div>
							<br>
							<div class="row">
								<div class="col-md-2">Initial Serial. :</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="serialText"
										disabled="disabled">
								</div>
							</div>
							<br>
							<div class="row" style="float: left;">
								&nbsp; &nbsp; <span>Bar code : &nbsp; </span> <input
									type="radio" name="bar" value="yesBar">&nbsp; Yes <input
									type="radio" name="bar" value="noBar">&nbsp; No
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" value="Add"
						data-toggle="modal" data-target="#another"> <input
						type="button" class="btn btn-default" data-dismiss="modal"
						value="Close" onclick="close();">
				</div>
			</div>

		</div>
	</div>

	<div id="another" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- <div class="modal-header">
					<button type="button" class="close" onclick="close1();">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div> -->
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>Do you want to add another product?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-default">Yes</button>
								<button type="button" class="btn btn-default">No</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="close1();">Close</button>
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
		function salable() {
			if ($('#sale').is(":checked")) {
				$("#wsp").attr("readonly", false);
				$("#mrp").attr("readonly", false);
			} else {
				$("#wsp").attr("readonly", true);
				$("#mrp").attr("readonly", true);
			}
		}
		$("input:radio[name=lot]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesLot") {
				$("#lotText").prop("disabled", false);
			} else {
				$("#lotText").prop("disabled", true);
			}
		});
		$("input:radio[name=serial]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesSerial") {
				$("#serialText").prop("disabled", false);
			} else {
				$("#serialText").prop("disabled", true);
			}
		});
		/* function first() {
			if ($('#a').is(":checked")) {
				alert("hi");
			}
		} */
		function close() {
			$("#addProduct").hide();
		}
		function close1() {
			$("#another").hide();
		}
		function getVendorNameByType() {
			var a = $('[name="vendorType"]').val();
			if (a != 0) {
				$.ajax({
					url : "getVendorByVendorType",
					dataType : "json",
					data : {
						"id" : a
					},
					success : function(data) {
						
					}
				})
			}
			/* $("#vName").autocomplete({
				source : function(req,resp){
					
				}
			}); */
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>