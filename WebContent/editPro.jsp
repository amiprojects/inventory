
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- tost msg -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />
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
			<c:if test="${page.name.equals('Edit Product/Material')}">
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
	<c:set var="editpro"
		value="${sessionScope['ejb'].getProductDetailsById(param.id)}" />

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
								<h3 style="margin-top: 11px;">Edit Product</h3>
							</div>

							<div class="widget-area" style="width: 100%">
								<form id="editSumPro" action="editproductSummary" method="post">
									<div class="col-md-12">
										<h4>
											<u>Product Details</u>
										</h4>
										<input type="hidden" value="${param.id}" name="productid"
											id="productid">
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInputEmail1">Product Code:</label> <input
													readonly="readonly" type="text" value="${editpro.code}"
													name="productCode123" class="form-control"><br>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">Description:</label> <input
													type="text" name="description123"
													onkeypress="return blockSpecialChar(event)"
													value="${editpro.description}" class="form-control"><br>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInputEmail1">Designer's Design
													number: </label> <input type="text" readonly="readonly"
													value="${editpro.universalCode}" name="upc123"
													onkeypress="return blockSpecialChar(event)"
													class="form-control"><br>
											</div>

											<div class="form-group">
												<label for="exampleInputEmail1">Unit Of Measurement:</label>
												<select name="uom123" id="uomO" class="form-control"
													style="width: 431px; height: 34px">
													<option value="${editpro.qtyUnit.id}" selected="selected">${editpro.qtyUnit.name}</option>
													<c:forEach items="${sessionScope['ejb'].getAllQtyUnit()}"
														var="qqty">
														<c:if test="${editpro.qtyUnit.id!=qqty.id}">
															<option value="${qqty.id}">${qqty.name}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<c:if
										test="${sessionScope['ejb'].getInitialPurchase_Product_DetailsByProductId(param.id).size()>0}">
										<div class="col-md-12">
											<h4>
												<u>Initial Inventory</u>
											</h4>
											<br>
											<c:set var="ppd"
												value="${sessionScope['ejb'].getInitialPurchase_Product_DetailsByProductId(param.id).get(0)}" />
											<div class="col-md-4">
												<div class="form-group">
													<label for="">Qty:</label> <input type="text"
														value="${ppd.quantity}" name="qty" id="qty"
														class="form-control" onchange="qtyOCF();"
														onkeyup="qtyOKUF();"> <input type="hidden"
														id="qtyH" value="${ppd.quantity}" name="qtyH"> <br>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="">Remaining Qty:</label> <input
														readonly="readonly" type="text"
														value="${ppd.remaining_quantity}" name="remQty"
														id="remQty" class="form-control"><input
														type="hidden" id="remQtyH" name="remQtyH"
														value="${ppd.remaining_quantity}"><br>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="">Used Qty:</label> <input readonly="readonly"
														type="text" value="${ppd.quantity-ppd.remaining_quantity}"
														name="usedQty" id="usedQty" class="form-control"><br>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="">Cost:</label>
													<c:choose>
														<c:when test="${ppd.quantity==ppd.remaining_quantity}">
															<input type="text" value="${ppd.cost}" name="cost"
																id="cost" class="form-control" onkeyup="costOKUF();"
																onchange="costOCF();">
														</c:when>
														<c:otherwise>
															<input type="text" readonly="readonly"
																value="${ppd.cost}" name="cost" id="cost"
																class="form-control" onkeyup="costOKUF();"
																onchange="costOCF();">
														</c:otherwise>
													</c:choose>
													<input type="hidden" id="costH" value="${ppd.cost}"
														name="costH"> <br>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="">WSP:</label> <input type="text"
														value="${ppd.wsp}" name="wsp" id="wsp"
														class="form-control" onchange="wspOCF();"><input
														type="hidden" id="wspH" value="${ppd.wsp}" name="wspH">
													<br>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label for="">MRP:</label> <input type="text"
														value="${ppd.mrp}" name="mrp" id="mrp"
														class="form-control" onchange="mrpOCF();"><input
														type="hidden" id="mrpH" value="${ppd.mrp}" name="mrpH"><br>
												</div>
											</div>
										</div>
									</c:if>
									<input style="float: right;" class="btn green btn-default"
										type="submit" value="submit">
								</form>
								<div class='toast' style='display: none'>
									<h3 id="msg">${requestScope['msg']}</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript" src="js/abixTreeList.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('#msg').html() != "") {
				$('.toast').fadeIn(400).delay(3000).fadeOut(400);
			}
		});
		$(document).ready(function() {
			$("#prodact").attr("id", "activeSubMenu");
			$("#sProduct").attr("style", "color: #6a94ff;");
		});
	</script>
	<script type="text/javascript">
		function blockSpecialChar(e) {
			var k = e.keyCode;
			return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8
					|| k == 32 || (k >= 48 && k <= 57));
		}
	</script>
	<script src="js/numericInput.min.js"></script>
	<script>
		$(function() {
			$("#qty").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#mrp").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#wsp").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
			$("#cost").numericInput({
				allowFloat : true, // Accpets positive numbers (floating point)
				allowNegative : false,
			// Accpets positive or negative integer
			});
		});
	</script>
	<script type="text/javascript">
		function qtyOKUF() {
			$("#remQty").val(
					Number($("#qty").val()) - Number($("#usedQty").val()));
		}
		function qtyOCF() {
			if (Number($("#qty").val()) < Number($("#usedQty").val())) {
				alert("Quantity can not be less than used quantity");
				$("#qty").val($("#qtyH").val());
				$("#remQty").val($("#remQtyH").val());
			}
		}
		function costOKUF() {
			if (Number($("#mrp").val()) < Number($("#cost").val())) {
				alert("Cost can not be greater than MRP");
				$("#cost").val($("#costH").val());
			} else if (Number($("#wsp").val()) < Number($("#cost").val())) {
				alert("Cost can not be greater than WSP");
				$("#cost").val($("#costH").val());
			}
		}
		function costOCF() {
			if ($("#cost").val() == "") {
				$("#cost").val($("#costH").val());
			}
		}
		function wspOCF() {
			if (Number($("#mrp").val()) < Number($("#wsp").val())) {
				alert("WSP can not be greater than MRP");
				$("#wsp").val($("#wspH").val());
			} else if (Number($("#cost").val()) > Number($("#wsp").val())) {
				alert("WSP can not be less than Cost");
				$("#wsp").val($("#wspH").val());
			}
		}
		function mrpOCF() {
			if (Number($("#mrp").val()) < Number($("#wsp").val())) {
				alert("MRP can not be less than WSP");
				$("#mrp").val($("#mrpH").val());
			} else if (Number($("#mrp").val()) < Number($("#cost").val())) {
				alert("MRP can not be less than Cost");
				$("#mrp").val($("#mrpH").val());
			}
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>