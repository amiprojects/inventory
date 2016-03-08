<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

.head_style {
	font-size: 17px;
}
</style>

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/Checkbox.css" type="text/css" />
<link rel="stylesheet" href="css/checkbox1.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sales").attr("id", "activeSubMenu");
		$("#sSalesEntry").attr("style", "color: #6a94ff;");
		$("#wspORmrp").val('mrpVal');
		$("#aDetailsDiv").hide();
	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Sales Entry')}">
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

	<c:if test="${requestScope['purDetIdforPC']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"salesInvoiceForPrint.jsp?id=${requestScope['purDetIdforPC']}",
							'name', 'width=600,height=400');
			myWindow.print();
		</script>
	</c:if>

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales Entry</h3>

						</div>


						<div class="col-md-12" style="height: 800px;">
							<form class="sec" action="salesEntry" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="widget-area"
											style="height: 270px; padding: 4px 5px;">
											<div style="background-color: lightgrey; padding: 3px 3px;">
												<span class="head_style">Bill To:</span>
											</div>
											<table cellspacing="2">
												<tr>
													<td>Name :<font color="red" size="4">*</font></td>
													<td><input type="text" name="custName" id="custName"
														style="align: center; text-transform: uppercase;"></input></td>
												</tr>

												<tr>
													<td>Address :<font color="red" size="4">*</font></td>
													<td><input type="text" name="addr" id="addr"
														style="length: 40px;" style="align:center; text-transform:uppercase;"></input></td>
												</tr>
												<tr>
													<td>City :<font color="red" size="4">*</font></td>
													<td><input type="text" name="city" id="city"
														style="length: 40px; text-transform: uppercase;" autocomplete="off"></input></td>
													<td><a onclick="addCitySC()" title="Add New City">
															<img height="20px" width="20px" alt="" src="img/add.png">
													</a></td>
												</tr>

												<tr>
													<td>Phone No. :<font color="red" size="4">*</font></td>
													<td><input type="number" name="phone" id="phone"
														style="length: 40px;" autocomplete="off"></input></td>


												</tr>

												<tr>
													<td>Vat No./CST No. :</td>
													<td><input type="text" name="vatcst" id="vatcst"
														style="length: 40px; text-transform: uppercase;"></input></td>
												</tr>
												<tr>
													<td><input type="checkbox" onclick="isAgentF();"
														id="agent" name="agent">&nbsp;<span id="aNameStar">Via Agent :</span></td>
													<td><input type="text" name="agentName" id="agentName"
														style="length: 30px; text-transform: uppercase;" readonly="readonly"><input
														type="hidden" name="aId" id="aId"><input
														type="hidden" name="isExistingCust" id="isExistingCust"><input
														type="hidden" name="existingCustId" value=""
														id="existingCustId"></td>
													<td><a onclick="addAgentDetails()"
														title="Add New Agent."> <img height="20px"
															width="20px" alt="" src="img/add.png">
													</a></td>
												</tr>
												<tr id="aDetailsDiv">
													<td>Agent details :</td>
													<td><textarea rows="" cols="" id="aDetail"
															class="form-control" readonly="readonly"
															style="width: 100%;"></textarea></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="col-md-6">
										<div class="widget-area"
											style="height: 270px; padding: 5px 3px;">
											<div style="background-color: lightgrey; padding: 3px 3px;"">
												<span class="head_style">Invoice Details:</span>
											</div>

											<div class="form-group" style="padding-top: 18px;">
												<label style="font-size: 15px" class="font">Sales
													challan no. :</label>
												<c:set var="fy"
													value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
												<c:set var="cno"
													value="${sessionScope['ejb'].getLastSalesChallanNumberByCompany()+1}" />
												<c:set var="csuf"
													value="${sessionScope['ejb'].getLastSalesChallanSuffixByCompany()+1}" />
												<c:set var="suf" value="INV" />
												<c:set var="bs"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany(suf)}" />
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
												<label style="font-size: 15px" class="font">Date :</label> <input
													class="form-control" type="text" name="salesDate"
													id="datepicker" readonly="readonly">

											</div>
										</div>
									</div>
								</div>
								<div class="widget-area" style="padding: 3px 3px;">
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>
									<div style="background-color: lightgrey; padding: 3px 3px;">
										<span class="head_style">Sale Product at:</span>
									</div>
									<input type="radio" class="chk" name="saleAt" value="mrp"
										id="mrp" style="display: none;" checked="checked"><label
										for="mrp"></label>MRP<input type="radio" class="chk"
										name="saleAt" value="wsp" id="wsp" style="display: none;">&nbsp;<label
										for="wsp"></label>WSP

								</div>
								<div class="widget-area">
									<b>Quantity :<font color="red" size="4">*</font></b> <input type="text" name="qty" id="qty"
										style="width: 70px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b>Product :<font color="red" size="4">*</font></b><input type="text" id="pCode" name="pCode"
										onkeyup="pcodeF();" autocomplete="off"><input
										type="hidden" id="pCodeId" name="pCodeId">
									<%-- <select name="prodCode" id="prodCode"
										onchange="getProdDetByPurchaseProdDetId();"
										required="required">
										<option value="0">Select Product code</option>
										<c:forEach
											items="${sessionScope['ejb'].getReadyPurchaseProductDetailsByQty()}"
											var="pCode">
											<option value="${pCode.id}">${pCode.productDetail.code}&nbsp;(${pCode.remaining_quantity})(<c:choose>
													<c:when test="${pCode.initialInventory.equals(false)}">
														<fmt:formatDate
															value="${pCode.purchase_Entry.purchase_date}"
															pattern="dd-MM-yy" />
													</c:when>
													<c:otherwise>Intial inventory</c:otherwise>
												</c:choose>)
											</option>
										</c:forEach>
									</select><input type="hidden" id="remQty" name="remQty"> --%>
									<!-- <input type="hidden" name="descriptiondId" id="descriptionId"> -->
									&nbsp; &nbsp; &nbsp;<b>Product with Barcode</b> <input
										type="text" id="salesbar" name="salesbar"
										onkeypress="Javascript: if (event.keyCode==13) fnsearch();"><input
										type="hidden" id="salesbarH" name="salesbarH"> &nbsp;
									&nbsp; &nbsp;
									<button onclick="resetF();" type="button">Reset</button>
									&nbsp; &nbsp; &nbsp;
									<button onclick="probar();" type="button">Go</button>

								</div>
								<div class="widget-area">
									<table class="table table-striped table-bordered"
										id="productTable">
										<thead>
											<tr>
												<th>#</th>
												<th>Designer Number</th>
												<th>Product Description</th>
												<th>Qty.</th>
												<th id="mrpWSP">MRP/Qty</th>
												<th>Total</th>
												<th><b>X</b></th>
											</tr>
										</thead>
										<tbody style="display: none;">
											<!-- <tbody> -->
											<tr>
												<td>0</td>
												<td><input type="text" id="codevalue"
													readonly="readonly"><input type="text"
													id="productId" readonly="readonly"></td>
												<td><input type="text" id="descvalue"
													readonly="readonly"></td>
												<td><input type="text" id="qtyvalue"
													readonly="readonly" value="0"></td>
												<td><input type="hidden" id="wspORmrp" name="wspORmrp">
													<input type="text" id="mrpQty" readonly="readonly"></td>
												<td><input type="text" id="eachtotalvalue"
													readonly="readonly"></td>
											</tr>
										</tbody>
									</table>
								</div>

								<div style="width: 40%; float: right;">
									<input type="hidden" id="totalvalue" name="totalvalue"
										value="0">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2" id="sub">Sub Total :</td>
												<td><input type="number" class="form-control"
													readonly="readonly" id="subtotalvalue" name="subtotalvalue"
													value="0"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount &nbsp; <select name="disType"
													id="disType" onchange="disTypeF();">

														<option value="disFlat">Flat</option>
														<option value="disPer">%</option>

												</select>
												</td>
												<td><input type="text" value="0" class="form-control"
													name="disValue" id="discount" placeholder=""
													onkeyup="discountF();" autocomplete="off"></td>
											</tr>
										</tbody>

										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="text" class="form-control"
													readonly="readonly" id="discountValue" name="discountValue"
													value="0"></td>
											</tr>

										</tbody>
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
													readonly="readonly" value="0" id="taxAmount"
													name="taxAmount"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="trans">Transport charge :</td>
												<td><input type="text" class="form-control" value="0"
													id="transcharge" name="transcharge"
													onkeyup="transchargeF();" autocomplete="off"></td>
											</tr>
										</tbody>

										<tbody>
											<tr>
												<td colspan="2" id="sur">Surcharge :</td>
												<td><input type="text" class="form-control" value="0"
													id="surcharge" name="surcharge" onkeyup="surchargeF();"
													autocomplete="off"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="number" class="form-control"
													placeholder="" readonly="readonly" id="roundvalue"
													name="roundvalue" value="0"></td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<td colspan="2" id="grand">Grand Total :</td>
												<td><input type="number" class="form-control"
													placeholder="0" readonly="readonly" id="grandtotal"
													name="grandtotal"></td>
											</tr>
										</thead>
									</table>
									<div style="float: right;">
										<input type="button" onclick="cancelF();"
											class="btn btn-danger small" value="Cancel"
											data-toggle="modal"> <input type="button"
											class="btn btn-info btn-sm" data-toggle="modal" value="Save"
											onclick="paymentDate();">
										<div id="saveSales" class="modal fade" role="dialog"
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
																					<select class="form-control" id="pstatus"
																						name="pType" onchange="pTypeFunc()">
																						<option value="-" selected="selected">---</option>
																						<c:forEach
																							items="${sessionScope['ejb'].getAllPaymentType()}"
																							var="payType">
																							<c:if
																								test="${payType.getType()!='Debit Note' && payType.getType()!='Credit Note'}">
																								<option value="${payType.getType()}">${payType.getType()}</option>
																							</c:if>
																						</c:forEach>

																					</select>
																				</div>
																			</div>
																			<div id="pDate">
																				<div class="col-md-5">Payment Date :</div>
																				<div class="col-md-7">
																					<input type="text" id="datepicker2"
																						class="form-control" readonly="readonly"
																						name="payDate">
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
																						onkeyup="spPaymentAmountFunc();"
																						autocomplete="off">
																				</div>
																			</div>
																			<div id="pDueAmount">
																				<div class="col-md-5">Due Amount :</div>
																				<div class="col-md-7">
																					<input type="text" class="form-control" value="0"
																						readonly="readonly" id="spDueAmount"
																						name="spDueAmount">
																				</div>
																			</div>
																			<div id="AMi2">
																				<div>
																					<div class="col-md-5">Current Debit Note :</div>
																					<div class="col-md-7">
																						<input type="text" id="totalDebit"
																							name="totalDebit" class="form-control"
																							readonly="readonly" value="0">
																					</div>
																				</div>
																				<div>
																					<div class="col-md-5">
																						<span id="dORc">Final Debit Note :</span>
																					</div>
																					<div class="col-md-7">
																						<input type="text" class="form-control"
																							id="finalDC" name="finalDC" readonly="readonly"
																							value="0">
																					</div>
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
																	<br> <input type="hidden" name="isAgent"
																		id="isAgent">
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
										<!-- <button type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#" id="save">Save</button> -->
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="addCitySC" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<div class="row">
						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Country/State/City</h3>

						</div>

						<div class="widget-area" style="width: 33%;">
							<form action="addJsonCountry" class="sec">
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
															type="button" value="Add" disabled="disabled"
															onclick="submitformcountry();">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</form>
							<%-- <div class="widget-area"
								style="overflow-y: scroll; height: 350px;">
								<ul>
									<c:forEach items="${sessionScope['ejb'].getAllCountry()}"
										var="contry">
										<li>${contry.countryName}</li>
									</c:forEach>
								</ul>
							</div> --%>
						</div>

						<div class="widget-area" style="width: 34%;">
							<form action="#" class="sec">
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
														<input id="country" type="text" name="nameqaz"
															class="form-control"> <input id="countryId"
															type="hidden" name="id">
													</div>
													<div class="col-md-2">
														<input id="countryForStatebtn" type="button"
															onclick="methodState()" value="create"
															disabled="disabled" class="btn green pull-right">
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</form>
							<%-- 	<br> <br> <span><b>Select Country:</b></span><select
								class="form-control" name="countryid" style="width: 150px;"
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
							</div> --%>
						</div>


						<div class="widget-area" style="width: 33%;">
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
														<input type="text" class="form-control" name="namezxc"
															id="cityName" onkeyup="cityNameKeyUp();">
													</div>
												</div>
												<br> <b>The City Belongs to :</b>
												<div class="row">
													<div class="col-md-2">Country:</div>
													<div class="col-md-10">
														<input id="country1" type="text" name="country1"
															class="form-control">
													</div>

													<div class="col-md-2">State:</div>

													<div class="col-md-8">
														<input id="state" type="text" name="name"
															class="form-control" disabled="disabled"> <input
															id="stateId" type="hidden" name="id">
													</div>

													<div class="col-md-2">
														<input id="cityAddbtn" type="button" value="create"
															onclick="methodCityA()" disabled="disabled"
															class="btn green pull-right">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer"></div>
									</div>
								</div>
							</div>
							<%-- <br> <br> <span><b>Select Country:</b></span><select
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
							</div> --%>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>

	<div id="addA" class="modal fade" role="dialog" style="top: 25px;">

		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<center>
						<h3 class="modal-title">Vendor/Agent</h3>
					</center>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="addAgen" id="addAgena"
						method="post">
						<ul class="nav nav-tabs">
							<li class="active" id="detl2"><a data-toggle="tab"
								href="#detail2">Details</a></li>
							<li id="addr2"><a data-toggle="tab" href="#address2">Address</a></li>
							<li id="vAcc2"><a data-toggle="tab" href="#vendorAccount2">Vendor
									Account Info</a></li>
							<li id="bAcc2"><a data-toggle="tab" href="#bankAccount2">Bank
									Account info</a></li>
							<!-- <li id="prts"><a data-toggle="tab" href="#part">Parts</a></li> -->
						</ul>
						<div class="tab-content">
							<div id="bankAccount2" class="tab-pane fade">
								<div class="widget-area">
									<h5 align="center">(All the below fields are optional)</h5>
									<br>
									<div class="col-md-3">
										<b>Bank Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankName2"
											id="idbankName2">
									</div>
									<br>
									<div class="col-md-3">
										<b>A/C no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankAccNo2"
											id="acno2">
									</div>
									<br>
									<div class="col-md-3">
										<b>Branch:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankBranch2"
											id="idbankBranch2">
									</div>
									<br>
									<div class="col-md-3">
										<b>City:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" id="bankCity6"
											autocomplete="off"> <input type="hidden" value=""
											name="bankCity6" id="bankCityId26">
									</div>
									<br>
									<div class="col-md-3">
										<b>IFSC no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankIFSC2"
											id="idbankIFSC2">
									</div>
									<br>
									<div class="col-md-3">
										<b>MICR no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankMICR2"
											id="idbankMICR2">
									</div>
									<br>
									<div class="col-md-3">
										<b>RTGS code:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankRTGS2"
											id="idbankRTGS2">
									</div>
									<br>
									<div class="col-md-3">
										<b>Check lebel:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankCheckLebel2"
											id="idbankCheckLebel2">
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="bankButtonPrev2();"> <input
										class="btn green pull-right" type="button" value="Finish"
										onclick="submitform2();">
								</div>

							</div>
							<div id="vendorAccount2" class="tab-pane fade">
								<div class="widget-area">
									<div class="row">
										<h5 align="center">(All the below fields are optional)</h5>
										<br>
										<div class="col-md-5">
											<b>VAT no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorVATno2"
												id="idvendorVATno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>VAT registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorVATregDate2" id="datepickerA2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorCSTno2"
												id="idvendorCSTno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorCSTregDate2" id="datepickerB2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">

											<b>PAN no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorPANno2"
												id="idvendorPANno2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegNo2" id="idvendorExciseRegNo2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegDate2" id="datepickerC2"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegNo2" id="idvendorServiceTaxRegNo2">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegDate2" id="datepickerD2"
												readonly="readonly">
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<b>Tax group id:</b>
										</div>
										<div class="col-md-7">
											<select class="form-control" name="taxTypeGroupId2"
												id="taxgroup2">
												<option value="0">select a tax group</option>
												<c:forEach
													items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
													var="taxTypeGroup">
													<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input type="button" value="Next" class="btn green pull-right"
										onclick="vendorButtonNext2();"> <input type="button"
										value="Previous" class="btn green pull-left"
										onclick="vendorButtonPrev2();">
								</div>
							</div>

							<div id="detail2" class="tab-pane fade active in">
								<div class="widget-area">

									<div class="col-md-3">
										<b>Name:<font color="red" size="4">*</font></b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorName2"
											id="idName2" required="required">
									</div>
									<br>
									<div class="col-md-3">
										<b>Company Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control"
											name="vendorCompanyName2" id="idvendorCompanyName2">
									</div>

									<div class="col-md-3">
										<b>Ph No1:<font color="red" size="4">*</font></b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh12"
											id="iphone2" required="required">
									</div>

									<div class="col-md-3">
										<b>Ph No2:(optional)</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh22"
											id="idvendorPh22" required="required">
									</div>

									<div class="col-md-3">
										<b>Email :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorMail2"
											style="text-transform: none;" id="idvendorMail2"
											required="required">
									</div>

									<div class="col-md-3">
										<b>Alias name :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorAlias2"
											id="idvendorAlias2" required="required">
									</div>

									<div class="col-md-3">
										<b>Vendor type :</b>
									</div>
									<div class="col-md-9">

										<select class="form-control" name="vendorType2"
											disabled="disabled" id="idvendorType2">
											<c:forEach items="${sessionScope['ejb'].getAllVendorType()}"
												var="vType">

												<c:choose>
													<c:when test="${vType.type.equals('Sales Agent')}">
														<option value="${vType.id}" selected="selected">${vType.type}</option>

													</c:when>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<div class="col-md-12">

									<input class="btn green pull-right" type="button" value="Next"
										onclick="detailButtonNext2();">
								</div>
							</div>
							<div id="address2" class="tab-pane fade ">
								<div class="widget-area">
									<div class="row">
										<div class="col-md-3">
											<b>Adress :</b>
										</div>
										<div class="col-md-9">
											<textarea rows="" cols="" class="form-control"
												name="vendorAddress2" id="idAdd2" required="required"></textarea>
											<div class="row"></div>
										</div>
										<div class="col-md-3">
											<b>City :<font color="red" size="4">*</font></b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control cityAuto"
												name="vendorCity2" required="required" id="vendorCity2">
											<input type="hidden" name="vendorCityId2" id="vendorCityId2">
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<b>Pin code :</b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="vendorPin2"
												id="idvendorPin2" required="required">
										</div>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="addressButtonPrev2();"> <input
										class="btn green pull-right" type="button" value="Next"
										onclick="addressButtonNext2();">
								</div>
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<div id="purchaseDetails" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModal();">&times;</button>
					<h4 class="modal-title">Purchase Details</h4>
				</div>
				<div class="modal-body">
				
				<div class="col-md-5">Product Image:</div>
								<div class="col-md-7" id="imgaeDIV">
									<img  id="productImage" height="60" width="50" style="" alt="">
								</div>
					<table id="stream_table" width="100%">
						<thead>
							<tr>
								<th>Designer Number:</th>
								
							
								<td colspan="2"><input type="text" readonly="readonly"
									id="pCodeModal" class="form-control"></td>
							</tr>
							<tr>
								<th>Description :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="pDescModal" class="form-control"></td>
							</tr>
						</thead>
					</table>
					<table id="purchaseDetailsTable" class="table">
						<thead>
							<tr>
								<th>Purchase Date</th>
								<th>Vendor name</th>
								<th>Raw/Ready</th>
								<th>Lot No.</th>
								<th>MRP</th>
								<th>WSP</th>
								<th>Remaining Qty.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
				</div>
			</div>

		</div>
	</div>
	<div id="cancelOrNot" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- <h4 class="modal-title">Modal Header</h4> -->
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>Do you want to cancel?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-success medium" id="yesP">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noP">No</button>
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
	
	<script>
		$(function() {
			var d = new Date();
			var m = d.getMonth();
			if (m > 3) {
				var n = d.getFullYear();
			} else {
				var n = d.getFullYear() - 1;
			}
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				minDate : new Date(n, 3, 1),
				maxDate : 0
			});
			$("#datepicker").datepicker('setDate', new Date());
		});
	</script>
	<script>
		function paymentDate() {
			if ($("#custName").val() == "") {
				alert("please enter customer name");
			} else if ($("#addr").val() == "") {
				alert("please enter customer address");
			} else if ($("#city").val() == "") {
				alert("please enter customer city");
			} else if ($("#phone").val() == "") {
				alert("please enter customer phone no.");
			} else if ($("#isAgent").val() == 'yes'
					&& $("#agentName").val() == "") {
				alert("please insert agent name");
			} else {
				//$("#datepicker2").val($("#datepicker").val());
				var d = $("#datepicker").datepicker('getDate');
				var n = d.getFullYear();
				var m = d.getMonth();
				var dt = d.getDate();
				$("#datepicker2").datepicker({
					dateFormat : "dd-mm-yy",
					minDate : new Date(n, m, dt),
					maxDate : 0
				});
				$("#datepicker2").datepicker('setDate', new Date());
				$("#saveSales").modal("show");
			}
		}
	</script>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	
	<script src="js/numericInput.min.js"></script>

<script>
		$(function() {

			$("#discount").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		
		$(function() {

			$("#qty").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		
		$(function() {

			$("#transcharge").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
		
		$(function() {

			$("#surcharge").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});

		});
	</script>

	<script>
		$("input:radio[name=saleAt]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "mrp") {
				$("#mrpWSP").html("MRP/Qty");
				$("#wspORmrp").val('mrpVal');
			} else {
				$("#mrpWSP").html("WSP/Qty");
				$("#wspORmrp").val('wspVal');
			}
		});
	</script>






	<script>
		ind = 0;
		var k = 0;
		function removeProduct(a) {
			$("#trRemove" + a).remove();

			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#subtotalvalue").val(sum.toFixed(2));

			/* $("#subtotalvalue").val(
					Math.round((Number($("#subtotalvalue").val()) + Number($(
							"#eachtotalvalue").val())) * 100) / 100); */
			discountF();
			$("#taxAmount").val(
					Math.round((Number($("#subtotalvalue").val())
							* Number($("#taxTot").val()) * 100) / 100)
							/ Number(100));
			$("#totalvalue").val(
					Math.round((Number($("#subtotalvalue").val())
							- Number($("#discountValue").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transcharge").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			if (tot > round) {
				$("#roundvalue").val(Math.round((round + 1 - tot) * 100) / 100);
			} else {
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			}

			$("#grandtotal").val(
					Number($("#totalvalue").val())
							+ Number($("#roundvalue").val()));
		}

		function probar() {
			if ($("#qty").val() == 0 || $("#qty").val() == "") {
				alert("Please enter a valid quantity");
			} else if ($("#salesbar").val() == 0 || $("#salesbar").val() == "") {
				alert("Please select a product or enter barcode.");
			} else {
				k = k + 1;
				var countryName = $("#salesbar").val();
				var countryArray = countryName.split('/');

				for (var i = 0; i < countryArray.length; i++) {
					countryArray[i];
				}
				var id = countryArray[0];
				var qty = Number($("#qty").val());

				$
						.ajax({
							type : "post",
							url : "getProdDetByPurchaseProdDetailsId",
							data : {
								id : id
							},
							dataType : "json",
							success : function(data) {
								$("#codevalue").val(data.productCode);
								$("#productId").val(data.productId);
								$("#descvalue").val(data.productDesc);
								$("#qtyvalue").val(Number(qty));
								if ($("#wspORmrp").val() == 'mrpVal') {
									$("#mrpQty").val(data.mrp);
									$("#eachtotalvalue")
											.val(
													Math
															.round((Number(data.mrp
																	* $(
																			"#qtyvalue")
																			.val())) * 100) / 100);
								} else {
									$("#mrpQty").val(data.wsp);
									$("#eachtotalvalue")
											.val(
													Math
															.round((Number(data.wsp
																	* $(
																			"#qtyvalue")
																			.val())) * 100) / 100);
								}
								$("#prodCode").val(data.id);
								$("#subtotalvalue")
										.val(
												Math
														.round((Number($(
																"#subtotalvalue")
																.val()) + Number($(
																"#eachtotalvalue")
																.val())) * 100) / 100);
								discountF();
								$("#taxAmount")
										.val(
												Math
														.round((Number($(
																"#subtotalvalue")
																.val())
																* Number($(
																		"#taxTot")
																		.val()) * 100) / 100)
														/ Number(100));
								$("#totalvalue")
										.val(
												Math
														.round((Number($(
																"#subtotalvalue")
																.val())
																- Number($(
																		"#discountValue")
																		.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transcharge")
																		.val()) + Number($(
																"#surcharge")
																.val())) * 100) / 100);
								var tot = $("#totalvalue").val();
								var round = Math.round(tot);
								if (tot > round) {
									$("#roundvalue")
											.val(
													Math
															.round((round + 1 - tot) * 100) / 100);
								} else {
									$("#roundvalue")
											.val(
													Math
															.round((round - tot) * 100) / 100);
								}

								$("#grandtotal")
										.val(
												Number($("#totalvalue").val())
														+ Number($(
																"#roundvalue")
																.val()));

								if (document.getElementById("trRemove"
										+ $("#salesbarH").val()) === null) {
									$("#productTable")
											.append(
													'<tbody><tr id="trRemove'
															+ $("#salesbarH")
																	.val()
															+ '">'
															+ '<td>'
															+ k
															+ '</td>'
															+ '<td><input readonly="readonly" type="text" name="codevalue" value=\''
													+ data.productCode
													+ '\'><input readonly="readonly" type="hidden" name="productId" value=\''
													+ data.productId
													+ '\'><input readonly="readonly" type="hidden" name="purchaseProductDetId" value=\''
															+ $("#salesbarH")
																	.val()
															+ '\'></td>'
															+ '<td><input readonly="readonly" type="text" name="descvalue" value=\''
													+ data.productDesc
													+ '\'></td>'
															+ '<td><input readonly="readonly" type="text" name="qtyvalue" value=\''
															+ $("#qtyvalue")
																	.val()
															+ '\'></td>'
															+ '<td><input readonly="readonly" type="text" name="mrpQty" value=\''
															+ $("#mrpQty")
																	.val()
															+ '\'></td>'
															+ '<td><input readonly="readonly" type="text" class="eachtotalvalue" name="eachtotalvalue" value=\''
															+ $(
																	"#eachtotalvalue")
																	.val()
															+ '\'></td>'
															+ '<td>'
															+ '<a href="#" onclick="removeProduct('
															+ $("#salesbarH")
																	.val()
															+ ');"><img src="img/cross.png" height="16px" width="16px"></a>'
															+ '</td>'
															+ '</tr></tbody>');
									//ind++;
								} else {
									k = k - 1;
									var Q = Number(Number($("#qtyvalue").val())
											+ Number($(
													"#trRemove"
															+ $("#salesbarH")
																	.val()
															+ " :nth-child(4) input[type=text]")
													.val()));
									$(
											"#trRemove" + $("#salesbarH").val()
													+ " :nth-child(4)")
											.html(
													'<input readonly="readonly" type="text" name="qtyvalue" value=\''
											+ Q
											+ '\'>');
									$(
											"#trRemove" + $("#salesbarH").val()
													+ " :nth-child(6)").html(
											'<input readonly="readonly" type="text" name="eachtotalvalue" value=\''
													+ Number($(
															"#eachtotalvalue")
															.val()
															* Q) + '\'>');
								}
							}

						});
				$("#pCode").val("");
				$("#salesbar").val("");
				$("#salesbar").prop("readonly", false);
				$("#mrp").prop("disabled", true);
				$("#wsp").prop("disabled", true);
				$("#qty").prop("readonly", false);
				$("#qty").val("");
			}
		}
		function disTypeF() {
			$("#discount").val("");
			$("#discountValue").val(0);
			$("#totalvalue").val(
					Math.round((Number($("#subtotalvalue").val())
							- Number($("#discountValue").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transcharge").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			if (tot > round) {
				$("#roundvalue").val(Math.round((round + 1 - tot) * 100) / 100);
			} else {
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			}

			$("#grandtotal").val(
					Number($("#totalvalue").val())
							+ Number($("#roundvalue").val()));
		}
		function discountF() {
			if ($("#disType").val() == 'disPer') {
				$("#discountValue")
						.val(
								Math
										.round((Number($("#subtotalvalue")
												.val())
												* Number($("#discount").val()) / 100) * 100) / 100);
			} else {
				if (Number($("#discount").val()) > Number($("#subtotalvalue")
						.val())) {
					alert("Discount can not be greater than sub total value");
					$("#discount").val("");
				} else {
					$("#discountValue")
							.val(
									Math
											.round(Number($("#discount").val()) * 100) / 100);
				}
			}
			$("#totalvalue").val(
					Math.round((Number($("#subtotalvalue").val())
							- Number($("#discountValue").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transcharge").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			if (tot > round) {
				$("#roundvalue").val(Math.round((round + 1 - tot) * 100) / 100);
			} else {
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			}

			$("#grandtotal").val(
					Number($("#totalvalue").val())
							+ Number($("#roundvalue").val()));
		}
		function transchargeF() {
			$("#totalvalue").val(
					Math.round((Number($("#subtotalvalue").val())
							- Number($("#discountValue").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transcharge").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			if (tot > round) {
				$("#roundvalue").val(Math.round((round + 1 - tot) * 100) / 100);
			} else {
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			}

			$("#grandtotal").val(
					Number($("#totalvalue").val())
							+ Number($("#roundvalue").val()));
		}
		function surchargeF() {
			$("#totalvalue").val(
					Math.round((Number($("#subtotalvalue").val())
							- Number($("#discountValue").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transcharge").val()) + Number($(
							"#surcharge").val())) * 100) / 100);
			var tot = $("#totalvalue").val();
			var round = Math.round(tot);
			if (tot > round) {
				$("#roundvalue").val(Math.round((round + 1 - tot) * 100) / 100);
			} else {
				$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
			}

			$("#grandtotal").val(
					Number($("#totalvalue").val())
							+ Number($("#roundvalue").val()));
		}
		function selectedTaxGroup() {
			if ($("#taxGroup").val() != 0) {
				$
						.ajax({
							url : "getTaxGroupById",
							data : {
								id : $("#taxGroup").val()
							},
							dataType : "json",
							success : function(data) {
								$("#taxTot").val(data.taxtot);
								$("#taxAmount")
										.val(
												Math
														.round((Number($(
																"#subtotalvalue")
																.val())
																* Number($(
																		"#taxTot")
																		.val()) * 100) / 100)
														/ Number(100));
								$("#totalvalue")
										.val(
												Math
														.round((Number($(
																"#subtotalvalue")
																.val())
																- Number($(
																		"#discountValue")
																		.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transcharge")
																		.val()) + Number($(
																"#surcharge")
																.val())) * 100) / 100);
								var tot = $("#totalvalue").val();
								var round = Math.round(tot);
								if (tot > round) {
									$("#roundvalue")
											.val(
													Math
															.round((round + 1 - tot) * 100) / 100);
								} else {
									$("#roundvalue")
											.val(
													Math
															.round((round - tot) * 100) / 100);
								}

								$("#grandtotal")
										.val(
												Number($("#totalvalue").val())
														+ Number($(
																"#roundvalue")
																.val()));
							},
							error : function(a, b, c) {
								alert(c);
							}
						});
			} else {
				$("#taxTot").val('0');
				$("#taxAmount").val('0');
				$("#totalvalue").val(
						Math.round((Number($("#subtotalvalue").val())
								- Number($("#discountValue").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transcharge").val()) + Number($(
								"#surcharge").val())) * 100) / 100);
				var tot = $("#totalvalue").val();
				var round = Math.round(tot);
				if (tot > round) {
					$("#roundvalue").val(
							Math.round((round + 1 - tot) * 100) / 100);
				} else {
					$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
				}

				$("#grandtotal").val(
						Number($("#totalvalue").val())
								+ Number($("#roundvalue").val()));
			}

		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#payDetail").hide();
			$("#description").hide();
			$("#isAgent").val('no');
			$("#isExistingCust").val(0);
			$("#AMi2").hide();

		});
		function closePayment() {
			$("#payDetail").hide();
			$("#description").hide();
			$("#pstatus").val('-');
			$("#pType").val('-');
			$("#AMi2").hide();
		}
		function pStatusDiv() {
			var val = $('[name="pstatus"]').val();
			$("#payDetail").show();
			//alert(val);
			if (val == '-') {
				alert('Please select Payment status...');
				$("#payDetail").hide();
				$("#description").hide();
				$("#AMi2").hide();
				$("#pType").val("-");
			} else if (val == 'Not Paid') {
				$("#pPayAmount").hide();
				$("#pAmount").hide();
				$("#pDate").hide();
				$("#pTypeDiv").hide();
				$("#pDueAmount").show();
				$("#description").show();
				$("#spAmount").val(Number($("#grandtotal").val()));
				$("#spPaymentAmount").val(Number(0));
				$("#spDueAmount").val(
						Number($("#spAmount").val())
								- Number($("#spPaymentAmount").val()));

				$("#AMi2").show();
				$("#finalDC").val(
						Math.round((Number($("#spDueAmount").val()) + Number($(
								"#totalDebit").val())) * 100) / 100);
			} else if (val == 'Full Paid') {
				$("#pPayAmount").hide();
				$("#pDueAmount").hide();
				$("#pAmount").show();
				$("#pDate").show();
				$("#pTypeDiv").show();
				$("#description").hide();
				$("#AMi2").hide();
				$("#spAmount").val(Number($("#grandtotal").val()));
				$("#spPaymentAmount").val(Number($("#grandtotal").val()));
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
				$("#spAmount").val(Number($("#grandtotal").val()));
				$("#spPaymentAmount").val(Number($("#grandtotal").val()));
				$("#spDueAmount").val(
						Number($("#spAmount").val())
								- Number($("#spPaymentAmount").val()));

				$("#AMi2").show();
				$("#finalDC").val(
						Math.round((Number($("#spDueAmount").val()) + Number($(
								"#totalDebit").val())) * 100) / 100);
			}
		}
		/* function spPaymentAmountFunc() {
			$("#spDueAmount").val(
					Number($("#spAmount").val())
							- Number($("#spPaymentAmount").val()));
		} */

		function spPaymentAmountFunc() {
			if (Number($("#spPaymentAmount").val()) > Number($("#spAmount")
					.val())) {
				alert("Payment amount can not be greater than full amount...");
				$("#spPaymentAmount").val(Number($("#gt").val()));
				$("#spDueAmount").val(
						Math.round((Number($("#spAmount").val()) - Number($(
								"#spPaymentAmount").val())) * 100) / 100);
				$("#finalDC").val(
						Math.round((Number($("#spDueAmount").val()) + Number($(
								"#totalDebit").val())) * 100) / 100);
			} else {
				$("#spDueAmount").val(
						Math.round((Number($("#spAmount").val()) - Number($(
								"#spPaymentAmount").val())) * 100) / 100);
				$("#finalDC").val(
						Math.round((Number($("#spDueAmount").val()) + Number($(
								"#totalDebit").val())) * 100) / 100);
			}
		}

		function pTypeFunc() {
			$("#description").show();
			var val = $('[name="pType"]').val();
			if (val == '-') {
				alert('Please select Payment Type...');
				$("#description").hide();
			}
		}
		function submit() {
			document.getElementById("purchaseForm").submit();
		}
		$(function() {
			$("#pCode")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												type : "post",
												url : "getProductsForSaleByCode",
												data : {
													codeParts : req.term
												},
												dataType : "json",
												success : function(data) {				

													resp($
															.map(
																	data,
																	function(
																			item) {
																		return ({
																			value : item.code,
																			id : item.id,
																			description : item.description,
																			image : item.aimage
																		});
																	}));
												},

												error : function(a, b, c) {
													alert(a + b + c);
												}

											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#pCodeId").val("");
										//getProductDetailsByProductCode(0);
									} else {
										$("#pCodeId").val(ui.item.id);
										//getProductDetailsByProductCode(ui.item.id);
									}
								},
								select : function(event, ui) {
									if (ui.item != null) {
										$("#pCodeId").val(ui.item.id);
										//getProductDetailsByProductCode(ui.item.id) ;
										$("#purchaseDetails").modal("show");
										$("#pCodeModal").val(ui.item.value);
										$("#productImage").attr('src',
												'data:image/jpeg;base64,' + ui.item.image);
										$("#pDescModal").val(
												ui.item.description);
										
										$
												.ajax({
													type : "post",
													url : "getSaleblePurchaseProductDetailsByProductCodeAndQuantity",
													dataType : "json",
													data : {
														code : ui.item.value,
														date : $("#datepicker")
																.val(),
														qty : $("#qty").val()
													},
													success : function(data2) {
														$(
																"#purchaseDetailsTable tbody")
																.empty();
														$
																.map(
																		data2,
																		function(
																				item2) {
																			if (item2.isRaw == 'true') {
																				var rawORready = 'Raw';
																			} else {
																				var rawORready = 'Ready';
																			}

																			if (!(document
																					.getElementById("trRemove"
																							+ item2.id) === null)) {
																				rv = $(
																						"#trRemove"
																								+ item2.id
																								+ " :nth-child(4) input[type=text]")
																						.val();
																			} else {
																				rv = 0;
																			}
																			var remQ = item2.remaining_quantity
																					- Number(rv);

																			if (item2.remaining_quantity >= (Number($(
																					"#qty")
																					.val()) + Number(rv))) {
																				if (item2.purchaseDate != 'Initial Inventory') {
																					$(
																							"#purchaseDetailsTable")
																							.append(
																									"<tbody id='viewAttr"+item2.id+"' title='"+item2.attrName1+" : "+item2.attrValue1+" , "+item2.attrName2+" : "+item2.attrValue2+" , "+item2.attrName3+" : "+item2.attrValue3+" , "+item2.attrName4+" : "+item2.attrValue4+" , "+item2.attrName5+" : "+item2.attrValue5+" , "+item2.attrName6+" : "+item2.attrValue6+"'>"
																											+ "<tr>"
																											+ "<td>"
																											+ formatDate(item2.purchaseDate)
																											+ "</td>"
																											+ "<td>"
																											+ item2.purchaseVendorName
																											+ "</td>"
																											+ "<td>"
																											+ rawORready
																											+ "</td>"
																											+ "<td>"
																											+ item2.lotNumber
																											+ "</td>"
																											+ "<td>"
																											+ item2.mrp
																											+ "</td>"
																											+ "<td>"
																											+ item2.wsp
																											+ "</td>"
																											+ "<td>"
																											+ remQ
																											+ "</td>"
																											+ "<td>"
																											+ '<input type="button" onclick="chooseF('
																											+ item2.id
																											+ ');" value="Choose">'
																											+ "</td>"
																											+ "</tr>"
																											+ "</tbody>");
																				} else {
																					$(
																							"#purchaseDetailsTable")
																							.append(
																									"<tbody id='viewAttr"+item2.id+"' title='"+item2.attrName1+" : "+item2.attrValue1+" , "+item2.attrName2+" : "+item2.attrValue2+" , "+item2.attrName3+" : "+item2.attrValue3+" , "+item2.attrName4+" : "+item2.attrValue4+" , "+item2.attrName5+" : "+item2.attrValue5+" , "+item2.attrName6+" : "+item2.attrValue6+"'>"
																											+ "<tr>"
																											+ "<td>"
																											+ item2.purchaseDate
																											+ "</td>"
																											+ "<td>"
																											+ item2.purchaseVendorName
																											+ "</td>"
																											+ "<td>"
																											+ rawORready
																											+ "</td>"
																											+ "<td>"
																											+ item2.lotNumber
																											+ "</td>"
																											+ "<td>"
																											+ item2.mrp
																											+ "</td>"
																											+ "<td>"
																											+ item2.wsp
																											+ "</td>"
																											+ "<td>"
																											+ remQ
																											+ "</td>"
																											+ "<td>"
																											+ '<input type="button" onclick="chooseF('
																											+ item2.id
																											+ ');" value="Choose">'
																											+ "</td>"
																											+ "</tr>"
																											+ "</tbody>");
																				}
																			}
																			$(
																					"#viewAttr"
																							+ item2.id)
																					.tooltip(
																							{
																								track : true
																							});

																		});

													}
												});

									} else {
										$(this).val("");
										$("#pCodeId").val("");
										//getProductDetailsByProductCode(0);						
									}

								}
							});
		});

		function formatDate(d) {
			var dateparts = d.split(" ");
			return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
		}
		function closeModal() {
			$("#pCode").val("");
			$("#pCodeId").val("");
		}
		function chooseF(purchaseProdDetIdForBarCode) {
			//alert(purchaseProdDetIdForBarCode);
			$("#salesbar").val(purchaseProdDetIdForBarCode);
			$("#salesbarH").val(purchaseProdDetIdForBarCode);
			$("#salesbar").prop("readonly", true);
			$("#purchaseDetails").modal("hide");
			$("#qty").prop("readonly", true);
		}
		function pcodeF() {
			if ($("#qty").val() == 0 || $("#qty").val() == "") {
				alert("Please select a valid quantity first");
				$("#pCode").val("");
				$("#qty").val("");
			}
		}

		/* function salesbarF() {
			if ($("#qty").val() == 0 || $("#qty").val() == "") {
				alert("Please select a valid quantity first");
				$("#salesbar").val("");
				$("#qty").val("");
			}
		} */
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesP").click(function() {
			window.location = 'salesSalesEntry.jsp';
		});
		$("#noP").click(function() {
			$("#cancelOrNot").modal("hide");
		});
		function isAgentF() {
			if ($('#agent').is(":checked")) {
				$("#isAgent").val('yes');
				$("#agentName").prop("readonly", false);
				
				$("#aNameStar").html("Via Agent :<font color='red' size='4'>*</font>");
			} else {
				$("#isAgent").val('no');
				$("#agentName").prop("readonly", true);
				$("#aDetailsDiv").hide();
				$("#agentName").val("");
				
				$("#aNameStar").html("Via Agent :");
			}
		}
		$(function() {
			$("#agentName")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												type : "post",
												url : "getVendorsByVendorTypeSalesAgentAndName",
												data : {
													name : req.term
												},
												dataType : "json",
												success : function(data) {
													resp($.map(data, function(
															item) {
														return ({
															value : item.name,
															id : item.id
														});
													}));
												},

												error : function(a, b, c) {
													alert(a + b + c);
												}

											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#aName").val("");
										$("#aId").val("");
									} else {
										$("#aId").val(ui.item.id);
									}
								},
								select : function(event, ui) {
									if (ui.item != null) {
										$("#aId").val(ui.item.id);
										$.ajax({
											url : 'getSalesAgentDetailsById',
											type : 'post',
											dataType : "json",
											data : {
												id : ui.item.id
											},
											success : function(data) {
												$("#aDetailsDiv").show();
												$("#aDetail").val(
														"Address :\n\t"
																+ data.address
																+ "\nPh1 : "
																+ data.ph1
																+ "\nPh2 : "
																+ data.ph2);
											},
											error : function(a, b, c) {
												alert(b + ": " + c);
											}
										});
									} else {
										$(this).val("");
										$("#aId").val("");
										$("#aName").val("");
									}

								}
							});
		});
		$(function() {
			$("#city").autocomplete({
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
					if (ui.item == null) {
						$(this).val("");
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
					}
				}
			});
		});
		function resetF() {
			$("#qty").val("");
			$("#qty").prop("readonly", false);
			$("#pCode").val("");
			$("#salesbar").val("");
			$("#salesbar").prop("readonly", false);
		}
		function fnsearch() {
			if ($("#salesbar").val() == 0 || $("#salesbar").val() == "") {
				alert("Please select a product or enter barcode.");
			} else {

				var countryName = $("#salesbar").val();
				var countryArray = countryName.split('/');
				$("#salesbarH").val($("#salesbar").val());

				for (var i = 0; i < countryArray.length; i++) {
					countryArray[i];
				}
				var id = countryArray[0];
				//var qty = Number($("#qty").val());

				$
						.ajax({
							type : "post",
							url : "getPurchaseProductDetailsByIdForSale",
							data : {
								id : id,
								date : $("#datepicker").val()
							},
							dataType : "json",
							success : function(data) {
								if (data != null) {
									k = k + 1;
									$("#codevalue").val(data.productCode);
									$("#productId").val(data.productId);
									$("#descvalue").val(data.productDesc);
									$("#qtyvalue").val(Number(1));
									if ($("#wspORmrp").val() == 'mrpVal') {
										$("#mrpQty").val(data.mrp);
										$("#eachtotalvalue")
												.val(
														Math
																.round((Number(data.mrp
																		* $(
																				"#qtyvalue")
																				.val())) * 100) / 100);
									} else {
										$("#mrpQty").val(data.wsp);
										$("#eachtotalvalue")
												.val(
														Math
																.round((Number(data.wsp
																		* $(
																				"#qtyvalue")
																				.val())) * 100) / 100);
									}
									$("#prodCode").val(data.id);
									$("#subtotalvalue")
											.val(
													Math.round((Number($(
															"#subtotalvalue")
															.val()) + Number($(
															"#eachtotalvalue")
															.val())) * 100) / 100);
									discountF();
									$("#taxAmount")
											.val(
													Math
															.round((Number($(
																	"#subtotalvalue")
																	.val())
																	* Number($(
																			"#taxTot")
																			.val()) * 100) / 100)
															/ Number(100));
									$("#totalvalue")
											.val(
													Math
															.round((Number($(
																	"#subtotalvalue")
																	.val())
																	- Number($(
																			"#discountValue")
																			.val())
																	+ Number($(
																			"#taxAmount")
																			.val())
																	+ Number($(
																			"#transcharge")
																			.val()) + Number($(
																	"#surcharge")
																	.val())) * 100) / 100);
									var tot = $("#totalvalue").val();
									var round = Math.round(tot);
									if (tot > round) {
										$("#roundvalue")
												.val(
														Math
																.round((round + 1 - tot) * 100) / 100);
									} else {
										$("#roundvalue")
												.val(
														Math
																.round((round - tot) * 100) / 100);
									}

									$("#grandtotal").val(
											Number($("#totalvalue").val())
													+ Number($("#roundvalue")
															.val()));

									if (document.getElementById("trRemove"
											+ $("#salesbarH").val()) === null) {
										$("#productTable")
												.append(
														'<tbody><tr id="trRemove'
																+ $(
																		"#salesbarH")
																		.val()
																+ '">'
																+ '<td>'
																+ k
																+ '</td>'
																+ '<td><input readonly="readonly" type="text" name="codevalue" value=\''
												+ data.productCode
												+ '\'><input readonly="readonly" type="hidden" name="productId" value=\''
												+ data.productId
												+ '\'><input readonly="readonly" type="hidden" name="purchaseProductDetId" value=\''
																+ $(
																		"#salesbarH")
																		.val()
																+ '\'></td>'
																+ '<td><input readonly="readonly" type="text" name="descvalue" value=\''
												+ data.productDesc
												+ '\'></td>'
																+ '<td><input readonly="readonly" type="text" id="qtyVal'
																+ '" name="qtyvalue" value=\''
																+ $("#qtyvalue")
																		.val()
																+ '\'></td>'
																+ '<td><input readonly="readonly" type="text" name="mrpQty" value=\''
																+ $("#mrpQty")
																		.val()
																+ '\'></td>'
																+ '<td><input readonly="readonly" type="text" class="eachtotalvalue" name="eachtotalvalue" value=\''
																+ $(
																		"#eachtotalvalue")
																		.val()
																+ '\'></td>'
																+ '<td>'
																+ '<a href="#" onclick="removeProduct('
																+ $(
																		"#salesbarH")
																		.val()
																+ ');"><img src="img/cross.png" height="16px" width="16px"></a>'
																+ '</td>'
																+ '</tr></tbody>');
										//ind++;
									} else {
										k = k - 1;
										var Q = Number(Number($("#qtyvalue")
												.val())
												+ Number($(
														"#trRemove"
																+ $(
																		"#salesbarH")
																		.val()
																+ " :nth-child(4) input[type=text]")
														.val()));
										$(
												"#trRemove"
														+ $("#salesbarH").val()
														+ " :nth-child(4)")
												.html(
														'<input readonly="readonly" type="text" name="qtyvalue" value=\''
												+ Q
												+ '\'>');
										$(
												"#trRemove"
														+ $("#salesbarH").val()
														+ " :nth-child(6)")
												.html(
														'<input readonly="readonly" type="text" name="eachtotalvalue" value=\''
																+ Number($(
																		"#eachtotalvalue")
																		.val()
																		* Q)
																+ '\'>');
									}
									$("#pCode").val("");
									$("#salesbar").val("");
									$("#salesbar").prop("readonly", false);
									$("#mrp").prop("disabled", true);
									$("#wsp").prop("disabled", true);
									$("#qty").prop("readonly", false);
									$("#qty").val("");
								} else {
									alert("no product found");
								}

							},
							error : function(a, b, c) {
								alert('invalid barcode');
							}

						});
			}
		}
		$(function() {
			$("#phone").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getCustomerByPh",
						data : {
							ph : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.mobile,
									id : item.id,
									name : item.name,
									address : item.address,
									city : item.city,
									vat_cst_no : item.vat_cst_no,
									currentDebitNote : item.currentDebitNote
								});
							}));
						}

					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$("#isExistingCust").val(0);
						$("#existingCustId").val("");
						/* $("#custName").val("");
						$("#addr").val("");
						$("#city").val("");
						$("#vatcst").val(""); */

						$("#totalDebit").val('0');
					} else {
						$("#isExistingCust").val(1);
						$("#existingCustId").val(ui.item.id);
						$("#custName").val(ui.item.name);
						$("#addr").val(ui.item.address);
						$("#city").val(ui.item.city);
						$("#vatcst").val(ui.item.vat_cst_no);

						$("#totalDebit").val(ui.item.currentDebitNote);
					}
				},
				select : function(event, ui) {
					if (ui.item != null) {
						$("#isExistingCust").val(1);
						$("#existingCustId").val(ui.item.id);
						$("#custName").val(ui.item.name);
						$("#addr").val(ui.item.address);
						$("#city").val(ui.item.city);
						$("#vatcst").val(ui.item.vat_cst_no);
					} else {
						$("#isExistingCust").val(0);
						$("#existingCustId").val("");
						$("#custName").val("");
						$("#addr").val("");
						$("#city").val("");
						$("#vatcst").val("");
					}
				}
			});
		});
	</script>
	<script>	

		function addAgentDetails() {

			$("#addA").modal("show");
			//$("#header").show();
		}

		function submitform2() {
			if ($("#idName2").val() == 0) {
				alert("please select  name");
			/* } else if ($("#idvendorCompanyName2").val() == "") {
				alert("please select Company Name"); */
			} else if ($("#iphone2").val() == "") {
				alert("please select Ph No1");
			/* } else if ($("#idvendorMail2").val() == "") {
				alert("please select email");
			} else if ($("#idvendorAlias2").val() == "") {
				alert("please select Alias name");
			} else if ($("#cityname2").val() == "") {
				alert("please select cityname");
			} else if ($("#idAdd2").val() == "") {
				alert("please select Adress"); */
			} else if ($("#vendorCity2").val() == "") {
				alert("please select vendor city");
			/* } else if ($("#idvendorPin2").val() == "") {
				alert("please select pin code");
			} else if ($("#service2").val() == "") {
				alert("please select Service Tax"); */
			} else {
				var dataa2 = {
					vendorName2 : $("#idName2").val(),
					vendorAddress2 : $("#idAdd2").val(),
					vendorAlias2 : $("#idvendorAlias2").val(),
					vendorCityId2 : $("#vendorCityId2").val(),
					vendorCompanyName2 : $("#idvendorCompanyName2").val(),
					vendorMail2 : $("#idvendorMail2").val(),
					vendorPh12 : $("#iphone2").val(),
					vendorPh22 : $("#idvendorPh22").val(),
					vendorPin2 : $("#idvendorPin2").val(),
					vendorType2 : $("#idvendorType2").val(),
					bankAccNo2 : $("#idbankAccNo2").val(),
					bankName2 : $("#idbankName2").val(),
					bankCheckLebel2 : $("#idbankCheckLebel2").val(),
					bankIFSC2 : $("#idbankIFSC2").val(),
					bankMICR2 : $("#idbankMICR2").val(),
					bankRTGS2 : $("#idbankRTGS2").val(),
					bankBranch2 : $("#idbankBranch2").val(),
					taxTypeGroupId2 : $("#taxgroup2").val(),
					bankCity6 : $("#bankCityId26").val(),
					vendorCSTno2 : $("#idvendorCSTno2").val(),
					vendorCSTregDate2 : $("#datepickerB2").val(),
					vendorExciseRegNo2 : $("#idvendorExciseRegNo2").val(),
					vendorExciseRegDate2 : $("#datepickerC2").val(),
					vendorVATno2 : $("#idvendorVATno2").val(),
					vendorVATregDate2 : $("#datepickerA2").val(),
					vendorServiceTaxRegNo2 : $("#idvendorServiceTaxRegNo2")
							.val(),
					vendorServiceTaxRegDate2 : $("#datepickerD2").val(),
					vendorPANno2 : $("#idvendorPANno2").val()
				};
				$.ajax({
					url : "addAgen",
					dataType : "json",
					data : dataa2,
					type : "post",
					success : function(data2) {
						agentId = data2.vendorid;
						aName = data2.vendorName;
						address = data2.vendorAddress;
						ph1 = data2.vendorPh1;
						ph2 = data2.vendorPh2;
						alert(data2.result);
						$("#addA").modal('hide');
					},
					complete : function() {
						$("#aId").val(agentId);
						$("#agentName").val(aName);

						$("#aDetailsDiv").show();
						$("#aDetail").val(
								"Address :\n\t" + address + "\nPh1 : " + ph1
										+ "\nPh2 : " + ph2);

						$("#agent").attr("checked", "checked");
						isAgentF();
					}

				});
			}
		}

		function bankButtonPrev2() {
			$("#bAcc2").removeAttr("class");
			$("#bankAccount2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
		}

		function vendorButtonPrev2() {
			$("#vAcc2").removeAttr("class");
			$("#vendorAccount2").attr("class", "tab-pane fade");
			$("#addr2").attr("class", "active");
			$("#address2").attr("class", "tab-pane fade active in");
		}

		function vendorButtonNext2() {
			$("#vAcc2").removeAttr("class");
			$("#vendorAccount2").attr("class", "tab-pane fade");
			$("#bAcc2").attr("class", "active");
			$("#bankAccount2").attr("class", "tab-pane fade active in");
		}

		function detailButtonPrev2() {
			$("#detl2").removeAttr("class");
			$("#detail2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
		}

		function detailButtonNext2() {
			if ($("#idName2").val() == 0) {
				alert("please select  name");			
			} else if ($("#iphone2").val() == "") {
				alert("please select Ph No1");			
			} else {
			$("#detl2").removeAttr("class");
			$("#detail2").attr("class", "tab-pane fade");
			$("#addr2").attr("class", "active");
			$("#address2").attr("class", "tab-pane fade active in");
			}
		}

		function addressButtonPrev2() {
			$("#addr2").removeAttr("class");
			$("#address2").attr("class", "tab-pane fade");
			$("#detl2").attr("class", "active");
			$("#detail2").attr("class", "tab-pane fade active in");
		}

		function addressButtonNext2() {
			if ($("#vendorCity2").val() == "") {
				alert("please select vendor city");			
			} else {
			$("#addr2").removeAttr("class");
			$("#address2").attr("class", "tab-pane fade");
			$("#vAcc2").attr("class", "active");
			$("#vendorAccount2").attr("class", "tab-pane fade active in");
			}
		}

		$(function() {
			$("#vendorCity2").autocomplete({
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
					if (ui.item == null) {
						$(this).val("");
						$("#vendorCityId2").val("");
					} else {
						$("#vendorCityId2").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					$("#vendorCityId2").val(ui.item.id);
				}
			});
		});

		$(function() {
			$("#bankCity6").autocomplete({
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
					if (ui.item == null) {
						$(this).val("");
						$("#bankCityId26").val("");
					} else {
						$("#bankCityId26").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					$("#bankCityId26").val(ui.item.id);
				}
			});
		});
	</script>
	<script>
		$(document).ready(function() {
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

		function stateDispByCountry() {
			var a = $('[name="countryid"]').val();
			if (a != 0) {
				$.ajax({
					url : "getStateByCountry",
					dataType : "json",
					data : {
						"id" : a
					},
					success : function(data) {
						$("#states ul").empty();
						$.each(data, function(index, value) {
							$("#states ul").append(
									'<li>' + value.stateName + '</li>');
						});
					}
				});
			} else {
				$("#states ul").empty();
				alert("select a country.");
			}
		}

		function getStateList() {
			var a = $("[name='countryid3']").val();
			if (a != 0) {
				$.ajax({
					url : "getStateByCountry",
					dataType : "json",
					data : {
						"id" : a
					},
					success : function(data) {
						$("#statelist1").empty();
						$("#statelist1").append(
								'<option value="0">select state</option>');
						$.map(data, function(item) {
							$("#statelist1").append(
									'<option value="'+item.id+'">'
											+ item.stateName + '</option>');
						});
					}
				});

			} else {
				$("#statelist1").empty();
			}
		}
		function getCityList() {
			var a = $('[name="sateid"]').val();//state id
			if (a != 0) {
				$.ajax({
					type : "post",
					url : "getCity",
					data : {
						id : a
					},
					dataType : "json",
					success : function(data) {
						$("#cityList ul").empty();
						$.each(data, function(index, val) {
							$("#cityList ul").append(
									'<li>' + val.cityName + '</li>');
						});
					}
				});
			} else {
				alert("please select a state");
			}

		}
		/**********************************for city add pupose******************************/
		$(function() {
			$("#country1")
					.autocomplete(
							{
								source : function(request, response) {
									$
											.ajax({
												url : "getcountry",
												dataType : "json",
												data : {
													term : request.term
												},
												success : function(data) {
													response($
															.map(
																	data,
																	function(
																			item) {
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
										$("#state").prop("disabled", true);
									} else {
										$("#state").prop("disabled", false);
										$("#state")
												.autocomplete(
														{
															source : function(
																	request,
																	response) {
																$
																		.ajax({
																			url : "getStateByCountryByStateName",
																			dataType : "json",
																			data : {
																				name : request.term,
																				cid : ui.item.id
																			},
																			success : function(
																					data) {
																				response($
																						.map(
																								data,
																								function(
																										item) {
																									return {
																										value : item.stateName,
																										id : item.id
																									}
																								}));
																			}
																		});
															},
															select : function(
																	event, ui) {
																$("#stateId")
																		.val(
																				ui.item.id);
																if ($(
																		"#cityName")
																		.val() != "") {
																	$(
																			"#cityAddbtn")
																			.prop(
																					"disabled",
																					false);
																}

															},
															change : function(
																	event, ui) {
																if (ui.item == null) {
																	$(this)
																			.val(
																					"");
																	$(
																			"#stateId")
																			.val(
																					"");
																	$(
																			"#cityAddbtn")
																			.prop(
																					"disabled",
																					true);
																} else {
																	$(
																			"#stateId")
																			.val(
																					ui.item.id);
																	if ($(
																			"#cityName")
																			.val() != "") {
																		$(
																				"#cityAddbtn")
																				.prop(
																						"disabled",
																						false);
																	}
																}
															}
														});
									}
								},
								select : function(event, ui) {
									if (ui.item != null) {
										$("#state").prop("disabled", false);
									}
								}
							});
		});
		function cityNameKeyUp() {
			if ($("#cityName").val() != "" && $("#stateId").val() != "") {
				$("#cityAddbtn").prop("disabled", false);
			} else {
				$("#cityAddbtn").prop("disabled", true);
			}
		}

		function closeaddV() {

			$("#addV").hide();

		}
	</script>

	<script>
		function addCitySC() {
			$("#addCitySC").modal("show");
			$("#createCountry").hide();
			$("#createState").hide();
			$("#createCity").hide();
		}

		function submitformcountry() {

			var datom = {
				name : $("#creConName").val()
			}

			$.ajax({
				url : "addJsonCountry",
				dataType : "json",
				data : datom,
				type : "post",
				success : function(dat) {
					alert(dat.result);
					$("#createCountry").hide();
				}
			});
		}

		function methodState() {
			var countryVar;
			var delta = {
				nameqaz : $("#stateName").val(),
				id : $("#countryId").val()
			}

			$.ajax({
				url : "addJsonState",
				dataType : "json",
				data : delta,
				type : "post",
				success : function(dat) {
					alert(dat.result);
					$("#createState").hide();
				}
			});
		}
		function methodCityA() {
			var cityid69;
			var cityname69;
			var countryVar;
			var deltab = {
				namezxc : $("#cityName").val(),
				id : $("#stateId").val(),
				country1 : $("#country1").val(),
				name : $("#state").val()
			}

			$.ajax({
				url : "addJsonCity",
				dataType : "json",
				data : deltab,
				type : "post",
				success : function(datt) {
					alert(datt.result);
					cityname69 = datt.cityAname;

					$("#createCity").modal('hide');
					$("#addCitySC").modal('hide');
				},

				complete : function() {

					$("#city").val(cityname69);
				}
			});

		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
