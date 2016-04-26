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
<!-- TOAST -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">

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
		$("#sSalesReturn").attr("style", "color: #6a94ff;");

	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
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

			<c:if test="${page.name.equals('Sales Return')}">
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

	<c:if test="${requestScope['salRetDetIdforPC']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"salesReturnInvoiceForPrint.jsp?id=${requestScope['salRetDetIdforPC']}",
							'name', 'width=600,height=400');
			myWindow.print();
		</script>
	</c:if>

	<c:set var="compInfo"
		value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />


	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Sales Return</h3>

						</div>


						<div class="col-md-12" style="height: 800px;">
							<%-- <br> <br>
							<div align="center" class="col-md-12">
								<form method="get" action="goSalesReturn" id="sReturnF">
									<table>
										<tr>
											<td><h4>Enter Sales Challan Id:</h4></td>
											<td>&nbsp;&nbsp;</td>
											<td width="380px"><input class="form-control"
												type="text" id="challanNumber" name="challanNumber"></td>
											<td>&nbsp;&nbsp;&nbsp;</td>
											<td><button type="button" class="btn btn-info btn-sm"
													onclick="sReturn()">Go</button></td>
										</tr>
									</table>
								</form>

								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
							</div> --%>


							<div class="col-md-12">
								<form role="form" class="sec" action="goSalesReturn"
									method="post">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="" style="float: left;">Sales challan
													no.:</label>

											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-1"
											style="margin-right: 0; padding-right: 0;">
											<input type="text" class="form-control" readonly="readonly"
												name="companyInitial"
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('INV', compInfo.id).companyInitial}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<select class="form-control" name="fynYear">
												<c:forEach
													items="${sessionScope['ejb'].getAllFinancialForSales()}"
													var="fyr">
													<option value="${fyr}">${fyr}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<!-- <input type="text" class="form-control" name="month"> -->
											<select name="month" class="form-control">
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</div>
										<div class="col-md-1" style="margin: 0; padding: 0;">
											<input type="text" class="form-control" readonly="readonly"
												name="billType"
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('INV', compInfo.id).billType}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<input type="text" class="form-control" name="autoNum">
										</div>
										<div class="col-md-2" style="margin-left: 0; padding-left: 0;">
											<input type="text" class="form-control" name="suffix">
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" type="submit">Go</button>
										</div>
									</div>
								</form>
								<hr width="100%">

								<h3 align="center" style="color: #6a94ff;" id="msg">${requestScope['msg']}</h3>

								<hr width="100%">
							</div>






							<c:if test="${requestScope['amS']!=null}">

								<div id="show">

									<form action="salesReturnServlet" method="post"
										id="salesReturnForm">

										<div class="row">
											<div class="col-md-6">
												<div class="widget-area"
													style="height: 270px; padding: 4px 5px;">
													<div style="background-color: lightgrey; padding: 3px 3px;">
														<span class="head_style">Bill To:</span>
													</div>
													<table>

														<c:set value="${requestScope['amS']}" var="salre" />


														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>Customer Name :</td>
															<td>&nbsp;</td>
															<td><input type="text" name="custName" id="custName"
																readonly="readonly" class="form-control"
																value="${salre.customer.name}" style="align: center;"></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>Customer mobile :</td>
															<td>&nbsp;</td>
															<td><input type="text" name="addr" id="addr"
																readonly="readonly" class="form-control"
																value="${salre.customer.mobile}" style="length: 40px;"
																style="align:center;"></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>Agent Name :</td>
															<td>&nbsp;</td>
															<td><input type="text" name="city" id="city"
																value="${salre.vendor.name}" readonly="readonly"
																class="form-control" style="length: 40px;"></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>Agent phone number :</td>
															<td>&nbsp;</td>
															<td><input type="text" name="phone" id="phone"
																readonly="readonly" class="form-control"
																value="${salre.vendor.ph1}" style="length: 40px;"></input></td>
														</tr>
													</table>
												</div>
											</div>

											<div class="col-md-6">
												<div class="widget-area"
													style="height: 270px; padding: 5px 3px;">
													<div style="background-color: lightgrey; padding: 3px;">
														<span class="head_style">Invoice Details:</span>
													</div>



													<!-- ************************************************Bill Generator************************************** -->
													<div class="form-group" style="padding-top: 18px;">
														<label style="font-size: 15px" class="font">Sales
															return Vouture no. :</label>
														<c:set var="fy"
															value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
														<c:set var="cno"
															value="${sessionScope['ejb'].getLastSalesReturnChallanNumber()+1}" />
														<c:set var="csuf"
															value="${sessionScope['ejb'].getLastSalesRChallanSuffix()+1}" />
														<c:set var="suf" value="SRINV" />
														<c:set var="bs"
															value="${sessionScope['ejb'].getLastBillSetupBySufix(suf)}" />
														<fmt:formatNumber value="${cno}" var="lastChNo"
															minIntegerDigits="4" groupingUsed="false" />
														<fmt:formatNumber value="${csuf}" var="lastSuf"
															minIntegerDigits="3" groupingUsed="false" />
														<fmt:formatDate
															value="${sessionScope['ejb'].getCurrentDateTime()}"
															pattern="MM" var="yr" />
														<input readonly="readonly" type="text"
															name="challanNumber" class="form-control"
															value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
														<input type="hidden" name="challanNo" value="${lastChNo}"
															id="challanNo"> <input type="hidden"
															name="challanSuffix" value="${lastSuf}">
													</div>

													<!-- ********************************************value="${salre.challanNumber}***************************************************************** -->

													<div class="form-group">
														<label style="font-size: 15px" class="font">
															Reference Number:</label> <input class="form-control" type="text"
															value="${salre.challanNumber}" name="saslesRChallanRId"
															id="saslesChallanId" readonly="readonly">

													</div>


													<div class="form-group" style="width: 50%; float: left">
														<label style="font-size: 15px" class="font">Sale
															Date :</label> <input class="form-control" type="text"
															value='<fmt:formatDate value="${salre.sales_date}" pattern="dd-MM-yyyy"/>'
															name="salesDate" id="datepickerQu" readonly="readonly">

													</div>

													<div class="form-group" style="width: 50%; float: left">
														<label style="font-size: 15px" class="font">Return
															Date :</label> <input class="form-control" type="text"
															name="salesReturnDate" id="datepicker22"
															readonly="readonly">

													</div>
												</div>
											</div>
										</div>


										<div class="widget-area">





											<input type="hidden" value="${requestScope['amS'].id}"
												name="salesReID">
											<table class="table table-striped table-bordered"
												id="example" cellspacing="0" width="100%">

												<thead>
													<tr>
														<th>#</th>
														<th>Product code</th>
														<th>Product Description</th>
														<th>Quantity</th>
														<th>Remaining Quantity</th>
														<th><c:choose>
																<c:when test="${salre.MRP}">
																	<b> MRP</b>
																</c:when>
																<c:otherwise>
																	<b>WSP</b>
																</c:otherwise>
															</c:choose>/Qty</th>
														<th>Total Price</th>
														<th>Quantity Return</th>
														<th>Amount Return</th>
														<th>Drawback</th>


													</tr>
												</thead>
												<c:set var="count" value="${1}" />
												<c:set value="${0}" var="tota" />
												<c:forEach items="${salre.salesProductDetails}" var="srr">
													<tbody>
														<tr>

															<td>${count}</td>
															<td>${srr.purchase_Product_Details.productDetail.code}

																<input type="hidden" name="salesProductDetailsID"
																value="${srr.id}">
															</td>
															<td>${srr.purchase_Product_Details.productDetail.description}</td>
															<td id="qtty${srr.id}">${srr.quantity}</td>
															<td id="qtttyR${srr.id}">${srr.quantity-srr.salesReQty}</td>
															<td id="qttyC${srr.id}"><c:choose>
																	<c:when test="${salre.MRP}">
																		${srr.purchase_Product_Details.mrp}
																	</c:when>
																	<c:otherwise>
																		${srr.purchase_Product_Details.wsp}
																	</c:otherwise>
																</c:choose></td>
															<td><c:choose>
																	<c:when test="${salre.MRP}">																		
																			${srr.quantity*srr.purchase_Product_Details.mrp}
																	</c:when>
																	<c:otherwise>
																		${srr.quantity*srr.purchase_Product_Details.wsp}
																	</c:otherwise>
																</c:choose></td>
															<td style="padding: 4px"><input id="rQtySa${srr.id}"
																value="0" type="text" class="form-control rQty"
																style="width: 120px" name="rQtySa"
																onchange="qtySubtraction('${srr.id}')"></td>


															<td><input type="text" id="rQtyAm${srr.id}"
																value="0" class="form-control rQtyAm"
																style="width: 120px" name="rQtyAm" readonly="readonly"></td>

															<td style="padding: 4px"><input type="text"
																id="drabackIid" class="form-control" name="rQtyDe"
																style="width: 120px"></td>

															<c:set
																value="${tota+srr.quantity*srr.purchase_Product_Details.cost}"
																var="tota" />
														</tr>
													</tbody>

													<c:set var="count" value="${count+1}" />
												</c:forEach>


											</table>

											<input type="hidden" value="${tota}" id="totalCostSales">



											<table class="table table-striped table-bordered"
												id="example" cellspacing="0" width="100%">

												<thead>
													<tr>
														<th>#</th>
														<th>Return Date</th>
														<th>Sales Return challan no.</th>
														<th>Product Code</th>
														<th>Product Description</th>
														<th>Returning Qty</th>
														<th>Drawback</th>
													</tr>
												</thead>

												<c:set var="j" value="${1}"></c:set>
												<c:forEach var="salesReturn" items="${salre.salesReturn}">

													<tbody>
														<tr>
															<td>${j}</td>
															<td><fmt:formatDate
																	value="${salesReturn.returnDate}" pattern="dd-MM-yy" />
															</td>
															<td><a href="#"
																onclick="viewInvoiceS(${salesReturn.id});"><b>${salesReturn.challanNumber}</b><br>
																	<input type="button" class="btn btn-primary small"
																	value="Print"></a></td>
															<td><c:forEach var="salesReturnProd"
																	items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.salesProductDetails.purchase_Product_Details.productDetail.code}
														<hr>

																</c:forEach></td>
															<td><c:forEach var="salesReturnProd"
																	items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.salesProductDetails.purchase_Product_Details.productDetail.description}
														<hr>

																</c:forEach></td>

															<td><c:forEach var="salesReturnProd"
																	items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.qtyReturn}
														<hr>

																</c:forEach></td>
															<td><c:forEach var="salesReturnProd"
																	items="${salesReturn.salesProductReturnDetail}">
														
													${salesReturnProd.fault}
														<hr>

																</c:forEach></td>
														</tr>
													</tbody>
													<c:set var="j" value="${j+1}" />
												</c:forEach>

											</table>



										</div>
										<div style="width: 40%; float: right;">
											<input type="hidden" id="totalvalue" name="totalvalue"
												value="0">
											<table id="stream_table"
												class="table table-striped table-bordered">
												<thead>
													<tr>
														<td colspan="2" id="sub">Subb Total :</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="subtotalvalue"
															name="subtotalvalue" value="0"></td>
													</tr>
												</thead>
												<tbody>

													<tr>
														<td colspan="2">Discount &nbsp; <select
															name="disType" id="disType" disabled="disabled">
																<c:choose>
																	<c:when test="${salre.isFlatDiscount()==true}">
																		<option value="disFlat">Flat</option>
																		<c:set var="dis" value="${salre.discountValue}"></c:set>
																	</c:when>
																	<c:otherwise>
																		<option value="disPer">%</option>
																		<c:set var="dis" value="${salre.discountValue}"></c:set>
																	</c:otherwise>
																</c:choose>
														</select>
														</td>

														<td><input type="text" class="form-control"
															id="discount" name="discount" readonly="readonly"
															value="<fmt:formatNumber value="${dis}" maxFractionDigits="2" />">
														</td>
													</tr>

												</tbody>
												<tbody>
													<tr>
														<td colspan="2" id="disc">Discount Value:</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="discountValue2"
															name="discountValue2"></td>
													</tr>

												</tbody>
												<tbody>
													<tr>
														<td><select class="form-control" id="taxGroup"
															name="taxGroup" disabled="disabled">
																<option>${salre.tax_Type_Group.name}</option>
														</select></td>
														<td>%</td>
														<td><input type="text" class="form-control"
															readonly="readonly"
															value="${salre.tax_Type_Group.getTotalTaxValue()}"
															id="taxTot"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2">Tax Amount :</td>
														<td><input type="text" class="form-control"
															readonly="readonly" value="0" id="taxAmount2"></td>
													</tr>
												</tbody>
												<tbody>
													<tr>
														<td colspan="2" id="round">Round Off :</td>
														<td><input type="text" class="form-control"
															readonly="readonly" id="roundvalue" name="roundvalue"
															value=""></td>
													</tr>
												</tbody>
												<thead>
													<tr>
														<td colspan="2" id="grand">Grand Total :</td>
														<td><input type="text" class="form-control"
															onchange="crditno()" readonly="readonly" id="grandtotal"
															name="grandtotal"></td>
													</tr>
												</thead>
											</table>
											<div style="float: right;">
												<input type="button" onclick="cancelF();"
													class="btn btn-danger small" value="Cancel"
													data-toggle="modal"> <input type="button"
													class="btn btn-info btn-sm" data-toggle="modal"
													value="Save" onclick="paymentDate();">
												<div id="saveSales" class="modal fade" role="dialog"
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
																			<div class="sec" id="pTypeDiv">
																				<div class="col-md-5">Payment type :</div>
																				<div class="col-md-7">
																					<select class="form-control" id="pType"
																						name="pType" readonly="readonly"
																						onchange="pTypeFunc()">
																						<c:forEach
																							items="${sessionScope['ejb'].getAllPaymentType()}"
																							var="payType">
																							<c:if test="${payType.getType()=='Debit Note'}">
																								<option value="${payType.getType()}">${payType.getType()}</option>
																							</c:if>
																						</c:forEach>
																					</select>
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

																					<div id="AMi2">
																						<c:set value="${0}" var="totCr" />
																						<c:set value="${0}" var="totDb" />
																						<c:forEach
																							items="${salre.customer.voucherAssign.voucherDetails}"
																							var="k">
																							<c:choose>
																								<c:when test="${k.isCredit().equals(true)}">
																									<c:set var="totCr" value="${totCr+k.value}" />
																								</c:when>
																								<c:otherwise>
																									<c:set var="totDb" value="${totDb+k.value}" />
																								</c:otherwise>
																							</c:choose>
																						</c:forEach>
																						<c:set value="${totDb-totCr}" var="totDb" />

																						<div>
																							<div class="col-md-5">Total debit Note :</div>
																							<div class="col-md-7">
																								<input type="text" id="tcn" name="tcn"
																									class="form-control" readonly="readonly"
																									value="${totDb}">
																							</div>
																						</div>
																						<div>
																							<div class="col-md-5">Total Bill Value :</div>
																							<div class="col-md-7">
																								<input type="text" class="form-control"
																									readonly="readonly" id="tbv" name="tbv"
																									value="0">
																							</div>
																						</div>
																						<div>
																							<div class="col-md-5">
																								<span id="dORc">Final Debit/Credit Note :
																								</span>
																								<!--  Amount Deduction : -->
																							</div>
																							<div class="col-md-7">
																								<input type="text" class="form-control"
																									readonly="readonly" id="aDed" name="aDed">
																							</div>
																						</div>
																						<div>
																							<div class="col-md-5">Payment Date :</div>
																							<div class="col-md-7">
																								<input type="text" id="datepickerB"
																									name="payDate" class="form-control"
																									readonly="readonly">
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
																			<br>
																			<div class="breadcrumbs">
																				<button type="button" class="btn green pull-right"
																					onclick="submitRet();">Save</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="modal-footer"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" name="salesentryid" value="${salre.id}">

										<input type="hidden" name="customerId"
											value="${salre.customer.id}">
									</form>
								</div>
							</c:if>
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
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.fixedHeader.min.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>


	<script type="text/javascript">
		function sReturn() {
			$("#sReturnF").submit();
		}
	</script>


	<c:if test="${requestScope['msg']!=''}">
		<script>
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		</script>
	</c:if>

	<script type="text/javascript">
		function qtySubtraction(g) {

			if (Number($("#rQtySa" + g).val()) <= Number($("#qtttyR" + g)
					.html())) {
				$("#rQtyAm" + g).val(
						Number($("#rQtySa" + g).val())
								* Number($("#qttyC" + g).html()));
				var sum = 0;
				$(".rQtyAm").each(function() {
					sum += parseFloat(this.value);
				});
				$("#subtotalvalue").val(sum.toFixed(2));
			}

			else {

				alert("returning quanty is less than sasles quantity");
				$("#rQtySa" + g).val("0");
				$("#rQtyAm" + g).val("0");

			}

			if ($("#disType option:selected").val() == 'disPer') {

				$("#discountValue2").val(
						(Number($("#subtotalvalue").val())
								* Number($("#discount").val()) / 100)
								.toFixed(2));
			} else {

				$("#discountValue2").val(
						(Number($("#subtotalvalue").val())
								* Number($("#discount").val()) / Number($(
								"#totalCostSales").val())).toFixed(2));

			}

			$("#taxAmount2").val(
					Number($("#taxTot").val())
							* Number($("#subtotalvalue").val()) / 100);
			var r = Number($("#subtotalvalue").val())
					+ Number($("#taxAmount2").val())
					- Number($("#discountValue2").val());
			$("#grandtotal").val(Math.floor(r));

			var va = Math.floor(r);
			var vi = (r - va).toFixed(2);
			$("#roundvalue").val(vi);
		}

		function cancelF() {

			alert(Math.floor(2.9));
		}
	</script>

	<script type="text/javascript">
		function paymentDate() {
			var count = $('#example tbody').length;

			var chk = 0;
			$(".rQty").each(function() {
				if (this.value != 0 && this.value != "") {
					chk = chk + 1;
				}
			});

			if (count < 1 || chk < 1) {
				alert("No product found to return.");
			} else if ($("#drabackIid").val() == "") {
				alert("please enter the draw back");
			} else {
				$("#saveSales").modal("show");
				$("#tbv").val($("#grandtotal").val());
				//$("#aDed").val(Number($("#tbv").val()) - Number($("#tcn").val()));
				if (Number($("#tcn").val()) > Number($("#tbv").val())) {
					$("#dORc").html("Final Debit Note :");
					$("#aDed").val(
							(Number($("#tcn").val()) - Number($("#tbv").val()))
									.toFixed(2));
				} else {
					$("#dORc").html("Final Credit Note :");
					$("#aDed").val(
							(Number($("#tbv").val()) - Number($("#tcn").val()))
									.toFixed(2));
				}
			}
		}
	</script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				minDate : 0
			});
			$("#datepicker").datepicker('setDate', new Date());
		});
	</script>


	<script type="text/javascript">
		function submitRet() {
			$("#salesReturnForm").submit();
		}
	</script>




	<script type="text/javascript">
		$(function() {
			if ($(document).find("#datepickerQu").length > 0) {
				var dte = $("#datepickerQu").val();
				var d = dte.split('-');
				var n = d[2];
				var m = d[1];
				var dt = d[0];
				$("#datepicker22").datepicker({
					dateFormat : "dd-mm-yy",
					minDate : new Date(n, m - 1, dt),
					maxDate : 0
				});
				$("#datepicker22").datepicker('setDate', new Date());
			}

		});

		$(function() {
			if ($(document).find("#datepicker22").length > 0) {
				var d = $("#datepicker22").datepicker('getDate');
				var n = d.getFullYear();
				var m = d.getMonth();
				var dt = d.getDate();
				$("#datepickerB").datepicker({
					dateFormat : "dd-mm-yy",
					minDate : new Date(n, m, dt),
					maxDate : 0
				});
				$("#datepickerB").datepicker('setDate', new Date());
			}
		});

		$(function() {
			if ($(document).find("#datepicker22").length > 0) {
				var d = $("#datepicker22").datepicker('getDate');
				var n = d.getFullYear();
				var m = d.getMonth();
				var dt = d.getDate();
				$("#datepickerA").datepicker({
					dateFormat : "dd-mm-yy",
					minDate : new Date(n, m, dt),
					maxDate : 0
				});
				$("#datepickerA").datepicker('setDate', new Date());
			}
		});
		function viewInvoiceS(id){		
			window
			.open(
					"salesReturnInvoiceForPrint.jsp?id="+id,
					'name', 'width=900,height=700').print();
		}
	</script>


</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
