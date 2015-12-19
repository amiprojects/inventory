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
			maxDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jAssign").attr("style", "color: red;");
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
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="widget-area">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Job Assignment</b>
											</p></li>
									</ul>
								</div>
								<div class="col-md-12">
									<form role="form" class="sec" method="post" id="jobForm"
										action="jobAssignment">
										<div class="widget-area">
											<div class="col-md-6">
												<div class="col-md-12"></div>
												<div class="col-md-12">
													<b class="font">Jobber Name :</b>
													<!-- <input type="text"
														class="form-control" id="jName" name="jName">
													<input type="hidden" id="jId" name="jId"> -->
													<select class="form-control" name="jName" id="jName"
														onchange="getDetailsByJobberName();" required="required">
														<option value="0">Select Jobber Name</option>
														<c:forEach
															items="${sessionScope['ejb'].getVendorsByVendorTypeJobber('Jobber')}"
															var="jobber">
															<option value="${jobber.id}">${jobber.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-12">

													&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
													<textarea rows="5" cols="" id="jDetail"
														class="form-control" readonly="readonly"></textarea>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Job Challan no :</label>
													<!-- <input
														type="text" placeholder="" id="jobChallanNo"
														class="form-control" name="jobChallanNo"> -->
													<c:set var="fy"
														value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
													<c:set var="cno"
														value="${sessionScope['ejb'].getLastJobChallanNumber()+1}" />
													<c:set var="csuf"
														value="${sessionScope['ejb'].getLastJobChallanSuffix()+1}" />
													<c:set var="suf" value="JOB" />
													<c:set var="bs"
														value="${sessionScope['ejb'].getLastBillSetupBySufix(suf)}" />
													<fmt:formatNumber value="${cno}" var="lastChNo"
														minIntegerDigits="4" groupingUsed="false" />
													<fmt:formatNumber value="${csuf}" var="lastSuf"
														minIntegerDigits="3" groupingUsed="false" />
													<fmt:formatDate
														value="${sessionScope['ejb'].getCurrentDateTime()}"
														pattern="MM" var="yr" />
													<input readonly="readonly" type="text" placeholder=""
														name="jobChallanNo" id="jobChallanNo" class="form-control"
														value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
													<input type="hidden" name="challanNo" value="${lastChNo}"
														id="challanNo"> <input type="hidden"
														name="challanSuffix" value="${lastSuf}">
												</div>
												<div class="form-group">

													<label for="" class="font">Asigned Date :</label> <input
														type="text" class="form-control" name="assignedDate"
														required="required" id="datepicker" readonly="readonly">
												</div>

												<br> <input type="button" class="btn green pull-right"
													data-toggle="modal" data-target="#addProduct"
													value="Add Product" style="width: 100%">
											</div>
											<div class='toast' style='display: none'>
												<h3 id="msg">${requestScope['msg']}</h3>
											</div>
										</div>
										<!-- <div class="widget-area">
											<input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%" onclick="manage();">
										</div> -->
										<table id="purProTable"
											class="table table-striped table-bordered">
											<thead style="background-color: #F0F0F0;">
												<tr>
													<th>#</th>
													<th>Product code</th>
													<th>Product Description</th>
													<th>Quantity</th>
													<th>UOM</th>
													<th>Work</th>
												</tr>
											</thead>
											<!-- <tbody>
												<tr>
													<td>1</td>
													<td>er65</td>
													<td>gfhg</td>
													<td>56</td>
													<td>kg</td>
													<td></td>
												<tr>
											</tbody> -->
										</table>
										<div class="row">
											<div class="col-md-2">
												<span>Total Products: </span>
											</div>
											<div class="col-md-5">
												<input type="text" readonly="readonly" class="form-control"
													id="totProd" name="totProd" value="0">
											</div>
											<div class="col-md-1">
												<span>Quantity: </span>
											</div>
											<div class="col-md-4">
												<input type="text" readonly="readonly" class="form-control"
													id="totQty" name="totQty" value="0">
											</div>
										</div>
										<!-- <div class="col-md-6">
											<b class="font">Estimated Submission Date :</b> <input
												type="text" class="form-control" name="estSubmissionDate"
												name="subDate" required="required" id="datepicker1"
												readonly="readonly">
										</div> -->
										<div class="widget-area" style="display: none;">
											<!-- <div class="widget-area" style="overflow-x: scroll;"> -->
											<table id="hiddenTable"
												class="table table-striped table-bordered">
												<thead style="background-color: #F0F0F0;">
													<tr>
														<th>Purchase Product Details id</th>
														<th>Qty</th>
														<th>Work Description</th>
													</tr>
												</thead>
											</table>
										</div>
										<br>
										<div class="row">
											<div class="col-md-3">
												<span>Estimated Submission Date: </span>
											</div>
											<div class="col-md-5">
												<input type="text" class="form-control"
													name="estSubmissionDate" required="required"
													id="datepicker1" readonly="readonly">
											</div>
											<div class="col-md-4">
												<input type="button" class="btn green pull-right"
													value="Save" onclick="submitForm();">
											</div>
										</div>
									</form>

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





	<div id="addProduct" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="close1" class="close">&times;</button>

				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<span>Product Code :</span> <select class="form-control"
								name="prodCode" id="prodCode"
								onchange="getProdDetByPurchaseProdDetId();" required="required">
								<option value="0">Select Product code</option>
								<c:forEach
									items="${sessionScope['ejb'].getPurchaseProductDetailsByQty()}"
									var="pCode">
									<option value="${pCode.id}">${pCode.productDetail.code}&nbsp;(<fmt:formatDate
											value="${pCode.purchase_Entry.purchase_date}"
											pattern="dd-MM-yy" />)
									</option>
								</c:forEach>
							</select><input type="hidden" id="prCode" name="prCode"> <input
								type="hidden" id="prDesc" name="prDesc">
						</div>
						<div class="col-md-6">
							<span>Barcode :</span><input type="text" name="barcode"
								class="form-control"
								onkeypress="Javascript: if (event.keyCode==13) fnsearch();">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<span>Product Description :</span>
							<textarea rows="5" cols="" readonly="readonly"
								class="form-control" id="prodDesc" name="prodDesc"></textarea>
						</div>
						<!-- <div class="col-md-4" style="float: right;">
							<span>Product Image :</span><br> <img alt=""
								src="img/Koala.jpg" height="115px">
						</div> -->
					</div>
					<span>Quantity :</span> <input type="text" id="qty" name="qty"
						class="form-control" onkeyup="checkQty();" required><input
						type="hidden" id="remQty" name="remQty"><input
						type="hidden" id="uom" name="uom"> <span>Describe
						Work :</span>
					<textarea rows="5" cols="" id="work" name="work"
						class="form-control" required></textarea>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" value="Add"
						data-toggle="modal" onclick="anotherShow();">
					<button type="button" class="btn btn-default" id="close">Close</button>
				</div>
			</div>

		</div>
	</div>
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
								<button type="button" class="btn btn-default" id="yesP">Yes</button>
								<button type="button" class="btn btn-default" id="noP">No</button>
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
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

		function getDetailsByJobberName() {
			if ($("#jName").val() != 0) {
				$.ajax({
					url : 'getJobberDetailsByName',
					type : 'post',
					dataType : "json",
					data : {
						id : $("#jName").val()
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
				alert("please select product code");
				$("prodCode#").val("");
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
		var i = 1;
		function anotherShow() {

			if ($("#prodCode").val() == 0) {
				alert("please select product code");
			} else if ($("#qty").val() == "") {
				alert("please insert Quantity");
			} else if ($("#work").val() == "") {
				alert("please insert work description");
			} else {

				$("#another").modal("show");
				$("#purProTable").append(
						'<tbody><tr><td>' + i + '</td><td>'
								+ $("#prCode").val() + '</td><td>'
								+ $("#prDesc").val() + '</td><td>'
								+ $("#qty").val() + '</td><td>'
								+ $("#uom").val() + '</td><td>'
								+ $("#work").val() + '</td></tr></tbody>');
				i++;
				$("#totProd").val(Number($("#totProd").val()) + Number(1));
				$("#totQty").val(
						Number($("#totQty").val()) + Number($("#qty").val()));

				$("#hiddenTable")
						.append(
								'<tbody><tr>'
										+ '<td><input type="text" name="pProdDetIdH" value=\''
										+ $("#prodCode").val()
										+ '\'></td>'
										+ '<td><input type="text" name="qtyH" value=\''
										+ $("#qty").val()
										+ '\'></td>'
										+ '<td><input type="text" name="workH" value=\''
										+ $("#work").val() + '\'></td>'
										+ '</tr></tbody>');
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
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>