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
		$("#designCostSheetSearch").attr("style", "color: #6a94ff;");
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

			<c:if test="${page.name.equals('Sample Job CostSheet Search')}">
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

	<c:set var="sampleJCS"
		value="${sessionScope['ejb'].getSampleDesignCostSheetById(requestScope['sampleDesignCostSheetId'])}" />

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
								<h3 style="margin-top: 11px;">Sample Job Cost Sheet</h3>
							</div>

							<!-- <div class="widget-area"> -->
							<div class="col-md-12">
								<div class="widget-area" style="margin-bottom: 20px;">
									<div class="col-md-6">
										<div class="col-md-12"></div>
										<div class="col-md-12">
											<b class="font">Design No.</b> <input type="text"
												class="form-control" id="designNo" name="designNo"
												autocomplete="off" value="${sampleJCS.designNumber}"
												readonly="readonly"> <input type="hidden"
												value="${sampleJCS.id}" id="sjcsId">
										</div>
										<div class="col-md-12">
											<b class="font">Designer Name :</b> <input type="text"
												class="form-control" id="designerName" name="designerName"
												autocomplete="off" readonly="readonly"
												value="${sampleJCS.vendor.name}">
										</div>
										<div class="col-md-12">

											&nbsp; &nbsp; &nbsp; <b class="font">Designer Details :</b>
											<textarea rows="5" cols="" id="jDetail" class="form-control"
												readonly="readonly">
													Address: ${sampleJCS.vendor.address}
													Phone Number:${sampleJCS.vendor.ph1}
													Email Number:${sampleJCS.vendor.email}
													Company Name:${sampleJCS.vendor.companyName}
													</textarea>
										</div>
									</div>
									<div class="col-md-6">
										<div class="col-md-12">
											<div class="form-group">
												<label class="font" for="designDescription">Design
													Descripton : </label>
												<textarea class="form-control" rows="" cols=""
													name="designDescription" id="designDescription"
													readonly="readonly">
														${sampleJCS.designDescription}
														</textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="qty" class="font">Qty :</label> <input
													type="number" name="qty" class="form-control" value="1"
													readonly="readonly">
											</div>
										</div>
										<br>
										<div class="col-md-12">
											<div class="col-md-6">
												<label> Sample Design Image :</label>
												<div id="image">
													<img alt="" style="width: 100px; height: 50px;">
												</div>
											</div>
											<div class="col-md-6">
												<a href="addOrDeleteSampleCostSheetImg.jsp?id=${sampleJCS.id}">
													<button class="btn btn-info btn-sm"
														style="float: right; margin-top: 45px;">Add
														or Delete Image</button>
												</a>
											</div>
										</div>
									</div>
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
										<th>Rate</th>
										<th>Amount</th>
										<th>Item</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="jobp"
										items="${sampleJCS.productsForDesignCostSheets}">
										<tr>
											<td>#</td>
											<td>${jobp.productDetail.code}</td>
											<td>${jobp.productDetail.description}</td>
											<td>${jobp.qty}</td>
											<td>${jobp.qtyUnit.name}</td>
											<td>${jobp.rate}</td>
											<td>${jobp.ammount}</td>
											<td>${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobp.id).itemDetails.name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<h3>List of jobs</h3>
							<table id="jobtable" class="table table-striped table-bordered">
								<thead style="background-color: #F0F0F0;">
									<tr>
										<th>#</th>
										<th>Job Name</th>
										<th>Product Code</th>
										<th>Qty</th>
										<th>UOM</th>
										<th>Rate</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="jobp"
										items="${sampleJCS.productsForDesignCostSheets}">
										<c:forEach var="jobj" items="${jobp.jobsForDesignCostSheets}">
											<tr>
												<td>#</td>
												<td>${jobj.jobTypes.jobName}</td>
												<td>${jobp.productDetail.code}</td>
												<td>${jobj.qty}</td>
												<td>${jobj.qtyUnit.name}</td>
												<td>${jobj.rate}</td>
												<td>${jobj.ammount}</td>
											</tr>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>

							<br>
							<div class="col-md-12">
								<table style="float: left;">
									<tr>
										<td><input type="button" class="btn btn-primary large"
											value="Print" onclick="viewInvoice(${sampleJCS.id});"></td>
									</tr>
								</table>
								<table style="float: right;">
									<tr>
										<td>Surcharge :</td>
										<td><input type="number" name="surcharge"
											value="${sampleJCS.surcharge}" id="surcharge"
											onkeyup="surchargeF();" autocomplete="off"
											readonly="readonly"></td>
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
										<td><input type="number" name="grandtot"
											value="${sampleJCS.grandTotal}" readonly="readonly"
											id="grandtot"><input type="hidden" name="gtot"
											value="0.00" readonly="readonly" id="gtot"><input
											type="hidden" name="gt" value="0.00" readonly="readonly"
											id="gt"></td>
									</tr>
								</table>
							</div>
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

</body>
<%@include file="zoomImage.jsp"%>
<!-- Script -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>

<script src="js/jquery-ui/jquery-ui.js"></script>

<script type="text/javascript">
	var img = "";
	$
			.ajax({
				type : "post",
				url : "getDesignImageBySampleJobId",
				data : {
					id : $("#sjcsId").val()
				},
				dataType : "json",
				success : function(data1) {
					$
							.map(
									data1,
									function(item) {
										//alert(item.image);
										img = img
												+ '<img onclick="zoomPicture(\'data:image/jpeg;base64,'
												+ item.image
												+ '\');" width="100" height="100" style="" alt="" src="data:image/jpeg;base64,'+item.image+'">';
									});
					$("#image").html(img);
				}
			});

	function viewInvoice(id) {
		window.open("jobChallanForSampleDesignCostSheet.jsp?id=" + id, 'name',
				'width=900,height=700').print();
	}
</script>
<script type="text/javascript">
		function zoomPicture(img) {
			$("#zoomImg").attr("src", img);
			$("#zoomPictureModal").modal("show");
		}
	</script>
</html>
