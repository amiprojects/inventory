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
<link rel="stylesheet" href="bootstrapcdn.css">
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script src="maxcdn.bootstrapcdn.js"></script>

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

<!-- Script -->

<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script src="js/jquery-ui/jquery-ui.js"></script>

<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
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

<script type="text/javascript">
	$(document).ready(function() {
		$("#stock").attr("id", "activeSubMenu");
		$("#sStock").attr("style", "color: red;");
		$("#step8").hide();

	});
	
	function viewInvoice(id){
		window
		.open(
				"stockPurCha.jsp?id="+id,
				'name', 'width=900,height=700');
		
	}
	
</script>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script src="js/jquery-ui/jquery-ui.js"></script>


</head>
<body>
	<c:if test="${!sessionScope['user'].equals('admin')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Stock')}">
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
	<c:set var="purchasePro"
		value="${sessionScope['ejb'].getPurchase_Product_DetailsByProId(requestScope['proid1'])}" />
	<c:set var="salesPro"
		value="${sessionScope['ejb'].getSales_Product_DetailsByProId(requestScope['proid1'])}" />

	<c:set var="jobProList"
		value="${sessionScope['ejb'].getJobAssignmentProductDetailsByproductId(requestScope['proid1'])}" />




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
								<h3 style="margin-top: 11px;">Stock Show Details</h3>


							</div>


							<div class="col-md-12">
								<div class="widget-area" style="width: 100%">
									<c:set
										value="${sessionScope['ejb'].getProductDetailById(requestScope['proid1'])}"
										var="p" />
									<h4 align="center">Product Code:&nbsp;${p.code}</h4>

									<br> <br>

									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#General">General</a></li>
										<li><a data-toggle="tab" href="#Image">Image</a></li>
										<li><a data-toggle="tab" href="#purchase">Purchase
												Inventory</a></li>
										<li><a data-toggle="tab" href="#Sales">Sales
												Inventory</a></li>
										<li><a data-toggle="tab" href="#jobber">Jobber
												Inventory</a></li>


										<li><a data-toggle="tab" href="#DSP">Detailed Present
												Stock</a></li>
									</ul>
									<div class="tab-content">

										<!-- .......................................**********************General****************************************************...................................... -->



										<div id="General" class="tab-pane fade active in">


											<!-- .*******EL expression**********. -->
											<c:set var="purSize"
												value="${p.purchase_Product_Details.size()}" />
											<c:set
												value="${sessionScope['ejb'].getAllProductImageByProductId(requestScope['proid1'])}"
												var="pImage" />
											<c:set var="qty"
												value="${p.isSaleble()?sessionScope['ejb'].getReadyGoodsStocktDetailByProductId(p.id).remainingQty:sessionScope['ejb'].getRawMaterialStocktDetailByProductId(p.id).remainingQty}" />
											<c:set var="purqty"
												value="${sessionScope['ejb'].getReadyGoodsStocktDetailByProductId(p.id).remainingQty}" />
											<br> <br>
											<div style="width: 50%; float: left;">
												<b>Product Code:</b>&nbsp;&nbsp;${p.code} <br> <br>
												<b>Product Description:</b>&nbsp;${p.description}<br> <br>
												<b>UOM:</b>&nbsp;&nbsp;&nbsp;&nbsp;${p.qtyUnit.name}<br>
												<br> <b>Latest Cost Price:</b>
												&nbsp;${purSize>0?p.purchase_Product_Details.get(purSize-1).cost:'nill'}
												<br> <br> <b>Latest WSP:</b>
												&nbsp;${purSize>0?p.purchase_Product_Details.get(purSize-1).wsp:'nill'}
												<br> <br> <b>Latest MRP:</b>
												&nbsp;${purSize>0?p.purchase_Product_Details.get(purSize-1).mrp:'nill'}
											</div>

											<div style="width: 50%; float: left;">
												<b>Image:</b>
												<div style="width: 150px; height: 99px; overflow: hidden;">
													<c:forEach items="${pImage}" var="image">
														<img width="100" height="100" style="" alt="ProductImage"
															src="data:image/jpeg;base64,${image.getImageAsString()}">
													</c:forEach>
												</div>

											</div>
											<div style="width: 100%; float: left;">
												<hr width="100%" color="black">
											</div>
											<div>

												<table width="100%">
													<tr>
														<td><h4>Attributes:</h4></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr style="width: 100%">
														<td><b>Attribute1:</b>
															&nbsp;&nbsp;${p.category.attrNmae1}</td>
														<td>&nbsp;</td>

														<td><b>Attribute2:</b>
															&nbsp;&nbsp;${p.category.attrNmae2}</td>

														<td>&nbsp;</td>

														<td><b>Attribute3:</b>&nbsp;&nbsp;${p.category.attrNmae3}</td>

													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><b>Attribute4:</b>&nbsp;&nbsp;
															${p.category.attrNmae4}</td>
														<td>&nbsp;</td>

														<td><b>Attribute5:</b>
															&nbsp;&nbsp;${p.category.attrNmae5}</td>
														<td>&nbsp;</td>

														<td><b>Attribute6:</b>
															&nbsp;&nbsp;${p.category.attrNmae6}</td>
													</tr>

												</table>

											</div>
											<div style="width: 100%; float: left;">
												<hr width="100%" color="black">
											</div>

											<div>

												<table width="100%">
													<tr>
														<td><h4>Inventory:</h4></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr style="width: 100%">
														<td><b>In Stock:</b> &nbsp;&nbsp;${qty}</td>
														<td>&nbsp;</td>
														<c:set
															value="${sessionScope['ejb'].getPurchase_Product_DetailsByProId(requestScope['proid1'])}"
															var="prolst" />
														<c:set value="${0}" var="initialQty" />
														<c:set value="${0}" var="purQtyt" />
														<c:forEach items="${prolst}" var="pro">
															<c:choose>
																<c:when test="${pro.isInitialInventory()}">
																	<c:set value="${pro.quantity}" var="initialQty" />
																</c:when>
																<c:otherwise>
																	<c:set value="${purQtyt+pro.quantity}" var="purQtyt" />
																</c:otherwise>
															</c:choose>
														</c:forEach>

														<td><b>Total Purchased:</b> &nbsp;&nbsp;${purQtyt}</td>
														<td>&nbsp;</td>

														<td><b>Initial Inventory:</b>
															&nbsp;&nbsp;${initialQty}</td>

													</tr>
													<tr>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><b>In Jobwork:</b>&nbsp;&nbsp;</td>
														<td>&nbsp;</td>

														<td><b>Total Sold:</b> &nbsp;&nbsp;</td>

													</tr>

												</table>

											</div>
										</div>

										<!-- .......................................**********************Image****************************************************...................................... -->



										<div id="Image" class="tab-pane fade">
											<c:set
												value="${sessionScope['ejb'].getAllProductImageByProductId(requestScope['proid1'])}"
												var="pImage" />
											<br> <br>
											<div style="width: 927px; height: 176px; overflow: scroll;">
												<c:forEach items="${pImage}" var="image">
													<img width="100" height="100" style="" alt="ProductImage"
														src="data:image/jpeg;base64,${image.getImageAsString()}">
												</c:forEach>
											</div>

										</div>
										<!-- .......................................*************************purchase************************************************...................................... -->
										<div id="purchase" class="tab-pane fade">
											<div class="widget-area">

												<%-- <table class="table table-striped table-bordered"
													style="height: 110px">
													<thead>
														<tr>
															<th>Purchase Date</th>

															<th>Vendor Name</th>

															<th>Quantity</th>


															<th>Remaining Quantity</th>
														</tr>
													</thead>
													<tbody style="height: 90px; overflow-y: scroll">
														<c:forEach items="${purchasePro}" var="purPro">
															<tr>
																<td><fmt:formatDate
																		value="${purPro.purchase_Entry.purchase_date}"
																		pattern="dd-MM-yyyy" /></td>
																<td>${purPro.purchase_Entry.vendor.name}</td>
																<td>${purPro.quantity}</td>

																<td>${purPro.remaining_quantity}</td>


															</tr>
														</c:forEach>

													</tbody>

												</table> --%>
												<div style="width: 100%; overflow-x: scroll">
													<table class="table">

														<tr style="width: 100%">
															<td><b>Date</b></td>
															<td>&nbsp;</td>

															<td><b>Quantity</b></td>

															<td>&nbsp;</td>

															<td><b>UOM </b></td>

															<td>&nbsp;</td>

															<td><b>Cost/unit</b></td>
															<td>&nbsp;</td>

															<td><b>Amount</b></td>
															<td>&nbsp;</td>

															<td><b>Vendor</b></td>
															<td>&nbsp;</td>

															<td><b>Agent</b></td>
															<td>&nbsp;</td>

															<td><b>Lot Number</b></td>
															<td>&nbsp;</td>

															<td><b>Barcode</b></td>
															<td>&nbsp;</td>

															<td><b>Purchase challan number</b></td>

														</tr>



														<c:forEach items="${purchasePro}" var="purPro">
															<c:if test="${!purPro.isInitialInventory()}">
																<tr style="width: 100%">
																	<td><b><fmt:formatDate
																				value="${purPro.purchase_Entry.purchase_date}"
																				pattern="dd-MM-yyyy" /></b></td>
																	<td>&nbsp;</td>

																	<td><b>${purPro.quantity}</b></td>

																	<td>&nbsp;</td>

																	<td><b>${purPro.productDetail.qtyUnit.name} </b></td>

																	<td>&nbsp;</td>

																	<td><b>${purPro.cost}</b></td>
																	<td>&nbsp;</td>

																	<td><b>${purPro.quantity*purPro.cost}</b></td>
																	<td>&nbsp;</td>

																	<td><b>${purPro.purchase_Entry.vendor.name}</b></td>
																	<td>&nbsp;</td>

																	<td><b>${sessionScope['ejb'].getVendorById(purPro.purchase_Entry.agentId).name}
																	</b></td>
																	<td>&nbsp;</td>



																	<td><b>${purPro.lotNumber}</b></td>
																	<td>&nbsp;</td>

																	<td><b>${purPro.id}/${purPro.lotNumber}/${purPro.productDetail.code}</b></td>
																	<td>&nbsp;</td>

																	<td><a href="#"
																		onclick="viewInvoice(${purPro.purchase_Entry.id});"><b>${purPro.purchase_Entry.challanNumber}</b></a></td>
																</tr>

															</c:if>
														</c:forEach>

													</table>
												</div>

											</div>
											<br>

										</div>
										<!-- .......................................**********************Sales****************************************************...................................... -->
										<div id="Sales" class="tab-pane fade ">
											<div class="widget-area">

												<%-- <table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Customer Name</th>

															<th>Quantity</th>
															<th>Date</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${salesPro}" var="salesPro1">
															<tr>
																<td>${salesPro1.salesEntry.customer.name}</td>
																<td>${salesPro1.quantity}</td>
																<td><fmt:formatDate
																		value="${salesPro1.salesEntry.sales_date}"
																		pattern="dd-MM-yyyy" /></td>
															</tr>
														</c:forEach>
													</tbody>
												</table> --%>

												<div style="width: 100%; overflow-x: scroll">
													<table class="table">

														<tr style="width: 100%">
															<td><b>Date</b></td>
															<td>&nbsp;</td>

															<td><b>Quantity</b></td>

															<td>&nbsp;</td>

															<td><b>UOM </b></td>

															<td>&nbsp;</td>

															<td><b>Sold in WSP/MRP </b></td>

															<td>&nbsp;</td>

															<td><b>Cost/unit</b></td>
															<td>&nbsp;</td>

															<td><b>Amount</b></td>
															<td>&nbsp;</td>

															<td><b>Customer</b></td>
															<td>&nbsp;</td>

															<!-- <td><b>Agent</b></td>
															<td>&nbsp;</td> -->

															<td><b>Lot Number</b></td>
															<td>&nbsp;</td>

															<td><b>Barcode</b></td>
															<td>&nbsp;</td>

															<td><b>Sales Invoice number</b></td>

														</tr>
														<%--  <c:set var="wspsps"
															value="${purSize>0?p.purchase_Product_Details.get(purSize-1).wsp:'0'}" />
														<c:set var="mrprp"
															value="${purSize>0?p.purchase_Product_Details.get(purSize-1).mrp:'0'}" />  --%>



														<c:forEach items="${salesPro}" var="sPro">
															<tr style="width: 100%">

																<td><b> <fmt:formatDate
																			value="${sPro.salesEntry.sales_date}"
																			pattern="dd-MM-yyyy" />
																</b></td>
																<td>&nbsp;</td>

																<td><b>${sPro.quantity}</b></td>
																<!--  Quantity -->

																<td>&nbsp;</td>
																<td><b>
																		${sPro.purchase_Product_Details.productDetail.qtyUnit.name}</b></td>
																<!-- UOM -->

																<td>&nbsp;</td>

																<td><b> </b></td>
																<!-- Sold in WSP/MRP   -->
																<td>&nbsp;</td>

																<td><b>${sPro.salesPrice}</b></td>
																<!-- Cost -->
																<td>&nbsp;</td>

																<td><b>${sPro.salesPrice*sPro.quantity}</b></td>
																<!-- Amount -->
																<td>&nbsp;</td>


																<td><b>${sPro.salesEntry.customer.name}</b></td>
																<!-- Customer -->
																<td>&nbsp;</td>

																<td><b>${sPro.purchase_Product_Details.lotNumber}</b></td>
																<!-- Lot -->
																<td>&nbsp;</td>

																<td><b>${sPro.purchase_Product_Details.id}/${sPro.purchase_Product_Details.lotNumber}/${sPro.purchase_Product_Details.productDetail.code}</b></td>
																<!-- Barcode -->
																<td>&nbsp;</td>

																<td><b>${sPro.salesEntry.challanNumber}</b></td>
																<!-- Invoice -->

															</tr>
														</c:forEach>





													</table>
												</div>

											</div>
											<br> <br>
										</div>
										<!-- **********************************************************************************jobber*****************************************************************************-->

										<div id="jobber" class="tab-pane fade">
											<div class="widget-area">
												<%-- <table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>Jobber Name</th>

															<th>Jobber description</th>

															<th>Quantity</th>

															<th>Date</th>

														</tr>
													</thead>
													<tbody>
														<tr>
															<c:forEach items="${jobProList}" var="jobPro">

																<td>${jobPro.vendor.name}</td>
																<td>${jobPro.workDescription}</td>
																<td>${jobPro.qty}</td>
																<td><fmt:formatDate
																		value="${jobPro.jobRecievedDetails.recievingDate}"
																		pattern="dd-MM-yyyy" /></td>

															</c:forEach>
														</tr>
													</tbody>

												</table> --%>

												<div style="width: 100%; overflow-x: scroll">
													<table class="table">

														<tr style="width: 100%">


															<td><b>Assigned Date</b></td>
															<td>&nbsp;</td>

															<td><b>Quantity Given</b></td>
															<td>&nbsp;</td>

															<td><b>Remaining Quantity</b></td>

															<td>&nbsp;</td>

															<td><b>UOM </b></td>

															<td>&nbsp;</td>

															<td><b>Work</b></td>

															<td>&nbsp;</td>

															<td><b>Submission Date</b></td>
															<td>&nbsp;</td>

															<td><b>Jobber Name</b></td>
															<td>&nbsp;</td>

															<td><b>Status</b></td>
															<td>&nbsp;</td>



															<td><b>Job Challan number</b></td>

														</tr>
														<tr style="width: 100%">
															<c:forEach items="${jobProList}" var="jobPro">
																<td><b><fmt:formatDate
																			value="${jobPro.jobAssignmentDetails.assignDate}"
																			pattern="dd-MM-yyyy" /> </b></td>
																<td>&nbsp;</td>

																<td><b>${jobPro.qty}</b></td>

																<td>&nbsp;</td>

																<td><b>${jobPro.remaninQty}</b></td>

																<td>&nbsp;</td>

																<td><b>${jobPro.purchase_Product_Details.productDetail.qtyUnit.name}</b></td>

																<td>&nbsp;</td>

																<td><b>${jobPro.workDescription}</b></td>
																<td>&nbsp;</td>

																<td><b><fmt:formatDate
																			value="${jobPro.jobAssignmentDetails.estimatedCompletionDate}"
																			pattern="dd-MM-yyyy" /> </b></td>
																<td>&nbsp;</td>

																<td><b>${jobPro.jobAssignmentDetails.vendor.name}</b></td>
																<td>&nbsp;</td>
																<c:choose>
																	<c:when test="${jobPro.remaninQty==0}">
																		<td><b>Complete</b></td>
																	</c:when>
																	<c:otherwise>
																		<td><b>Process</b></td>
																	</c:otherwise>
																</c:choose>


																<td>&nbsp;</td>

																<td><b>${jobPro.jobAssignmentDetails.challanNumber}</b></td>
															</c:forEach>

														</tr>

													</table>
												</div>


											</div>
											<br>

										</div>


										<!-- .......................................**********************DSP****************************************************...................................... -->

										<div id="DSP" class="tab-pane fade">

											<div style="width: 100%; overflow-x: scroll">
												<table class="table">

													<tr style="width: 100%">
														<td><b>Product Code</b></td>
														<td>&nbsp;</td>

														<td><b>Product Description</b></td>
														<td>&nbsp;</td>

														<td><b>Quantity</b></td>

														<td>&nbsp;</td>

														<td><b>UOM </b></td>

														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae1} </b></td>
														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae2} </b></td>
														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae3} </b></td>
														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae4} </b></td>
														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae5} </b></td>
														<td>&nbsp;</td>

														<td><b>${p.category.attrNmae6} </b></td>
														<td>&nbsp;</td>



														<td><b>Cost/unit</b></td>
														<td>&nbsp;</td>

														<td><b>Amount</b></td>
														<td>&nbsp;</td>

														<td><b>Vendor</b></td>
														<td>&nbsp;</td>

														<td><b>Agent</b></td>
														<td>&nbsp;</td>

														<td><b>Lot Number</b></td>
														<td>&nbsp;</td>

														<td><b>Barcode</b></td>
														<td>&nbsp;</td>

														<td><b>Purchase challan number</b></td>

													</tr>
													<tr style="width: 100%">
														<c:forEach items="${purchasePro}" var="purProDsp">
															<td><b>${purProDsp }</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp}</b></td>

															<td>&nbsp;</td>

															<td><b>${purProDsp} </b></td>

															<td>&nbsp;</td>

															<td><b>${purProDsp.attrValue1}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp.attrValue2}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp.attrValue3}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp.attrValue4}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp.attrValue5}</b></td>
															<td>&nbsp;</td>

															<td><b> ${purProDsp.attrValue6}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp>0?p.purchase_Product_Details.get(purSize-1).cost:'nill'}</b></td>

															<td>&nbsp;</td>

															<td><b>${purProDsp>0?p.purchase_Product_Details.get(purSize-1).mrp:'nill'}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp>0?p.purchase_Product_Details.get(purSize-1).wsp:'nill'}</b></td>
															<td>&nbsp;</td>

															<%-- <td><b>${purProDsp}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp}</b></td>
															<td>&nbsp;</td>

															
															<td><b>${purProDsp}</b></td>
															<td>&nbsp;</td>

															<td><b>${purProDsp}</b></td> --%>

														</c:forEach>
													</tr>

												</table>


											</div>



										</div>
										<!-- ........................................................................************************************..............	 -->
									</div>
									<a href="stockView.jsp"><button
											class="btn blue btn-default" style="float: right">BACK</button></a>
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>