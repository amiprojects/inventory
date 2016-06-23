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
<link rel="stylesheet" href="js/dist/sweetalert2.css" type="text/css" />
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
		$("#sSalesSearch").attr("style", "color: #6a94ff;");
	});
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
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminProduction' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Sales Edit')}">
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
	<c:set var="salesSearchView"
		value="${sessionScope['ejb'].getSalesEntryById(requestScope['sId'])}"></c:set>
	<input type="hidden" value="${requestScope['sId']}" name="seId"
		id="seId">
	<div class="main" style="height: 664px;">
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales Edit</h3>
						</div>

						<div class="col-md-12" style="height: 800px;">
							<div class="row">
								<div class="col-md-6">
									<div class="widget-area"
										style="height: 270px; padding: 4px 5px;">
										<div style="background-color: lightgrey; padding: 3px 3px;">
											<span class="head_style">Bill To:</span>
										</div>
										<table cellspacing="2">
											<tr>
												<td>Name :</td>
												<td><input type="text" name="custName" id="custName"
													style="align: center;" readonly="readonly"
													value="${salesSearchView.customer.name}"></input></td>
											</tr>

											<tr>
												<td>Address :</td>
												<td><input type="text" name="addr" id="addr"
													style="length: 40px;" style="align:center;"
													readonly="readonly"
													value="${salesSearchView.customer.address}"></input></td>
											</tr>
											<tr>
												<td>City :</td>
												<td><input type="text" name="city" id="city"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.city}"></input></td>
											</tr>

											<tr>
												<td>Phone No. :</td>
												<td><input type="number" name="phone" id="phone"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.mobile}"></input></td>
											</tr>

											<tr>
												<td>Vat No./CST No. :</td>
												<td><input type="text" name="vatcst" id="vatcst"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.customer.vat_cst_no}"></input></td>
											</tr>
											<tr>
												<td><c:choose>
														<c:when test="${salesSearchView.vendor!=null}">
															<input type="checkbox" checked="checked"
																onclick="isAgentF();" id="agent" name="agent"
																disabled="disabled">&nbsp; Via Agent :
														</c:when>
														<c:otherwise>
															<input type="checkbox" onclick="isAgentF();" id="agent"
																name="agent" disabled="disabled">&nbsp; Via Agent :</c:otherwise>
													</c:choose></td>
												<td><input type="text" name="agentName" id="agentName"
													style="length: 40px;" readonly="readonly"
													value="${salesSearchView.vendor.name}"></input></td>
											</tr>
											<tr id="aDetailsDiv">
												<td>Agent details :</td>
												<td><textarea rows="" cols="" id="aDetail"
														class="form-control" readonly="readonly"
														style="width: 100%;">
														Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${salesSearchView.vendor.address}
															Ph1 : ${salesSearchView.vendor.ph1}
															Ph2 : ${salesSearchView.vendor.ph2}
														</textarea></td>
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
												challan no. :</label> <input readonly="readonly" type="text"
												placeholder="" name="challanNumber" class="form-control"
												value="${salesSearchView.challanNumber}">
										</div>

										<div class="form-group">
											<label style="font-size: 15px" class="font">Date :</label> <input
												class="form-control" type="text" name="salesDate"
												id="datepicker" readonly="readonly"
												value='<fmt:formatDate value="${salesSearchView.sales_date}" pattern="dd-MM-yyyy"/>'>

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
								<c:choose>
									<c:when test="${salesSearchView.isMRP()==true}">
										<input type="radio" class="chk" name="saleAt" value="mrp"
											id="mrp" style="display: none;" disabled="disabled"
											checked="checked">
										<label for="mrp"></label>MRP
										<input type="radio" disabled="disabled" class="chk"
											name="saleAt" value="wsp" id="wsp" style="display: none;">&nbsp;<label
											for="wsp"></label>WSP
									</c:when>
									<c:otherwise>
										<input type="radio" class="chk" name="saleAt" value="mrp"
											id="mrp" style="display: none;" disabled="disabled">
										<label for="mrp"></label>MRP
										<input type="radio" checked="checked" disabled="disabled"
											class="chk" name="saleAt" value="wsp" id="wsp"
											style="display: none;">&nbsp;<label for="wsp"></label>WSP</c:otherwise>
								</c:choose>
							</div>
							<div class="widget-area">
								<table class="table table-striped table-bordered"
									id="productTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Product code</th>
											<th>Product Description</th>
											<th>Lot No.</th>
											<th>Returned Qty</th>
											<th>Qty.</th>
											<c:choose>
												<c:when test="${salesSearchView.isMRP()==true}">
													<th>MRP/Qty</th>
												</c:when>
												<c:otherwise>
													<th>WSP/Qty</th>
												</c:otherwise>
											</c:choose>
											<th>Total</th>
										</tr>
									</thead>
									<c:set var="i" value="${1}"></c:set>
									<c:forEach var="salesProducts"
										items="${salesSearchView.salesProductDetails}">
										<tbody id="trRemove${salesProducts.id}">
											<tr>
												<td>${i}<input type="hidden"
													id="retQtyH${salesProducts.id}"
													value="${salesProducts.salesReQty}"><input
													type="hidden" id="qtyH${salesProducts.id}"
													value="${salesProducts.quantity}"> <input
													type="hidden" id="wspH${salesProducts.id}"
													value="${salesProducts.purchase_Product_Details.wsp}"><input
													type="hidden" id="salesPriceH${salesProducts.id}"
													value="${salesProducts.salesPrice}">
												</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.code}</td>
												<td>${salesProducts.purchase_Product_Details.productDetail.description}</td>
												<td>${salesProducts.purchase_Product_Details.lotNumber}</td>
												<td>${salesProducts.salesReQty}</td>
												<td><input type="text" style="background-color: gray;"
													readonly="readonly" value="${salesProducts.quantity}"
													name="qtyvalue"
													onchange="qtyvalueF(this,${salesProducts.id});"
													ondblclick="enable(this);"></td>
												<td><c:if test="${salesProducts.salesReQty==0}">
														<input type="text" value="${salesProducts.salesPrice}"
															style="background-color: gray;" readonly="readonly"
															name="mrpQty"
															onchange="qtyvalueF(this,${salesProducts.id});"
															ondblclick="enable(this);">
													</c:if> <c:if test="${salesProducts.salesReQty!=0}">
														<input type="text" value="${salesProducts.salesPrice}"
															readonly="readonly" name="mrpQty">
													</c:if></td>
												<td><fmt:formatNumber var="amount"
														value="${salesProducts.quantity*salesProducts.salesPrice}"
														maxFractionDigits="2" groupingUsed="false" /><input
													readonly="readonly" type="text" class="eachtotalvalue"
													name="eachtotalvalue" value="${amount}"></td>
											</tr>
										</tbody>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</table>
							</div>
							<div style="width: 60%; float: left;">
								<div class="widget-area" style="margin-top: 21px;">
									<div class="form-group"">
										<label style="font-size: 15px" class="font">Description
											:</label>
										<textarea rows="8" cols="" class="form-control"
											name="salesDesc" id="salesDesc"
											style="background-color: gray; text-align: left;"
											readonly="readonly" onchange="updateSe(this);"
											ondblclick="enable(this);">
											${salesSearchView.description}
											</textarea>
									</div>
								</div>
							</div>
							<div style="width: 40%; float: right;">
								<input type="hidden" id="totalvalue" name="totalvalue" value="0">
								<table id="stream_table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<td colspan="2" id="sub">Sub Total :</td>
											<td><input type="number" class="form-control"
												readonly="readonly" id="subtotalvalue" name="subtotalvalue"
												value="${salesSearchView.subTotal}"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">Discount &nbsp; <select name="disType"
												id="disType" disabled="disabled">
													<c:choose>
														<c:when test="${salesSearchView.isFlatDiscount()==true}">
															<option value="disFlat" selected="selected">Flat</option>
															<option value="disPer">%</option>
															<c:set var="dis" value="${salesSearchView.discountValue}"></c:set>
														</c:when>
														<c:otherwise>
															<option value="disPer" selected="selected">%</option>
															<option value="disFlat">Flat</option>
															<c:set var="dis"
																value="${salesSearchView.subTotal*salesSearchView.discountValue/100}"></c:set>
														</c:otherwise>
													</c:choose>
											</select>
											</td>
											<td><input type="text" class="form-control"
												name="disValue" id="discount" placeholder=""
												readonly="readonly"
												value="<fmt:formatNumber value="${salesSearchView.discountValue}" maxFractionDigits="2" groupingUsed="false" />">
											</td>
										</tr>
									</tbody>

									<tbody>
										<tr>
											<td colspan="2" id="disc">Discount Value:</td>
											<td><input type="number" class="form-control"
												readonly="readonly" id="discountValue" name="discountValue"
												value="${dis}"></td>
										</tr>

									</tbody>
									<c:choose>
										<c:when test="${salesSearchView.vendor==null}">
											<tbody style="display: none;">
												<tr>
													<td colspan="2">Agent Profit:</td>
													<td>Is Effective On Return:&nbsp; <select
														name="isEffective" id="isEffective" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isEfectiveProfit()==true}">
																	<option>Yes</option>
																</c:when>
																<c:otherwise>
																	<option>No</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
												</tr>
											</tbody>
											<tbody style="display: none;">
												<tr>
													<td colspan="2">Agent Profit: &nbsp; <select
														name="profitType" id="profitType"
														onchange="profitTypeF();" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isFlatProfitAgent()==true}">
																	<option value="profitFlat">Flat</option>
																</c:when>
																<c:otherwise>
																	<option value="profitPer">%</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
													<td><input type="text"
														value="${salesSearchView.agentProfitValue}"
														class="form-control" name="profitVal" id="profitVal"
														placeholder="" readonly="readonly"></td>
												</tr>
											</tbody>
											<tbody style="display: none;">
												<tr>
													<td colspan="2" id="disc">Agent Profit Value:</td>
													<td><input type="text" class="form-control"
														readonly="readonly" id="profitValue" name="profitValue"
														value="${salesSearchView.agentProfitTotal}"></td>
												</tr>
											</tbody>
										</c:when>
										<c:otherwise>
											<tbody>
												<tr>
													<td colspan="2">Agent Profit:</td>
													<td>Is Effective On Return:&nbsp; <select
														name="isEffective" id="isEffective" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isEfectiveProfit()==true}">
																	<option>Yes</option>
																</c:when>
																<c:otherwise>
																	<option>No</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Agent Profit: &nbsp; <select
														name="profitType" id="profitType"
														onchange="profitTypeF();" disabled="disabled">
															<c:choose>
																<c:when
																	test="${salesSearchView.isFlatProfitAgent()==true}">
																	<option value="profitFlat">Flat</option>
																</c:when>
																<c:otherwise>
																	<option value="profitPer">%</option>
																</c:otherwise>
															</c:choose>
													</select>
													</td>
													<td><input type="text"
														value="<fmt:formatNumber value="${salesSearchView.agentProfitValue}" maxFractionDigits="2" groupingUsed="false" />"
														class="form-control" name="profitVal" id="profitVal"
														placeholder="" readonly="readonly"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2" id="disc">Agent Profit Value:</td>
													<td><input type="text" class="form-control"
														readonly="readonly" id="profitValue" name="profitValue"
														value="<fmt:formatNumber value="${salesSearchView.agentProfitTotal}" maxFractionDigits="2" groupingUsed="false" />"></td>
												</tr>
											</tbody>
										</c:otherwise>
									</c:choose>
									<tbody>
										<tr>
											<td><select class="form-control" id="taxGroup"
												name="taxGroup" disabled="disabled">
													<c:choose>
														<c:when test="${salesSearchView.tax_Type_Group!=null}">
															<option>${salesSearchView.tax_Type_Group.name}</option>
														</c:when>
														<c:otherwise>
															<option value="0">TAX type</option>
														</c:otherwise>
													</c:choose>
													<c:forEach
														items="${sessionScope['ejb'].getAllActiveTax_Type_Groups()}"
														var="taxTypeGroup">
														<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
													</c:forEach>
											</select></td>
											<td>%</td>
											<td><input type="text" class="form-control"
												readonly="readonly"
												value="<fmt:formatNumber value="${salesSearchView.tax_Type_Group.getTotalTaxValue()}" maxFractionDigits="2" groupingUsed="false" />"
												id="taxTot"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2">Tax Amount :</td>
											<td><input type="text" class="form-control"
												readonly="readonly"
												value="<fmt:formatNumber value="${salesSearchView.taxAmount}" maxFractionDigits="2" groupingUsed="false" />"
												id="taxAmount"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2" id="trans">Transport charge :</td>
											<td><input type="text" class="form-control"
												name="transcharge" id="transcharge"
												value="<fmt:formatNumber value="${salesSearchView.transportcCharge}" maxFractionDigits="2" groupingUsed="false" />"
												style="background-color: gray;" readonly="readonly"
												onchange="updateSe(this);" ondblclick="enable(this);"></td>
										</tr>
									</tbody>

									<tbody>
										<tr>
											<td colspan="2" id="sur">Surcharge :</td>
											<td><input type="text" class="form-control"
												id="surcharge" name="surcharge"
												value="<fmt:formatNumber value="${salesSearchView.surcharge}" maxFractionDigits="2" groupingUsed="false" />"
												style="background-color: gray;" readonly="readonly"
												onchange="updateSe(this);" ondblclick="enable(this);"></td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td colspan="2" id="round">Round Of :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="roundvalue"
												name="roundvalue"
												value="<fmt:formatNumber value="${salesSearchView.roundOf}" maxFractionDigits="2" groupingUsed="false" />"></td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td colspan="2" id="grand">Grand Total :</td>
											<td><input type="number" class="form-control"
												placeholder="" readonly="readonly" id="grandtotal"
												name="grandtotal"
												value="<fmt:formatNumber value="${salesSearchView.totalCost}" maxFractionDigits="2" groupingUsed="false" />"></td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
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
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript" src="js/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
	function gtot() {
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
				$("#discount").val(0);
				$("#discountValue").val(0);
			} else {
				$("#discountValue")
						.val(
								Math
										.round(Number($("#discount").val()) * 100) / 100);
			}
		}

		if ($("#profitType").val() == 'profitPer') {
			$("#profitValue")
					.val(
							Math
									.round(Number(Number(Number($(
											"#subtotalvalue").val())
											- Number($("#discountValue")
													.val()))
											* Number($("#profitVal").val())
											/ 100) * 100) / 100);
		} else {
			$("#profitValue").val(
					Math.round(Number($("#profitVal").val()) * 100) / 100);
		}

		$("#taxAmount").val(
				Math.round((Number(Number($("#subtotalvalue").val())
						- Number($("#discountValue").val()))
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

		$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
		$("#grandtotal").val(Math.round((round) * 100) / 100);
	}

	function qtyvalueF(f,a) {
		var retQtyH = $("#retQtyH" + a).val();
		var qtyH = $("#qtyH" + a).val();
		var qty = $("#trRemove" + a + " :nth-child(6) input[type=text]")
				.val();
		var wspH = $("#wspH" + a).val();
		var salesPriceH = $("#salesPriceH" + a).val();
		var price = $("#trRemove" + a + " :nth-child(7) input[type=text]")
				.val();
		if (Number(qty) < Number(retQtyH)) {
			$("#trRemove" + a + " :nth-child(6) input[type=text]").val(
					qtyH);
			var qty=qtyH;
			
			$(f).prop("readonly", true);
			$(f).attr("style", "background-color: grey;");	
			sweetAlert('Oops...','Selling quantity can not be less than returning quantity : ' + retQtyH, 'error');
		} else if (Number(qty) > Number(qtyH)) {
			$("#trRemove" + a + " :nth-child(6) input[type=text]").val(
					qtyH);
			var qty=qtyH;
			
			$(f).prop("readonly", true);
			$(f).attr("style", "background-color: grey;");	
			sweetAlert('Oops...','Selling quantity can not be greater than sold quantity : ' + qtyH, 'error');
		} else if (Number(price) < Number(wspH)) {
			$("#trRemove" + a + " :nth-child(7) input[type=text]").val(
					salesPriceH);
			var price=salesPriceH;
			
			$(f).prop("readonly", true);
			$(f).attr("style", "background-color: grey;");	
			sweetAlert('Oops...','Selling price can not be less than wsp : ' + wspH, 'error');
		} else{                
                swal({
                	title: "Are you sure?",
                	//text: "After changing , You can not increase the quantity, but you can decrease. Do you want to continue ?",   
                	type: "warning",   
                	showCancelButton: true,   
                	confirmButtonColor: "#DD6B55" ,  
                	confirmButtonText: "Yes" }, 
                	function(isConfirm){
                		if (isConfirm) {
                		$.ajax({
            				url:"updateSalesproduct",
            				dataType:"json",
            				data:{
            					id:a,
            					qty:qty,
            					price:price
            				},
            				success:function(data1){
            					if(data1.error){
            						$("#trRemove"+a+" :nth-child(6) input[type=text]").val(qtyH);
            						$("#trRemove"+a+" :nth-child(7) input[type=text]").val(salesPriceH);
            						qty=qtyH;
            						price=salesPriceH;
            						$(f).prop("readonly", true);
            						$(f).attr("style", "background-color: grey;");	
            						sweetAlert('Oops...', 'prodct update failed....', 'error');
            					}else{
            						$(f).prop("readonly", true);
            						$(f).attr("style", "background-color: pink;");	
            						$("#qtyH" + a).val(qty);
            						$("#salesPriceH" + a).val(price);
            						qtyH=qty;
            						salesPriceH=price;
            						
            						$("#trRemove" + a + " :nth-child(8) input[type=text]").val(
            								Number(Number(qty) * Number(price)).toFixed(2));
            						var sum = 0;
            						$(".eachtotalvalue").each(function() {
            							sum += parseFloat(this.value);
            						});
            						$("#subtotalvalue").val(sum.toFixed(2));
            						gtot();
            						updateSalesEntry();
            					}
            				}
            			});
                		}else{
                			$("#trRemove"+a+" :nth-child(6) input[type=text]").val(qtyH);
    						qty=qtyH;
    						$("#trRemove"+a+" :nth-child(7) input[type=text]").val(salesPriceH);
    						price=salesPriceH;
    						$(f).prop("readonly", true);
    						$(f).attr("style", "background-color: grey;");
                		}
                	});                            	             	
		}		
	}
	function enable(f) {
		$(f).prop("readonly", false);
		$(f).attr("style", "background-color: white;");
	}
	function updateSalesEntry() {
		gtot();
		var st = $("#subtotalvalue").val();
		st = st.replace(",", "");
		var scharge = $("#surcharge").val();
		var tcharge = $("#transcharge").val();
		var gt = $("#grandtotal").val();
		var roundvalue = $("#roundvalue").val();

		$.ajax({
			url : "updateSalesEntry",
			dataType : "json",
			data : {
				id : $("#seId").val(),
				surCharge : scharge,
				trCharge : tcharge,
				gt:gt,
				roundvalue:roundvalue,
				st:st,
				disType : $("#disType").val(),
				discount : $("#discount").val(),
				taxAmount : $("#taxAmount").val(),
				profitValue : $("#profitValue").val(),
				salesDesc : $("#salesDesc").val()
			},
			success : function(data) {
				if (data.error) {					
					sweetAlert('Oops...', data.msg, 'error')
				} else {
					//alert(data.msg);
					swal('Update', 'Data successfully saved!', 'success')
				}
			}
		});
	}
	
	function updateSe(a) {
		updateSalesEntry();

		$(a).prop("readonly", true);
		$(a).attr("style", "background-color: pink;");
	}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
