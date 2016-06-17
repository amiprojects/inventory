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
</style>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchSearch").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Purchase Edit')}">
				<c:set var="i" value="5" />
			</c:if>
		</c:forEach>
		<c:if test="${i!=5}">
			<script type="text/javascript">
				alert('you have no permission to view this page');
				window.location = "purchasingPurchaseSearch.jsp";
			</script>
		</c:if>
	</c:if>
	<c:set var="purchaseSearchView"
		value="${sessionScope['ejb'].getPurchaseEntryById(requestScope['pId'])}" />
	<input type="hidden" value="${requestScope['pId']}" name="peId"
		id="peId">
	<div class="main" style="height: 664px;">
		<%-- <%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%> --%>

		<%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide">

			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Purchase Edit</h3>

							</div>
							<div class="col-md-12">
								<div class="widget-area">
									<div class="col-md-6">
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Type :</b> <input
												type="text" class="form-control" readonly="readonly"
												name="vendorType" id="vendorType"
												value="${purchaseSearchView.vendor.vendorType.type}">
										</div>
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
												type="text" class="form-control" id="vName" name="vName"
												readonly="readonly"
												value="${purchaseSearchView.vendor.name}">
										</div>
										<div class="col-md-12">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Details :</b>
											<textarea rows="5" cols="" id="vDetail" class="form-control"
												readonly="readonly">
													Address : 
														&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;${purchaseSearchView.vendor.address}
													Ph1: ${purchaseSearchView.vendor.ph1}
													Ph2: ${purchaseSearchView.vendor.ph2}
													</textarea>

										</div>
										<div class="col-md-12">
											<c:choose>
												<c:when test="${purchaseSearchView.agentId==0}">
													<input type="checkbox" id="agent" name="agent"
														disabled="disabled">&nbsp;<span>Via Agent</span>
												</c:when>
												<c:otherwise>
													<input type="checkbox" id="agent" name="agent"
														disabled="disabled" checked="checked">&nbsp;<span>Via
														Agent</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-md-12" id="aNameDiv">
											<label for="" class="font">Agent Name:</label>
											<c:choose>
												<c:when test="${purchaseSearchView.agentId!=0}">
													<input class="form-control" type="text"
														class="form-control" name="agentName" id="agentName"
														readonly="readonly"
														value="${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).getName()}">
												</c:when>
												<c:otherwise>
													<input class="form-control" type="text"
														class="form-control" name="agentName" id="agentName"
														readonly="readonly">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Vendor Bill no :</label> <input
												type="text" placeholder="" id="vendorBillNo"
												class="form-control" name="vendorBillNo" readonly="readonly"
												value="${purchaseSearchView.vendor_bill_no}">
										</div>
										<div class="form-group">
											<label for="" class="font">Purchase challan no. :</label> <input
												readonly="readonly" type="text" placeholder=""
												name="challanNumber" class="form-control"
												value="${purchaseSearchView.challanNumber}">
										</div>
										<div class="form-group">
											<label for="" class="font">Purchase Date :</label> <input
												type="text" id="datepicker" class="form-control"
												name="purchaseDate" required="required" readonly="readonly"
												value="<fmt:formatDate
																			value="${purchaseSearchView.purchase_date}"
																			pattern="dd-MM-yyyy" />">
										</div>
										<div class="form-group" id="aDetailDiv">
											<label for="" class="font">Agent Details:</label>

											<c:choose>
												<c:when test="${purchaseSearchView.agentId!=0}">
													<textarea rows="5" cols="" class="form-control"
														readonly="readonly" id="agentDet" name="agentDet">
															Address : 
															&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).address}
															Ph1 : ${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).ph1}
															Ph2 : ${sessionScope['ejb'].getVendorById(purchaseSearchView.agentId).ph2}
															</textarea>
												</c:when>
												<c:otherwise>
													<textarea rows="5" cols="" class="form-control"
														readonly="readonly" id="agentDet" name="agentDet"></textarea>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>
								</div>
								<div style="overflow: auto; width: 100%;">
									<table id="purPro" class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Product Code:</th>
												<th>Product Description</th>
												<th>WSP</th>
												<th>MRP</th>
												<th>Qty</th>
												<th>Used Qty</th>
												<th>UOM</th>
												<th>Cost</th>
												<th>Amount</th>
											</tr>
										</thead>
										<c:set var="i" value="${1}"></c:set>

										<tbody>

											<c:forEach var="purchaseProducts"
												items="${purchaseSearchView.purchase_Product_Details}">

												<tr id="proRow${purchaseProducts.id}">
													<td>${i}</td>
													<td>${purchaseProducts.productDetail.code}</td>
													<td>${purchaseProducts.productDetail.description}</td>
													<td><input type="text" value="${purchaseProducts.wsp}"
														style="background-color: gray;" readonly="readonly"
														name="pprowsp"
														onchange="update(this,${purchaseProducts.id});"
														ondblclick="enable(this);"></td>
													<td><input type="text" value="${purchaseProducts.mrp}"
														style="background-color: gray;" readonly="readonly"
														name="ppromrp"
														onchange="update(this,${purchaseProducts.id});"
														ondblclick="enable(this);"></td>
													<td><input type="text"
														value="${purchaseProducts.quantity}"
														style="background-color: gray;" readonly="readonly"
														name="pproqty"
														onchange="update(this,${purchaseProducts.id});"
														ondblclick="enable(this);"></td>
													<td><fmt:formatNumber var="usedQty"
															value="${purchaseProducts.quantity-purchaseProducts.remaining_quantity}"
															maxFractionDigits="3" groupingUsed="false" /> ${usedQty}</td>
													<td>${purchaseProducts.productDetail.qtyUnit.name}</td>
													<td><c:choose>
															<c:when
																test="${purchaseProducts.quantity>purchaseProducts.remaining_quantity}">
																<input type="text" value="${purchaseProducts.cost}"
																	readonly="readonly" name="pprocost">
															</c:when>
															<c:otherwise>
																<input type="text" value="${purchaseProducts.cost}"
																	style="background-color: gray;" readonly="readonly"
																	name="pprocost"
																	onchange="update(this,${purchaseProducts.id});"
																	ondblclick="enable(this);">
															</c:otherwise>
														</c:choose></td>
													<td class="proTotCost">${purchaseProducts.quantity*purchaseProducts.cost}</td>
												</tr>

												<c:set var="i" value="${i+1}" />
											</c:forEach>

										</tbody>
									</table>
								</div>
								<div class="col-md-12">
									<input type="button" class="form-control btn-success"
										data-toggle="modal" data-target="#addProduct"
										value="Add Product" value="Add">
								</div>


								<div style="width: 40%; float: right;">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2">Sub Total :</td>
												<td><fmt:formatNumber var="subt"
														value="${purchaseSearchView.subTotal}"
														maxFractionDigits="2" groupingUsed="false" /> <input
													type="text" class="form-control" id="subTotal"
													value="${subt}" readonly="readonly"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount &nbsp; <select name="disType"
													id="disType" disabled="disabled">
														<c:choose>
															<c:when
																test="${purchaseSearchView.isFlatDiscount()==true}">
																<option value="disFlat">Flat</option>
															</c:when>
															<c:otherwise>
																<option value="disPer">%</option>
															</c:otherwise>
														</c:choose>
												</select>
												</td>
												<td><input type="number" class="form-control"
													name="disValue" id="discount" placeholder=""
													readonly="readonly"
													value="<fmt:formatNumber value="${purchaseSearchView.discountValue}" maxFractionDigits="2" groupingUsed="false" />"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="number" class="form-control"
													readonly="readonly" id="discountValue" name="discountValue"
													value="<fmt:formatNumber value="${purchaseSearchView.discountTotal}" maxFractionDigits="2" groupingUsed="false" />"></td>
											</tr>
										</tbody>
										<c:choose>
											<c:when test="${purchaseSearchView.agentId==0}">
												<tbody style="display: none;">
													<tr>
														<td colspan="2">Agent Profit:</td>
														<td>Is Effective On Return:&nbsp; <select
															name="isEffective" id="isEffective" disabled="disabled">
																<c:choose>
																	<c:when
																		test="${purchaseSearchView.isEfectiveProfit()==true}">
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
																		test="${purchaseSearchView.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text"
															value="${purchaseSearchView.agentProfitValue}"
															class="form-control" name="profitVal" id="profitVal"
															placeholder="" readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody style="display: none;">
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="${purchaseSearchView.agentProfitTotal}"></td>
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
																		test="${purchaseSearchView.isEfectiveProfit()==true}">
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
																		test="${purchaseSearchView.isFlatProfitAgent()==true}">
																		<option value="profitFlat">Flat</option>
																	</c:when>
																	<c:otherwise>
																		<option value="profitPer">%</option>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>
														<td><input type="text"
															value="${purchaseSearchView.agentProfitValue}"
															class="form-control" name="profitVal" id="profitVal"
															placeholder="" readonly="readonly"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2" id="disc">Agent Profit Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="profitValue" name="profitValue"
															value="${purchaseSearchView.agentProfitTotal}"></td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
										<tbody>
											<tr>
												<td>${purchaseSearchView.tax_Type_Group.name}</td>
												<td>%</td>
												<td><input type="text" class="form-control"
													readonly="readonly"
													value="${purchaseSearchView.tax_Type_Group.getTotalTaxValue()}"
													id="taxTot"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Tax Amount :</td>
												<td><fmt:formatNumber var="ta"
														value="${purchaseSearchView.taxAmount}"
														maxFractionDigits="2" groupingUsed="false" /> <input
													type="text" class="form-control" readonly="readonly"
													value="${ta}" id="taxAmount"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Transport charge :</td>
												<td><input type="text" class="form-control"
													name="transportCost" id="transportCost"
													value="${purchaseSearchView.transport_cost}"
													style="background-color: gray;" readonly="readonly"
													onchange="updatePe(this);" ondblclick="enable(this);"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2">Surcharge :</td>
												<td><input type="text" class="form-control"
													id="surcharge" name="surcharge"
													value="${purchaseSearchView.sur_charge}"
													style="background-color: gray;" readonly="readonly"
													onchange="updatePe(this);" ondblclick="enable(this);"></td>
											</tr>
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="hidden" id="totalvalue"
													name="totalvalue" value="0"><input type="number"
													class="form-control" placeholder="" readonly="readonly"
													id="roundvalue" name="roundvalue"
													value="${purchaseSearchView.roundOf}"></td>
											</tr>
										</tbody>
										<thead>
											<tr>
												<td colspan="2">Grand Total :</td>
												<td><input type="text" class="form-control" id="gt"
													placeholder="0" readonly="readonly"
													value="${purchaseSearchView.totalCost}"></td>
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
		<!-- Content Sec -->
	</div>


	<!-- for adding new product -->

	<div id="addProduct" class="modal fade" role="dialog"
		style="top: -70px; overflow-y: hidden; overflow-x: hidden;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="" style="font-size: 20px;"><strong>Group</strong></a></li>
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
								<div class="col-md-5">
									Product Code:<font color="red" size="4">*</font>
								</div>
								<div class="col-md-6">
									<input type="text" id="pCode" name="pCode" class="form-control"
										onchange="emptyForm();" autocomplete="off"><input
										type="hidden" id="productCode" name="productCode">
								</div>
								<div class="col-md-5">Product Descripsion:</div>
								<div class="col-md-7">
									<input type="text" class="form-control" name="pDesc" id="pDesc"
										readonly="readonly">
								</div>
								<div class="col-md-5">Product Image:</div>
								<div class="col-md-7" id="imgaeDIV">
									<img width="100" id="productImage" height="60" width="50"
										style="" alt="">
								</div>
								<br> <br>
							</div>
						</div>
						<div class="widget-area" style="width: 50%; height: 275px;">
							<div class="breadcrumbs">
								<ul>
									<li><a title="" style="font-size: 20px;"><strong>Attributes</strong>
									</a></li>
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
								<div class="col-md-3">
									Quantity:<font color="red" size="4">*</font>
								</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="qty" id="qty">
								</div>
								<div class="col-md-3">UOM:</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="uom" name="uom"
										readonly="readonly">
								</div>
								<div class="col-md-3">
									Rate:<font color="red" size="4">*</font>
								</div>
								<div class="col-md-9">
									<input type="number" class="form-control" name="rate" id="rate"
										required="required" onchange="rateF();">
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
								<div class="col-md-2">
									<input type="hidden" name="isSalable" id="isSalable"> <span
										id="wspStar">WSP:</span>
								</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="wsp"
										readonly="readonly" name="wsp" onchange="wspF();">
								</div>
								<div class="col-md-2">
									<span id="mrpStar">MRP:</span>
								</div>
								<div class="col-md-10">
									<input type="number" class="form-control" id="mrp"
										readonly="readonly" name="mrp" onchange="mrpF();">
								</div>
							</div>
						</div>
						<div class="widget-area" style="width: 100%; top: 0px;">
							<div class="row">
								<div class="col-md-2">
									<b>Lot No. :<font color="red" size="4">*</font></b>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="lotText"
										readonly="readonly" name="lotText"
										onkeypress="return blockSpecialChar(event)"
										onkeyup="lotNoKeyUpT();" onchange="lotNoChangeT();"
										autocomplete="off"><input type="hidden"
										id="lotNoCheckT" name="lotNoCheckT">
								</div>
							</div>

							<br>
							<div class="row">

								<div style="float: right; right: 25px;">
									<input type="button" class="btn green pull-left" width=""
										value="Add Product" data-toggle="modal"
										onclick="anotherShow();"> <input type="button"
										class="btn btn-default" data-dismiss="modal" value="Close"
										id="close" onclick="closeProduct()">
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<!-- end of adding product dialog -->

	<!-- add button clicked div -->

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
								<button type="button" class="btn btn-success medium" id="yesP">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noP">No</button>
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
	<script type="text/javascript" src="js/dist/sweetalert2.min.js"></script>
</body>

<script type="text/javascript">
	function enable(a) {
		$(a).prop("readonly", false);
		$(a).attr("style", "background-color: white;");

	}

	function update(a,id) {	
		var wsp=$("#proRow"+id+" :nth-child(4) input[type=text]").val();
		var mrp=$("#proRow"+id+" :nth-child(5) input[type=text]").val();
		var qty=$("#proRow"+id+" :nth-child(6) input[type=text]").val();
		var rate=$("#proRow"+id+" :nth-child(9) input[type=text]").val();
		
		var amount=Number(qty)*Number(rate);
		$.ajax({
			url:"getProdDetByPurchaseProdDetailsId",
			dataType:"json",
			data:{id:id},
			success:function(data){
				var outQty=data.quantity-data.remaining_quantity;	
				if(Number(qty)<Number(outQty)){
					$("#proRow"+id+" :nth-child(6) input[type=text]").val(data.quantity);
					$("#proRow"+id+" :nth-child(9) input[type=text]").val(data.cost);
					$(a).prop("readonly", true);
					$(a).attr("style", "background-color: grey;");	
					sweetAlert('Oops...',  outQty.toFixed(3)+data.uom+' product is already in use', 'error');
				} else if(Number(mrp)<Number(wsp)){
					$("#proRow"+id+" :nth-child(4) input[type=text]").val(data.wsp);
					$("#proRow"+id+" :nth-child(5) input[type=text]").val(data.mrp);
					$(a).prop("readonly", true);
					$(a).attr("style", "background-color: grey;");
					sweetAlert('Oops...', 'MRP can not be less than WSP', 'error');
				} else if(Number(mrp)<Number(rate)){
					$("#proRow"+id+" :nth-child(9) input[type=text]").val(data.cost);
					$("#proRow"+id+" :nth-child(5) input[type=text]").val(data.mrp);
					$(a).prop("readonly", true);
					$(a).attr("style", "background-color: grey;");
					sweetAlert('Oops...', 'MRP can not be less than Cost', 'error');
				} else if(Number(wsp)<Number(rate)){
					$("#proRow"+id+" :nth-child(9) input[type=text]").val(data.cost);
					$("#proRow"+id+" :nth-child(4) input[type=text]").val(data.wsp);
					$(a).prop("readonly", true);
					$(a).attr("style", "background-color: grey;");
					sweetAlert('Oops...', 'WSP can not be less than Cost', 'error');
				} else{
					$.ajax({
						url:"updatePurchaseproduct",
						dataType:"json",
						data:{
							id:id,
							qty:qty,
							cost:rate,
							wsp:wsp,
							mrp:mrp
						},
						success:function(data1){
							if(data1.error){
								$("#proRow"+id+" :nth-child(6) input[type=text]").val(data.quantity);
								$(a).prop("readonly", true);
								$(a).attr("style", "background-color: grey;");	
								sweetAlert('Oops...', 'prodct update failed....', 'error');
							}else{
								$(a).prop("readonly", true);
								$(a).attr("style", "background-color: pink;");		
								$("#proRow"+id+" :nth-child(10)").html(amount);		


								var sum=0.0;
								$( ".proTotCost" ).each(function( index ) {
									sum=sum+Number($( this ).html());
								});
								$("#subTotal").val(sum);
								updatePurchaseEntry();
							}
						}
					});
				}
			}			
		});	
	}

	function updatePe(a) {
		updatePurchaseEntry();

		$(a).prop("readonly", true);
		$(a).attr("style", "background-color: pink;");
	}
	
	function updatePurchaseEntry() {
		gtot();
		var st = $("#subTotal").val();
		st = st.replace(",", "");
		var scharge = $("#surcharge").val();
		var tcharge = $("#transportCost").val();
		var gt = $("#gt").val();
		var roundvalue = $("#roundvalue").val();

		$.ajax({
			url : "updatePurchaseEntry",
			dataType : "json",
			data : {
				id : $("#peId").val(),
				surCharge : scharge,
				trCharge : tcharge,
				gt:gt,
				roundvalue:roundvalue,
				st:st,
				discountValue : $("#discountValue").val(),
				taxAmount : $("#taxAmount").val(),
				profitValue : $("#profitValue").val()
			},
			success : function(data) {
				if (data.error) {					
					sweetAlert('Oops...', data.msg, 'error')
				} else {
					swal('Update', 'Data successfully saved!', 'success')
				}
			}

		});
	}	
	
	/**********for adding new product**********/
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
		ind = 0;	
	function emptyForm() {
			if ($("#pCode").val() == "") {
				getProductDetailsByProductCode(0);
			}
		}
	$(function() {
		$("#pCode")
				.autocomplete(
						{
							source : function(req, resp) {
								$.ajax({
									type : "post",
									url : "getProductbyProductCode",
									data : {
										code : req.term
									},
									dataType : "json",
									success : function(data) {
										resp($.map(data, function(item) {
											return ({
												value : item.code,
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
									$("#productCode").val("");
									getProductDetailsByProductCode(0);
								} else {
									$("#productCode").val(ui.item.id);
									getProductDetailsByProductCode(ui.item.id);
									$
											.ajax({
												url : "getLastPurchaseProductDetailsByProductId",
												dataType : "json",
												data : {
													pId : ui.item.id
												},
												success : function(data) {
													if (data != null) {
														$("#lotText")
																.val(
																		Number(data.lotNumber)
																				+ Number(1));
													} else {
														$("#lotText")
																.val(1);
													}
												}
											});
								}
							},
							select : function(event, ui) {
								if (ui.item != null) {
									$("#productCode").val(ui.item.id);
									getProductDetailsByProductCode(ui.item.id);
									$
											.ajax({
												url : "getLastPurchaseProductDetailsByProductId",
												dataType : "json",
												data : {
													pId : ui.item.id
												},
												success : function(data) {
													if (data != null) {
														$("#lotText")
																.val(
																		Number(data.lotNumber)
																				+ Number(1));
													} else {
														$("#lotText")
																.val(1);
													}
												}
											});
								} else {
									$(this).val("");
									$("#productCode").val("");
									getProductDetailsByProductCode(0);
								}

							}
						});
	});		
		
		$(document).ready(function() {
			$("#isSalable").val('no');
		});
		function getProductDetailsByProductCode(id1) {
			if (id1 != 0) {
				$.ajax({
					url : 'getProductDetailById',
					type : 'post',
					dataType : "json",
					data : {
						id : id1
					},
					success : function(data) {
						$("#dept").val(data.Department);
						$("#pCode").val(data.code);
						$("#productImage").attr('src',
								'data:image/jpeg;base64,' + data.aimage);
						if (data.isSaleble == 'true') {
							$("#wsp").attr("readonly", false);
							$("#mrp").attr("readonly", false);
							$("#isSalable").val('yes');
							$('#sale').prop("checked", "checked");
							
							$("#wspStar").html("WSP:<font color='red' size='4'>*</font>");
							$("#mrpStar").html("MRP:<font color='red' size='4'>*</font>");
						} else {
							$("#wsp").attr("readonly", true);
							$("#mrp").attr("readonly", true);
							$("#isSalable").val('no');
							$('#sale').removeProp("checked");
							
							$("#wspStar").html("WSP:");
							$("#mrpStar").html("MRP:");
						}
						$("#subDept").val(data.subDepartment);
						$("#cat").val(data.category);
						$("#pDesc").val(data.description);
						$("#uom").val(data.qtyUnit);
						if ((data.attrNmae1) != 'null') {
							$("#attr1Name").html(data.attrNmae1 + ":<font color='red' size='4'>*</font>");
							$("#attr1").prop("readonly", false);
						} else {
							$("#attr1Name").html("Attribute1:");
							$("#attr1").prop("readonly", true);
						}
						if ((data.attrNmae2) != 'null') {
							$("#attr2Name").html(data.attrNmae2 + ":<font color='red' size='4'>*</font>");
							$("#attr2").prop("readonly", false);
						} else {
							$("#attr2Name").html("Attribute2:");
							$("#attr2").prop("readonly", true);
						}
						if ((data.attrNmae3) != 'null') {
							$("#attr3Name").html(data.attrNmae3 + ":<font color='red' size='4'>*</font>");
							$("#attr3").prop("readonly", false);
						} else {
							$("#attr3Name").html("Attribute3:");
							$("#attr3").prop("readonly", true);
						}
						if ((data.attrNmae4) != 'null') {
							$("#attr4Name").html(data.attrNmae4 + ":<font color='red' size='4'>*</font>");
							$("#attr4").prop("readonly", false);
						} else {
							$("#attr4Name").html("Attribute4:");
							$("#attr4").prop("readonly", true);
						}
						if ((data.attrNmae5) != 'null') {
							$("#attr5Name").html(data.attrNmae5 + ":<font color='red' size='4'>*</font>");
							$("#attr5").prop("readonly", false);
						} else {
							$("#attr5Name").html("Attribute5:");
							$("#attr5").prop("readonly", true);
						}
						if ((data.attrNmae6) != 'null') {
							$("#attr6Name").html(data.attrNmae6 + ":<font color='red' size='4'>*</font>");
							$("#attr6").prop("readonly", false);
						} else {
							$("#attr6Name").html("Attribute6:");
							$("#attr6").prop("readonly", true);
						}
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
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
						$("#productCode").val(0);
					}
				});
				$("#wsp").val("");
				$("#mrp").val("");
				$("#rate").val("");
				$("#attr1").val("");
				$("#attr2").val("");
				$("#attr3").val("");
				$("#attr4").val("");
				$("#attr5").val("");
				$("#attr6").val("");
				$("#lotText").val("");
			} else {
				alert("please select one Product Code:");
				$("#wsp").val("");
				$("#mrp").val("");
				$("#rate").val("");
				$("#attr1").val("");
				$("#attr2").val("");
				$("#attr3").val("");
				$("#attr4").val("");
				$("#attr5").val("");
				$("#attr6").val("");
				$("#lotText").val("");
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
			
		}
		
		function rateF() {
			if ($("#rate").val() != "") {
				$("#rate").val(Number($("#rate").val()).toFixed(2));
			} else {
				$("#rate").val("");
			}
			if ($("#isSalable").val() == 'yes') {
				if ($("#wsp").val() != ""
						&& Number($("#rate").val()) > Number($("#wsp").val())) {
					alert("Rate should be less than or equals to WSP.");
					$("#rate").val("");
				} else if ($("#mrp").val() != ""
						&& Number($("#rate").val()) > Number($("#mrp").val())) {
					alert("Rate should be less than or equals to MRP.");
					$("#rate").val("");
				}
			}
		}

		function wspF() {
			if ($("#wsp").val() != "") {
				$("#wsp").val(Number($("#wsp").val()).toFixed(2));
			} else {
				$("#wsp").val("");
			}
			if ($("#isSalable").val() == 'yes') {
				if ($("#rate").val() == "") {
					alert("Please insert Rate first...");
					$("#wsp").val("");
				} else if (Number($("#rate").val()) > Number($("#wsp").val())) {
					alert("WSP should be greater than or equals to Rate.");
					$("#wsp").val("");
				} else if ($("#mrp").val() != ""
						&& Number($("#wsp").val()) > Number($("#mrp").val())) {
					alert("WSP should be less than or equals to MRP.");
					$("#wsp").val("");
				}
			}
		}

		function mrpF() {
			if ($("#mrp").val() != "") {
				$("#mrp").val(Number($("#mrp").val()).toFixed(2));
			} else {
				$("#mrp").val("");
			}
			if ($("#isSalable").val() == 'yes') {
				if ($("#rate").val() == "") {
					alert("Please insert Rate first...");
					$("#mrp").val("");
				} else if ($("#wsp").val() == "") {
					alert("Please insert WSP first...");
					$("#mrp").val("");
				} else if (Number($("#rate").val()) > Number($("#mrp").val())) {
					alert("MRP should be greater than or equals to Rate.");
					$("#mrp").val("");
				} else if (Number($("#wsp").val()) > Number($("#mrp").val())) {
					alert("MRP should be greater than or equals to WSP.");
					$("#mrp").val("");
				}
			}
		}
		
		
		var k = Number("${i}");
		function anotherShow() {			
			if ($("#productCode").val() == 0) {
				alert("please select Product Code:");
			} else if ($("#qty").val() == "") {
				alert("please insert quantity");
			} else if ($("#rate").val() == "") {
				alert("please insert Rate");
			} else if ($("#lotText").val() == "") {
				alert("please insert Lot no.");
			} else if ($("#isSalable").val() == 'yes' && $("#wsp").val() == "") {
				alert("please insert WSP");
			} else if ($("#isSalable").val() == 'yes' && $("#mrp").val() == "") {
				alert("please insert MRP");
			} else if (!$('#attr1').attr("readonly") && $("#attr1").val() == "") {
				alert("Please insert " + $("#attr1Name").html() + " value");
			} else if (!$('#attr2').attr("readonly") && $("#attr2").val() == "") {
				alert("Please insert " + $("#attr2Name").html() + " value");
			} else if (!$('#attr3').attr("readonly") && $("#attr3").val() == "") {
				alert("Please insert " + $("#attr3Name").html() + " value");
			} else if (!$('#attr4').attr("readonly") && $("#attr4").val() == "") {
				alert("Please insert " + $("#attr4Name").html() + " value");
			} else if (!$('#attr5').attr("readonly") && $("#attr5").val() == "") {
				alert("Please insert " + $("#attr5Name").html() + " value");
			} else if (!$('#attr6').attr("readonly") && $("#attr6").val() == "") {
				alert("Please insert " + $("#attr6Name").html() + " value");
			} else {
				$.ajax({
					url:"setPurchaseProduct",
					dataType:"json",
					data:{
						id:$("#peId").val(),
						attr1:$("#attr1").val(),
						attr2:$("#attr2").val(),
						attr3:$("#attr3").val(),
						attr4:$("#attr4").val(),
						attr5:$("#attr5").val(),
						attr6:$("#attr6").val(),
						
						proCode:$("#pCode").val(),
						mrp:$("#mrp").val(),
						rate:$("#rate").val(),
						wsp:$("#wsp").val(),
						qty:$("#qty").val(),
						lot:$("#lotText").val()
						
					},
					success:function(data){
						
						if(data.error){
							sweetAlert('Oops...', data.msg, 'error');
						}else{
							displayProductIntable(data.ppid);
						}
					},error:function(a,b,c){
						alert(JSON.stringify(a));
					}
				});					
			}
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

function displayProductIntable(ppid){	
	$("#purPro tbody")
			.append(
					'<tr class="trRemove" id="proRow'+ppid+'"><td>'
							+ k
							+ '</td><td>'
							+ $("#pCode").val()
							+ '</td><td>'
							+ $("#pDesc").val()
							+ '</td><td>'
							+'<input type="text" value="'+ $("#wsp").val()+'" style="background-color: gray;" readonly="readonly"	name="pprowsp"	onchange="update(this,\''+ppid+'\');"	ondblclick="enable(this);">'
							+ '</td><td>'
							+'<input type="text" value="'+ $("#mrp").val()+'" style="background-color: gray;" readonly="readonly"	name="ppromrp"	onchange="update(this,\''+ppid+'\');"	ondblclick="enable(this);">'
							+ '</td><td>'
							+'<input type="text" value="'+ $("#qty").val()+'" style="background-color: gray;" readonly="readonly"	name="pproqty"	onchange="update(this,\''+ppid+'\');"	ondblclick="enable(this);">'
							+ '</td><td>'
							+ 0
							+ '</td><td>'
							+ $("#uom").val()
							+ '</td><td>'
							+'<input type="text" value="'+ $("#rate").val()+'" style="background-color: gray;" readonly="readonly" name="pprocost"	onchange="update(this,\''+ppid+'\'});"	ondblclick="enable(this);">'
							+ '</td><td class="proTotCost">'
							+ Number($("#qty").val())
							* Number($("#rate").val())
							+ '</td>'+'</tr>');
	$("#subTotal").val(
			Math.round(Number($("#subTotal").val()) + Number($(
					"#qty").val())
					* Number($("#rate").val())));	
	k++;	
	ind++;

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

	updatePurchaseEntry();	
}

function lotNoKeyUpT() {
	$("#lotNoCheckT").val("");
	$.ajax({
		url : "getPurchaseProductDetailsByLotNumber",
		dataType : "json",
		data : {
			lotNo : $("#lotText").val()
		},
		success : function(data) {
			if (data.lotNo != "") {
				$("#lotNoCheckT").val(data.lotNo);
			} else {
				$("#lotNoCheckT").val("");
			}
		}

	});
}

function lotNoChangeT() {
	if ($("#lotNoCheckT").val() != "") {
		alert("Duplicate Lot Number");
		$("#lotNoCheckT").val("");
		$("#lotText").val("");
	}
}

function gtot() {
	if ($("#disType").val() == 'disPer') {
		$("#discountValue")
				.val(
						Math
								.round((Number($("#subTotal").val())
										* Number($("#discount").val()) / 100) * 100) / 100);
	} else {
		if (Number($("#discount").val()) > Number($("#subTotal").val())) {
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
								.round((Number(Number($("#subTotal")
										.val())
										- Number($("#discountValue")
												.val()))
										* Number($("#profitVal").val()) / 100) * 100) / 100);
	} else {
		$("#profitValue").val(
				Math.round(Number($("#profitVal").val()) * 100) / 100);
	}

	$("#taxAmount")
			.val(
					Math
							.round((Number(Number($("#subTotal").val())
									- Number($("#discountValue").val()))
									* Number($("#taxTot").val()) / Number(100)) * 100) / 100);
	
	$("#totalvalue").val(
			Math.round((Number($("#subTotal").val())
					- Number($("#discountValue").val())
					+ Number($("#taxAmount").val())
					+ Number($("#transportCost").val()) + Number($(
					"#surcharge").val())) * 100) / 100);

	var tot = $("#totalvalue").val();
	var round = Math.round(tot);
	$("#roundvalue").val(Math.round((round - tot) * 100) / 100);
	$("#gt").val(Math.round((round) * 100) / 100);
}
</script>
<script src="js/numericInput.min.js"></script>
<script>
		$(function() {
			$("#qty").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#mrp").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#wsp").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#rate").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
		});
	</script>
<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
	</script>
</html>
