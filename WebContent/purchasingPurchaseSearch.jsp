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
<link rel="stylesheet" href="css/scrollTable.css" type="text/css" />
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

			<c:if test="${page.name.equals('Purchase Search')}">
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
	<c:set var="compInfo"
		value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />
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
								<h3 style="margin-top: 11px;">Purchase Search</h3>
							</div>

							<div class="widget-area">
								<form role="form" class="sec" action="purchaseSearchAll"
									method="post">
									<div class="row">
										<div class="col-md-12">
											<button class="btn green pull-right" type="submit"
												style="margin-right: 63px;">Show All</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec" action="purchaseSearchByDate"
									method="post" id="purchaseSearchByDateId">
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">Search between
													two dates : (Start Date)<font color="red" size="4">*</font>
												</label> <input type="text" placeholder="Enter First Date"
													id="datepicker" class="form-control" name="fDate" value=""
													autocomplete="off" onchange="dateSet();">
											</div>
										</div>

										<div class="col-md-5">
											<div class="form-group">
												<label for="" style="float: left;">(End Date)<font
													color="red" size="4">*</font></label> <input type="text"
													placeholder="Enter last date" id="datepicker1"
													class="form-control" name="lDate" value=""
													autocomplete="off" onchange="checkDate();">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="button" onclick="purchaseSearchByDateSubmit();">Search</button>
										</div>
									</div>
								</form>

								<form role="form" class="sec"
									action="purchaseSearchByPurchaseChallanNo" method="post">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="" style="float: left;">Purchase challan
													no. :</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-1"
											style="margin-right: 0; padding-right: 0;">
											<input type="text" class="form-control" readonly="readonly"
												name="companyInitial"
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PUR', compInfo.id).companyInitial}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<select class="form-control" name="fynYear">
												<c:forEach
													items="${sessionScope['ejb'].getAllFinancialForPurchase()}"
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
												value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompanyId('PUR', compInfo.id).billType}">
										</div>
										<div class="col-md-2" style="margin: 0; padding: 0;">
											<input type="text" class="form-control" name="autoNum">
										</div>
										<div class="col-md-2" style="margin-left: 0; padding-left: 0;">
											<input type="text" class="form-control" name="suffix">
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" type="submit">Search</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByProductCode" method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Product Code:</label> <input
													type="" placeholder="Enter Product Code" id="prodCode"
													name="prodCode" class="form-control" autocomplete="off">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>
									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByVendorName" method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Vendor Name :</label> <input
													type="" placeholder="Enter Vendor Name" id="vendorName"
													name="vendorName" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>

									</div>
								</form>
								<form role="form" class="sec" action="purchaseSearchByAgentName"
									method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Agent (Direct)
													Name :</label> <input type=""
													placeholder="Enter Agent (Direct) Name" id="agentName"
													name="agentName" class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="submit">Search</button>
										</div>

									</div>
								</form>
								<form role="form" class="sec"
									action="purchaseSearchByViaAgentName"
									id="purchaseSearchByAgentNameForm" method="post">
									<div class="row">
										<div class="col-md-10">
											<div class="form-group">
												<label for="" style="float: left;">Agent (Via) Name
													:</label> <input type="text" placeholder="Enter Agent (Via) Name"
													id="VagentName" name="VagentName" class="form-control"><input
													type="hidden" id="VagentId" name="VagentId" value="0"
													class="form-control">
											</div>
										</div>
										<div class="col-md-2">
											<button class="btn green pull-left" style="margin-top: 25px;"
												type="button" onclick="purchaseSearchByViaAgentSubmit();">Search</button>
										</div>
									</div>
								</form>
								<br>
								<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
								<br>
								<div style=""></div>
								<table class="table table-fixedheader">
									<thead>
										<tr>
											<th width="2%">#</th>
											<th width="19%">Purchase challan no.</th>
											<th width="12%">Vendor Name</th>
											<th width="11%">Agent Name</th>
											<th width="15%">Vendor Bill no.</th>
											<th width="13%">Purchase Date</th>
											<th width="12%">Total Amount</th>
											<th width="8%">Barcode</th>
											<!-- <th width="4%"></th>
											<th width="4%"></th> -->
										</tr>
									</thead>
									<tbody style="height: 300px;">
										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['purEntryList']}"
											var="pEntryByD">
											<c:if test="${pEntryByD.vendor.name!='Production Vendor'}">
												<tr>
													<td width="2%">${count}</td>
													<td width="19%"><a href="#"
														onclick="viewInvoice(${pEntryByD.id});"><b>${pEntryByD.challanNumber}</b></a>
													</td>
													<c:if test="${pEntryByD.vendor.vendorType.type=='Vendor'}">
														<td width="12%">${pEntryByD.vendor.name}</td>
													</c:if>
													<c:if test="${pEntryByD.vendor.vendorType.type!='Vendor'}">
														<td width="12%">NIL</td>
													</c:if>
													<c:choose>
														<c:when
															test="${pEntryByD.vendor.vendorType.type=='Purchase Agent'}">
															<td width="11%">${pEntryByD.vendor.name}</td>
														</c:when>
														<c:when test="${pEntryByD.agentId!=0}">
															<td width="11%">${sessionScope['ejb'].getVendorById(pEntryByD.agentId).name}</td>
														</c:when>
														<c:otherwise>
															<td width="11%">NIL</td>
														</c:otherwise>
													</c:choose>
													<td width="15%">${pEntryByD.vendor_bill_no}</td>
													<td width="13%"><fmt:formatDate
															value="${pEntryByD.purchase_date}" pattern="dd-MM-yy" /></td>
													<td width="12%">${pEntryByD.totalCost}</td>
													<td width="8%"><a href="#"
														onclick="window.open('purchaseBarcodePrint.jsp?id=${pEntryByD.id}','mywindow','width=1100,height=500')">
															<img alt="click to view" src="Capture.PNG" height="20">
													</a></td>
													<td width="4%">
														<form action="purchaseView" method="post"
															id="pView${pEntryByD.id}">
															<a href="#" onclick="purchaseViewF('${pEntryByD.id}');"><input
																type="hidden" value="${pEntryByD.id}" name="pId"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
													<td width="4%">
														<form action="purchaseEdit" method="post">
															<input type="hidden" value="${pEntryByD.id}" name="pId">
															<input type="image" src="img/edit.png">
														</form> <%-- <form action="#" method="post">
															<input type="hidden" value="${pEntryByD.id}" name="pId">
															<input type="image" src="img/edit.png">
														</form> --%>
													</td>
												</tr>
												<c:set var="count" value="${count+1}" />
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Content Sec -->
	<!-- Page Container -->

	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#purch").attr("id", "activeSubMenu");
			$("#sPurchSearch").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
	</script>
	<script>
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
		function purchaseViewF(id) {
			$("#pView" + id).submit();
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
			$("#vendorName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeVendorAndName",
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
						$("#vendorName").val("");
					} else {
						$("#vendorName").val(ui.item.name);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#vendorName").val("");
					} else {
						$("#vendorName").val(ui.item.name);
					}

				}
			});
		});

		$(function() {
			$("#agentName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypePurchaseAgentAndName",
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

		function purchaseSearchByDateSubmit() {
			if ($("#datepicker").val() == "" || $("#datepicker1").val() == "") {
				alert("Please enter start date and end date");
			} else {
				$("#purchaseSearchByDateId").submit();
			}
		}
		
		function viewInvoice(id){
			window
			.open(
					"stockPurCha.jsp?id="+id,
					'name', 'width=900,height=700').print();
			
		}
		function purchaseSearchByViaAgentSubmit() {
			if ($("#VagentName").val() == "") {
				alert("Please enter agent name!");
			} else {
				$("#purchaseSearchByAgentNameForm").submit();
			}
		}
		$(function() {
			$("#VagentName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypePurchaseAgentAndName",
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
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#VagentName").val("");
						$("#VagentId").val("");
					} else {
						$("#VagentName").val(ui.item.value);
						$("#VagentId").val(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#VagentName").val("");
						$("#VagentId").val(0);
					} else {
						$("#VagentName").val(ui.item.value);
						$("#VagentId").val(ui.item.id);
					}

				}
			});
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
