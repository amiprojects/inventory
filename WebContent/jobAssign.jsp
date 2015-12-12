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
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#purch").attr("id", "activeSubMenu");
		$("#sPurchEntry").attr("style", "color: red;");
		$("#notpaid").hide();
		$("#semipaid").hide();
		$("#fullpaid").hide();
		$("#cash").hide();
		$("#bank").hide();
		$("#cheque").hide();
		$("#scash").hide();

	});
	function closePayment() {
		$("#notpaid").hide();
		$("#semipaid").hide();
		$("#fullpaid").hide();
		$("#cash").hide();
		$("#bank").hide();
		$("#cheque").hide();
		$("#scash").hide();
		$("#pstatus").val('-');
	}
	
	
	
	
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
									<form role="form" class="sec" method="post" id="purchaseForm"
										action="purchaseEntry">
										<div class="widget-area">
											<div class="col-md-6">
												<div class="col-md-12">
												
														
													
												</div>
												<div class="col-md-12">
													<b class="font">Jobber Name :</b> <input
														type="text" class="form-control" id="jName" name="jName">
													<input type="hidden" id="jId" name="jId">
												</div>
												<div class="col-md-12">
													
													&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
													<textarea rows="5" cols="" id="jDetail"
														class="form-control" readonly="readonly"></textarea>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Job Challan no :</label> <input
														type="text" placeholder="" id="" class="form-control"
														name="vendorBillNo">
												</div>
												<div class="form-group">

													<label for="" class="font">Asigned Date :</label>
													<input type="text" class="form-control"
																name="vendorVATregDate" required="required"
																id="datepicker" readonly="readonly">
												</div>
												
												<br> <input type="button" class="btn green pull-right"
													data-toggle="modal" data-target="#addProduct"
													value="Add Product" style="width: 100%" onclick="manage();">
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
											<tbody>
											<tr>
												<td>1</td>
												<td>er65</td>
												<td>gfhg</td>
												<td>56</td>
												<td>kg</td>
												<td></td>
											<tr>
											<tr>
											   <td colspan="2">Total Products:<td>
											   <td colspan="2">Quantity:<td>
											</tr>
											</tbody>
										</table>
										<div class="col-md-6">
										  <b class="font">Submission Date :</b>
										  <input type="text" class="form-control"
																name="submissionDate" required="required"
																id="datepicker1" readonly="readonly">
										</div><br><br>
										<input type="button" class="btn green pull-right"
													value="Save" style="width: 40%" >
										
										<input type="hidden" name="isSalable" id="isSalable">
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

	



	<div id="addProduct" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="close1" class="close">&times;</button>
					
				</div>
				<div class="modal-body">
					<span>Product Code :</span> <input type="text" id="prodcode"
						class="form-control">
				</div>
				<div class="modal-body">
					<span>Quantity :</span> <input type="text" id="prodqty"
						class="form-control">
				</div>
				<div class="modal-body">
					<span>Describe Work :</span> <textarea rows="5" cols="" id="work"
														class="form-control"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="ProdSave">Add</button>
					<button type="button" class="btn btn-default" id="close">Close</button>
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
		$(document).ready(function() {
			$("#isSalable").val('no');
		});
		$(function() {
			$("#datepicker").datepicker();
		});
		function salable() {

			if ($('#sale').is(":checked")) {
				$("#isSalable").val('yes');
				$("#wsp").attr("readonly", false);
				$("#mrp").attr("readonly", false);
			} else {
				$("#isSalable").val('no');
				$("#wsp").attr("readonly", true);
				$("#mrp").attr("readonly", true);
			}
		}
		$("input:radio[name=lot]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesLot") {
				$("#lotText").prop("disabled", false);
			} else {
				$("#lotText").prop("disabled", true);
			}
		});
		$("input:radio[name=serial]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "yesSerial") {
				$("#serialText").prop("disabled", false);
			} else {
				$("#serialText").prop("disabled", true);
			}
		});
		/* function first() {
			if ($('#a').is(":checked")) {
				alert("hi");
			}
		} */

		$("#close").click(function() {
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		/* $("#close1").click(function() {
			$("#another").modal("hide");
		}); */
		function close1() {
			$("#another").modal("hide");
		}
		function manage() {
			$("#header").hide();
		}
		$("#yesP").click(function() {
			$("#another").modal("hide");
		});
		$("#noP").click(function() {
			$("#another").modal("hide");
			$("#addProduct").modal("hide");
			$("#header").show();
		});
		var i = 1;
		function anotherShow() {
			$("#another").modal("show");
			//$("#amount").val(Number($("#qty").val()) * Number($("#rate").val()));
			$("#purProTable").append(
					'<tbody><tr><td>' + i + '</td><td>' + $("#pCode").val()
							+ '</td><td>' + $("#pDesc").val() + '</td><td>'
							+ $("#rate").val() + '</td><td>' + $("#qty").val()
							+ '</td><td>' + Number($("#qty").val())
							* Number($("#rate").val()) + '</td></tr></tbody>');
			$("#subTotal").val(
					Number($("#subTotal").val()) + Number($("#qty").val())
							* Number($("#rate").val()));
			//$("#qty").val("");
			i++;

			$("#pCodeIdH").val("Id");
			$("#hiddenTable").append(
					'<tbody><tr>'
							+ '<td><input type="text" name="pCodeIdH" value=\''
							+ $("#pCode").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr1H" value=\''
							+ $("#attr1").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr2H" value=\''
							+ $("#attr2").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr3H" value=\''
							+ $("#attr3").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr4H" value=\''
							+ $("#attr4").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr5H" value=\''
							+ $("#attr5").val()
							+ '\'></td>'
							+ '<td><input type="text" name="attr6H" value=\''
							+ $("#attr6").val()
							+ '\'></td>'
							+ '<td><input type="text" name="qtyH" value=\''
							+ $("#qty").val()
							+ '\'></td>'
							+ '<td><input type="text" name="uomH" value=\''
							+ $("#uom").val()
							+ '\'></td>'
							+ '<td><input type="text" name="rateH" value=\''
							+ $("#rate").val()
							+ '\'></td>'
							+ '<td><input type="text" name="wspH" value=\''
							+ $("#wsp").val()
							+ '\'></td>'
							+ '<td><input type="text" name="mrpH" value=\''
							+ $("#mrp").val()
							+ '\'></td>'
							+ '<td><input type="text" name="lotH" value=\''
							+ $("#lotText").val()
							+ '\'></td>'
							+ '<td><input type="text" name="serialH" value=\''
							+ $("#serialText").val()
							+ '\'></td>'
							+ '</tr></tbody>');
			$("#taxAmount").val(
					Number($("#subTotal").val()) * Number($("#taxTot").val())
							/ Number(100));
			$("#gt").val(
					Number($("#subTotal").val())
							+ Number($("#taxAmount").val())
							+ Number($("#transportCost").val())
							+ Number($("#surcharge").val()));
		}

		function getVendorNameByType() {
			$("#vName").val("");
			$("#vDetail").val("");
		}

		$(function() {
			$("#vName")
					.autocomplete(
							{
								source : function(req, resp) {
									$
											.ajax({
												url : "getVendorByVendorType",
												dataType : "json",
												data : {
													id : $(
															'[name="vendorType"]')
															.val(),
													term : req.term
												},
												success : function(data) {
													resp($
															.map(
																	data,
																	function(
																			item) {
																		return ({
																			value : item.name,
																			addr : item.address,
																			id : item.id,
																			ph1 : item.ph1,
																			ph2 : item.ph2
																		});
																	}));
												}
											});
								},
								change : function(event, ui) {
									if (ui.item == null) {
										$("#vName").val("");
										$("#vDetail").val("");
										$("#taxGroup").val(0).prop("selected",
												true);
										$("#taxTot").val('0');
										$("#taxAmount").val('0');
										$("#gt")
												.val(
														Number($("#subTotal")
																.val())
																+ Number($(
																		"#taxAmount")
																		.val())
																+ Number($(
																		"#transportCost")
																		.val())
																+ Number($(
																		"#surcharge")
																		.val()));
									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val(
												"Address : \n\t" + ui.item.addr
														+ "\nPhone1 : "
														+ ui.item.ph1
														+ "\nPhone2 : "
														+ ui.item.ph2);
									}

								},
								select : function(event, ui) {
									if (ui.item == null) {
										$("#vName").val("");

									} else {
										$("#vId").val(ui.item.id)
										$("#vDetail").val(
												"Address : \n\t" + ui.item.addr
														+ "\nPhone1 : "
														+ ui.item.ph1
														+ "\nPhone2 : "
														+ ui.item.ph2);

										$
												.ajax({
													type : "post",
													url : "getAccountDetails",
													data : {
														id : ui.item.id
													},
													dataType : "json",
													success : function(data5) {
														$("#taxGroup")
																.val(
																		data5.tax_Type_Group)
																.prop(
																		"selected",
																		true);
														$("#taxTot").val(
																data5.taxTotal);
														$("#taxAmount")
																.val(
																		Number($(
																				"#subTotal")
																				.val())
																				* Number($(
																						"#taxTot")
																						.val())
																				/ Number(100));
														$("#gt")
																.val(
																		Number($(
																				"#subTotal")
																				.val())
																				+ Number($(
																						"#taxAmount")
																						.val())
																				+ Number($(
																						"#transportCost")
																						.val())
																				+ Number($(
																						"#surcharge")
																						.val()));
													},
													error : function(a, b, c) {
														alert("error: " + b);
													}
												});
									}
								}
							});
		});
		function selectedTaxGroup() {
			if ($("#taxGroup").val() != 0) {
				$.ajax({
					url : "getTaxGroupById",
					data : {
						id : $("#taxGroup").val()
					},
					dataType : "json",
					success : function(data) {
						$("#taxTot").val(data.taxtot);
						$("#taxAmount").val(
								Number($("#subTotal").val())
										* Number($("#taxTot").val())
										/ Number(100));
						$("#gt").val(
								Number($("#subTotal").val())
										+ Number($("#taxAmount").val())
										+ Number($("#transportCost").val())
										+ Number($("#surcharge").val()));
					},
					error : function(a, b, c) {
						alert(c);
					}
				});
			} else {
				$("#taxTot").val('0');
				$("#taxAmount").val('0');
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			}

		}
		function gtot() {
			if (($("#transportCost").val() != "")
					|| ($("#surcharge").val() != "")) {
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			} else {
				$("#gt").val(
						Number($("#subTotal").val())
								+ Number($("#taxAmount").val())
								+ Number($("#transportCost").val())
								+ Number($("#surcharge").val()));
			}
		}
		function submit() {
			document.getElementById("purchaseForm").submit();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>