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
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jSearch").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Job Search')}">
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

	<c:set var="jobAssi"
		value="${sessionScope['ejb'].getJobAssignmentById(requestScope['joId'])}" />

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
								<h3 style="margin-top: 11px;">Job Assign View</h3>


							</div>

							<div class="widget-area">
								<div class="col-md-12">
										<div class="col-md-6">

											<div class="col-md-12">
												<b class="font">Jobber Name :</b> <input readonly="readonly"
													type="text" placeholder="" name="" id=""
													class="form-control" value="${jobAssi.vendor.name}">

											</div>
											<div class="col-md-12">

												&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
												<textarea rows="5" cols="" id="" class="form-control"
													readonly="readonly">
													Address: ${jobAssi.vendor.address}
													Phone Number:${jobAssi.vendor.ph1}
													Email Number:${jobAssi.vendor.email}
													Company Name:${jobAssi.vendor.companyName}
														
														</textarea>

											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="" class="font">Job Challan no :</label> <input
													readonly="readonly" type="text"
													value="${jobAssi.challanNumber}" name="" id=""
													class="form-control">


											</div>
											<div class="form-group">

												<label for="" class="font">Asigned Date :</label> <input
													readonly="readonly" type="text" placeholder=""
													value=<fmt:formatDate
																			value="${jobAssi.assignDate}"
																			pattern="dd-MM-yyyy" />
													name="" id="" class="form-control">
											</div>
											<div class="form-group">

												<label for="" class="font">Final Submission Date :</label> <input
													readonly="readonly" type="text" placeholder=""
													value=<fmt:formatDate
																			value="${jobAssi.estimatedCompletionDate}"
																			pattern="dd-MM-yyyy" />
													name="" id="" class="form-control">
											</div>


										</div>

									<table id="" class=" table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Designer Number</th>
												<th>Product Description</th>
												<th>Quantity</th>
												<th>UOM</th>
												<th>Work</th>
												<th>Remaining Quantity</th>
												<th>Status</th>

											</tr>
										</thead>
										<c:set var="total" value="${total+jppL.remaninQty}" />
										<tbody>

											<c:set var="count" value="${1}" />
											<c:forEach var="jobp"
												items="${jobAssi.jobAssignmentProducts}">
												<tr>
													<td>${count}</td>
													<td>${jobp.purchase_Product_Details.productDetail.code}</td>
													<td>${jobp.purchase_Product_Details.productDetail.description}</td>
													<td>${jobp.qty}</td>
													<td>${jobp.purchase_Product_Details.productDetail.qtyUnit.name}</td>
													<td>${jobp.workDescription}</td>
													<td>${jobp.remaninQty}</td>
													<c:choose>
														<c:when test="${jobp.remaninQty==0}">
															<td><b>Complete</b></td>
														</c:when>
														<c:otherwise>
															<td><b>Process</b></td>
														</c:otherwise>
													</c:choose>
													<c:set var="count" value="${count+1}" />
													<c:set var="total" value="${total+jobp.qty}" />
													<c:set var="totalt" value="${totalt+jobp.remaninQty}" />
												</tr>
											</c:forEach>


											<tr>
												<td colspan="2">Total No. Of Items:
													<h4>${count-1}</h4>
												</td>
												<td></td>
												<td colspan="2">Total Quantity:
													<h4>${total}</h4>
												</td>
												<td></td>
												<td colspan="1">Total Remaining:
													<h4>${totalt}</h4>
												</td>
												<td></td>
											</tr>
										</tbody>
									</table>



									<br>


								</div>
							</div>
							<div class="widget-area">
								<div class="col-md-12">
									<div class="breadcrumbs"
										style="height: 50px; text-align: center;">
										<h3 style="margin-top: -13px; float: left;">Job Received
											Details:</h3>


									</div>
									<table id="" class=" table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>


												<th>Designer Number</th>
												<th>Product Description</th>
												<th>Receiving Quantity</th>
												<th>UOM</th>
												<th>Work</th>

												<th>Status</th>
												<th>Date</th>

											</tr>
										</thead>
										<tbody>


											<c:forEach var="jobp"
												items="${jobAssi.jobAssignmentProducts}">
												<c:forEach var="jobPreci" items="${jobp.jobRecievedDetails}">
													<tr>

														<td>${jobp.purchase_Product_Details.productDetail.code}</td>
														<td>${jobp.purchase_Product_Details.productDetail.description}</td>
														<td>${jobPreci.qtyRecieved}</td>
														<td>${jobp.purchase_Product_Details.productDetail.qtyUnit.name}</td>
														<td>${jobp.workDescription}</td>

														<c:choose>
															<c:when test="${jobp.remaninQty==0}">
																<td><b>Complete</b></td>
															</c:when>
															<c:otherwise>
																<td><b>Process</b></td>
															</c:otherwise>
														</c:choose>
														<td><fmt:formatDate value="${jobPreci.recievingDate}"
																pattern="dd-MM-yyyy" /></td>
													</tr>

												</c:forEach>

											</c:forEach>


										</tbody>
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<!-- <script>
		function submitForm() {
			if ($("#jName").val() == 0) {
				alert("please select jobber name");
			} else if ($("#datepicker").val() == "") {
				alert("please select Assigning date");
			} else if ($("#datepicker1").val() == "") {
				alert("please select Estimated submission date");
			} else {
				$("#jobForm").submit();
			}
		}
		$("#close").click(function() {
			$("#addProduct").modal("hide");
			$("#prodDesc").val("");
			$("#qty").val("");
			$("#work").val("");
			$("#prodCode").val("0");
		});

		$("#close1").click(function() {
			$("#addProduct").modal("hide");

		});

		function getProdDetByPurchaseProdDetId() {
			if ($("#prodCode").val() != 0) {
				$.ajax({
					url : 'getProdDetByPurchaseProdDetailsId',
					type : 'post',
					dataType : "json",
					data : {
						id : $("#prodCode").val()
					},
					success : function(data) {
						$("#prodDesc").val(
								"Remaining Quantity : "
										+ data.remaining_quantity
										+ "\nVendor Name : "
										+ data.purchaseVendorName
										+ "\nPurchase Date : "
										+ data.purchaseDate);
						$("#remQty").val(Number(data.remaining_quantity));
						$("#uom").val(data.uom);
						$("#prCode").val(data.productCode);
						$("#prDesc").val(data.productDesc);
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
					}
				});
			} else {
				alert("please select Designer Number");
				$("#prodDesc").val("");
			}
		}
		function fnsearch() {

			barcodeParts = $("[name='barcode']").val().split('/');
			var purchaseProductId = barcodeParts[0];
			$("#prodCode").val(purchaseProductId);
			$
					.ajax({
						url : 'getProdDetByPurchaseProdDetailsId',
						type : 'post',
						dataType : "json",
						data : {
							id : purchaseProductId
						},
						success : function(data) {
							$("#prodDesc").val(
									"Remaining Quantity : "
											+ data.remaining_quantity
											+ "\nVendor Name : "
											+ data.purchaseVendorName
											+ "\nPurchase Date : "
											+ data.purchaseDate);
							$("#remQty").val(Number(data.remaining_quantity));
							$("#uom").val(data.uom);
							$("#prCode").val(data.productCode);
							$("#prDesc").val(data.productDesc);
						},
						error : function(a, b, c) {
							alert(b + ": " + c);
						}
					});

		}

		function checkQty() {
			if ($("#qty").val() > $("#remQty").val()) {
				alert('Please enter less quantity than remaining');
				$("#qty").val("");
			}
		}
		ind = 0;
		function removeProduct(a) {
			$("#trRemove" + a).remove();
			$("#trRemoveH" + a).remove();
		}
		var i = 1;
		function anotherShow() {

			if ($("#prodCode").val() == 0) {
				alert("please select Designer Number");
			} else if ($("#qty").val() == "") {
				alert("please insert Quantity");
			} else if ($("#work").val() == "") {
				alert("please insert work description");
			} else {

				$("#another").modal("show");
				$("#purProTable")
						.append(
								'<tbody><tr id="trRemove'+ind+'"><td>'
										+ i
										+ '</td><td>'
										+ $("#prCode").val()
										+ '</td><td>'
										+ $("#prDesc").val()
										+ '</td><td>'
										+ $("#qty").val()
										+ '</td><td>'
										+ $("#uom").val()
										+ '</td><td>'
										+ $("#work").val()
										+ '</td><td>'
										+ '<a href="#" onclick="removeProduct('
										+ ind
										+ ');"><img src="img/cross.png" height="16px" width="16px"></a>'
										+ '</td></tr></tbody>');
				i++;
				$("#totProd").val(Number($("#totProd").val()) + Number(1));
				$("#totQty").val(
						Number($("#totQty").val()) + Number($("#qty").val()));

				$("#hiddenTable")
						.append(
								'<tbody><tr id="trRemoveH'+ind+'">'
										+ '<td><input type="text" name="pProdDetIdH" value=\''
										+ $("#prodCode").val()
										+ '\'></td>'
										+ '<td><input type="text" name="qtyH" value=\''
										+ $("#qty").val()
										+ '\'></td>'
										+ '<td><input type="text" name="workH" value=\''
										+ $("#work").val() + '\'></td>'
										+ '</tr></tbody>');
				ind++;
				$("#prodDesc").val("");
				$("#qty").val("");
				$("#work").val("");
				$("#prodCode").val("0");
			}
		}
		$("#yesP").click(function() {
			$("#another").modal("hide");
		});
		$("#noP").click(function() {
			$("#another").modal("hide");
			$("#addProduct").modal("hide");
		});
		function getDetailsByJobberName(id1) {
			if (id1 != 0) {
				$.ajax({
					url : 'getJobberDetailsByName',
					type : 'post',
					dataType : "json",
					data : {
						id : id1
					},
					success : function(data) {
						$("#jDetail").val(
								"Address :\n\t" + data.address + "\nPh1 : "
										+ data.ph1 + "\nPh2 : " + data.ph2);
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
					}
				});
			} else {
				alert("please select one jobber name");
				$("#jDetail").val("");
			}
		}
		function emptyForm() {
			if ($("#jId").val() == "") {
				getDetailsByJobberName(0);
			}
		}
		$(function() {
			$("#jId").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeJobberAndName",
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
						$("#jName").val("");
						getDetailsByJobberName(0);
					} else {
						$("#jName").val(ui.item.id);
						getDetailsByJobberName(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item != null) {
						$("#jName").val(ui.item.id);
						getDetailsByJobberName(ui.item.id);
					} else {
						$(this).val("");
						$("#jName").val("");
						getDetailsByJobberName(0);
					}

				}
			});
		});
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'jobAssign.jsp';
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});
	</script> -->
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
