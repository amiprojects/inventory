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
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
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
								<h3 style="margin-top: 11px;">Job Receive</h3>
							</div>
						</div>
						<div class="col-md-12">
							<div class="widget-area">
								<div class="col-md-12">
									<form id="jobform" action="jChallanSearch" method="post">
										<table>
											<tr>
												<td><h4>Enter Jobber Challan Id:</h4></td>
												<td>&nbsp;&nbsp;</td>
												<td width="380px"><input class="form-control"
													type="text" id="jChallan" name="jChallan"></td>
												<td>&nbsp;&nbsp;&nbsp;</td>
												<td><button type="button" class="btn btn-info btn-sm"
														onclick="jRec()">Go</button></td>
											</tr>
										</table>
									</form>
									<br> <br>
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>

									<hr width="100%">
								</div>
								<br> <br> <br> <br>
								<c:if test="${requestScope['amj']!=null}">
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
																Jobber Details:</p> <br>
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
														<td><p style="font-size: 18px; color: black;">
																Job Challan ID:</td>
														<td>&nbsp;</td>
														<td><p style="font-size: 17px; color: black;">
																<b>${jjjjj.challanNumber}</b>
															</p></td>

													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><p style="font-size: 18px; color: black;">
																Assigned Date:</p></td>
														<td>&nbsp;</td>
														<td><p style="font-size: 17px; color: black;">
																<b><fmt:formatDate value="${jjjjj.assignDate}"
																		pattern="dd-MM-yyyy" /></b>
															</p></td>

													</tr>
												</table>

											</div>
										</div>
										<div class="col-md-12">&nbsp;</div>

										<div class="col-md-12">


											<hr width="100%">
											<br> <br>
											<form action="jobRecieve" method="post">
												<input type="hidden" value="${requestScope['amj'].id}"
													name="jobAssignID">
												<table cellspacing="0" cellpadding="0" border="0"
													width="975">
													<tr>
														<td>
															<table cellspacing="0" cellpadding="1" border="1"
																width="900">
																<tr style="color: black; background-color: #f4f4f0">
																	<th style="text-align: center" width="5%">#</th>

																	<th width="15%" style="text-align: center">Product
																		Code</th>
																	<th width="15%" style="text-align: center">Product
																		Description</th>
																	<th width="10%" style="text-align: center">Quantity</th>
																	<th width="10%" style="text-align: center">UOM</th>
																	<th width="15%" style="text-align: center">Work</th>
																	<th width="10%" style="text-align: center">Remaining
																		Quantity</th>
																	<th width="20%" style="text-align: center">Quantity
																		Receive</th>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<div style="width: 960px; height: 360px; overflow: auto;">
																<table cellspacing="0" cellpadding="1" border="1"
																	width="900">

																	<c:set var="count" value="${1}" />

																	<c:forEach items="${jjjjj.jobAssignmentProducts}"
																		var="jobPro">
																		<tr>


																			<td style="text-align: center" width="5%">${count}</td>

																			<td width="15%" style="text-align: center">${jobPro.purchase_Product_Details.productDetail.code}</td>
																			<td width="15%" style="text-align: center">${jobPro.purchase_Product_Details.productDetail.description}</td>
																			<td width="10%" style="text-align: center"><span
																				id="qtty${jobPro.id}">${jobPro.qty}</span></td>
																			<td width="10%" style="text-align: center">${jobPro.purchase_Product_Details.productDetail.qtyUnit.name}</td>
																			<td width="15%" style="text-align: center">${jobPro.workDescription}</td>
																			<td width="10%"
																				style="text-align: center; padding: 2px"><span
																				id="remainQtyRe${jobPro.id}">${jobPro.remaninQty}</span></td>

																			<td width="20%"
																				style="text-align: center; padding: 4px"><input
																				type="number" class="form-control" value="0"
																				name="qtyRe${jobPro.id}" id="qtyRe${jobPro.id}"
																				onkeyup="qtySubtraction('${jobPro.id}');"
																				onchange="return0('${jobPro.id}');"></td>

																		</tr>
																	</c:forEach>
																	<c:set var="count" value="${count+1}" />
																</table>

															</div>
														</td>
													</tr>
												</table>
												<input type="hidden" name="remaining_qty" id="remaining_qty"
													required> <input type="hidden" name="receive_qty"
													id="remaining_qty" required> <input
													class="btn green pull-right" type="submit"
													style="float: right" value="Save">
											</form>
										</div>
									</div>
								</c:if>
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
<script type="text/javascript">
	function qtySubtraction(g) {

		if (Number($("#qtyRe" + g).val()) > Number($("#remainQtyRe" + g).html())) {
			$("#qtyRe" + g).val("0");
		}
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

	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy"
		});
	});

	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy"
		});
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
</script>

<c:if test="${requestScope['msg']!=''}">
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
</c:if>


</html>