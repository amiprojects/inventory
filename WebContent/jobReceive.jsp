<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<!-- tost msg -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminProduction' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Recieve')}">
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
	<c:if test="${requestScope['jobRcvId']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"JobReceiveChallan.jsp?id=${requestScope['jobRcvId']}",
							'name', 'width=600,height=400');
			myWindow.print();
		</script>
	</c:if>
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
								<h3 style="margin-top: 11px;">Job Receive</h3>
							</div>
						</div>
						<div class="col-md-12">
							<div class="widget-area">
								<div class="col-md-12">
									<form id="jobform" action="jChallanSearch" method="post">
										<!-- <table>
											<tr>
												<td><h4>Enter Jobber Challan Id:</h4></td>
												<td>&nbsp;&nbsp;</td>
												<td width="380px"><input class="form-control"
													type="text" id="jChallan" name="jChallan"></td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><button type="button" class="btn btn-info btn-sm"
														onclick="jRec()">Go</button></td>
											</tr>
										</table> -->

										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="" style="float: left;">Job challan no.
														:</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-1"
												style="margin-right: 0; padding-right: 0;">
												<input type="text" class="form-control" readonly="readonly"
													name="companyInitial"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('JOB').companyInitial}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<select class="form-control" name="fynYear">
													<c:forEach
														items="${sessionScope['ejb'].getAllFinancialForJob()}"
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
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('JOB').billType}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<input type="text" class="form-control" name="autoNum">
											</div>
											<div class="col-md-2"
												style="margin-left: 0; padding-left: 0;">
												<input type="text" class="form-control" name="suffix">
											</div>
											<div class="col-md-2">
												<button type="button" class="btn btn-info btn-sm"
													onclick="jRec()">Go</button>
											</div>
										</div>

									</form>
									<br> <br>
									<%-- <div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div> --%>
									<hr width="100%">

									<h3 align="center" style="color: #6a94ff;" id="msg">${requestScope['msg']}</h3>

									<hr width="100%">
								</div>
								<br> <br> <br> <br>
								<%-- <c:if test="${requestScope['amj']!=null}"> --%>
								<form action="jobRecieve" method="post" id="jobRcvForm">
									<div class="col-md-12" style="width: 100%;" id="jrecive">
										<div>
											<div class="col-md-6">

												<table>
													<tr>
														<c:set value="${requestScope['amj']}" var="jjjjj" />
														<td><p style="font-size: 18px; color: black;">
																Jobber Name:</p></td>

														<td><p style="font-size: 17px; color: black;">
																<b>${jjjjj.vendor.name}</b>
															</p></td>

													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><p style="font-size: 18px; color: black;">
																<u>Jobber Details:</u>
															</p> <br>
															<p style="font-size: 17px; color: black;">
																Email: <b>${jjjjj.vendor.email}</b>
															</p> <br>
															<p style="font-size: 17px; color: black;">
																Address:<b>${jjjjj.vendor.address}</b>
															</p>
													</tr>
												</table>

											</div>

											<div class="col-md-6">

												<table>
													<tr>
														<td><p style="font-size: 18px; color: black;">Job
																Challan ID: &nbsp;</td>
														<td width="242px"><input type="text"
															value="${jjjjj.challanNumber}" class="form-control"
															readonly="readonly" name="jobChallanNo"></td>

													</tr>
													<tr>
														<td><p style="font-size: 18px; color: black;">
																Assigned Date: &nbsp;</p></td>
														<td><c:if test="${requestScope['amj']!=null}">
																<input type="text" id="assgnDate"
																	value="<fmt:formatDate value="${jjjjj.assignDate}"
																	pattern="dd-MM-yyyy" />"
																	class="form-control" disabled="disabled">
															</c:if> <c:if test="${requestScope['amj']==null}">
																<input type="text" id="assgnDate" value="00-00-0000"
																	class="form-control" disabled="disabled">
															</c:if></td>

													</tr>
													<tr>
														<td><p style="font-size: 18px; color: black;">Job
																Rcv Challan No: &nbsp;</td>
														<td><c:set var="fy"
																value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
															<c:set var="cno"
																value="${sessionScope['ejb'].getLastJobReChallanNumber()+1}" />
															<c:set var="csuf"
																value="${sessionScope['ejb'].getLastJobReChallanSuffix()+1}" />
															<c:set var="suf" value="JOBR" /> <c:set var="bs"
																value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany(suf)}" />
															<fmt:formatNumber value="${cno}" var="lastChNo"
																minIntegerDigits="4" groupingUsed="false" /> <fmt:formatNumber
																value="${csuf}" var="lastSuf" minIntegerDigits="3"
																groupingUsed="false" /> <fmt:formatDate
																value="${sessionScope['ejb'].getCurrentDateTime()}"
																pattern="MM" var="yr" /> <input readonly="readonly"
															type="text" placeholder="" name="jobReChallanNo"
															id="jobChallanNo" class="form-control"
															value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
															<input type="hidden" name="challanNo" value="${lastChNo}"
															id="challanNo"> <input type="hidden"
															name="challanSuffix" value="${lastSuf}"></td>

													</tr>
													<tr>
														<td><p style="font-size: 18px; color: black;">
																Receiving Date:<font color="red" size="4">*</font>
																&nbsp;
															</p></td>
														<td><input type="text" value="" class="form-control"
															id="datepicker" readonly="readonly" name="rcvDate"></td>

													</tr>
												</table>

											</div>
										</div>
										<div class="col-md-12">&nbsp;</div>

										<div class="col-md-12">


											<hr width="100%">
											<br> <br> <input type="hidden"
												value="${requestScope['amj'].id}" name="jobAssignID">
											<table cellspacing="0" cellpadding="0" border="0" width="100%">
												<tr>
													<td>
														<table cellspacing="0" cellpadding="1" border="1"
															width="100%">
															<tr style="color: black; background-color: #f4f4f0">
																<th width="34%" style="text-align: center">Design
																	No. :
																	${requestScope['amj'].jobPlan.designCostSheet.designNumber}</th>
																<th width="33%" style="text-align: center">Total
																	Qty : <span id="totalSampleQty">${requestScope['amj'].jobPlan.qty}</span>
																</th>
																<th width="33%" style="text-align: center">Remaining
																	Qty : <span id="remSampleQty">${requestScope['amj'].jobPlan.qty*requestScope['amj'].jobAssignmentProducts.get(0).remaninQty/requestScope['amj'].jobAssignmentProducts.get(0).qty}</span>
																</th>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<table cellspacing="0" cellpadding="1" border="1"
															width="100%">
															<tr style="color: black; background-color: #f4f4f0">
																<th style="text-align: center" width="4%">#</th>

																<th width="7%" style="text-align: center">Pcode</th>
																<th width="10%" style="text-align: center">Product
																	Description</th>
																<th width="5%" style="text-align: center">Qty</th>
																<th width="8%" style="text-align: center">Remaining
																	Qty</th>
																<th width="6%" style="text-align: center">UOM</th>
																<th width="7%" style="text-align: center">Item</th>
																<th width="8%" style="text-align: center">Job</th>
																<th width="10%" style="text-align: center">Total
																	Job Qty</th>
																<th width="10%" style="text-align: center">Receiving
																	Sample Qty<font color="red" size="4">*</font>
																</th>
																<th width="10%" style="text-align: center">Receiving
																	Product Qty</th>
																<th width="10%" style="text-align: center">Select
																	Product<font color="red" size="4">*</font>
																</th>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<div style="width: 100%; height: 360px; overflow: auto;">
															<table cellspacing="0" cellpadding="1" border="1"
																width="100%">

																<c:set var="count" value="${1}" />

																<c:forEach items="${jjjjj.jobAssignmentProducts}"
																	var="jobPro">
																	<tr>
																		<td style="text-align: center" width="4%">${count}<input
																			type="hidden" id="jobPlanProductsId${jobPro.id}"
																			value="${jobPro.jobPlanProducts.id}"><input
																			type="hidden" id="jobAssgnProductsId${jobPro.id}"
																			value="${jobPro.id}"></td>

																		<td width="7%" style="text-align: center">${jobPro.jobPlanProducts.jobPlanProductStock.get(0).purchase_Product_Details.productDetail.code}</td>
																		<td width="10%" style="text-align: center">${jobPro.jobPlanProducts.jobPlanProductStock.get(0).purchase_Product_Details.productDetail.description}</td>
																		<td width="5%" style="text-align: center"><span
																			id="qtty${jobPro.id}">${jobPro.qty}</span></td>
																		<td width="8%"
																			style="text-align: center; padding: 2px"><span
																			id="prodRemQty${jobPro.id}">${jobPro.remaninQty}</span></td>
																		<td width="6%" style="text-align: center">${jobPro.jobPlanProducts.jobPlanProductStock.get(0).purchase_Product_Details.productDetail.qtyUnit.name}</td>
																		<td width="7%" style="text-align: center">${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobPro.productsForDesignCostSheet.id).itemDetails.name}</td>
																		<td width="8%" style="text-align: center"><c:forEach
																				items="${jobPro.jobAssignmentJobDetails}"
																				var="jobProjob">
																				${jobProjob.jobType.jobName}<hr>
																			</c:forEach></td>
																		<td width="10%" style="text-align: center"><c:forEach
																				items="${jobPro.jobAssignmentJobDetails}"
																				var="jobProjob">
																				<span id="remainQtyRe${jobProjob.id}">${jobProjob.qty}</span>
																				<hr>
																			</c:forEach></td>
																		<td width="10%"
																			style="text-align: center; padding: 4px"><c:if
																				test="${jobPro.remaninQty>0}">
																				<input type="text" class="form-control"
																					value="${requestScope['amj'].jobPlan.qty*requestScope['amj'].jobAssignmentProducts.get(0).remaninQty/requestScope['amj'].jobAssignmentProducts.get(0).qty}"
																					onkeyup="qtySubtractionSample('${jobPro.id}');"
																					id="sampleQtyRe${jobPro.id}">
																			</c:if> <c:if test="${jobPro.remaninQty==0}">
																				<input type="text" readonly="readonly"
																					class="form-control"
																					value="${requestScope['amj'].jobPlan.qty*requestScope['amj'].jobAssignmentProducts.get(0).remaninQty/requestScope['amj'].jobAssignmentProducts.get(0).qty}"
																					onkeyup="qtySubtractionSample('${jobPro.id}');"
																					id="sampleQtyRe${jobPro.id}">
																			</c:if></td>
																		<td width="10%"
																			style="text-align: center; padding: 4px"><c:forEach
																				items="${jobPro.jobAssignmentJobDetails}"
																				var="jobProjob">
																				<c:if test="${jobPro.remaninQty>0}">
																					<input type="hidden" class="form-control"
																						value="${jobProjob.qty}" name="qtyRe${jobPro.id}"
																						id="qtyRe${jobProjob.id}"
																						onkeyup="qtySubtraction('${jobProjob.id}');"
																						onchange="return0('${jobProjob.id}');">
																				</c:if>
																				<c:if test="${jobPro.remaninQty==0}">
																					<input type="hidden" class="form-control"
																						readonly="readonly"
																						value="${jobProjob.qty-jobProjob.qty}"
																						name="qtyRe${jobPro.id}" id="qtyRe${jobProjob.id}"
																						onkeyup="qtySubtraction('${jobProjob.id}');"
																						onchange="return0('${jobProjob.id}');">
																				</c:if>
																				<input type="hidden"
																					name="jobAssgnJobId${jobPro.id}"
																					value="${jobProjob.id}">
																				<!-- <hr> -->
																			</c:forEach> <c:if test="${jobPro.remaninQty>0}">
																				<input type="text" class="form-control"
																					id="prodQtyRe${jobPro.id}" readonly="readonly"
																					value="${jobPro.remaninQty}"
																					onkeyup="qtySubtractionProd('${jobPro.id}');">
																			</c:if> <c:if test="${jobPro.remaninQty==0}">
																				<input type="text" readonly="readonly"
																					class="form-control" id="prodQtyRe${jobPro.id}"
																					value="${jobPro.remaninQty}">
																			</c:if></td>

																		<td width="10%" style="text-align: center"><c:if
																				test="${jobPro.remaninQty>0}">
																				<input type="checkbox" class="isSelected"
																					id="isSelected${jobPro.id}"
																					name="isSelected${jobPro.id}"
																					onclick="isSelectedF(${jobPro.id});">
																			</c:if> <c:if test="${jobPro.remaninQty==0}">
																				<input type="checkbox" class="isSelected"
																					disabled="disabled" id="isSelected${jobPro.id}"
																					name="isSelected${jobPro.id}"
																					onclick="isSelectedF(${jobPro.id});">
																			</c:if></td>
																	</tr>
																	<c:set var="count" value="${count+1}" />
																</c:forEach>
															</table>

														</div>
													</td>
												</tr>
											</table>
											<hr>
											<table class="table table-striped table-bordered">
												<thead>
													<tr>
														<th>#</th>
														<th>Received Date</th>
														<th>Received challan no.</th>
														<th>Product Code</th>
														<th>Product Description</th>
														<th>Product Qty</th>
														<th>UOM</th>
													</tr>
												</thead>

												<c:set var="j" value="${1}"></c:set>
												<c:forEach var="jobReceive"
													items="${jjjjj.jobRecievedDetails}">

													<tbody>
														<tr>
															<td>${j}</td>
															<td><fmt:formatDate
																	value="${jobReceive.recievingDate}" pattern="dd-MM-yy" />
															</td>
															<td><a href="#"
																onclick="viewInvoice(${jobReceive.id});"><b>${jobReceive.challanNumber}</b><br>
																	<input type="button" class="btn btn-primary small"
																	value="Print"> </a></td>
															<td><c:forEach var="jobReceivedProd"
																	items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.code}
														<hr>
																</c:forEach></td>
															<td><c:forEach var="jobReceivedProd"
																	items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.description}
														<hr>
																</c:forEach></td>
															<td><c:forEach var="jobReceivedProd"
																	items="${jobReceive.jobRecieveProductsDetails}">														
													${jobReceivedProd.qtyReturn}
														<hr>
																</c:forEach></td>
															<td><c:forEach var="jobReceivedProd"
																	items="${jobReceive.jobRecieveProductsDetails}">																	
													${jobReceivedProd.jobPlanProducts.productsForDesignCostSheet.productDetail.qtyUnit.name}
														<hr>
																</c:forEach></td>
														</tr>
													</tbody>
													<c:set var="j" value="${j+1}" />
												</c:forEach>
											</table>
											<input type="hidden" name="remaining_qty" id="remaining_qty"
												required> <input type="hidden" name="receive_qty"
												id="remaining_qty" required> <input
												class="btn green pull-right" type="button"
												style="float: right" value="Save" onclick="saveF()">
										</div>
									</div>
								</form>
								<%-- </c:if> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- Script -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>
<script src="js/numericInput.min.js"></script>
<script type="text/javascript">
	function qtySubtraction(g) {

		if (Number($("#qtyRe" + g).val()) > Number($("#remainQtyRe" + g).html())) {
			$("#qtyRe" + g).val("0");
			alert("Receiving qty can not be more than Assigning qty.");
		}

		$("#qtyRe" + g).numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});
	}
	function qtySubtractionSample(g) {
		$("#prodQtyRe" + g).val(Number(Number($("#qtty" + g).html())*Number($("#sampleQtyRe" + g).val()))/Number($("#totalSampleQty").html()));
		qtySubtractionProd(g);
	}
	function qtySubtractionProd(g) {
		if (Number($("#prodQtyRe" + g).val()) > Number($("#prodRemQty" + g).html())) {
			$("#prodQtyRe" + g).val($("#prodRemQty" + g).html());
			$("#sampleQtyRe" + g).val($("#remSampleQty").html());
			alert("Receiving qty can not be more than Remaining qty.");
		}

		$("#prodQtyRe" + g).numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});
	}
	function return0(g) {
		if ($("#qtyRe" + g).val() == "") {
			$("#qtyRe" + g).val("0");
		}

	}

	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jR").attr("style", "color: #6a94ff;");
		/* $("#jrecive").hide(); */

		$("#qtyRe").val()

	});
	/* $(document).ready(function() {
		if ($('#msg').html() == "error: null") {
			$('#msg').html("Wrong challan number...");
		}
	}); */
	$(function() {
		$("#assgnDate").datepicker({
			dateFormat : "dd-mm-yy"
		});
		//$("#assgnDate").datepicker('setDate', new Date());
	});

	$(function() {
		var d = $("#assgnDate").datepicker('getDate');
		var n = d.getFullYear();
		var m = d.getMonth();
		var dt = d.getDate();
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, m, dt),
			maxDate : 0
		});
		$("#datepicker").datepicker('setDate', new Date());
	});

	function jRec() {
		$("#jobform").submit();
		/* $("#jrecive").show(); */

	}

	function getUrlVars() {
		var vars = {};
		var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
				function(m, key, value) {
					vars[key] = value;
				});
		return vars;
	}

	function isSelectedF(japId) {
		if ($('#isSelected'+japId).is(":checked")) {
			$("#jobAssgnProductsId"+japId).attr("name", "jobAssgnProductsId");
			$("#jobPlanProductsId"+japId).attr("name", "jobPlanProductsId");
			$("#prodQtyRe"+japId).attr("name", "prodQtyRe");
		}else{
			$("#jobAssgnProductsId"+japId).removeAttr("name");
			$("#jobPlanProductsId"+japId).removeAttr("name");
			$("#prodQtyRe"+japId).removeAttr("prodQtyRe");
		}
	}
	
	function saveF(){
		var i = 0;
	    $(".isSelected").each(function () {
	        if ($(this).is(':checked')) {
	            i = 1;
	        }
	    });
	    if (i == 0) {
	    	alert("No product found to receive...");
	    }else{
	    	$("#jobRcvForm").submit();
	    }
	}
</script>
<script type="text/javascript">
		function viewInvoice(id) {
			window.open("JobReceiveChallan.jsp?id=" + id, 'name',
					'width=900,height=700').print();
		}
</script>
<%-- <c:if test="${requestScope['msg']!=''}">
	<script>
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	</script>
</c:if>

<c:if test="${requestScope['amj']==null}">
	<script type="text/javascript">
		if (getUrlVars()['jChallan'] != null) {
			$('#msg').html("Invalid Challan number.");
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	</script>
</c:if> --%>


</html>
