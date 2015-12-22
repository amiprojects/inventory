<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/Checkbox.css" type="text/css" />
<link rel="stylesheet" href="css/checkbox1.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sales").attr("id", "activeSubMenu");
		$("#sSalesEntry").attr("style", "color: red;");

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
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="row">
					<div class="masonary-grids">

						<div class="col-md-12" style="height: 800px;">
							<form class="sec" action="salesEntry" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="widget-area" style="height: 250px;">
											<div style="background-color: lightgrey;">
												<h3>Bill To:</h3>
											</div>
											<table cellspacing="2">
												<tr>
													<td>Name :</td>
													<td><input type="text" name="custName"
														style="align: center;"></input></td>
												</tr>
												<br>
												<tr>
													<td>Address :</td>
													<td><input type="text" name="addr"
														style="length: 40px;" style="align:center;"></input></td>
												</tr>
												<tr>
													<td>City :</td>
													<td><input type="text" name="city"
														style="length: 40px;"></input></td>
												</tr>

												<tr>
													<td>Phone No. :</td>
													<td><input type="text" name="phone"
														style="length: 40px;"></input></td>
												</tr>

												<tr>
													<td>Vat No./CST No. :</td>
													<td><input type="text" name="vatcst"
														style="length: 40px;"></input></td>
												</tr>
											</table>
										</div>
									</div>


									<div class="col-md-6">
										<div class="widget-area" style="height: 250px;">
											<div style="background-color: lightgrey;">
												<h3>Invoice Details:</h3>
											</div>


											<div class="form-group">

												<label style="font-size: 15px" class="font">Sales
													challan no. :</label>
												<c:set var="fy"
													value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
												<c:set var="cno"
													value="${sessionScope['ejb'].getLastSalesChallanNumber()+1}" />
												<c:set var="csuf"
													value="${sessionScope['ejb'].getLastSalesChallanSuffix()+1}" />
												<c:set var="suf" value="INV" />
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
													name="challanNumber" class="form-control"
													value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
												<input type="hidden" name="challanNo" value="${lastChNo}"
													id="challanNo"> <input type="hidden"
													name="challanSuffix" value="${lastSuf}">
											</div>


											<div class="form-group">
												<label style="font-size: 15px" class="font">Date :</label> <input
													class="form-control" type="text" name="salesDate"
													id="datepicker" readonly="readonly">

											</div>
										</div>
									</div>
								</div>
								<div class="widget-area">
									<div class='toast' style='display: none'>
										<h3 id="msg">${requestScope['msg']}</h3>
									</div>
									<div style="background-color: lightgrey;">
										<h3>Sale Product at:</h3>
									</div>
									<input type="radio" class="chk" name="saleAt" value="mrp"
										id="mrp" style="display: none;"><label for="mrp"></label>MRP<input
										type="radio" class="chk" name="saleAt" value="wsp" id="wsp"
										style="display: none;">&nbsp;<label for="wsp"></label>WSP

								</div>
								<div class="widget-area">


									<b>Quantity :</b> <input type="text" name="qty" id="qty"
										style="width: 70px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<b>Product :</b>
									<!-- <input type="text" name="descriptionName"
										id="descriptionName"> -->
									<select name="prodCode" id="prodCode"
										onchange="getProdDetByPurchaseProdDetId();"
										required="required">
										<option value="0">Select Product code</option>
										<c:forEach
											items="${sessionScope['ejb'].getReadyPurchaseProductDetailsByQty()}"
											var="pCode">
											<option value="${pCode.id}">${pCode.productDetail.code}&nbsp;(<fmt:formatDate
													value="${pCode.purchase_Entry.purchase_date}"
													pattern="dd-MM-yy" />)
											</option>
										</c:forEach>
									</select>
									<!-- <input type="hidden" name="descriptiondId" id="descriptionId"> -->
									&nbsp; &nbsp; &nbsp;<b>Product with Barcode</b> <input
										type="text" id="salesbar" name="salesbar">
									<button onclick="probar()" type="button">Go</button>

								</div>
								<div class="widget-area">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th id="serial">#</th>
												<th id="prodcode">Product code</th>
												<th id="desc">Product Description</th>
												<th id="qty">Qty.</th>
												<th id="mrpWSP">MRP/Qty</th>
												<th id="total">Total</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><input type="text" name="codevalue" id="codevalue"
													readonly="readonly"></td>
												<td><input type="text" name="descvalue" id="descvalue"
													readonly="readonly"></td>
												<td><input type="text" name="qtyvalue" id="qtyvalue"
													readonly="readonly" value="0"></td>
												<td><input type="hidden" id="wspORmrp" name="wspORmrp">
													<input type="text" name="mrpQty" id="mrpQty"
													readonly="readonly"></td>
												<td><input type="text" name="totalvalue"
													id="totalvalue" readonly="readonly"></td>
											</tr>
										</tbody>
									</table>
								</div>

								<div style="width: 40%; float: right;">
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="2" id="round">Round Of :</td>
												<td><input type="number" class="form-control"
													placeholder="" readonly="readonly" id="roundvalue"
													name="roundvalue"></td>
											</tr>
											<tr>
												<td colspan="2" id="sub">Sub Total :</td>
												<td><input type="number" class="form-control"
													placeholder="0.0" readonly="readonly" id="subvalue"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount :<br> <input type="radio"
													class="chk1" name="dis" id="percent" style="display: none;"><label
													for="percent" style="top: -2px;"></label>% <input
													type="radio" class="chk1" name="dis" id="flat"
													style="display: none;"><label for="flat"
													style="top: 7px;">&nbsp;</label>FLAT
												</td>
												<td><input type="number" class="form-control"
													placeholder="" readonly="readonly"></td>
											</tr>
										</tbody>

										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="number" class="form-control"
													readonly="readonly" id="discount"></td>
											</tr>

										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="trans">Transport charge :</td>
												<td><input type="number" class="form-control"
													id="transcharge"></td>
											</tr>
										</tbody>

										<tbody>
											<tr>
												<td colspan="2" id="sur">Surcharge :</td>
												<td><input type="number" class="form-control"
													id="surcharge"></td>
											</tr>
										</tbody>

										<thead>
											<tr>
												<td colspan="2" id="grand">Grand Total :</td>
												<td><input type="number" class="form-control"
													placeholder="0.0" readonly="readonly" id="grandtotal"></td>
											</tr>
										</thead>
									</table>
									<div style="float: right;">
										<input type="submit" class="btn btn-info btn-sm" value="Save">
										<!-- <button type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#savePurchase" id="save">Save</button> -->
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy",
				maxDate : 0
			});
		});
	</script>

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

	<script>
		$("input:radio[name=saleAt]").click(function() {
			var value = $(this).val();
			//alert(value);
			if (value == "mrp") {
				$("#mrpWSP").html("MRP/Qty");
				$("#wspORmrp").val('mrpVal');
			} else {
				$("#mrpWSP").html("WSP/Qty");
				$("#wspORmrp").val('wspVal');
			}
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$("#descriptionName").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "getProductByDescription",
						dataType : "json",
						data : {
							descriptionName : request.term
						},
						success : function(data) {
							response($.map(data, function(item) {
								return {
									value : item.code,
									id : item.id,
									description : item.description,
								}
							}));
						}
					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#descriptiondId").val("");
						$("#descvalue").val("");

					} else {
						$("#descriptiondId").val(ui.item.id);
						$("#descvalue").val(ui.item.description);
					}
				},
				select : function(event, ui) {
					$("#descriptiondId").val(ui.item.id);
				}
			});
		});
	</script>

	<script>
		function getProdDetByPurchaseProdDetId() {
			$("#salesbar").val($("#prodCode").val());
		}

		function probar() {
			if ($("#wspORmrp").val() == 'mrpVal'
					|| $("#wspORmrp").val() == 'wspVal') {
				var countryName = $("#salesbar").val();
				var countryArray = countryName.split('/');

				for (var i = 0; i < countryArray.length; i++) {
					countryArray[i];
				}
				var id = countryArray[0];

				$.ajax({
					type : "post",
					url : "getProdDetByPurchaseProdDetailsId",
					data : {
						id : id
					},
					dataType : "json",
					success : function(data) {
						$("#codevalue").val(data.productCode);
						$("#descvalue").val(data.productDesc);
						$("#qtyvalue").val(Number($("#qty").val()));
						if ($("#wspORmrp").val() == 'mrpVal') {
							$("#mrpQty").val(data.mrp);
							$("#totalvalue").val(
									Number(data.mrp * $("#qtyvalue").val()));
						} else {
							$("#mrpQty").val(data.wsp);
							$("#totalvalue").val(
									Number(data.wsp * $("#qtyvalue").val()));
						}
						$("#prodCode").val(data.id);
						var tot = $("#totalvalue").val();
						var round = Math.round(tot);
						if (tot > round) {
							$("#roundvalue").val(
									Math.round((round + 1 - tot) * 100) / 100);
						} else {
							$("#roundvalue").val(
									Math.round((round - tot) * 100) / 100);
						}
					}

				});
			} else {
				alert("Please choose one between MRP and WSP");
			}
		}
	</script>

	<script>
		
	</script>


</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>