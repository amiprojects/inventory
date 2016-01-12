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
		$("#wspORmrp").val('mrpVal');
		$("#aDetailsDiv").hide();
	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	if (getUrlVars()['jChallan'] != null) {
		$('#msg').html("Invalid Challan number.");
		$('.toast').fadeIn(400).delay(3000).fadeOut(400);
	}
</script>
</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>

	<c:if test="${!sessionScope['user'].equals('admin')}">
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
							<h3 style="margin-top: 11px;">Sales Return</h3>

						</div>


						<div class="col-md-12" style="height: 800px;">
							<br> <br>
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
							</div>
							<div class='toast' style='display: none'>
								<h3 id="msg">${requestScope['msg']}</h3>
							</div>


							<c:if test="${requestScope['amS']!=null}">
								<div id="show">


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
														<td><input type="number" name="phone" id="phone"
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

												<br> <br>
												<div class="form-group">
													<label style="font-size: 15px" class="font">Sales
														Challan ID :</label> <input class="form-control" type="text"
														value="${salre.challanNumber}" name="salesDate" id=""
														readonly="readonly">

												</div>
												<div class="form-group">
													<label style="font-size: 15px" class="font">Date :</label>
													<input class="form-control" type="text" name="salesDate"
														value=<fmt:formatDate value="${salre.sales_date}"
																		pattern="dd-MM-yyyy" />
														id="" readonly="readonly">

												</div>
											</div>
										</div>
									</div>


									<div class="widget-area">


										<form action="goSalesReturn" method="post">
											<input type="hidden" value="${requestScope['amS'].id}"
												name="salesReID">
											<table class="table table-striped table-bordered">

												<thead>
													<tr>
														<th>#</th>
														<th>Product code</th>
														<th>Product Description</th>
														<th>Qty.</th>
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
															<td>${srr.purchase_Product_Details.productDetail.code}</td>
															<td>${srr.purchase_Product_Details.productDetail.description}</td>
															<td id="qtty${srr.id}">${srr.quantity}</td>
															<td id="qttyC${srr.id}">
																${srr.purchase_Product_Details.cost}</td>
															<td>${srr.quantity*srr.purchase_Product_Details.cost}
															</td>
															<td style="padding: 4px"><input id="rQtySa${srr.id}"
																type="text" class="form-control" style="width: 120px"
																name="rQtySa" onchange="qtySubtraction('${srr.id}')">
															</td>


															<td><input type="text" id="rQtyAm${srr.id}"
																class="form-control" style="width: 120px" name="rQtyAm"
																readonly="readonly"></td>
															<td style="padding: 4px"><input type="text"
																class="form-control" name="rQtyDe" style="width: 120px"></td>


														</tr>
													</tbody>

													<%-- <c:set var="tota" value="${tota+}" /> --%>
												</c:forEach>
												<c:set var="count" value="${count+1}" />

											</table>
										</form>
									</div>

									<div style="width: 40%; float: right;">
										<input type="hidden" id="totalvalue" name="totalvalue"
											value="0">
										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<td colspan="2" id="sub">Subb Total :</td>
													<td><input type="number" class="form-control"
														readonly="readonly" id="subtotalvalue"
														name="subtotalvalue" value="0"></td>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td colspan="2">Discount &nbsp; <select name="disType"
														id="disType" disabled="disabled">
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

													<td><input type="number" class="form-control"
														id="discount" name="discount" readonly="readonly"
														value="<fmt:formatNumber value="${dis}" maxFractionDigits="2" />"></td>
												</tr>

											</tbody>



											<tbody>
												<tr>
													<td colspan="2" id="disc">Discount Value:</td>
													<td><input type="number" class="form-control"
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
													<td colspan="2" id="trans">Transport charge :</td>
													<td><input type="number" class="form-control"
														value="${salre.transportcCharge}" id="transcharge"
														name="transcharge"></td>

												</tr>
											</tbody>

											<tbody>
												<tr>
													<td colspan="2" id="sur">Surcharge :</td>
													<td><input type="number" class="form-control"
														value="${salre.surcharge}" id="surcharge" name="surcharge"></td>

												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2" id="round">Round Of :</td>
													<td><input type="number" class="form-control"
														placeholder="" readonly="readonly" id="roundvalue"
														name="roundvalue" value=""></td>
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
														<div class="modal-footer"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
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
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
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


	<script type="text/javascript">
		function sReturn() {
			$("#sReturnF").submit();
			/* $("#jrecive").show(); */

		}
	</script>


	<c:if test="${requestScope['msg']!=''}">
		<script>
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		</script>
	</c:if>

	<c:if test="${requestScope['amS']==null}">
		<script type="text/javascript">
			if (getUrlVars()['challanNumber'] != null) {
				alert("dfdf");
				$('#msg').html("Invalid Challan number.");
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		</script>
	</c:if>
	<script type="text/javascript">
		function qtySubtraction(g) {

			if (Number($("#rQtySa" + g).val()) <= Number($("#qtty" + g).html())) {
				$("#rQtyAm" + g).val(
						Number($("#rQtySa" + g).val())
								* Number($("#qttyC" + g).html()));
				$("#subtotalvalue").val(
						Number($("#rQtyAm" + g).val())
								+ Number($("#subtotalvalue").val()));

			}

			else {

				alert("returning quanty is less than sasles quantity");
				$("#rQtySa" + g).val("0");

			}

			if ($("#disType option:selected").val() == 'disPer') {

				$("#discountValue2")
						.val(
								Math
										.round((Number($("#subtotalvalue")
												.val())
												* Number($("#discount").val()) / 100) * 100) / 100);
			} else {

				$("#discountValue2").val($("#discount").val());

			}

			$("#taxAmount2").val(
					Number($("#taxTot").val())
							* Number($("#subtotalvalue").val()) / 100);
			var r = Number($("#subtotalvalue").val())
					+ Number($("#transcharge").val())
					+ Number($("#taxAmount2").val())
					- Number($("#discountValue2").val())
					+ Number($("#surcharge").val());

			$("#grandtotal").val(r.toFixed());

			
			$("#roundvalue").val((Number(r)-Number($("#grandtotal").val())).toFixed(2));
			/* $("#roundvalue").val(); */
		}
	</script>



</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
