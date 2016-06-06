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
	function showDatePicker() {
		var d = $("#datepicker").datepicker('getDate');
		var n = d.getFullYear();
		var m = d.getMonth();
		var dt = d.getDate();
		$(".estSubmDate").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, m, dt)
		});
	}

	$(function() {
		var d = new Date();
		var m = d.getMonth();
		if (m > 3) {
			var n = d.getFullYear();
		} else {
			var n = d.getFullYear() - 1;
		}
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, 3, 1),
			maxDate : 0
		});
		$("#datepicker").datepicker('setDate', new Date());
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
		$("#jAssign").attr("style", "color: #6a94ff;");
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
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminProduction' || sessionScope['user']=='adminKainat')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Assignment')}">
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


	<%-- <c:if test="${requestScope['jobasfoPaDeN']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"jobChallan1ForPrint.jsp?id=${requestScope['jobasfoPaDeN']}&print=${requestScope['print']}",
							'name', 'width=600,height=400');
			
			myWindow.print();
			
		</script>
		
	</c:if> --%>

	<c:if test="${requestScope['jobAssignId']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"JobChalanForAssignment.jsp?id=${requestScope['jobAssignId']}",
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
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Job Assignment For Particular
									Design Number</h3>
							</div>

							<!-- <div class="widget-area"> -->


							<div class="col-md-12">
								<form role="form" class="sec" method="post"
									id="jobAssignmentForParticularDesignNumber"
									action="jobAssignmentForParticularDesignNumber">
									<div class="widget-area">
										<div class="col-md-6">
											<div class="col-md-12"></div>
											<div class="col-md-12">
												<b class="font">Jobber Name :<font color="red" size="4">*</font></b>
												<input type="text" class="form-control" id="jId" name="jId"
													onchange="emptyForm();" autocomplete="off"> <input
													type="hidden" id="jName" name="jName">
											</div>
											<div class="col-md-12">

												&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
												<textarea rows="5" cols="" id="jDetail" class="form-control"
													readonly="readonly"></textarea>

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
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany(suf)}" />
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
												<label for="" class="font">Asigned Date :<font
													color="red" size="4">*</font></label> <input type="text"
													class="form-control" name="assignedDate"
													required="required" id="datepicker" readonly="readonly">
											</div>

											<div class="form-group">
												<label for="" class="font">Design No. :<font
													color="red" size="4">*</font></label> <input type="text"
													class="form-control" name="dNo" required="required"
													id="dNo" autocomplete="off"> <input type="hidden"
													id="dId" name="dId">
											</div>

											<div class="form-group">
												<label for="" class="font">Qty :<font color="red"
													size="4">*</font></label> <input type="text" class="form-control"
													name="qty" required="required" id="qty" onkeyup="qtyF();"
													onchange="qtyFC();">
											</div>

											<!-- <br> <input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%"> -->
										</div>
										<div class='toast' style='display: none'>
											<h3 id="msg">${requestScope['msg']}</h3>
										</div>
									</div>

									<div id="productNjobsDiv"></div>
									<!-- <div id="productNjobsDivH"></div> -->
									<div id="productNjobsDivH" style="display: none;"></div>
									<!-- <div id="productNpurchasesDiv"></div> -->
									<div id="productNpurchasesDiv" style="display: none;"></div>

									<table id="productNjobsTable"
										class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th style="text-align: right;">Product code :</th>
												<td>---</td>
												<th style="text-align: right;">Description :</th>
												<td>---</td>
												<th style="text-align: right;">Quantity :</th>
												<td>code</td>
												<th style="text-align: right;">Total Amount :</th>
												<td>---</td>
											</tr>
											<tr>
												<th>#</th>
												<th>Job</th>
												<th>Sample Rate</th>
												<th>Present Rate</th>
												<th>Qty</th>
												<th>UOM</th>
												<th>Amount</th>
												<th>Estimated Submission Date</th>
											</tr>
										</thead>
									</table>
									<br>
									<div class="row">
										<div class="col-md-12">
											<table style="float: right;">
												<tr>
													<td>Surcharge :</td>
													<td><input type="text" name="surcharge" value="0.00"
														id="surcharge" onkeyup="surchargeF();" autocomplete="off"></td>
												</tr>
												<tr>
													<td>
														<!-- Profit  --> <select style="display: none;"
														name="profitType" id="profitType"
														onchange="profitTypeF();">
															<option value="profitPer">%</option>
															<option value="profitFlat">Flat</option>
													</select> <!-- : -->
													</td>
													<td><input type="hidden" name="profitVal" value="0.00"
														id="profitVal" onkeyup="profitValF();" autocomplete="off"></td>
												</tr>
												<tr>
													<td>
														<!-- Profit Value : -->
													</td>
													<td><input type="hidden" name="totProfit" value="0.00"
														id="totProfit" readonly="readonly" autocomplete="off"></td>
												</tr>
												<tr>
													<td>GrandTotal :</td>
													<td><input type="number" name="grandtot" value="0.00"
														readonly="readonly" id="grandtot"><input
														type="hidden" name="gtot" value="0.00" readonly="readonly"
														id="gtot"><input type="hidden" name="gt"
														value="0.00" readonly="readonly" id="gt"></td>
												</tr>
											</table>
										</div>
										<div class="col-md-12" style="margin-top: 10px;">
											<div class="col-md-3">
												<!-- <span><b>Estimated Submission Date: </b></span> -->
											</div>
											<div class="col-md-7">
												<!-- <input type="text" class="form-control"
												name="estSubmissionDate" required="required"
												id="datepicker1" readonly="readonly"> -->
											</div>
											<div class="col-md-2">
												<input type="button" onclick="cancelF();"
													class="btn btn-danger small" value="Cancel"
													data-toggle="modal"><input type="button"
													class="btn green pull-right" value="Save"
													onclick="submitForm();">
											</div>
										</div>
									</div>
								</form>

							</div>
							<!-- </div> -->
						</div>
					</div>
				</div>
			</div>
			<!-- Content Sec -->
		</div>
		<!-- Page Container -->
	</div>
	<!-- main -->

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
								<button type="button" class="btn btn-success medium" id="yesC">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noC">No</button>
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

	<div id="productDetails" class="modal fade" role="dialog"
		style="top: 25px;" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Product Details For the Design Number</h4>
				</div>
				<div class="modal-body">
					<table id="stream_table" width="100%">
						<thead>
							<tr>
								<th>Design No:</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="dNoModal" class="form-control"></td>
							</tr>
							<tr>
								<th>Description :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="dDescModal" class="form-control"></td>
							</tr>
						</thead>
					</table>
					<table id="ProductDetailsTable" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Product code</th>
								<th>Product Description</th>
								<th>UOM</th>
								<th>Quantity</th>
								<th>rate</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="prodDetOkF();">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<div id="purchaseDetails" class="modal fade" role="dialog"
		style="top: 25px;" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Purchase Details</h4>
				</div>
				<div class="modal-body">
					<table id="stream_table" width="100%">
						<thead>
							<tr>
								<th>Product Code:</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="pCodeModal" class="form-control"></td>
							</tr>
							<tr>
								<th>Description :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="pDescModal" class="form-control"></td>
							</tr>
							<tr>
								<th>UOM :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="pUOMModal" class="form-control"><input
									type="hidden" id="pIdModal"><input value=""
									type="hidden" id="pForSampleIdModal"><input value=""
									type="hidden" id="pItemModal"></td>
							</tr>
							<tr>
								<th>Required Quantity :</th>
								<td colspan="2"><input type="text" readonly="readonly"
									id="reqQtyModal" class="form-control"></td>
							</tr>
						</thead>
					</table>
					<table id="purchaseDetailsTable" class="table">
						<thead>
							<tr>
								<th>Purchase Date</th>
								<th>Lot No.</th>
								<th>Cost/Unit</th>
								<th>Remaining Qty.</th>
								<th>Qty Selected<font color="red" size="4">*</font></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="totalAmount" name="totalAmount">
					<button type="button" class="btn btn-default"
						onclick="purDetOkF();">Ok</button>
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
	<script src="js/numericInput.min.js"></script>
	<script>
		function submitForm() {
			var sum = 0;
			$(".totdate").each(function() {
				if (this.value.length != 0) {
					sum = Number(sum) + Number(1);
				}
			});

			if ($("#jName").val() == 0) {
				alert("please select jobber name");
			} else if ($("#datepicker").val() == "") {
				alert("please select Assigning date");
			} else if ($("#datepicker1").val() == "") {
				alert("please select Estimated submission date");
			} else if ($("#dNo").val() == "") {
				alert("please enter design no.");
			} else if ($("#qty").val() == "") {
				alert("please enter Qty");
			} else if ($("#gt").val() == 0) {
				alert("No Product or job found to assign job. Please select one.");
			} else if ($(".totdate").length != sum) {
				alert("please select est. submission date");
			} else {
				$("#jobAssignmentForParticularDesignNumber").submit();
			}
		}

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
			window.location = 'jobAssignForParticularDesignNumber.jsp';
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});

		$(function() {
			$("#dNo").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getSampleDesignCostSheetByDesignNumber",
						data : {
							dNo : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.dNumber,
									id : item.dId,
									dDEsc : item.dDEsc
								});
							}));
						}

					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#dId").val("");
						$("#dDescModal").val("");
						$("#dNoModal").val("");
					} else {
						$("#dId").val(ui.item.id);
						$("#dDescModal").val(ui.item.dDEsc);
						$("#dNoModal").val($(this).val());
					}
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#dId").val("");
						$("#dDescModal").val("");
						$("#dNoModal").val("");
					} else {
						$("#dId").val(ui.item.id);
						$("#dDescModal").val(ui.item.dDEsc);
						$("#dNoModal").val($(this).val());
					}
				}
			});
		});

		function qtyF() {
			if ($("#dNo").val() == "") {
				alert("PLease enter design no. first...");
				$("#qty").val("");
			}
		}
		function qtyFC() {
			if ($("#qty").val() != "") {
				if ($("#qty").val() > 0) {
					$("#productDetails").modal("show");

					$
							.ajax({
								type : "post",
								url : "getProductDetailsByDesignNumberAndQuantity",
								dataType : "json",
								data : {
									did : $("#dId").val()
								},
								success : function(data2) {
									$("#ProductDetailsTable tbody").empty();

									$
											.each(
													data2,
													function(index, item2) {
														if (item2.ProductRemainingQty >= (Number($(
																"#qty").val()) * item2.ProductQtyForSample)) {
															$(

															"#ProductDetailsTable")
																	.append(
																			"<tbody id='prod"
																					+ item2.ProductId
																					+ "' onclick='selectProduct(\""
																					+ item2.ProductCode
																					+ "\",\""
																					+ item2.ProductDesc
																					+ "\",\""
																					+ item2.ProductUOMName
																					+ "\",\""
																					+ item2.ProductForSampleId
																					+ "\",\""
																					+ item2.ProductId
																					+ "\");'>"
																					+ "<tr>"
																					+ "<td>"
																					+ Number(1 + index)
																					+ "</td>"
																					+ "<td>"
																					+ item2.ProductCode
																					+ "</td>"
																					+ "<td>"
																					+ item2.ProductDesc
																					+ "</td>"
																					+ "<td>"
																					+ item2.ProductUOMName
																					+ "</td>"
																					+ "<td>"
																					+ Number(
																							item2.ProductQtyForSample
																									* $(
																											"#qty")
																											.val())
																							.toFixed(
																									3)
																					+ "</td>"
																					+ "<td>"
																					+ Number(
																							item2.ProductRateForSample
																									* $(
																											"#qty")
																											.val())
																							.toFixed(
																									2)
																					+ "</td>"
																					+ "<td>"
																					+ Number(
																							(item2.ProductQtyForSample * $(
																									"#qty")
																									.val())
																									* (item2.ProductRateForSample * $(
																											"#qty")
																											.val()))
																							.toFixed(
																									2)
																					+ "</td>"
																					+ "<td>"
																					+ "<font color='red' size='4'>*</font>"
																					+ "</td>"
																					+ "</tr>"
																					+ "</tbody>");
														} else {
															alert("unsufficient product "
																	+ item2.ProductDesc);
															$(
																	"#ProductDetailsTable tbody")
																	.empty();
															$("#productDetails")
																	.modal(
																			"hide");
															return false;
														}

													});
								}
							});
				} else {
					alert("Please enter valid quantity...");
				}
			}
		}
		function selectProduct(code, desc, uom, ProductForSampleId, id) {
			if ($(document).find("#pDetTable" + ProductForSampleId).length == 0) {
				$("#purchaseDetails").modal("show");
				$("#pCodeModal").val(code);
				$("#pDescModal").val(desc);
				$("#pUOMModal").val(uom);
				$("#pIdModal").val(id);
				$("#reqQtyModal").val(
						$("#prod" + $("#pIdModal").val() + " :nth-child(5)")
								.html());
				$("#pForSampleIdModal").val(ProductForSampleId);
				$
						.ajax({
							url : 'getPurchaseProductDetailsByProductCode',
							type : 'post',
							dataType : "json",
							data : {
								code : code,
								date : $("#datepicker").val()
							},
							success : function(data) {
								/* $.map(data, function(item) {
									$("#purchaseDet").html(
											$("#purchaseDet").html() + item.purchaseDate
													+ '\n');
									
									
								}); */
								$("#purchaseDetailsTable tbody").empty();
								$
										.map(
												data,
												function(item2) {
													$
															.ajax({
																url : 'getItmProductsForSampleByProductId',
																type : 'post',
																dataType : "json",
																data : {
																	id : item2.productId
																},
																success : function(
																		data) {
																	$(
																			"#pItemModal")
																			.val(
																					data.itemName);
																},
																error : function(
																		a, b, c) {
																	alert(b
																			+ ": "
																			+ c);
																}
															});
													if (item2.purchaseDate != 'Initial Inventory') {
														$(
																"#purchaseDetailsTable")
																.append(
																		"<tbody id='viewAttr"+item2.id+"' title='"+item2.attrName1+" : "+item2.attrValue1+" , "+item2.attrName2+" : "+item2.attrValue2+" , "+item2.attrName3+" : "+item2.attrValue3+" , "+item2.attrName4+" : "+item2.attrValue4+" , "+item2.attrName5+" : "+item2.attrValue5+" , "+item2.attrName6+" : "+item2.attrValue6+"'>"
																				+ "<tr>"
																				+ "<td>"
																				+ formatDate(item2.purchaseDate)
																				+ "</td>"
																				+ "<td>"
																				+ item2.lotNumber
																				+ "</td>"
																				+ "<td>"
																				+ item2.cost
																				+ "</td>"
																				+ "<td>"
																				+ item2.remaining_quantity
																				+ "</td>"
																				+ "<td>"
																				+ '<input type="text" class="form-control qtySelected" onkeyup="selectedQtyF('
																				+ item2.id
																				+ ','
																				+ $(
																						"#pIdModal")
																						.val()
																				+ ')" id="qtySelected'
																				+ item2.id
																				+ '">'
																				+ '<input type="hidden" class="form-control" value="'+item2.id+'" id="purProDetId'+item2.id+'">'
																				+ '<input type="hidden" class="form-control purProDetTotAmount" id="purProDetTotAmount'+item2.id+'">'
																				+ "</td>"
																				+ "</tr>"
																				+ "</tbody>");
													} else {
														$(
																"#purchaseDetailsTable")
																.append(
																		"<tbody id='viewAttr"+item2.id+"' title='"+item2.attrName1+" : "+item2.attrValue1+" , "+item2.attrName2+" : "+item2.attrValue2+" , "+item2.attrName3+" : "+item2.attrValue3+" , "+item2.attrName4+" : "+item2.attrValue4+" , "+item2.attrName5+" : "+item2.attrValue5+" , "+item2.attrName6+" : "+item2.attrValue6+"'>"
																				+ "<tr>"
																				+ "<td>"
																				+ item2.purchaseDate
																				+ "</td>"
																				+ "<td>"
																				+ item2.lotNumber
																				+ "</td>"
																				+ "<td>"
																				+ item2.cost
																				+ "</td>"
																				+ "<td>"
																				+ item2.remaining_quantity
																				+ "</td>"
																				+ "<td>"
																				+ '<input type="text" class="form-control qtySelected" onkeyup="selectedQtyF('
																				+ item2.id
																				+ ','
																				+ $(
																						"#pIdModal")
																						.val()
																				+ ')" id="qtySelected'
																				+ item2.id
																				+ '">'
																				+ '<input type="hidden" class="form-control" value="'+item2.id+'" id="purProDetId'+item2.id+'">'
																				+ '<input type="hidden" class="form-control purProDetTotAmount" id="purProDetTotAmount'+item2.id+'">'
																				+ "</td>"
																				+ "</tr>"
																				+ "</tbody>");
													}

												});
							}
						});
			} else {
				alert("This product is already selected.");
			}
		}

		function selectedQtyF(id, prodId) {
			//alert($("#prod" + prodId + " :nth-child(5)").html());
			if (Number($("#viewAttr" + id + " :nth-child(4)").html()) < Number($(
					"#viewAttr" + id + " :nth-child(5) input[type=text]").val())) {
				alert("You can not select more than remaining quantity!");
				$("#qtySelected" + id).val("");
				$("#purProDetTotAmount" + id).val("");
				$("#purProDetTotAmount" + id).val(
						Number($("#viewAttr" + id + " :nth-child(3)").html())
								* Number($("#qtySelected" + id).val()));
				var sum = 0;
				$(".purProDetTotAmount").each(function() {
					if (!isNaN(this.value) && this.value.length != 0) {
						sum += parseFloat(this.value);
					}
				});
				$("#totalAmount").val(sum.toFixed(2));
			} else {
				$("#purProDetTotAmount" + id).val(
						Number($("#viewAttr" + id + " :nth-child(3)").html())
								* Number($("#qtySelected" + id).val()));
				var sum = 0;
				$(".purProDetTotAmount").each(function() {
					if (!isNaN(this.value) && this.value.length != 0) {
						sum += parseFloat(this.value);
					}
				});
				$("#totalAmount").val(sum.toFixed(2));
			}
		}
		function purDetOkF() {
			var sum = 0;
			$(".qtySelected").each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value);
				}
			});
			if (Number(sum) != Number($(
					"#prod" + $("#pIdModal").val() + " :nth-child(5)").html())) {
				alert("Selected Quantity can not be more than or less than Required Quantity! Total required quantity is : "
						+ $("#prod" + $("#pIdModal").val() + " :nth-child(5)")
								.html()
						+ ". You selected : "
						+ sum
						+ ". PLease select valid quantity...");
			} else {
				$("#purchaseDetails").modal("hide");
				$("#productNjobsTable").hide();

				$('#productNjobsDiv')
						.append(
								'<table id="pDetTable'
										+ $("#pForSampleIdModal").val()
										+ '" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
										+ "Pcode:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(2)")
												.html()
										+ "'>"
										+ "<input type='hidden' class='form-control' readonly='readonly' id='productForSampleId"
										+ $("#pForSampleIdModal").val()
										+ "' value='"
										+ $("#pForSampleIdModal").val()
										+ "'>"
										+ "<input type='hidden' class='form-control' readonly='readonly' id='productId"
										+ $("#pForSampleIdModal").val()
										+ "' value='"
										+ $("#pIdModal").val()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Description:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(3)")
												.html()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Qty:"
										+ '</th><td>'
										+ "<input type='text' id='qtyOfSampleProduct"
										+ $("#pForSampleIdModal").val()
										+ "' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(5)")
												.html()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Total Amount:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' id='productEachTotal"
										+ $("#pForSampleIdModal").val()
										+ "' readonly='readonly' value='"
										+ $("#totalAmount").val()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Item:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' value='"
										+ $("#pItemModal").val()
										+ "'>"
										+ '</td></tr><tr><th>'
										+ "#"
										+ '</th><th>'
										+ "Job"
										+ '</th><th>'
										+ "Sample Rate"
										+ '</th><th>'
										+ "Present Rate<font color='red' size='4'>*</font>"
										+ '</th><th>'
										+ "Qty Per Sample"
										+ '</th><th>'
										+ "Total Qty"
										+ '</th><th>'
										+ "UOM"
										+ '</th><th>'
										+ "Total Amount"
										+ '</th><th colspan="2">'
										+ "Est. Submission Date<font color='red' size='4'>*</font>"
										+ '</th></tr></thead></table>');

				$
						.ajax({
							type : "post",
							url : "getJobsForDesignCostSheetByProductSForSampleId",
							dataType : "json",
							data : {
								pid : $("#pForSampleIdModal").val()
							},
							success : function(data2) {
								$
										.each(
												data2,
												function(index, item2) {
													$(

															"#pDetTable"
																	+ $(
																			"#pForSampleIdModal")
																			.val())
															.append(
																	"<tbody id='pDetTable"+item2.JobId+"'>"
																			+ "<tr>"
																			+ "<td>"
																			+ Number(1 + index)
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobName
																			+ "<input type='hidden' id='jobId"+item2.JobId+"' value='"+item2.JobId+"'>"
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobRateOfSample
																					.toFixed(2)
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' class='form-control' id='jobPresentRate"
																			+ item2.JobId
																			+ "' onkeyup='presentRateKU("
																			+ item2.JobId
																			+ ");' onchange='presentRateOC("
																			+ item2.JobId
																			+ ");' value='"
																			+ item2.JobRateOfSample
																					.toFixed(2)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' class='form-control' id='jobSampleQty"
																			+ item2.JobId
																			+ "' readonly='readonly' value='"
																			+ item2.JobQtyOfSample
																					.toFixed(3)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' readonly='readonly' class='form-control' id='jobQty"
																			+ item2.JobId
																			+ "' onkeyup='qtyKU("
																			+ item2.JobId
																			+ ");' value='"
																			+ Number(
																					item2.JobQtyOfSample
																							* $(
																									"#qty")
																									.val())
																					.toFixed(
																							3)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobUOMOfSample
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' readonly='readonly' id='jobAmount"
																			+ item2.JobId
																			+ "' class='form-control' value='"
																			+ Number(
																					item2.JobAmountOfSample
																							* $(
																									"#qty")
																									.val())
																					.toFixed(
																							2)
																			+ "'>"
																			+ "</td>"
																			+ "<td colspan='2'>"
																			+ "<input onclick='showDatePicker();' type='text' id='estSubmDate"
																			+ item2.JobId
																			+ "' class='form-control estSubmDate'>"
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='checkbox' onclick='isSelectedF("
																			+ $(
																					"#pForSampleIdModal")
																					.val()
																			+ ","
																			+ item2.JobId
																			+ ");' name='selectedJobs"
																			+ item2.JobId
																			+ "' class='isSelected"
																			+ $(
																					"#pForSampleIdModal")
																					.val()
																			+ "' id='isSelected"
																			+ item2.JobId
																			+ "' value='"
																			+ item2.JobId
																			+ "'>"
																			+ "</td>"
																			+ "</tr>"
																			+ "</tbody>");

												});
							}
						});

				$('#productNjobsDivH')
						.append(
								'<table id="pDetTableH'
										+ $("#pForSampleIdModal").val()
										+ '" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
										+ "Product code:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(2)")
												.html()
										+ "'>"
										+ "<input type='text' class='form-control' readonly='readonly' name='productForSampleIdH' id='productForSampleIdH"
										+ $("#pForSampleIdModal").val()
										+ "' value='"
										+ $("#pForSampleIdModal").val()
										+ "'>"
										+ "<input type='text' class='form-control' readonly='readonly' name='productIdH' id='productIdH"
										+ $("#pForSampleIdModal").val()
										+ "' value='"
										+ $("#pIdModal").val()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Description:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(3)")
												.html()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Qty:"
										+ '</th><td>'
										+ "<input type='text' name='qtyOfSampleProductH' id='qtyOfSampleProductH"
										+ $("#pForSampleIdModal").val()
										+ "' class='form-control' readonly='readonly' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(5)")
												.html()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Total Amount:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' name='productEachTotalH' id='productEachTotalH"
										+ $("#pForSampleIdModal").val()
										+ "' readonly='readonly' value='"
										+ $("#totalAmount").val() + "'>"
										+ '</td></tr><tr><th>' + "#"
										+ '</th><th>' + "Job" + '</th><th>'
										+ "Sample Rate" + '</th><th>'
										+ "Present Rate" + '</th><th>' + "Qty"
										+ '</th><th>' + "UOM" + '</th><th>'
										+ "Amount" + '</th><th>'
										+ "Est. Submission Date"
										+ '</th></tr></thead></table>');

				$
						.ajax({
							type : "post",
							url : "getJobsForDesignCostSheetByProductSForSampleId",
							dataType : "json",
							data : {
								pid : $("#pForSampleIdModal").val()
							},
							success : function(data2) {
								$
										.each(
												data2,
												function(index, item2) {
													$(

															"#pDetTableH"
																	+ $(
																			"#pForSampleIdModal")
																			.val())
															.append(
																	"<tbody id='pDetTableH"+item2.JobId+"'>"
																			+ "<tr>"
																			+ "<td>"
																			+ Number(1 + index)
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobName
																			+ "<input type='hidden' name='jobIdH"
																			+ $(
																					"#pForSampleIdModal")
																					.val()
																			+ "' id='jobIdH"
																			+ item2.JobId
																			+ "' value='"
																			+ item2.JobId
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobRateOfSample
																					.toFixed(2)
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' class='form-control' name='jobPresentRateH' id='jobPresentRateH"
																			+ item2.JobId
																			+ "' onkeyup='presentRateKU("
																			+ item2.JobId
																			+ ");' onchange='presentRateOC("
																			+ item2.JobId
																			+ ");' value='"
																			+ item2.JobRateOfSample
																					.toFixed(2)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' class='form-control' name='jobQtyH"
																			+ $(
																					"#pForSampleIdModal")
																					.val()
																			+ "' id='jobQtyH"
																			+ item2.JobId
																			+ "' onkeyup='qtyKU("
																			+ item2.JobId
																			+ ");' value='"
																			+ Number(
																					item2.JobQtyOfSample
																							* $(
																									"#qty")
																									.val())
																					.toFixed(
																							3)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ item2.JobUOMOfSample
																			+ "</td>"
																			+ "<td>"
																			+ "<input type='text' readonly='readonly' name='jobAmountH' id='jobAmountH"
																			+ item2.JobId
																			+ "' class='form-control' value='"
																			+ Number(
																					item2.JobAmountOfSample
																							* $(
																									"#qty")
																									.val())
																					.toFixed(
																							2)
																			+ "'>"
																			+ "</td>"
																			+ "<td>"
																			+ "<input onclick='showDatePicker();' type='text' name='estSubmDateH' id='estSubmDateH"
																			+ item2.JobId
																			+ "' class='form-control'>"
																			+ "</td>"
																			+ "</tr>"
																			+ "</tbody>");

												});
							}
						});

				$('#productNpurchasesDiv')
						.append(
								'<table id="productDetTable'
										+ $("#pIdModal").val()
										+ '" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
										+ "Product code:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' name='productCode' value='"
										+ $(
												"#prod" + $("#pIdModal").val()
														+ " :nth-child(2)")
												.html()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Product Id:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' name='productId' value='"
										+ $("#pIdModal").val()
										+ "'>"
										+ '</td><th style="text-align: right;">'
										+ "Product For sample id:"
										+ '</th><td>'
										+ "<input type='text' class='form-control' readonly='readonly' name='productForSampleId' value='"
										+ $("#pForSampleIdModal").val() + "'>"
										+ '</td></tr><tr><th>'
										+ "Purchase Product Detail Id"
										+ '</th><th>' + "Qty Selected"
										+ '</th></tr></thead></table>');

				$
						.ajax({
							url : 'getPurchaseProductDetailsByProductCode',
							type : 'post',
							dataType : "json",
							data : {
								code : $("#pCodeModal").val(),
								date : $("#datepicker").val()
							},
							success : function(data) {
								$
										.map(
												data,
												function(item2) {
													if (!isNaN($(
															"#qtySelected"
																	+ item2.id)
															.val())
															&& $(
																	"#qtySelected"
																			+ item2.id)
																	.val().length != 0) {
														$(
																"#productDetTable"
																		+ $(
																				"#pIdModal")
																				.val())
																.append(
																		"<tbody id='purchaseDetail"+item2.id+"'>"
																				+ "<tr>"
																				+ "<td>"
																				+ '<input type="text" class="form-control" name="purProDetId'
																				+ $(
																						"#pForSampleIdModal")
																						.val()
																				+ '" value="'
																				+ $(
																						"#purProDetId"
																								+ item2.id)
																						.val()
																				+ '">'
																				+ "</td>"
																				+ "<td>"
																				+ '<input type="text" class="form-control" name="qtySelected'
																				+ $(
																						"#pForSampleIdModal")
																						.val()
																				+ '" value="'
																				+ $(
																						"#qtySelected"
																								+ item2.id)
																						.val()
																				+ '">'
																				+ "</td>"
																				+ "</tr>"
																				+ "</tbody>");
													}

												});
							}
						});
				//error
				/* $("#gt").val(
						Number($("#gt").val()) + Number($("#totalAmount").val())); */
				$(".estSubmDate").trigger("click");
				$(".estSubmDate").trigger("click");
				$(".estSubmDate").trigger("click");

				$("#prod" + $("#pIdModal").val() + " :nth-child(8)").html("");
			}
		}
		function prodDetOkF() {
			var flag = 0;
			$
					.ajax({
						type : "post",
						url : "getProductDetailsByDesignNumberAndQuantity",
						dataType : "json",
						data : {
							did : $("#dId").val()
						},
						success : function(data2) {
							$
									.each(
											data2,
											function(index, item2) {
												if ($(document)
														.find(
																"#pDetTable"
																		+ item2.ProductForSampleId).length == 0) {
													flag = 1;
												}

											});
						},
						complete : function() {
							if (flag == 0) {
								$("#productDetails").modal("hide");
							} else {
								alert('Please select all product');
							}
						}
					});
			$("#dNo").prop("readonly", "readonly");
			$("#qty").prop("readonly", "readonly");

			//error
			var sm = 0;
			$(".productEachTotal").each(function() {
				sm += parseFloat(this.value);
			});
			$("#gt").val(Number(sm.toFixed(2)));

			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			profitValF();
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));
		}
		function formatDate(d) {
			var dateparts = d.split(" ");
			return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
		}
		function presentRateOC(jobId) {
			$("#jobPresentRate" + jobId).val(
					Number($("#jobPresentRate" + jobId).val()).toFixed(2));
			presentRateKU(jobId);
		}
		function presentRateKU(jobId) {
			$("#jobAmount" + jobId).val(
					Number(
							$("#jobPresentRate" + jobId).val()
									* $("#jobQty" + jobId).val()).toFixed(2));

			//error
			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			profitValF();
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));
		}
		function qtyKU(jobId) {
			if ($("#jobQty" + jobId).val() > $("#jobSampleQty" + jobId).val()) {
				alert("Assigning qty can not be more than sample qty!");
				$("#jobQty" + jobId).val($("#jobSampleQty" + jobId).val());
			} else {
				$("#jobAmount" + jobId).val(
						$("#jobPresentRate" + jobId).val()
								* $("#jobQty" + jobId).val());

				//error
				var sum = 0;
				$(".eachtotalvalue").each(function() {
					sum += parseFloat(this.value);
				});
				$("#gtot").val(
						Number($("#gt").val()) + Number(sum.toFixed(2))
								+ Number($("#surcharge").val()));
				profitValF();
				$("#grandtot").val(
						Number(
								Number($("#gtot").val())
										+ Number($("#totProfit").val()))
								.toFixed(2));
			}
		}
		function profitTypeF() {
			//error
			$("#profitVal").val("0.00");
			$("#totProfit").val("0.00");
			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));
		}
		function profitValF() {
			//error
			if ($("#profitType").val() == 'profitPer') {
				$("#totProfit")
						.val(
								Math
										.round((Number($("#gtot").val())
												* Number($("#profitVal").val()) / 100) * 100) / 100);
				var sum = 0;
				$(".eachtotalvalue").each(function() {
					sum += parseFloat(this.value);
				});
				$("#gtot").val(
						Number($("#gt").val()) + Number(sum.toFixed(2))
								+ Number($("#surcharge").val()));
				$("#grandtot").val(
						Number(
								Number($("#gtot").val())
										+ Number($("#totProfit").val()))
								.toFixed(2));
			} else {
				$("#totProfit").val(
						Math.round(Number($("#profitVal").val()) * 100) / 100);
				var sum = 0;
				$(".eachtotalvalue").each(function() {
					sum += parseFloat(this.value);
				});
				$("#gtot").val(
						Number($("#gt").val()) + Number(sum.toFixed(2))
								+ Number($("#surcharge").val()));
				$("#grandtot").val(
						Number(
								Number($("#gtot").val())
										+ Number($("#totProfit").val()))
								.toFixed(2));

			}
		}
		function surchargeF() {
			//error
			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			profitValF();
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));
		}

		function isSelectedF(psId, jobId) {
			var i = 0;
			$(".isSelected" + psId).each(function() {
				if ($(this).is(':checked')) {
					i = 1;
				}
			});
			if (i == 0) {
				// alert("Please select atleast one job");

				$("#productForSampleId" + psId).removeAttr("name");
				$("#productId" + psId).removeAttr("name");
				$("#qtyOfSampleProduct" + psId).removeAttr("name");
				$("#productEachTotal" + psId).removeAttr("name");

				$("#productEachTotal" + psId).attr("class", "form-control");
			} else {
				//alert("Atleast one is selected");

				$("#productForSampleId" + psId).attr("name",
						"productForSampleId1");
				$("#productId" + psId).attr("name", "productId1");
				$("#qtyOfSampleProduct" + psId).attr("name",
						"qtyOfSampleProduct");
				$("#productEachTotal" + psId).attr("name", "productEachTotal");

				$("#productEachTotal" + psId).attr("class",
						"form-control productEachTotal");
			}

			if ($('#isSelected' + jobId).is(":checked")) {
				//alert("checked"+jobId);

				$("#jobId" + jobId).attr("name", "jobId" + psId);
				$("#jobPresentRate" + jobId).attr("name",
						"jobPresentRate" + psId);
				$("#jobQty" + jobId).attr("name", "jobQty" + psId);
				$("#jobAmount" + jobId).attr("name", "jobAmount" + psId);
				$("#estSubmDate" + jobId).attr("name", "estSubmDate" + psId);

				$("#estSubmDate" + jobId).attr("class",
						"form-control estSubmDate totdate");
				$("#jobAmount" + jobId).attr("class",
						"form-control eachtotalvalue");
			} else {
				//alert("not checked"+jobId);

				$("#jobId" + jobId).removeAttr("name");
				$("#jobPresentRate" + jobId).removeAttr("name");
				$("#jobQty" + jobId).removeAttr("name");
				$("#jobAmount" + jobId).removeAttr("name");
				$("#estSubmDate" + jobId).removeAttr("name");

				$("#estSubmDate" + jobId).attr("class",
						"form-control estSubmDate");
				$("#jobAmount" + jobId).attr("class", "form-control");
			}

			//error
			var sm = 0;
			$(".productEachTotal").each(function() {
				sm += parseFloat(this.value);
			});
			$("#gt").val(Number(sm.toFixed(2)));

			var sum = 0;
			$(".eachtotalvalue").each(function() {
				sum += parseFloat(this.value);
			});
			$("#gtot").val(
					Number($("#gt").val()) + Number(sum.toFixed(2))
							+ Number($("#surcharge").val()));
			profitValF();
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));
		}
	</script>
	<script src="js/numericInput.min.js"></script>
	<script>
		$(function() {
			$("#qty").numericInput({

				allowFloat : false, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});
		});
		$(function() {
			$("#surcharge").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});
		});
		$(function() {
			$(".qtySelected").numericInput({

				allowFloat : true, // Accpets positive numbers (floating point)

				allowNegative : false,
			// Accpets positive or negative integer

			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$("#surcharge").change(function() {
				$("#surcharge").val(Number($("#surcharge").val()).toFixed(2));
				surchargeF();
			});
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
