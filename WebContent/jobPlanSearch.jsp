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
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jobPlan").attr("style", "color: #6a94ff;");
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
								<h3 style="margin-top: 11px;">Job Plan View</h3>
							</div>

							<!-- <div class="widget-area"> -->


							<div class="col-md-12">
								<form action="jobSearchByPlanNo" method="post"
									id="jobSearchByPlanNoId">
									<div class="widget-area" style="margin-bottom: 20px;">
										<div class="col-md-8">
											<div class="form-group">
												<label for="" class="font">Design No. :</label> <input
													type="text" class="form-control" name="dNo"
													required="required" id="dNo" autocomplete="off"> <input
													type="hidden" id="dId" name="dId"> <input
													type="hidden" id="dNoCheck" name="dNoCheck">
											</div>
											<div class="form-group">
												<!-- <label for="" class="font">Plan No. :</label> -->
												<input readonly="readonly" type="hidden"
													class="form-control" value="" name="planNo" id="planNo">
											</div>
										</div>
										<div class="col-md-4">
											<!-- <button class="btn green pull-left"
											style="margin-top: 22px; margin-right: 20px;" type="button"
											onclick="plansByDnoF();">Go</button> -->
											<button class="btn pull-left"
												style="margin-top: 22px; margin-right: 20px;" type="button"
												onclick="cancelF();">Reset</button>
											<button class="btn green pull-left" style="margin-top: 22px;"
												type="button" onclick="allJobPlanF();" id="allJobBtn">All
												Plans</button>

										</div>
									</div>
									<h3 align="center" style="color: #6a94ff;">
										<span id="planNoMsg"></span>
									</h3>
									<br>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th colspan="6"><h3>Expanse Details</h3></th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th>Total Product Cost :</th>
												<td><span id="totProCost"></span></td>
												<th>Total Job expanse till now :</th>
												<td><span id="totJobExpanse"></span></td>
												<th>Total Expanse till now :</th>
												<td><span id="totExpanse"></span></td>
											</tr>
										</thead>
									</table>
									<div class="col-md-12">
										<div class="col-md-6">
											<h3 align="left">Current Status</h3>
										</div>
										<div class="col-md-6" align="right">
											<!-- <button class="btn pull-right" type="button"
											onclick="cancelF();">
											<h5>All job assignments of this plan</h5>
										</button> -->


											<a href="#" target="_blank" onclick="jobSearchByPlanNoF();"><input
												type="hidden" value="" name="planIdForAssign"
												id="planIdForAssign"><u><h3>All job
														assignments of this plan</h3></u></a>
										</div>
									</div>
									<div id="productNjobsDiv"></div>
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
								<span>Do you want to reset?</span>
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

	<div id="jobPlans" class="modal fade" role="dialog" style="top: 25px;"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">Job plans For the Design Number</h4>
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
					<table id="jobPlansTable" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Plan No.</th>
								<!-- <th>PLan Description</th> -->
								<th>Plan Date</th>
								<th>Design Qty</th>
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
						onclick="JobPlanOkF();">Ok</button>
				</div>
			</div>
		</div>
	</div>

	<div id="jobPlansAll" class="modal fade" role="dialog"
		style="top: 25px;" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					<h4 class="modal-title">All Job plans</h4>
				</div>
				<div class="modal-body">
					<table id="jobPlansTableA" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Plan No.</th>
								<!-- <th>PLan Description</th> -->
								<th>Plan Date</th>
								<th>Design Qty</th>
								<th>Design No.</th>
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
						onclick="JobPlanOkF();">Ok</button>
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
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'jobPlanSearch.jsp';
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});

		$(function() {
			$("#dNo")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												type : "post",
												url : "getSampleDesignCostSheetByDesignNumber",
												data : {
													dNo : req.term
												},
												dataType : "json",
												success : function(data) {
													resp($
															.map(
																	data,
																	function(
																			item) {
																		return ({
																			value : item.dNumber,
																			id : item.dId,
																			dDEsc : item.dDEsc,
																			dNo : item.dNumber,
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
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									} else {
										$("#dId").val(ui.item.id);
										$("#dDescModal").val(ui.item.dDEsc);
										//$("#dNoModal").val($(this).val());
										$("#dNoModal").val(ui.item.dNo);
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									}
								},
								select : function(event, ui) {
									if (ui.item == null) {
										$(this).val("");
										$("#dId").val("");
										$("#dDescModal").val("");
										$("#dNoModal").val("");
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();
									} else {
										$("#dId").val(ui.item.id);
										$("#dDescModal").val(ui.item.dDEsc);
										//$("#dNoModal").val($(this).val());
										$("#dNoModal").val(ui.item.dNo);
										$("#planNo").val("");
										$("#productNjobsDiv table").empty();
										$("#productNjobsTable").show();

										$
												.ajax({
													type : "post",
													url : "getAllJobPlanByDesignNumber",
													dataType : "json",
													data : {
														dId : $("#dId").val()
													},
													success : function(data2) {
														$(
																"#jobPlansTable tbody")
																.empty();
														//alert(data2.length);
														if (data2.length > 0) {
															$
																	.each(
																			data2,
																			function(
																					index,
																					item2) {
																				$(

																				"#jobPlansTable")
																						.append(
																								"<tbody id='jobPlan"
																										+ item2.jpId
																										+ "' onclick='selectPlan(\""
																										+ item2.jpId
																										+ "\",\""
																										+ item2.jpQty
																										+ "\");'>"
																										+ "<tr>"
																										+ "<td>"
																										+ Number(1 + index)
																										+ "</td>"
																										+ "<td>"
																										+ item2.jpId
																										+ "</td>"
																										/* + "<td>"
																										+ item2.jpDEsc
																										+ "</td>" */
																										+ "<td>"
																										+ formatDate(item2.jpDate)
																										+ "</td>"
																										+ "<td>"
																										+ item2.jpQty
																										+ "</td>"
																										+ "</tr>"
																										+ "</tbody>");
																			});
															$("#jobPlans")
																	.modal(
																			"show");
														} else {
															alert("There is no plan for this design number.");
															$("#dNo").val("");
														}
													}
												});

									}
								}
							});
		});

		function formatDate(d) {
			var dateparts = d.split(" ");
			return dateparts[2] + "-" + dateparts[1] + "-" + dateparts[5];
		}
		function presentRateKU(jobId) {
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
					Number($("#gtot").val()) + Number($("#totProfit").val()));
		}
		function qtyKU(jobId) {
			if ($("#jobQty" + jobId).val() > $("#jobRemQty" + jobId).val()) {
				alert("Assigning qty can not be more than Remaining qty!");
				$("#jobQty" + jobId).val($("#jobRemQty" + jobId).val());
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
						Number($("#gtot").val())
								+ Number($("#totProfit").val()));
			}
		}

		function JobPlanOkF() {
			if ($("#planNo").val() != "") {
				$("#jobPlans").modal("hide");
				$("#jobPlansAll").modal("hide");
				$(".estSubmDate").trigger("click");
			} else {
				alert("Please select a plan.")
			}
			//$("#dNo").attr("readonly","readonly");
		}
		function selectPlan(pId, pQty) {
			$("#planNo").val(pId);
			$("#planNoMsg").html("Your search for plan number : " + pId);
			alert("plan " + pId + " selected");
			$("#jobPlans").modal("hide");
			$("#jobPlansAll").modal("hide");
			$(".estSubmDate").trigger("click");

			$.ajax({
				type : "post",
				url : "getPlanNumbersById",
				dataType : "json",
				data : {
					id : pId
				},
				success : function(data) {
					//alert(data.id);
					$("#totProCost").html(data.totalProductCost);
					$("#totJobExpanse").html(data.totalJobExpanse);
					$("#totExpanse").html(data.totalExpanse);
				}
			});

			$
					.ajax({
						type : "post",
						url : "getProductAndDesignDetailsAndJobPlanByJobPlanId",
						dataType : "json",
						data : {
							pId : pId
						},
						success : function(data2) {
							$(".estSubmDate").trigger("click");
							$("#productNjobsDiv table").empty();
							$("#dNo").attr("readonly", "readonly");
							$
									.each(
											data2,
											function(index, item2) {
												$("#dNo").val(item2.DesignNo);

												$("#productNjobsTable").hide();
												if ((item2.japYesOrNo == "yes" && item2.IsComplete == true)
														|| (item2.japYesOrNo == "yes"
																&& item2.japRemQty > 0 && item2.IsComplete == false)) {
													if (item2.japRemQty > 0
															&& item2.IsComplete == false) {
														var Assigned = "Assigned";
													} else if (item2.IsComplete == true) {
														var Assigned = "Completed";
													}
													$('#productNjobsDiv')
															.append(
																	'<table id="pDetTable'+item2.ProductForSampleId+'" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
																			+ "Pcode:"
																			+ '</th><td>'
																			+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductCode+"'>"
																			+ "<input type='hidden' class='form-control' readonly='readonly' id='productForSampleId"+item2.ProductForSampleId+"' value='"+item2.ProductForSampleId+"'>"
																			+ "<input type='hidden' class='form-control' readonly='readonly' id='productId"+item2.ProductForSampleId+"' value='"+ item2.ProductId+ "'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Description:"
																			+ '</th><td colspan="2">'
																			+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductDesc+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Qty:"
																			+ '</th><td>'
																			+ "<input type='text' id='qtyOfSampleProduct"+item2.ProductForSampleId+"' class='form-control' readonly='readonly' value='"+item2.ProductQtyForSample*pQty+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Total Amount:"
																			+ '</th><td>'
																			+ "<input type='text' class='form-control' id='productEachTotal"+item2.ProductForSampleId+"' readonly='readonly' value='"+item2.ProductTotalAmount+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Status:"
																			+ '</th><td>'
																			+ Assigned
																			+ '</td></tr><tr><th>'
																			+ "#"
																			+ '</th><th>'
																			+ "Job"
																			+ '</th><th>'
																			+ "Sample Rate"
																			+ '</th><th>'
																			+ "Present Rate"
																			+ '</th><th>'
																			+ "Qty per sample"
																			+ '</th><th>'
																			+ "Total Qty"
																			+ '</th><th>'
																			+ "UOM"
																			+ '</th><th>'
																			+ "Total Amount"
																			+ '</th><th colspan="2">'
																			+ "Est. Submission Date"
																			+ '</th><th>'
																			+ "Status"
																			+ '</th></tr></thead></table>');

													var ProductForSampleId = item2.ProductForSampleId;
													var planId = pId;
													var prodId = item2.ProductId;
													var japId = item2.japId;
													$
															.ajax({
																type : "post",
																url : "getJobsForDesignCostSheetByPlanId",
																dataType : "json",
																data : {
																	pid : ProductForSampleId,
																	planId : planId,
																	prodId : prodId,
																	japId : japId
																},
																success : function(
																		data2) {
																	$
																			.each(
																					data2,
																					function(
																							index,
																							item2) {
																						if (item2.EstSubDate != "NA") {
																							var EstSubDate = formatDate(item2.EstSubDate);
																						} else {
																							var EstSubDate = item2.EstSubDate;
																						}
																						$(

																								"#pDetTable"
																										+ ProductForSampleId)
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
																												+ "</td>"
																												+ "<td>"
																												+ "<input type='text' readonly='readonly' class='form-control' id='jobPresentRate"
																												+ item2.JobId
																												+ "' onkeyup='presentRateKU("
																												+ item2.JobId
																												+ ");' value='"
																												+ item2.PresentRate
																												+ "'>"
																												+ "</td>"
																												+ "<td>"
																												+ item2.JobQtyOfSample
																												+ "</td>"
																												+ "<td>"
																												+ "<input type='text' readonly='readonly' class='form-control' id='jobQty"
																												+ item2.JobId
																												+ "' onkeyup='qtyKU("
																												+ item2.JobId
																												+ ");' value='"
																												+ item2.AssignQty
																												+ "'>"
																												+ "</td>"
																												+ "<td>"
																												+ item2.JobUOMOfSample
																												+ "</td>"
																												+ "<td>"
																												+ "<input type='text' readonly='readonly' id='jobAmount"+item2.JobId+"' class='form-control' value='"+item2.Amount+"'>"
																												+ "</td>"
																												+ "<td colspan='2'>"
																												+ "<input type='text' readonly='readonly' id='estSubmDate"+item2.JobId+"' value='"+EstSubDate+"' class='form-control'>"
																												+ "</td>"
																												+ "<td>"
																												+ item2.Status
																												+ "</td>"
																												+ "</tr>"
																												+ "</tbody>");

																					});
																}
															});

												} else if (item2.japYesOrNo == "no"
														|| (item2.japYesOrNo == "yes" && item2.japRemQty == 0)) {
													if (item2.japYesOrNo == "no") {
														var Assigned = "Not Assigned";
														var japId = 0;
													} else if (item2.japYesOrNo == "yes"
															&& item2.japRemQty == 0) {
														var Assigned = "Not completed";
														var japId = item2.japId;
													}
													$('#productNjobsDiv')
															.append(
																	'<table id="pDetTable'+item2.ProductForSampleId+'" class="table table-striped table-bordered"><thead style="background-color: #F0F0F0;"><tr><th style="text-align: right;">'
																			+ "Pcode:"
																			+ '</th><td>'
																			+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductCode+"'>"
																			+ "<input type='hidden' class='form-control' readonly='readonly' id='productForSampleId"+item2.ProductForSampleId+"' value='"+item2.ProductForSampleId+"'>"
																			+ "<input type='hidden' class='form-control' readonly='readonly' id='productId"+item2.ProductForSampleId+"' value='"+ item2.ProductId+ "'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Description:"
																			+ '</th><td>'
																			+ "<input type='text' class='form-control' readonly='readonly' value='"+item2.ProductDesc+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Qty:"
																			+ '</th><td>'
																			+ "<input type='text' id='qtyOfSampleProduct"+item2.ProductForSampleId+"' class='form-control' readonly='readonly' value='"+item2.ProductQtyForSample*pQty+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Total Amount:"
																			+ '</th><td>'
																			+ "<input type='text' class='form-control' id='productEachTotal"+item2.ProductForSampleId+"' readonly='readonly' value='"+item2.ProductTotalAmount+"'>"
																			+ '</td><th style="text-align: right;">'
																			+ "Status:"
																			+ '</th><td>'
																			+ Assigned
																			+ '</td></tr><tr><th>'
																			+ "#"
																			+ '</th><th colspan="2">'
																			+ "Job"
																			+ '</th><th colspan="2">'
																			+ "Sample Rate"
																			+ '</th><th>'
																			+ "Qty per sample"
																			+ '</th><th>'
																			+ "Total Qty"
																			+ '</th><th>'
																			+ "UOM"
																			+ '</th><th colspan="2">'
																			+ "Status"
																			+ '</th></tr></thead></table>');

													var ProductForSampleId = item2.ProductForSampleId;
													var planId = pId;
													var prodId = item2.ProductId;
													$
															.ajax({
																type : "post",
																url : "getJobsForDesignCostSheetByPlanId",
																dataType : "json",
																data : {
																	pid : ProductForSampleId,
																	planId : planId,
																	prodId : prodId,
																	japId : japId
																},
																success : function(
																		data2) {
																	$
																			.each(
																					data2,
																					function(
																							index,
																							item2) {
																						$(

																								"#pDetTable"
																										+ ProductForSampleId)
																								.append(
																										"<tbody id='pDetTable"+item2.JobId+"'>"
																												+ "<tr>"
																												+ "<td>"
																												+ Number(1 + index)
																												+ "</td>"
																												+ "<td colspan='2'>"
																												+ item2.JobName
																												+ "<input type='hidden' id='jobId"+item2.JobId+"' value='"+item2.JobId+"'>"
																												+ "</td>"
																												+ "<td colspan='2'>"
																												+ item2.JobRateOfSample
																												+ "</td>"
																												+ "<td>"
																												+ "<input type='text' class='form-control' id='jobRemQty"+item2.JobId+"' readonly='readonly' value='"+item2.JobQtyOfSample
																														+"'>"
																												+ "</td>"
																												+ "<td>"
																												+ "<input type='text' class='form-control' id='jobRemQty"+item2.JobId+"' readonly='readonly' value='"+item2.JobQtyOfSample
																														* pQty+"'>"
																												+ "</td>"
																												+ "<td>"
																												+ item2.JobUOMOfSample
																												+ "</td>"
																												+ "<td colspan='2'>"
																												+ item2.Status
																												+ "</td>"
																												+ "</tr>"
																												+ "</tbody>");

																					});
																}
															});
												}
											});
						}
					});
			$(".estSubmDate").trigger("click");
			$("#allJobBtn").prop("disabled", "disabled");
		}

		function allJobPlanF() {
			$.ajax({
				type : "post",
				url : "getAllJobPlans",
				dataType : "json",
				success : function(data2) {
					$("#jobPlansTableA tbody").empty();
					//alert(data2.length);
					if (data2.length > 0) {
						$.each(data2, function(index, item2) {
							$(

							"#jobPlansTableA").append(
									"<tbody id='jobPlan" + item2.jpId
											+ "' onclick='selectPlan(\""
											+ item2.jpId + "\",\""
											+ item2.jpQty + "\");'>" + "<tr>"
											+ "<td>" + Number(1 + index)
											+ "</td>" + "<td>" + item2.jpId
											+ "</td>"
											/* + "<td>"
											+ item2.jpDEsc
											+ "</td>" */
											+ "<td>" + formatDate(item2.jpDate)
											+ "</td>" + "<td>" + item2.jpQty
											+ "</td>" + "<td>" + item2.dNo
											+ "</td>" + "</tr>" + "</tbody>");
						});
						$("#jobPlansAll").modal("show");
					} else {
						alert("There is no plan");
						$("#dNo").val("");
					}
				}
			});
		}

		function jobSearchByPlanNoF() {
			if ($("#planNo").val() != "") {
				$("#jobSearchByPlanNoId").submit();
			} else {
				alert("Please select a plan first");
			}
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
