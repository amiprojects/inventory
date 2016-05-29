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

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>

	<div class="main" style="height: 664px;">
		<div class="content-sec"
			style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
			<div class="container">
				<div class="row">
					<div class="masonary-grids">
						<div class="col-md-12">
							<div class="breadcrumbs" style="height: 39px">
								<ul>
									<li><p
											style="right: -422px; font-size: 20px; position: absolute;">
											<b>Barcode</b>
										</p></li>
								</ul>
							</div>
							<div class="widget-area">
								<!-- <form action="purchaseBarCode" method="post"> -->
								<form action="barcode" method="post">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Product Code</th>
												<th>product Description</th>
												<th>Lot No.</th>
												<th>Qty</th>
												<th>Remaining Qty</th>
												<th>Select</th>
												<th>Qty to print</th>
										</thead>
										<c:forEach var="purchaseProducts"
											items="${sessionScope['ejb'].getPurchaseEntryById(param.id).purchase_Product_Details}">
											<tbody>
												<tr>
													<td>${purchaseProducts.productDetail.code}</td>
													<td>${purchaseProducts.productDetail.description}</td>
													<td>${purchaseProducts.lotNumber}</td>
													<td>${purchaseProducts.quantity}</td>
													<td>${purchaseProducts.remaining_quantity}</td>
													<td><input type="checkbox"
														id="prodCheck${purchaseProducts.id}"
														onclick="qtyPrF(${purchaseProducts.id});"><input
														type="hidden" value="${purchaseProducts.id}"
														name="prodCheck"></td>
													<td><input type="number"
														id="qtyPr${purchaseProducts.id}" class="form-control"
														readonly="readonly" name="qtyProd" value="0"></td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
									<button type="submit" class="btn btn-info btn-lg"
										style="float: right;" id="b1" value="print">Print</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image').attr('src', e.target.result).width(120).height(
							85);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		function  qtyPrF(id) {
			if($("#prodCheck"+id).is(":checked")){
				$("#qtyPr"+id).prop("readonly", false);
			}else{
				$("#qtyPr"+id).prop("readonly", true);
				$("#qtyPr"+id).val("0");
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#purch").attr("id", "activeSubMenu");
			$("#sPurchSearch").attr("style", "color: #6a94ff;");
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>