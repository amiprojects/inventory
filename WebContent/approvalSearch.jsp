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

			<c:if test="${page.name.equals('Approval Search')}">
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
								<h3 style="margin-top: 11px;">Approval Search</h3>
							</div>
							<div class="widget-area">
								<div class="col-md-12">
									<form role="form" class="sec" action="approvalSearchAll"
										method="post">
										<div class="row">
											<div class="col-md-12">
												<button class="btn green pull-right" type="submit"
													style="margin-right: 63px;">Show All</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec" action="approvalSearchByDate"
										method="post" id="searchByDateId">
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
													onclick="searchByDateSubmit();">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="approvalSearchByChallanNumber" method="post">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label for="" style="float: left;">Approval bill
														no. :</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-1"
												style="margin-right: 0; padding-right: 0;">
												<input type="text" class="form-control" readonly="readonly"
													name="companyInitial"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('APPROVAL').companyInitial}">
											</div>
											<div class="col-md-2" style="margin: 0; padding: 0;">
												<select class="form-control" name="fynYear">
													<c:forEach
														items="${sessionScope['ejb'].getAllFinancialForApproval()}"
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
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany('APPROVAL').billType}">
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
										action="approvalSearchByAgentName" method="post">
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
										action="approvalSearchByCustomerName" method="post">
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
										action="approvalSearchByProductCode" method="post">
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
												<th>Total Amount</th>
											</tr>
										</thead>

										<c:set var="count" value="${1}" />
										<c:forEach items="${requestScope['approvalEntryLst']}"
											var="approvalEntry">
											<tbody>
												<tr>
													<td>${count}</td>
													<td><a href="#"
														onclick="viewInvoice(${approvalEntry.id});"><b>${approvalEntry.challanNumber}</b></a></td>
													<td>${approvalEntry.customer.name}</td>
													<c:choose>
														<c:when test="${approvalEntry.vendor==null}">
															<td>NIL</td>
														</c:when>
														<c:otherwise>
															<td>${approvalEntry.vendor.name}</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatDate
															value="${approvalEntry.approvalDate}" pattern="dd-MM-yy" /></td>
													<td>${approvalEntry.totalCost}</td>
													<td>
														<form action="approvalView" method="post"
															id="view${approvalEntry.id}">
															<a href="#"
																onclick="approvaolViewF('${approvalEntry.id}');"><input
																type="hidden" value="${approvalEntry.id}" name="id"><img
																alt="" src="images/eye.png" height="25px"></a>
														</form>
													</td>
												</tr>
											</tbody>
											<c:set var="count" value="${count+1}" />
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

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#approval").attr("id", "activeSubMenu");
			$("#approvalSearch").attr("style", "color: #6a94ff;");
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
		function approvaolViewF(id) {
			$("#view" + id).submit();
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
		
		function searchByDateSubmit() {
			if ($("#datepicker").val() == "" || $("#datepicker1").val() == "") {
				alert("Please enter start date and end date");
			} else {
				$("#searchByDateId").submit();
			}
		}
		function viewInvoice(id){			
			window
			.open(
					"approvalBillForPrint.jsp?id="+id,
					'name', 'width=900,height=700').print();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>