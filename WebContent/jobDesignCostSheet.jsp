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
		$("#designCostSheet").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Sample Job CostSheet')}">
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
	<c:if test="${requestScope['sampleId']!=null}">
		<script type="text/javascript">
			var myWindow = window
					.open(
							"jobChallanForSampleDesignCostSheet.jsp?id=${requestScope['sampleId']}",
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
								<h3 style="margin-top: 11px;">Sample Job Cost Sheet</h3>
							</div>

							<!-- <div class="widget-area"> -->
							<div class="col-md-12">
								<form role="form" class="sec" method="post" id="jobForm"
									action="sampleJobCost">
									<div class="widget-area" style="margin-bottom: 20px;">
										<div class="col-md-6">
											<div class="col-md-12"></div>
											<div class="col-md-12">
												<b class="font">Design No.<font color="red" size="4">*</font></b>
												<input type="text" class="form-control" id="designNo"
													name="designNo" autocomplete="off" onkeyup="dNoKeyUp();"
													onchange="dNoChange();"
													onkeypress="return blockSpecialChar(event)"> <input
													type="hidden" id="dNoCheck" name="dNoCheck">
											</div>
											<div class="col-md-12">
												<label class="font" for="designDescription">Design
													Descripton :<font color="red" size="4">*</font>
												</label>
												<textarea class="form-control" rows="" cols=""
													name="designDescription" id="designDescription"
													onkeypress="return blockSpecialCharWS(event)"></textarea>
											</div>
											<div class="col-md-12">
												<b class="font">Designer Name :<font color="red"
													size="4">*</font></b> <input type="text" class="form-control"
													id="designerName" name="designerName" autocomplete="off">
												<input type="hidden" id="designerId" name="designerId">

											</div>
											<div class="col-md-12">
												&nbsp; &nbsp; &nbsp; <b class="font">Designer Details :</b>
												<textarea rows="5" cols="" id="jDetail" class="form-control"
													readonly="readonly"></textarea>
											</div>
											<div class="col-md-12">
												<label for="qty" class="font">Qty :</label> <input
													type="number" name="qty" class="form-control" value="1"
													readonly="readonly">
											</div>
										</div>
										<div class="col-md-6">
											<!-- <div class="col-md-12">
												<div class="form-group">
													<label class="font" for="designDescription">Design
														Descripton :<font color="red" size="4">*</font>
													</label>
													<textarea class="form-control" rows="" cols=""
														name="designDescription" id="designDescription"
														onkeypress="return blockSpecialCharWS(event)"></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label for="qty" class="font">Qty :</label> <input
														type="number" name="qty" class="form-control" value="1"
														readonly="readonly">
												</div>
											</div> -->
											<br>
											<!-- <div class="form-group">
												<label for="" class="font">Sample
													Design Image :</label><input type="file"
													onchange="readURL(this);" name="productImage"> <input
													type="hidden" name="proImage1" id="proImage1" value="">
											</div>

											<div class="form-group"
												style="width: 50%; height: 100px; margin-top: 27px;">
												<img id="image" alt="" src="">
											</div> -->
											<div class="col-md-12">
												<div class="form-group">
													<label> Sample Design Image :</label>
													<div>
														<img id="image" alt="" src="data:image/jpeg;base64,"
															style="width: 100px; height: 50px;">
													</div>
													<input type="file" onchange="readURL(this);"
														name="productImage"> <input type="hidden"
														name="proImage1" id="proImage1" value=""> <br>
													<a href="javascript:void(take_snapshot())"><button
															class="btn blue btn-default" type="button">Take
															Snapshot</button></a>
													<div id="my_camera" style="width: 320px; height: 240px;">
													</div>
												</div>
											</div>
										</div>
										<div class='toast' style='display: none'>
											<h3 id="msg">${requestScope['msg']}</h3>
										</div>
									</div>
									<br> <br> <br>
									<h3 style="margin-top: 10px; padding-top: 10px;">List of
										material use</h3>
									<table id="products" class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Product code</th>
												<th>Product Description</th>
												<th>Quantity</th>
												<th>UOM</th>
												<th>rate</th>
												<th>Amount</th>
												<th>Item</th>
												<th>Remove</th>
											</tr>
										</thead>
									</table>
									<a href="#" onclick="addProduct();"><img src="img/add.png"
										height="20px" style="float: right;"></a>
									<h3>List of jobs</h3>
									<table id="jobs" class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Job Name</th>
												<th>Product Code</th>
												<th>Qty<font color="red" size="4">*</font></th>
												<th>UOM</th>
												<th>Rate<font color="red" size="4">*</font></th>
												<th>Amount</th>
												<th>Remove</th>
											</tr>
										</thead>
									</table>

									<br>
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
													name="profitType" id="profitType" onchange="profitTypeF();">
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
										<!-- <div class="form-group" style="float: right;">
											<label for="surcharge" class="font">Surcharge :</label> <input
												type="number" name="surcharge" value="0.00" id="surcharge"
												onkeyup="surchargeF();" autocomplete="off"> <br>
												<label for="" class="font">Profit <select>
												<option>%</option>
												<option>Flat</option>
												</select> :</label> <input
												type="number" name="profitVal" value="0.00" id="profitVal"
												onkeyup="profitValF();" autocomplete="off"> <br>
												<label for="" class="font">Profit Value :</label> <input
												type="number" name="totProfit" value="0.00" id="totProfit"
												readonly="readonly" autocomplete="off"> <br>
											<label for="" class="font">GrandTotal :</label> <input
												type="number" name="gtot" value="0.00" readonly="readonly"
												id="gtot"> <input type="hidden" name="gt"
												value="0.00" readonly="readonly" id="gt">
										</div> -->
									</div>
									<div class="col-md-12" style="margin-top: 10px;">
										<div class="form-group">
											<input type="button" value="Submit"
												onclick="designCostSheetSubmit();"
												class="btn green pull-right">
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

	<div id="addProduct" class="modal fade" role="dialog"
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
								<span>Add Products</span>
							</div>
							<br>
							<div class="row">
								<div class="col-md-8">
									<table>
										<tr>
											<td><label for="proCode" class="font">Product
													Code :<font color="red" size="4">*</font>
											</label></td>
											<td><input type="hidden" id="proId"> <input
												type="text" id="proCode" name="proCode"></td>
										</tr>
										<tr>
											<td><label for="proDesc" class="font">Product
													Description :</label></td>
											<td><textarea rows="" cols="" id="proDesc"
													name="proDesc" readonly="readonly"></textarea></td>
										</tr>
										<tr>
											<td><label for="proQty" class="font">Product Qty
													:<font color="red" size="4">*</font>
											</label></td>
											<td><input type="text" class="numChk" id="proQty"></td>
										</tr>
										<tr>
											<td><label for="proUOM" class="font">UOM :</label></td>
											<td><input type="text" name="proUOM" id="proUOM"
												readonly="readonly"> <input type="hidden" id="UOMid"
												name="UOMid"></td>
										</tr>
										<tr>
											<td><label for="rate" class="font">Product Rate
													:<font color="red" size="4">*</font>
											</label></td>
											<td><input type="text" id="rate" class="numChk"
												onkeyup="rateDescF();"></td>
										</tr>
										<tr id="rateDesc">
											<td colspan="2">(This is latest rate. It can be changed)</td>
										</tr>
										<tr>
											<td><label for="rate" class="font">Select Job :<font
													color="red" size="4">*</font></label></td>
											<td><c:forEach
													items="${sessionScope['ejb'].getAllJobTypes()}" var="job">
													<input type="checkbox" class="isSelected" name="jobName"
														value="${job.id}">
													<span id="jobName${job.id}">${job.jobName}</span>
													<br>
												</c:forEach></td>
										</tr>
									</table>

									<div class="form-group">
										<input type="button" class="btn btn-success medium" id="yesC"
											value="Add" onclick="addProductRow();">
									</div>
								</div>
								<div class="col-md-4">
									Select Item : <br> <br>
									<c:forEach items="${sessionScope['ejb'].getAllItemDetails()}"
										var="item">
										<input type="radio" class="isSelectedItem" name="item"
											onclick="itemF('${item.name}','${item.id}');">${item.name}&nbsp;													
																	<br>
									</c:forEach>
									<input type="hidden" id="itemName"> <input
										type="hidden" id="itemId">
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
<script>
	/******************for products*************/
	function addProduct() {
		$("#addProduct").modal("show");
	}
	$("#proCode").autocomplete(
			{
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
									id : item.id,
									description : item.description,
									qtyUnitId : item.qtyUnitId,
									qtyUnitName : item.qtyUnit,
									latestCost : item.latestCost
								});
							}));
						}
					});
				},
				change : function(evt, ui) {
					if (ui.item == null) {
						$("#proCode").val("");
						$("#proId").val("");
						$("#proDesc").val("");
						$("#proUOM").val("");
						$("#UOMid").val("");
						$("#rate").val("");
					}
				},
				select : function(evt, ui) {
					$("#rate").prop("readonly", false);
					if ($(document).find("#proTable" + ui.item.id).length > 0) {
						$("#rate")
								.val(
										$(
												"#proTable" + ui.item.id
														+ " td:nth-child(6)")
												.html());
						//$("#rate").prop("readonly", true);
						$("#proQty")
								.val(
										$(
												"#proTable" + ui.item.id
														+ " td:nth-child(4)")
												.html());
					}
					$("#proId").val(ui.item.id);
					$("#proDesc").val(ui.item.description);
					$("#proUOM").val(ui.item.qtyUnitName);
					$("#UOMid").val(ui.item.qtyUnitId);
					$("#rate").val(ui.item.latestCost);
					$("#rateDesc").removeAttr("style");
				}
			});

	function addProductRow() {
		var i = 0;
		$(".isSelected").each(function() {
			if ($(this).is(':checked')) {
				i = 1;
			}
		});

		var item = 0;
		$(".isSelectedItem").each(function() {
			if ($(this).is(':checked')) {
				item = 1;
			}
		});
		if ($("#proCode").val() == "") {
			alert("please select product code.");
		} else if ($("#proQty").val() == "") {
			alert("please enter product qty");
		} else if ($("#rate").val() == "") {
			alert("please enter product rate");
		} else if (i == 0) {
			alert("Please select job");
		} else if (item == 0) {
			alert("Please select item");
		} else {
			//error

			$("#addProduct").modal("hide");
			if ($(document).find("#proTable" + $("#proId").val()).length > 0) {
				$("#gt").val(
						Number($("#gt").val())
								- $(
										"#proTable" + $("#proId").val()
												+ " td:nth-child(7)").html()
								+ Number(Number($("#proQty").val())
										* Number($("#rate").val())));
				$("#proTable" + $("#proId").val() + " td:nth-child(4)").html(
						Number($("#proQty").val()));
				$("#proQtyH" + $("#proId").val()).val(
						Number($("#proQty").val()));
				$("#proTable" + $("#proId").val() + " td:nth-child(6)").html(
						$("#rate").val());
				$("#rateH" + $("#proId").val()).val(Number($("#rate").val()));
				$("#proTable" + $("#proId").val() + " td:nth-child(7)").html(
						Number($("#proQty").val()) * Number($("#rate").val()));
				$("#amountH" + $("#proId").val()).val(
						Number($("#proQty").val()) * Number($("#rate").val()));
				$("#proTable" + $("#proId").val() + " td:nth-child(8)").html(
						$("#itemName").val());
				$("#itemIdH" + $("#proId").val()).val(
						Number($("#itemId").val()));

				$('[name="jobName"]:checked')
						.each(
								function() {
									if ($(document).find(
											"#jobRow" + $(this).val()
													+ $("#proId").val()).length == 0) {

										$("#jobs")
												.append(
														'<tbody class="proTable'
																+ $("#proId")
																		.val()
																+ '" id="jobRow'
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '"><tr>'
																+ '<td>#<input type="hidden" value="'
																+ $("#proId")
																		.val()
																+ '" name="proId"><input type="hidden" value="'
																+ $(this).val()
																+ '" name="jobId'
																+ $("#proId")
																		.val()
																+ '"></td>'
																+ '<td>'
																+ $(
																		"#jobName"
																				+ $(
																						this)
																						.val())
																		.html()
																+ '</td>'
																+ '<td>'
																+ $("#proCode")
																		.val()
																+ '</td>'
																+ '<td><input type="text" class="numChk" id="rate1'
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '" onchange="calAnount(\''
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '\');" value="1" name="jobqty'
																+ $("#proId")
																		.val()
																+ '"></td>'
																+ '<td>'
																+ $("#proUOM")
																		.val()
																+ '</td>'
																+ '<td><input type="text" class="numChk" id="qtu1'
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '" onchange="calAnount(\''
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '\');" value="0" name="jobRate'
																+ $("#proId")
																		.val()
																+ '"></td>'
																+ '<td><input type="text" value="0" name="totalAmount'
																+ $("#proId")
																		.val()
																+ '" readonly="readonly" class="eachtotalvalue" id="amount'
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '"></td>'
																+ '<td><a href="#" onclick="removeJobRow(\''
																+ $(this).val()
																+ $("#proId")
																		.val()
																+ '\',\''
																+ $("#proId")
																		.val()
																+ '\');"><font color="red"><u>remove</u></font></a></td>'
																+ '</tr>'
																+ '</tbody>');
										$("#jobQty").val("0");
										$("#jobrate").val("0");
										$("#jobName").val("0");
										$("#jobUOM").val("0");
									}
								});

			} else {
				$("#gt").val(
						Number($("#gt").val())
								+ Number(Number($("#proQty").val())
										* Number($("#rate").val())));
				$("#products")
						.append(
								'<tbody id="proTable'
										+ $("#proId").val()
										+ '">'
										+ '<tr>'
										+ '<td>#</td>'
										+ '<td>'
										+ '<input type="hidden" name="productId" value="'
										+ $("#proId").val()
										+ '"><input type="hidden" name="itemId" id="itemIdH'
										+ $("#proId").val()
										+ '" value="'
										+ $("#itemId").val()
										+ '"><input type="hidden" name="proQty" id="proQtyH'
										+ $("#proId").val()
										+ '" value="'
										+ $("#proQty").val()
										+ '"><input type="hidden" name="rate" id="rateH'
										+ $("#proId").val()
										+ '" value="'
										+ $("#rate").val()
										+ '"><input type="hidden" name="amount" id="amountH'
										+ $("#proId").val()
										+ '" value="'
										+ Number(
												Number($("#proQty").val())
														* Number($("#rate")
																.val()))
												.toFixed(2)
										+ '"><input type="hidden" name="qtyUnitId" value="'
										+ $("#UOMid").val()
										+ '">'
										+ $("#proCode").val()
										+ '</td>'
										+ '<td>'
										+ $("#proDesc").val()
										+ '</td>'
										+ '<td>'
										+ $("#proQty").val()
										+ '</td>'
										+ '<td>'
										+ $("#proUOM").val()
										+ '</td>'
										+ '<td>'
										+ $("#rate").val()
										+ '</td>'
										+ '<td>'
										+ Number(
												Number($("#proQty").val())
														* Number($("#rate")
																.val()))
												.toFixed(2)
										+ '</td>'
										+ '<td>'
										+ $("#itemName").val()
										+ '</td>'
										+ '<td><a href="#" onclick="removeProductRow(\''
										+ $("#proId").val()
										+ '\');"><font color="red"><u>remove</u></font></a></td>'
										+ '</tr>' + '</tbody>');

				$('[name="jobName"]:checked')
						.each(
								function() {

									$("#jobs")
											.append(
													'<tbody class="proTable'
															+ $("#proId").val()
															+ '" id="jobRow'
															+ $(this).val()
															+ $("#proId").val()
															+ '"><tr>'
															+ '<td>#<input type="hidden" value="'
															+ $("#proId").val()
															+ '" name="proId"><input type="hidden" value="'
															+ $(this).val()
															+ '" name="jobId'
															+ $("#proId").val()
															+ '"></td>'
															+ '<td>'
															+ $(
																	"#jobName"
																			+ $(
																					this)
																					.val())
																	.html()
															+ '</td>'
															+ '<td>'
															+ $("#proCode")
																	.val()
															+ '</td>'
															+ '<td><input type="text" class="numChk" id="rate1'
															+ $(this).val()
															+ $("#proId").val()
															+ '" onchange="calAnount(\''
															+ $(this).val()
															+ $("#proId").val()
															+ '\');" value="1" name="jobqty'
															+ $("#proId").val()
															+ '"></td>'
															+ '<td>'
															+ $("#proUOM")
																	.val()
															+ '</td>'
															+ '<td><input type="text" class="numChk" id="qtu1'
															+ $(this).val()
															+ $("#proId").val()
															+ '" onchange="calAnount(\''
															+ $(this).val()
															+ $("#proId").val()
															+ '\');" value="0" name="jobRate'
															+ $("#proId").val()
															+ '"></td>'
															+ '<td><input type="text" value="0" name="totalAmount'
															+ $("#proId").val()
															+ '" readonly="readonly" class="eachtotalvalue" id="amount'
															+ $(this).val()
															+ $("#proId").val()
															+ '"></td>'
															+ '<td><a href="#" onclick="removeJobRow(\''
															+ $(this).val()
															+ $("#proId").val()
															+ '\',\''
															+ $("#proId").val()
															+ '\');"><font color="red"><u>remove</u></font></a></td>'
															+ '</tr>'
															+ '</tbody>');
									$("#jobQty").val("0");
									$("#jobrate").val("0");
									$("#jobName").val("0");
									$("#jobUOM").val("0");
								});
			}
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

			//error
			$("#proCode").val("");
			$("#proId").val("");
			$("#proDesc").val("");
			$("#proUOM").val("");
			$("#UOMid").val("");
			$("#proQty").val("");
			$("#rate").val("");
			$(".isSelected").removeProp("checked");
			$(".isSelectedItem").removeProp("checked");
		}

	}

	function calAnount(a) {
		$("#rate1" + a).numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});
		$("#qtu1" + a).numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});
		$("#qtu1" + a).val(Number($("#qtu1" + a).val()).toFixed(2));
		$("#amount" + a).val(
				Number(
						Number($("#qtu1" + a).val())
								* Number($("#rate1" + a).val())).toFixed(2));

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

	function removeProductRow(id) {
		//error
		n1 = $("#proTable" + id + " td:nth-child(7)").html();
		$("#proTable" + id).remove();
		$(".proTable" + id).remove();

		$("#gt").val(
				Math.round((Number($("#gt").val()) - Number(n1)) * 100) / 100);

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

	function removeJobRow(id, proId) {
		//error
		$("#jobRow" + id).remove();

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

		if ($('.proTable' + proId).length == 0) {
			removeProductRow(proId);
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

	/****************for Designer*****************/
	$("#designerName").autocomplete(
			{
				source : function(req, resp) {
					$.ajax({
						url : "getVendorsByNameAndType",
						dataType : "json",
						data : {
							type : "DESIGNER",
							name : req.term
						},
						type : "post",
						success : function(data) {
							resp($.map(data, function(item) {
								return {
									value : item.name,
									id : item.id,
									companyName : item.companyName,
									ph1 : item.ph1,
									ph2 : item.ph2,
									address : item.address,
									pinCode : item.pinCode,
									email : item.email,
									city : item.city
								}
							}));

						}
					});
				},
				change : function(ev, ui) {
					if (ui.item == null) {
						$("#designerName").val("");
						$("#jDetail").val("");
						$("#designerId").val("");
					}
				},
				select : function(ev, ui) {
					$("#designerId").val(ui.item.id);
					$("#jDetail").val(
							"Address : " + ui.item.address + "\nPh1 : "
									+ ui.item.ph1 + ",\t Ph2 : " + ui.item.ph2
									+ "\nCity : " + ui.item.city
									+ ",\tPincode : " + ui.item.pinCode
									+ "\nEmail : " + ui.item.email);
				}

			});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).width(120).height(85);
				var str = e.target.result;
				//alert(str);
				$("#proImage1").val(str.substring(str.lastIndexOf(',') + 1));
			};

			reader.readAsDataURL(input.files[0]);
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
			$("#grandtot")
					.val(
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
			$("#grandtot")
					.val(
							Number(
									Number($("#gtot").val())
											+ Number($("#totProfit").val()))
									.toFixed(2));

		}
	}
</script>

<script type="text/javascript">
	function dNoKeyUp() {
		$("#dNoCheck").val("");
		$
				.ajax({
					url : "getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck",
					dataType : "json",
					data : {
						dNo : $("#designNo").val()
					},
					success : function(data) {
						$.map(data, function(item) {
							if (item.dNumber != "") {
								$("#dNoCheck").val(item.dNumber);
							} else {
								$("#dNoCheck").val("");
							}
						});
					}

				});

	}

	function dNoChange() {
		if ($("#dNoCheck").val() != "") {
			alert("Duplicate Design Number");
			$("#dNoCheck").val("");
			$("#designNo").val("");
		}
	}

	function designCostSheetSubmit() {
		if ($("#designNo").val() == "") {
			alert("please enter design no.");
		} else if ($("#designerName").val() == "") {
			alert("please select designer name");
		} else if ($("#designDescription").val() == "") {
			alert("please enter design description");
		} else if ($("#gt").val() == 0) {
			alert("No Product found.");
		} else {
			$("#jobForm").submit();
		}
	}
</script>
<script type="text/javascript">
	function blockSpecialChar(e) {
		var k = e.keyCode;
		return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
	}
	function blockSpecialCharWS(e) {
		var k = e.keyCode;
		return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
	}
	$(function() {
		$("#surcharge").numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});
	});
	$(function() {

		$(".numChk").numericInput({

			allowFloat : true, // Accpets positive numbers (floating point)

			allowNegative : false,
		// Accpets positive or negative integer

		});

	});
</script>
<script>
	$(document).ready(function() {
		$("#rate").change(function() {
			$("#rate").val(Number($("#rate").val()).toFixed(2));
		});
		$("#surcharge").change(function() {
			$("#surcharge").val(Number($("#surcharge").val()).toFixed(2));
		});
	});

	function itemF(name, id) {
		$("#itemName").val(name);
		$("#itemId").val(id);
	}
</script>
<script type="text/javascript" src="js/webcam.js"></script>
<script>
	Webcam.set({
		width : 320,
		height : 240,
		image_format : 'jpeg',
		jpeg_quality : 90
	});
	Webcam.attach('#my_camera');

	function take_snapshot() {
		Webcam.snap(function(data_uri) {
			$('#image').attr('src', data_uri).width(120).height(85);
			str = data_uri;
			$("#proImage1").val(str.substring(str.lastIndexOf(',') + 1));
		});
	}
	function rateDescF() {
		$("#rateDesc").attr("style", "display : none;");
	}
</script>
</html>
