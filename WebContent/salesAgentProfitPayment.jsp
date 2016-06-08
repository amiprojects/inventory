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
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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

			<c:if test="${page.name.equals('Sales Search')}">
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
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Sales Agent Profit Payment</h3>
							</div>
							<div class="widget-area">
								<div class="col-md-12">
									<form role="form" class="sec" action="salesSearchAllForAgent"
										method="post">
										<div class="row">
											<div class="col-md-12">
												<button class="btn green pull-right" type="submit"
													style="margin-right: 63px;">Show All</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchByDateForAgent" method="post"
										id="salesSearchByDateId">
										<div class="row">
											<div class="col-md-5">
												<div class="form-group">
													<label for="">Search between two dates : (Start
														Date)<font color="red" size="4">*</font>
													</label> <input type="text" placeholder="Enter First Date"
														id="datepicker" class="form-control" name="fDate"
														autocomplete="off" onchange="dateSet();">
												</div>
											</div>
											<div class="col-md-5">
												<div class="form-group">
													<label for="">(End Date)<font color="red" size="4">*</font></label>
													<input type="text" placeholder="Enter last date"
														id="datepicker1" class="form-control" name="lDate"
														autocomplete="off" onchange="checkDate();">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="button"
													onclick="salesSearchByDateSubmit();">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchBySalesChallanNoForAgent" method="post">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="" style="float: left;">Sales challan
														no. :</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-1"
												style="margin-right: 0; padding-right: 0;">
												<input type="text" class="form-control" readonly="readonly"
													name="companyInitial"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('INV').companyInitial}">
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
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('INV').billType}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<input type="text" class="form-control" name="autoNum">
											</div>
											<div class="col-md-2"
												style="margin-left: 0; padding-left: 0;">
												<input type="text" class="form-control" name="suffix">
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left" type="submit">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchByAgentNameForAgent" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Agent Name :</label> <input
														type="" placeholder="Enter Agent Name" id="agentName"
														name="agentName" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>

										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchByCustomerNameForAgent" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Customer Name :</label>
													<input type="" placeholder="Enter Customer Name"
														id="custoName" name="custoName" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>

										</div>
									</form>
									<form role="form" class="sec"
										action="salesSearchByProductCodeForAgent" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Product code :</label> <input
														type="" placeholder="Enter Product code" id="prodCode"
														name="prodCode" class="form-control" autocomplete="off">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>
										</div>
									</form>
									<br>
									<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
									<br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Sales challan no.</th>
												<th>Customer Name</th>
												<th>Agent Name</th>
												<th>Sales Date</th>
												<th>Profit</th>
												<th>(-)Profit</th>
											</tr>
										</thead>

										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['salesEntryLst']}"
											var="sEntryByD">
											<c:if test="${sEntryByD.vendor!=null}">
												<tbody>
													<tr>
														<td>${count}</td>
														<td><a href="#"
															onclick="viewInvoiceS(${sEntryByD.id});"><b>${sEntryByD.challanNumber}</b></a></td>
														<td>${sEntryByD.customer.name}</td>
														<c:choose>
															<c:when test="${sEntryByD.vendor==null}">
																<td>NIL</td>
															</c:when>
															<c:otherwise>
																<td>${sEntryByD.vendor.name}</td>
															</c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${sEntryByD.sales_date}"
																pattern="dd-MM-yy" /></td>
														<td>${sEntryByD.agentProfitTotal}</td>
														<td><c:set var="mProdit" value="${0}" /> <c:forEach
																var="sReturn" items="${sEntryByD.salesReturn}">
																<c:set var="mProdit"
																	value="${mProdit+sReturn.retAgentProfitTotal}" />
															</c:forEach>${mProdit}</td>
														<td style="display: none;"><c:if
																test="${sessionScope['ejb'].getPaymentDetails4ViaAgentBySalesEntryId(sEntryByD.id).size()>0}">
																<c:set
																	value="${sessionScope['ejb'].getPaymentStatusById(sessionScope['ejb'].getPaymentDetails4ViaAgentBySalesEntryId(sEntryByD.id).get(0).paymentStatusId).status}"
																	var="Status"></c:set>
															</c:if> <c:if
																test="${sessionScope['ejb'].getPaymentDetails4ViaAgentBySalesEntryId(sEntryByD.id).size()==0}">
																<c:set value="Not Paid" var="Status"></c:set>
															</c:if> <span id="status${sEntryByD.id}">${Status}</span></td>
														<td><c:set var="totPaybleCost"
																value="${sEntryByD.agentProfitTotal}" /> <c:forEach
																var="salesRet" items="${sEntryByD.salesReturn}">
																<c:set var="totPaybleCost"
																	value="${totPaybleCost-salesRet.retAgentProfitTotal}" />
															</c:forEach>
															<form action="" method="post"
																id="agentPayment${sEntryByD.id}">
																<a href="#"
																	onclick="agentPaymentOCF('${sEntryByD.id}','${sEntryByD.challanNumber}','${totPaybleCost}','${sEntryByD.vendor.id}');"><input
																	type="hidden" value="${sEntryByD.challanNumber}"
																	name="salesChallan"> <span
																	style="color: #6a94ff;"><u> Payment</u></span></a>
															</form></td>
														<td>
															<form action="salesView" method="post"
																id="sView${sEntryByD.id}">
																<a href="#" onclick="salesViewF('${sEntryByD.id}');"><input
																	type="hidden" value="${sEntryByD.id}" name="sId"><img
																	alt="" src="images/eye.png" height="25px"></a>
															</form>
														</td>
													</tr>
												</tbody>
												<c:set var="count" value="${count+1}" />
											</c:if>
										</c:forEach>
									</table>
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

	<div id="agentPayModal" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						Agent Payment details for Sales : <span id="salesChallan"></span>
					</h4>
				</div>
				<div class="modal-body">
					<table id="paymentDetailsTable" class="table">
						<thead>
							<tr>
								<th>Payment date</th>
								<th>Payment method</th>
								<th>Payment description</th>
								<th>Paid Amount</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<b style="float: left;"><span>Current Due : </span><span
						id="dueAmount"></span></b> <input type="button" value="Pay"
						id="payButton" onclick="payButtonOCF();"
						class="btn green pull-right" disabled="disabled">
				</div>
			</div>
		</div>
	</div>
	<form role="form" class="sec" method="post" id="paymentForm"
		action="salesAgentPayment">
		<div id="paymentModal" class="modal fade" role="dialog"
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
											<li><a title="">Select Payment status : <input
													type="hidden" name="uniqueNo"
													value="${sessionScope['ejb'].getLastUniqueNoOfPayDet4ViaAgent()+1}"></a></li>
										</ul>
									</div>
									<br> <br> <br>
									<div class="row">
										<div class="col-md-5">
											Payment status :<font color="red" size="4">*</font>
										</div>
										<div class="col-md-7">
											<div class="sec">

												<select class="form-control" id="pstatus" name="pstatus"
													onchange="pStatusDiv()">
													<option value="-" selected="selected">---</option>
													<c:forEach
														items="${sessionScope['ejb'].getAllPaymentStatus()}"
														var="payStatus">
														<%-- <c:if test="${payStatus.status!='Not Paid'}"> --%>
														<option value="${payStatus.status}">${payStatus.status}</option>
														<%-- </c:if> --%>
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
												<div class="col-md-5">
													Payment type :<font color="red" size="4">*</font>
												</div>
												<div class="col-md-7">
													<select class="form-control" id="pType" name="pType"
														onchange="pTypeFunc()">
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
													<input type="text" id="datepicker2" class="form-control"
														readonly="readonly" name="payDate">
												</div>
											</div>
											<div id="pAmount">
												<div class="col-md-5">Full Amount :</div>
												<div class="col-md-7">
													<input type="text" class="form-control" readonly="readonly"
														id="spAmount" name="spAmount">
												</div>
											</div>
											<div id="pPayAmount">
												<div class="col-md-5">
													Payment Amount :<font color="red" size="4">*</font>
												</div>
												<div class="col-md-7">
													<input type="text" class="form-control" value="0"
														id="spPaymentAmount" name="spPaymentAmount"
														onkeyup="spPaymentAmountFunc();" autocomplete="off"
														onchange="spPaymentAmountDecimalFixF();">
												</div>
											</div>
											<div id="pDueAmount">
												<div class="col-md-5">Due Amount :</div>
												<div class="col-md-7">
													<input type="text" class="form-control" readonly="readonly"
														id="spDueAmount" name="spDueAmount">
												</div>
											</div>
											<div id="AMi2">
												<div>
													<div class="col-md-5">Current Credit Note :</div>
													<div class="col-md-7">
														<input type="text" id="totalCredit" name="totalCredit"
															class="form-control" readonly="readonly" value="0">
													</div>
												</div>
												<div>
													<div class="col-md-5">
														<span id="dORc">Final Credit Note :</span>
													</div>
													<div class="col-md-7">
														<input type="text" class="form-control" id="finalDC"
															name="finalDC" readonly="readonly" value="0">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6" style="float: right;" id="description">
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
											<textarea rows="" cols="" class="form-control" id="desc"
												name="desc"></textarea>
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
		<input type="hidden" id="aId" name="aId"> <input type="hidden"
			id="seId" name="seId"><input type="hidden"
			id="voucherDetailSize" name="voucherDetailSize">
	</form>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sales").attr("id", "activeSubMenu");
			$("#sSalesAgentProfitPayment").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
	</script>
	<script>
		$(function() {
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		function salesViewF(id) {
			$("#sView" + id).submit();
		}
		function dateSet() {
			var dt = $("#datepicker").datepicker('getDate');
			var dt1 = $("#datepicker1").datepicker('getDate');
			if ($("#datepicker1").val() != "" && dt > dt1) {
				alert("Start date must be can not be later than end date...");
				$("#datepicker").val("");
			}
		}
		function checkDate() {
			var d = $("#datepicker").datepicker('getDate');
			var d1 = $("#datepicker1").datepicker('getDate');
			if ($("#datepicker").val() != "" && d > d1) {
				alert("End date can not be before than start date...");
				$("#datepicker1").val("");
			}
		}

		$(function() {
			$("#prodCode").autocomplete({
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
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#prodCode").val("");						
					} else {
						$("#prodCode").val(ui.item.code);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#prodCode").val("");
					} else {
						$("#prodCode").val(ui.item.code);
					}

				}
			});
		});

		$(function() {
			$("#agentName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeSalesAgentAndName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
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
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#agentName").val("");
					} else {
						$("#agentName").val(ui.item.name);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#agentName").val("");
					} else {
						$("#agentName").val(ui.item.name);
					}

				}
			});
		});

		$(function() {
			$("#custoName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getCustomerByName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
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
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#custoName").val("");
					} else {
						$("#custoName").val(ui.item.name);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#custoName").val("");
					} else {
						$("#custoName").val(ui.item.name);
					}

				}
			});
		});
		
		function salesSearchByDateSubmit() {
			if ($("#datepicker").val() == "" || $("#datepicker1").val() == "") {
				alert("Please enter start date and end date");
			} else {
				$("#salesSearchByDateId").submit();
			}
		}
		function viewInvoiceS(id){			
			window
			.open(
					"stockSaCha.jsp?id="+id,
					'name', 'width=900,height=700').print();
		}
		function agentPaymentOCF(id, challanNo, totPC, agentId) {			
			$("#aId").val(agentId);
			$("#seId").val(id);
			$.ajax({
				url : "getAllVoucherDetails4ViaAgentBySalesEntryId",
				type : "post",
				dataType : "json",
				data : {
					id : id
				},
				success : function(data) {
					$("#voucherDetailSize").val(data.voucherDetailSize);
				}
			});
			$.ajax({
				type : "post",
				url : "getCurrentCreditNote4ViaAgentByAgentId",
				data : {
					id : agentId
				},
				dataType : "json",
				success : function(data) {
					$("#totalCredit").val(data.currentCreditNote);
				}
			});
			if($("#status"+id).html()=="Not Paid"){
				$("#dueAmount").html(Number(totPC).toFixed(2));		
				if(Number(totPC)>0){
					$("#payButton").removeAttr("disabled");
				}else{
					$("#payButton").attr("disabled","disabled");
				}
			}			
			$("#salesChallan").html(challanNo+" (Total Payable: "+Number(totPC).toFixed(2)+" Rs.)");				
			$.ajax({
				type : "post",
				url : "getPaymentDetails4ViaAgentBySalesEntryId",
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					$("#paymentDetailsTable tbody").empty();
					var totalPaid=0;
					$.each(data, function(index, item) {
							$("#paymentDetailsTable").append('<tbody><tr><td>'+formatDate(item.paymentDate)+'</td><td>'+item.paymentMethod+'</td><td>'+item.paymentDescription+'</td><td>'+item.paymentAmount+'</td></tr></tbody>');							
							totalPaid=totalPaid+item.paymentAmount;
					});
					$("#dueAmount").html(Number(Number(totPC)-Number(totalPaid)).toFixed(2));
					if(Number(Number(totPC)-Number(totalPaid))==0){
						$("#payButton").attr("disabled","disabled");
					}else{
						$("#payButton").removeAttr("disabled");
					}
				},
				error : function(a, b, c) {
					alert(a + b + c);
				}
			});
			$("#agentPayModal").modal("show");
		}
		function formatDate(d) {
			var dateparts = d.split(" ");
			return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
		}
	</script>
	<script src="js/numericInput.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#payDetail").hide();
		$("#description").hide();
		$("#AMi2").hide();
	});
	
	function payButtonOCF(){
		$("#paymentModal").modal("show");
	}
	
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
		if (val == '-') {
			alert('Please select Payment status...');
			$("#payDetail").hide();
			$("#description").hide();
			$("#AMi2").hide();
			$("#pType").val("-");
		} else if (val == 'Not Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pAmount").hide();
			$("#pDate").hide();
			$("#pTypeDiv").hide();
			$("#pDueAmount").show();
			$("#description").show();
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number(0));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			finalCreditFunc();
		} else if (val == 'Full Paid') {
			$("#pType").val("-");
			$("#pPayAmount").hide();
			$("#pDueAmount").hide();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#AMi2").hide();
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
		} else if (val == 'Semi Paid') {
			$("#pType").val("-");
			$("#pPayAmount").show();
			$("#pDueAmount").show();
			$("#pAmount").show();
			$("#pDate").show();
			$("#pTypeDiv").show();
			$("#description").hide();
			$("#spAmount").val(Number($("#dueAmount").html()));
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);

			$("#AMi2").show();
			finalCreditFunc();
		}
	}
	function spPaymentAmountFunc() {
		if (Number($("#spPaymentAmount").val()) > Number($("#spAmount").val())) {
			alert("Payment amount can not be greater than full amount...");
			$("#spPaymentAmount").val(Number($("#dueAmount").html()));
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);			
		} else {
			$("#spDueAmount").val(
					Math.round((Number($("#spAmount").val()) - Number($(
							"#spPaymentAmount").val())) * 100) / 100);
		}
		finalCreditFunc();				
	}
	function finalCreditFunc(){
		if($("#voucherDetailSize").val()==0){
			$("#finalDC").val(
					Math.round((Number($("#spDueAmount").val()) + Number($(
							"#totalCredit").val())) * 100) / 100);
		}else{
			$("#finalDC").val(
					Math.round((Number($("#totalCredit").val())- Number($("#spPaymentAmount").val())) * 100) / 100);
		}
	}
	function spPaymentAmountDecimalFixF() {
		$("#spPaymentAmount").val(
				Number($("#spPaymentAmount").val()).toFixed(2));
		spPaymentAmountFunc();
	}
	function pTypeFunc() {
		$("#description").show();
		var val = $('[name="pType"]').val();
		if (val == '-') {
			alert('Please select Payment Type...');
			$("#description").hide();
		}
	}	
	$(function() {		
		$("#spPaymentAmount").numericInput({
			allowFloat : true,
			allowNegative : false,
		});
	});
	function submit() {
		document.getElementById("paymentForm").submit();
	}
	$(function() {
		var d = new Date();
		var m = d.getMonth();
		if (m > 3) {
			var n = d.getFullYear();
		} else {
			var n = d.getFullYear() - 1;
		}
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy"
		});
		$("#datepicker2").datepicker('setDate', new Date());
	});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>