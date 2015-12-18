<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	/* $(function() {
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	}); */
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchEntry").attr("style", "color: red;");
		$("#payDetail").hide();
		$("#description").hide();

	});
	function closePayment() {
		$("#payDetail").hide();
		$("#description").hide();
		$("#pstatus").val('-');
		$("#pType").val('-');
	}
	function pStatusDiv() {
		var val = $('[name="pstatus"]').val();
		$("#payDetail").show();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#payDetail").hide();
			$("#description").hide();
		} else if (val == 'Not Paid') {
			$("#pPayAmount").hide();
			$("#pAmount").hide();
			$("#pDate").hide();
			$("#pTypeDiv").hide();
			$("#pDueAmount").show();
			$("#description").show();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number(0));
			$("#spDueAmount").val(
					Number($("#spAmount").val())
							- Number($("#spPaymentAmount").val()));
		} else if (val == 'Full Paid') {
			$("#pPayAmount").hide();
			$("#pDueAmount").hide();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number($("#gt").val()));
			$("#spDueAmount").val(
					Number($("#spAmount").val())
							- Number($("#spPaymentAmount").val()));
		} else if (val == 'Semi Paid') {
			$("#pPayAmount").show();
			$("#pDueAmount").show();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#spAmount").val(Number($("#gt").val()));
			$("#spPaymentAmount").val(Number(0));
			$("#spDueAmount").val(
					Number($("#spAmount").val())
							- Number($("#spPaymentAmount").val()));
		}
	}
	function spPaymentAmountFunc() {
		$("#spDueAmount").val(
				Number($("#spAmount").val())
						- Number($("#spPaymentAmount").val()));
	}
	function pTypeFunc() {
		$("#description").show();
		var val = $('[name="pType"]').val();
		if (val == '-') {
			alert('Please select Payment Type...');
			$("#description").hide();
		}
	}
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
</head>
<body>
	<c:if test="${requestScope['print']==1}">
		<script type="text/javascript">
			window.open("barcodePrint.jsp?id=${requestScope['purDet']}",
					'name', 'width=600,height=400');
		</script>
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
									<form role="form" class="sec" method="post" id="purchaseForm"
										action="purchaseEntry">
										<div class="widget-area">
											<div class="col-md-6">
												<div class="col-md-12">
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <select
														class="form-control" name="vendorType"
														onchange="getVendorNameByType();" required="required">
														<option value="0">Select Vendor Type</option>
														<c:forEach
															items="${sessionScope['ejb'].getAllVendorType()}"
															var="vType">
															<option value="${vType.id}">${vType.type}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-12">
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
														type="text" class="form-control" id="vName" name="vName"
														required="required"> <input type="hidden" id="vId"
														name="vId">
												</div>
												<div class="col-md-12">
													<!-- <div class="breadcrumbs">
														<ul>
															<li><a title="" class="font">Vendor Details :</a></li>
														</ul>
													</div> -->
													&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
													<textarea rows="5" cols="" id="vDetail"
														class="form-control" readonly="readonly"></textarea>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Vendor Bill no :</label> <input
														type="text" placeholder="" id="" class="form-control"
														name="vendorBillNo" required="required">
												</div>
												<div class="form-group">

													<label for="" class="font">Purchase challan no. :</label>
													<c:set var="fy"
														value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
													<c:set var="cno"
														value="${sessionScope['ejb'].getLastPurchaseChallanNumber()+1}" />
													<c:set var="csuf"
														value="${sessionScope['ejb'].getLastPurchaseChallanSuffix()+1}" />
													<c:set var="suf" value="PUR" />
													<c:set var="bs"
														value="${sessionScope['ejb'].getLastBillSetupBySufix(suf)}" />
													<fmt:formatNumber value="${cno}" var="lastChNo"
														minIntegerDigits="4" groupingUsed="false" />
													<fmt:formatNumber value="${csuf}" var="lastSuf"
														minIntegerDigits="3" groupingUsed="false" />
													<fmt:formatDate
														value="${sessionScope['ejb'].getCurrentDateTime()}"
														pattern="MM" var="yr" />
													<input readonly="readonly" type="text" placeholder=""
														name="challanNumber" class="form-control"
														value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
													<input type="hidden" name="challanNo" value="${lastChNo}"
														id="challanNo"> <input type="hidden"
														name="challanSuffix" value="${lastSuf}">
												</div>
												<div class="form-group">
													<label for="" class="font">Purchase Date :</label> <input
														type="text" id="datepicker" class="form-control"
														name="purchaseDate" required="required">
												</div>
												<br> <input type="button" class="btn green pull-right"
													data-toggle="modal" data-target="#addProduct"
													value="Add Product" style="width: 100%" onclick="manage();">
											</div>
											<div class='toast' style='display: none'>
												<h3 id="msg">${requestScope['msg']}</h3>
											</div>
										</div>
									
										<table id="purProTable"
											class="table table-striped table-bordered">
											<thead style="background-color: #F0F0F0;">
												<tr>
													<th>#</th>
													<th>Product code</th>
													<th>Product Description</th>
													<th>Rate</th>
													<th>Qty</th>
													<th>Amount</th>
												</tr>
											</thead>
										</table>
										<div style="width: 40%; float: right;">
											<table id="stream_table"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<td colspan="2">Sub Total :</td>
														<td><input type="text" class="form-control"
															id="subTotal" value="0" readonly="readonly""></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><select class="form-control" id="taxGroup"
															name="taxGroup" onchange="selectedTaxGroup();">
																<option value="0">TAX type</option>
																<c:forEach
																	items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
																	var="taxTypeGroup">
																	<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
																</c:forEach>
														</select></td>
														<td>%</td>
														<td><input type="text" class="form-control"
															readonly="readonly" value="0" id="taxTot"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Tax Amount :</td>
														<td><input type="text" class="form-control"
															readonly="readonly" value="0" id="taxAmount"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Transport charge :</td>
														<td><input type="text" class="form-control"
															name="transportCost" id="transportCost" onkeyup="gtot();"
															value="0"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Surcharge :</td>
														<td><input type="text" class="form-control"
															id="surcharge" name="surcharge" onkeyup="gtot();"
															value="0"></td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<td colspan="2">Grand Total :</td>
														<td><input type="text" class="form-control" id="gt"
															placeholder="0" readonly="readonly"></td>
													</tr>
												</thead>
											</table>
											<div class="widget-area" style="display: none;">
												<!-- <div class="widget-area" style="overflow-x: scroll;"> -->
												<table id="hiddenTable"
													class="table table-striped table-bordered">
													<thead style="background-color: #F0F0F0;">
														<tr>
															<th>Product code id</th>
															<th>Attribute1</th>
															<th>Atribute2</th>
															<th>Atribute3</th>
															<th>Atribute4</th>
															<th>Atribute5</th>
															<th>Atribute6</th>
															<th>Quantity</th>
															<th>UOM</th>
															<th>Rate</th>
															<th>WSP</th>
															<th>MRP</th>
															<th>Lot no.</th>
															<th>Initial Serial</th>
														</tr>
													</thead>
												</table>
											</div>
											<div class="row">
												<div style="float: left;">
													&nbsp; &nbsp; <span><b>Bar code :</b> &nbsp; </span> <input
														type="radio" name="bar" value="yesBar" checked="checked">&nbsp;
													Yes <input type="radio" name="bar" value="noBar">&nbsp;
													No
												</div>
												<div style="float: right;">
													<input type="button" class="btn green pull-right"
														data-toggle="modal" data-target="#savePurchase"
														value="Save" onclick="paymentDate();">
												</div>
											</div>
											<div id="savePurchase" class="modal fade" role="dialog"
												style="top: 25px;">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																onclick="closePayment();">&times;</button>
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

																					<select class="form-control" id="pstatus"
																						name="pstatus" onchange="pStatusDiv()">
																						<option value="-" selected="selected">---</option>
																						<c:forEach
																							items="${sessionScope['ejb'].getAllPaymentStatus()}"
																							var="payStatus">
																							<option value="${payStatus.status}">${payStatus.status}</option>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																		</div>
																		<div id="payDetail">
																			<div class="breadcrumbs">
																				<ul>
																					<li><a title="">Payment Details : </a></li>
																				</ul>
																			</div>
																			<br> <br> <br>
																			<div class="row">
																				<div class="sec" id="pTypeDiv">
																					<div class="col-md-5">Payment type :</div>
																					<div class="col-md-7">
																						<select class="form-control" id="pType"
																							name="pType" onchange="pTypeFunc()">
																							<option value="-" selected="selected">---</option>
																							<c:forEach
																								items="${sessionScope['ejb'].getAllPaymentType()}"
																								var="payType">
																								<option value="${payType.getType()}">${payType.getType()}</option>
																							</c:forEach>
																						</select>
																					</div>
																				</div>
																				<div id="pDate">
																					<div class="col-md-5">Payment Date :</div>
																					<div class="col-md-7">
																						<input type="text" id="datepicker2"
																							class="form-control" readonly="readonly">
																					</div>
																				</div>
																				<div id="pAmount">
																					<div class="col-md-5">Full Amount :</div>
																					<div class="col-md-7">
																						<input type="text" class="form-control"
																							readonly="readonly" id="spAmount" name="spAmount">
																					</div>
																				</div>
																				<div id="pPayAmount">
																					<div class="col-md-5">Payment Amount :</div>
																					<div class="col-md-7">
																						<input type="text" class="form-control" value="0"
																							id="spPaymentAmount" name="spPaymentAmount"
																							onkeyup="spPaymentAmountFunc();">
																					</div>
																				</div>
																				<div id="pDueAmount">
																					<div class="col-md-5">Due Amount :</div>
																					<div class="col-md-7">
																						<input type="text" class="form-control"
																							readonly="readonly" id="spDueAmount"
																							name="spDueAmount">
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="col-md-6" style="float: right;"
																	id="description">
																	<div class="widget-area">
																		<div class="breadcrumbs">
																			<ul>
																				<li><a title="">Provide Description : </a></li>
																			</ul>
																		</div>
																		<br> <br> <br>
																		<div class="row">
																			<div class="col-md-5">Description :</div>
																			<div class="col-md-7">
																				<textarea rows="" cols="" class="form-control"
																					id="desc" name="desc"></textarea>
																			</div>
																		</div>
																		<br>
																		<div class="breadcrumbs">
																			<button type="button" class="btn green pull-right"
																				onclick="submit();">Save</button>
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
										</div>
										<input type="hidden" name="isSalable" id="isSalable">
										<input type="hidden" name="isBarPrint" id="isBarPrint">
										<input type="hidden" name="isSerial" id="isSerial"> <input
											type="hidden" name="isLot" id="isLot">
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

	<div id="addProduct" class="modal fade" role="dialog"
		style="top: -110px; overflow-y: hidden; overflow-x: hidden;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
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
									<input type="text" class="form-control" readonly="readonly"
										id="dept" name="dept">
								</div>
								<div class="col-md-5">Sub-Department:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" readonly="readonly"
										id="subDept" name="subDept">
								</div>
								<div class="col-md-5">Category:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" readonly="readonly"
										id="cat" name="cat">
								</div>
								<div class="col-md-12">
									<br>
								</div>
								<div class="col-md-5">Product-Code:</div>
								<div class="col-md-7">
									<select class="form-control" name="productCode"
										id="productCode" onchange="getProductDetailsByProductCode();"
										required="required">
										<option value="0">Select Product Code</option>
										<c:forEach
											items="${sessionScope['ejb'].getAllProductDetail()}"
											var="productDetail">
											<option value="${productDetail.id}">${productDetail.code}</option>
										</c:forEach>
									</select> <input type="hidden" id="pCode" name="pCode">
								</div>
								<div class="col-md-5">Product Descripsion:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" name="pDesc" id="pDesc"
										readonly="readonly">
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
								<div class="col-md-2">
									<span id="attr1Name">Attribute1:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr1" id="attr1"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr2Name">Attribute2:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr2" id="attr2"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr3Name">Attribute3:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr3" id="attr3"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr4Name">Attribute4:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr4" id="attr4"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr5Name">Attribute5:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr5" id="attr5"
										readonly="readonly">
								</div>
								<div class="col-md-2">
									<span id="attr6Name">Attribute6:</span>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" name="attr6" id="attr6"
										readonly="readonly">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="col-md-3">Quantity:</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="qty" id="qty"
										required="required">
								</div>
								<div class="col-md-3">UOM:</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="uom" name="uom"
										readonly="readonly">
								</div>
								<div class="col-md-3">Rate:</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="rate" id="rate"
										required="required">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 50%;">
							<div class="row">
								<div class="row">
									&nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" id="sale"
										onclick="salable();" style="display: none;"> &nbsp;
									<!-- Is salable -->

								</div>
								<div class="col-md-2">WSP:</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="wsp"
										readonly="readonly" name="wsp">
								</div>
								<div class="col-md-2">MRP:</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="mrp"
										readonly="readonly" name="mrp">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 100%; top: 0px;">
							<div class="row">
								&nbsp; &nbsp; <span>Lot no : &nbsp;</span> <input type="radio"
									name="lot" value="yesLot" checked="checked">&nbsp; Yes
								<input type="radio" name="lot" value="noLot">&nbsp; No
							</div>

							<div class="row">
								<div class="col-md-2">
									<b>Lot No. :</b>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="lotText"
										name="lotText">
								</div>
							</div>
							<br>
							<div class="row">
								&nbsp; &nbsp; <span>Serial : &nbsp; </span> <input type="radio"
									name="serial" value="yesSerial" checked="checked">&nbsp;
								Yes <input type="radio" name="serial" value="noSerial">&nbsp;
								No
							</div>

							<div class="row">
								<div class="col-md-2">
									<b>Initial Serial. :</b>
								</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="serialText"
										name="serialText">
								</div>
							</div>
							<br>
							<div class="row">
								<!-- <div style="float: left;">
									&nbsp; &nbsp; <span><b>Bar code :</b> &nbsp; </span> <input
										type="radio" name="bar" value="yesBar" checked="checked">&nbsp;
									Yes <input type="radio" name="bar" value="noBar">&nbsp;
									No
								</div> -->

								<div style="float: right; right: 25px;">
									<input type="button" class="btn btn-default" value="Add"
										data-toggle="modal" onclick="anotherShow();"> <input
										type="button" class="btn btn-default" data-dismiss="modal"
										value="Close" id="close" onclick="closeProduct()">
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="modal-footer">
					
				</div> -->
				</div>

			</div>
		</div>
	</div>

	<div id="another" class="modal fade" role="dialog" style="top: -25px;">
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
								<span>Product added successfully...</span> <span>Do you
									want to add another product?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-default" id="yesP">Yes</button>
								<button type="button" class="btn btn-default" id="noP">No</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" id="close1"
						onclick="close1();">Close</button> -->
				</div>
			</div>

		</div>
	</div>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script>
		$(document).ready(function() {
			$("#isSalable").val('no');
			$("#isBarPrint").val('yes');
			$("#isSerial").val('yes');
			$("#isLot").val('yes');
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		function getProductDetailsByProductCode() {
			if ($("#productCode").val() != 0) {
				$.ajax({
					url : 'getProductDetailById',
					type : 'post',
					dataType : "json",
					data : {
						id : $("#productCode").val()
					},
					success : function(data) {
						$("#dept").val(data.Department);
						$("#pCode").val(data.code);
						if (data.isSaleble == 'true') {
							$("#wsp").attr("readonly", false);
							$("#mrp").attr("readonly", false);
							$("#isSalable").val('yes');
							$('#sale').prop("checked", "checked");
						} else {
							$("#wsp").attr("readonly", true);
							$("#mrp").attr("readonly", true);
							$("#isSalable").val('no');
							$('#sale').removeProp("checked");
						}
						$("#subDept").val(data.subDepartment);
						$("#cat").val(data.category);
						$("#pDesc").val(data.description);
						$("#uom").val(data.qtyUnit);
						if ((data.attrNmae1) != 'null') {
							$("#attr1Name").html(data.attrNmae1);
							$("#attr1").prop("readonly", false);
						} else {
							$("#attr1Name").html("Attribute1:");
							$("#attr1").prop("readonly", true);
						}
						if ((data.attrNmae2) != 'null') {
							$("#attr2Name").html(data.attrNmae2);
							$("#attr2").prop("readonly", false);
						} else {
							$("#attr2Name").html("Attribute2:");
							$("#attr2").prop("readonly", true);
						}
						if ((data.attrNmae3) != 'null') {
							$("#attr3Name").html(data.attrNmae3);
							$("#attr3").prop("readonly", false);
						} else {
							$("#attr3Name").html("Attribute3:");
							$("#attr3").prop("readonly", true);
						}
						if ((data.attrNmae4) != 'null') {
							$("#attr4Name").html(data.attrNmae4);
							$("#attr4").prop("readonly", false);
						} else {
							$("#attr4Name").html("Attribute4:");
							$("#attr4").prop("readonly", true);
						}
						if ((data.attrNmae5) != 'null') {
							$("#attr5Name").html(data.attrNmae5);
							$("#attr5").prop("readonly", false);
						} else {
							$("#attr5Name").html("Attribute5:");
							$("#attr5").prop("readonly", true);
						}
						if ((data.attrNmae6) != 'null') {
							$("#attr6Name").html(data.attrNmae6);
							$("#attr6").prop("readonly", false);
						} else {
							$("#attr6Name").html("Attribute6:");
							$("#attr6").prop("readonly", true);
						}
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
					}
				});
			} else {
				alert("please select one product-code");
				$("#wsp").val("");
				$("#mrp").val("");
				$("#subDept").val("");
				$("#dept").val("");
				$("#cat").val("");
				$("#pDesc").val("");
				$("#uom").val("");
				$("#pCode").val("");
				$("#attr1Name").html("Attribute1:");
				$("#attr2Name").html("Attribute2:");
				$("#attr3Name").html("Attribute3:");
				$("#attr4Name").html("Attribute4:");
				$("#attr5Name").html("Attribute5:");
				$("#attr6Name").html("Attribute6:");
				$("#attr1").prop("readonly", true);
				$("#attr2").prop("readonly", true);
				$("#attr3").prop("readonly", true);
				$("#attr4").prop("readonly", true);
				$("#attr5").prop("readonly", true);
				$("#attr6").prop("readonly", true);
				$("#wsp").prop("readonly", true);
				$("#mrp").prop("readonly", true);
			}
			/* $.ajax({
				url : 'getCategoryById',
				type : 'post',
				dataType : "json",
				data : {
					id : $("#catId").val()
				},
				success : function(data) {
					if ((data.attrNmae1) != null) {
						$("#attr1Name").html(data.attrNmae1);
					}
					//$("#attr2Name").html(data.attrNmae2);
					//$("#attr3Name").html(data.attrNmae3);
					//$("#attr4Name").html(data.attrNmae4);
					//$("#attr5Name").html(data.attrNmae5);
					//$("#attr6Name").html(data.attrNmae6);
				},
				error : function(a, b, c) {
					alert(b + ": " + c);
				}
			}); */
		}
		function salable() {

			if ($('#sale').is(":checked")) {
				$("#isSalable").val('yes');
				$("#wsp").attr("readonly", false);
				$("#mrp").attr("readonly", false);
			} else {
				$("#isSalable").val('no');
				$("#wsp").attr("readonly", true);
				$("#mrp").attr("readonly", true);
			}
		}
		$("input:radio[name=bar]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesBar") {
				$("#isBarPrint").val('yes');
			} else {
				$("#isBarPrint").val('no');
			}
		});
		$("input:radio[name=lot]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesLot") {
				$("#lotText").prop("disabled", false);
				$("#isLot").val('yes');
			} else {
				$("#lotText").prop("disabled", true);
				$("#isLot").val('no');
			}
		});
		$("input:radio[name=serial]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesSerial") {
				$("#serialText").prop("disabled", false);
				$("#isSerial").val('yes');
			} else {
				$("#serialText").prop("disabled", true);
				$("#isSerial").val('no');
			}
		});
		/* function first() {
			if ($('#a').is(":checked")) {
				alert("hi");
			}
		} */

		$("#close").click(function() {
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		/* $("#close1").click(function() {
			$("#another").modal("hide");
		}); */
		function close1() {
			$("#another").modal("hide");
		}
		function manage() {
			$("#header").hide();
		}
		$("#yesP").click(function() {
			$("#another").modal("hide");
		});
		$("#noP").click(function() {
			$("#another").modal("hide");
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		var i = 1;
		function anotherShow() {
			$("#another").modal("show");
			//$("#amount").val(Number($("#qty").val()) * Number($("#rate").val()));
			$("#purProTable").append(
					'<tbody><tr><td>' + i + '</td><td>' + $("#pCode").val()
							+ '</td><td>' + $("#pDesc").val() + '</td><td>'
							+ $("#rate").val() + '</td><td>' + $("#qty").val()
							+ '</td><td>' + Number($("#qty").val())
							* Number($("#rate").val()) + '</td></tr></tbody>');
			$("#subTotal").val(
					Number($("#subTotal").val()) + Number($("#qty").val())
							* Number($("#rate").val()));
			//$("#qty").val("");
			i++;

			$("#hiddenTable").append(
					'<tbody><tr>'
							+ '<td><input type="text" name="pCodeIdH" value=\''
							+ $("#productCode").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr1H" value=\''
							+ $("#attr1").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr2H" value=\''
							+ $("#attr2").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr3H" value=\''
							+ $("#attr3").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr4H" value=\''
							+ $("#attr4").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr5H" value=\''
							+ $("#attr5").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr6H" value=\''
							+ $("#attr6").val()
							+ '\'></td>'
							+ '<td><input type="text" name="qtyH" value=\''
							+ $("#qty").val()
							+ '\'></td>'
							+ '<td><input type="text" name="uomH" value=\''
							+ $("#uom").val()
							+ '\'></td>'
							+ '<td><input type="text" name="rateH" value=\''
							+ $("#rate").val()
							+ '\'></td>'
							+ '<td><input type="text" name="wspH" value=\''
							+ $("#wsp").val()
							+ '\'></td>'
							+ '<td><input type="text" name="mrpH" value=\''
							+ $("#mrp").val()
							+ '\'></td>'
							+ '<td><input type="text" name="lotH" value=\''
							+ $("#lotText").val()
							+ '\'></td>'
							+ '<td><input type="text" name="serialH" value=\''
							+ $("#serialText").val()
							+ '\'></td>'
							+ '</tr></tbody>');
			$("#taxAmount").val(
					Number($("#subTotal").val()) * Number($("#taxTot").val())
							/ Number(100));
			$("#gt").val(
					Number($("#subTotal").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transportCost").val())
							+ Number($("#surcharge").val()));
			$("#dept").val("");
			$("#subDept").val("");
			$("#cat").val("");
			$("#pCode").val("");
			$("#pDesc").val("");
			$("#attr1").val("");
			$("#attr2").val("");
			$("#attr3").val("");
			$("#attr4").val("");
			$("#attr5").val("");
			$("#attr6").val("");
			$("#qty").val("");
			$("#uom").val("");
			$("#rate").val("");
			$("#wsp").val("");
			$("#mrp").val("");
			$("#lotText").val("");
			$("#serialText").val("");
			$("#productCode").val("0");
			$("#attr1Name").html("Attribute1:");
			$("#attr2Name").html("Attribute2:");
			$("#attr3Name").html("Attribute3:");
			$("#attr4Name").html("Attribute4:");
			$("#attr5Name").html("Attribute5:");
			$("#attr6Name").html("Attribute6:");
			$("#attr1").prop("readonly", true);
			$("#attr2").prop("readonly", true);
			$("#attr3").prop("readonly", true);
			$("#attr4").prop("readonly", true);
			$("#attr5").prop("readonly", true);
			$("#attr6").prop("readonly", true);
		}

		function closeProduct() {
			$("#dept").val("");
			$("#subDept").val("");
			$("#cat").val("");
			$("#pCode").val("");
			$("#pDesc").val("");
			$("#attr1").val("");
			$("#attr2").val("");
			$("#attr3").val("");
			$("#attr4").val("");
			$("#attr5").val("");
			$("#attr6").val("");
			$("#qty").val("");
			$("#uom").val("");
			$("#rate").val("");
			$("#wsp").val("");
			$("#mrp").val("");
			$("#lotText").val("");
			$("#serialText").val("");
			$("#productCode").val("0");
			$("#attr1Name").html("Attribute1:");
			$("#attr2Name").html("Attribute2:");
			$("#attr3Name").html("Attribute3:");
			$("#attr4Name").html("Attribute4:");
			$("#attr5Name").html("Attribute5:");
			$("#attr6Name").html("Attribute6:");
			$("#attr1").prop("readonly", true);
			$("#attr2").prop("readonly", true);
			$("#attr3").prop("readonly", true);
			$("#attr4").prop("readonly", true);
			$("#attr5").prop("readonly", true);
			$("#attr6").prop("readonly", true);
		}

		function getVendorNameByType() {
			$("#vName").val("");
			$("#vDetail").val("");
		}

		$(function() {
			$("#vName")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												url : "getVendorByVendorType",
												dataType : "json",
												data : {
													id : $(
															'[name="vendorType"]')
															.val(),
													term : req.term
												},
												success : function(data) {
													resp($.map(data,function(item) {
																		return ({
																			value : item.name,
																			addr : item.address,
																			id : item.id,
																			ph1 : item.ph1,
																			ph2 : item.ph2
																		});
																	}));
												}
											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$("#vName").val("");
										$("#vDetail").val("");
										$("#taxGroup").val(0).prop("selected",
												true);
										$("#taxTot").val('0');
										$("#taxAmount").val('0');
										$("#gt")
												.val(
														Number($("#subTotal")
																.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transportCost")
																		.val())
																+ Number($(
																		"#surcharge")
																		.val()));
									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val(
												"Address : \n\t" + ui.item.addr
														+ "\nPhone1 : "
														+ ui.item.ph1
														+ "\nPhone2 : "
														+ ui.item.ph2);
									}

								},
								select : function(event, ui) {
									if (ui.item == null) {
										$("#vName").val("");

									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val("Address : \n\t" + ui.item.addr+ "\nPhone1 : "+ ui.item.ph1+ "\nPhone2 : "+ ui.item.ph2);

										$
												.ajax({
													type : "post",
													url : "getAccountDetails",
													data : {
														id : ui.item.id
													},
													dataType : "json",
													success : function(data5) {
														$("#taxGroup")
																.val(
																		data5.tax_Type_Group)
																.prop(
																		"selected",
																		true);
														$("#taxTot").val(
																data5.taxTotal);
														$("#taxAmount")
																.val(
																		Number($(
																				"#subTotal")
																				.val())
																				* Number($(
																						"#taxTot")
																						.val())
																				/ Number(100));
														$("#gt")
																.val(
																		Number($(
																				"#subTotal")
																				.val())
																				+ Number($(
																						"#taxAmount")
																						.val())
																				+ Number($(
																						"#transportCost")
																						.val())
																				+ Number($(
																						"#surcharge")
																						.val()));
													},
													error : function(a, b, c) {
														alert(b + " error: "
																+ c);
													}
												});
									}
								}
							});
		});
		function selectedTaxGroup() {
			if ($("#taxGroup").val() != 0) {
				$.ajax({
					url : "getTaxGroupById",
					data : {
						id : $("#taxGroup").val()
					},
					dataType : "json",
					success : function(data) {
						$("#taxTot").val(data.taxtot);
						$("#taxAmount").val(
								Number($("#subTotal").val())
										* Number($("#taxTot").val())
										/ Number(100));
						$("#gt").val(
								Number($("#subTotal").val())
										+ Number($("#taxAmount").val())
										+ Number($("#transportCost").val())
										+ Number($("#surcharge").val()));
					},
					error : function(a, b, c) {
						alert(c);
					}
				});
			} else {
				$("#taxTot").val('0');
				$("#taxAmount").val('0');
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			}

		}
		function gtot() {
			if (($("#transportCost").val() != "")
					|| ($("#surcharge").val() != "")) {
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			} else {
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			}
		}
		function submit() {
			document.getElementById("purchaseForm").submit();
		}
		function paymentDate() {
			$("#datepicker2").val($("#datepicker").val());
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>