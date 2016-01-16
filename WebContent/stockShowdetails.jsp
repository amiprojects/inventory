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
		$("#sStock").attr("style", "color: #6a94ff;");
		$("#step8").hide();

	});
	
	function viewInvoice(id){
		window
		.open(
				"stockPurCha.jsp?id="+id,
				'name', 'width=900,height=700');
		
	}
	function viewInvoiceS(id){
		
		window
		.open(
				"stockSaCha.jsp?id="+id,
				'name', 'width=900,height=700');
	}
</script>
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script src="js/jquery-ui/jquery-ui.js"></script>

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
		value="${sessionScope['ejb'].getPurchase_Product_DetailsByProductIdAndCompany(requestScope['proid1'])}" />

	<c:set var="salesPro"
		value="${sessionScope['ejb'].getSales_Product_DetailsByProductIdAndCompany(requestScope['proid1'])}" />

	<c:set var="jobProList"
		value="${sessionScope['ejb'].getJobAssignmentProductDetailsByproductIdAndCompany(requestScope['proid1'])}" />

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
									<h4 align="center">Designer Number:&nbsp;${p.code}</h4>

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

										<c:set var="compInfo"
											value="${sessionScope['ejb'].getUserById(sessionScope['user']).getCompanyInfo()}" />

										<div id="General" class="tab-pane fade active in">
											<c:set var="purSize" value="${0}" />
											<c:forEach items="${p.purchase_Product_Details}"
												var="purProByProd">
												<c:if test="${purProByProd.companyInfo.id==compInfo.id}">
													<c:set var="purSize" value="${purSize+1}" />
												</c:if>
											</c:forEach>
											<%-- <c:set var="purSize"
												value="${sessionScope['ejb'].getPurchaseProductDetailsByProductIdAndCompany(requestScope['proid1']).size()}" /> --%>
											<c:set
												value="${sessionScope['ejb'].getAllProductImageByProductId(requestScope['proid1'])}"
												var="pImage" />
											<c:set var="qty"
												value="${p.isRaw()?sessionScope['ejb'].getRawMaterialStocktDetailByProductIdAndCompany(p.id).remainingQty:sessionScope['ejb'].getReadyGoodsStocktDetailByProductIdAndCompany(p.id).remainingQty}" />
											<c:set var="purqty"
												value="${sessionScope['ejb'].getReadyGoodsStocktDetailByProductIdAndCompany(p.id).remainingQty}" />
											<br> <br>
											<div style="width: 50%; float: left;">
												<b>Designer Number:</b>&nbsp;&nbsp;${p.code} <br> <br>
												<b>Product Description:</b>&nbsp;${p.description}<br> <br>
												<b>UOM:</b>&nbsp;&nbsp;&nbsp;&nbsp;${p.qtyUnit.name}<br>
												<br> <b>Latest Cost Price:</b>
												&nbsp;${purSize>0?sessionScope['ejb'].getPurchaseProductDetailsByProductIdAndCompany(requestScope['proid1']).get(purSize-1).cost:'nill'}
												<br> <br> <b>Latest WSP:</b>
												&nbsp;${purSize>0?sessionScope['ejb'].getPurchaseProductDetailsByProductIdAndCompany(requestScope['proid1']).get(purSize-1).wsp:'nill'}
												<br> <br> <b>Latest MRP:</b>
												&nbsp;${purSize>0?sessionScope['ejb'].getPurchaseProductDetailsByProductIdAndCompany(requestScope['proid1']).get(purSize-1).mrp:'nill'}
											</div>

											<div style="width: 50%; float: left;">
												<b>Image:</b>
												<div>
													<c:if test="${pImage.size()>0}">
														<img width="100" height="100" style=""
															alt="Product Image here"
															src="data:image/jpeg;base64,${pImage.get(0).getImageAsString()}">
													</c:if>
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

													</tr>
													<tr style="width: 100%">
														<td><b>Attribute1:</b>
															&nbsp;&nbsp;${p.category.attrNmae1}</td>


														<td><b>Attribute2:</b>
															&nbsp;&nbsp;${p.category.attrNmae2}</td>



														<td><b>Attribute3:</b>&nbsp;&nbsp;${p.category.attrNmae3}</td>

													</tr>
													<tr>

													</tr>
													<tr>
														<td><b>Attribute4:</b>&nbsp;&nbsp;
															${p.category.attrNmae4}</td>


														<td><b>Attribute5:</b>
															&nbsp;&nbsp;${p.category.attrNmae5}</td>


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



													</tr>
													<tr style="width: 100%">

														<td><b>In Stock:</b> &nbsp;&nbsp;${qty}</td>




														<c:set
															value="${sessionScope['ejb'].getPurchaseProductDetailsByProductIdAndCompany(requestScope['proid1'])}"
															var="prolst" />

														<c:set var="sProduct"
															value="${sessionScope['ejb'].getSales_Product_DetailsByProductIdAndCompany(requestScope['proid1'])}" />

														<c:set var="jpL"
															value="${sessionScope['ejb'].getJobAssignmentProductDetailsByproductIdAndCompany(requestScope['proid1'])}" />



														<c:set value="${0}" var="total" />
														<c:set value="${0}" var="sTotal" />
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


														<td><b>Initial Inventory:</b> ${initialQty}</td>


													</tr>

													<c:forEach items="${jpL}" var="jppL">
														<c:set var="total" value="${total+jppL.remaninQty}" />
													</c:forEach>
													<tr>
														<td><b>In Jobwork:</b>&nbsp;&nbsp;${total}</td>

														<c:forEach items="${sProduct}" var="sP">
															<c:set var="sTotal" value="${sTotal+sP.quantity}" />
														</c:forEach>

														<td><b>Total Sold:</b> &nbsp;&nbsp;${sTotal}</td>

													</tr>
												</table>
											</div>

											<hr width="100%">
											<table>
												<tr>
													<td><b>To receive from jobber:&nbsp;&nbsp;</b>${total}</td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr>
													<td></td>
												</tr>

												<tr>
													<td><b>Available for sale:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<c:choose>
															<c:when test="${p.isSaleble()}">${qty}</c:when>
															<c:otherwise>0</c:otherwise>
														</c:choose></td>
												</tr>
											</table>
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


												<div style="width: 100%; overflow-x: scroll">
													<table class="table table-striped table-bordered">

														<tr style="width: 100%;">
															<td><b>Date</b></td>


															<td><b>Quantity</b></td>



															<td><b>UOM </b></td>


															<td><b>Cost/unit</b></td>


															<td><b>Amount</b></td>


															<td><b>Vendor</b></td>


															<td><b>Agent</b></td>


															<td><b>Lot Number</b></td>


															<td><b>Barcode</b></td>


															<td><b>Purchase challan number</b></td>

														</tr>



														<c:forEach items="${purchasePro}" var="purPro">
															<c:if test="${!purPro.isInitialInventory()}">
																<tr>
																	<td><b><fmt:formatDate
																				value="${purPro.purchase_Entry.purchase_date}"
																				pattern="dd-MM-yyyy" /></b></td>


																	<td><b>${purPro.quantity}</b></td>



																	<td><b>${purPro.productDetail.qtyUnit.name} </b></td>



																	<td><b>${purPro.cost}</b></td>


																	<td><b>${purPro.quantity*purPro.cost}</b></td>


																	<td><b>${purPro.purchase_Entry.vendor.name}</b></td>


																	<td><b>${sessionScope['ejb'].getVendorById(purPro.purchase_Entry.agentId).name}
																	</b></td>

																	<td><b>${purPro.lotNumber}</b></td>


																	<td><b>${purPro.id}/${purPro.lotNumber}/${purPro.productDetail.code}</b></td>


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



												<div style="width: 100%; overflow-x: scroll">
													<table class="table table-striped table-bordered">

														<tr>
															<td><b>Date</b></td>


															<td><b>Quantity</b></td>



															<td><b>UOM </b></td>



															<td><b>Sold in WSP/MRP </b></td>



															<td><b>Cost/unit</b></td>


															<td><b>Amount</b></td>


															<td><b>Customer</b></td>


															<td><b>Agent</b></td>


															<td><b>Lot Number</b></td>


															<td><b>Barcode</b></td>


															<td><b>Sales Invoice number</b></td>

														</tr>



														<c:forEach items="${salesPro}" var="sPro">
															<tr>

																<td><b> <fmt:formatDate
																			value="${sPro.salesEntry.sales_date}"
																			pattern="dd-MM-yyyy" />
																</b></td>


																<td><b>${sPro.quantity}</b></td>
																<!--  Quantity -->


																<td><b>
																		${sPro.purchase_Product_Details.productDetail.qtyUnit.name}</b></td>
																<!-- UOM -->




																<td><c:choose>

																		<c:when test="${sPro.salesEntry.MRP}">

																			<b> MRP</b>

																		</c:when>

																		<c:otherwise>
																			<b>WSP</b>
																		</c:otherwise>

																	</c:choose></td>

																<!-- Sold in WSP/MRP   -->


																<td><b>${sPro.salesPrice}</b></td>
																<!-- Cost -->


																<td><b>${sPro.salesPrice*sPro.quantity}</b></td>
																<!-- Amount -->



																<td><b>${sPro.salesEntry.customer.name}</b></td>
																<!-- Customer -->



																<td><b>${sPro.salesEntry.vendor.name}</b></td>



																<td><b>${sPro.purchase_Product_Details.lotNumber}</b></td>
																<!-- Lot -->


																<td><b>${sPro.purchase_Product_Details.id}/${sPro.purchase_Product_Details.lotNumber}/${sPro.purchase_Product_Details.productDetail.code}</b></td>
																<!-- Barcode -->


																<td><a href="#"
																	onclick="viewInvoiceS(${sPro.salesEntry.id});"><b>${sPro.salesEntry.challanNumber}</b></a></td>
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


												<div style="width: 100%; overflow-x: scroll">
													<table class="table table-striped table-bordered">

														<tr>


															<td><b>Assigned Date</b></td>


															<td><b>Quantity Given</b></td>


															<td><b>Remaining Quantity</b></td>



															<td><b>UOM </b></td>



															<td><b>Work</b></td>



															<td><b>Submission Date</b></td>


															<td><b>Jobber Name</b></td>


															<td><b>Status</b></td>


															<td><b>Job Challan number</b></td>

														</tr>

														<c:forEach items="${jobProList}" var="jobPro">
															<tr>
																<td><b><fmt:formatDate
																			value="${jobPro.jobAssignmentDetails.assignDate}"
																			pattern="dd-MM-yyyy" /> </b></td>


																<td><b>${jobPro.qty}</b></td>



																<td><b>${jobPro.remaninQty}</b></td>



																<td><b>${jobPro.purchase_Product_Details.productDetail.qtyUnit.name}</b></td>



																<td><b>${jobPro.workDescription}</b></td>


																<td><b><fmt:formatDate
																			value="${jobPro.jobAssignmentDetails.estimatedCompletionDate}"
																			pattern="dd-MM-yyyy" /> </b></td>


																<td><b>${jobPro.jobAssignmentDetails.vendor.name}</b></td>

																<c:choose>
																	<c:when test="${jobPro.remaninQty==0}">
																		<td><b>Complete</b></td>
																	</c:when>
																	<c:otherwise>
																		<td><b>Process</b></td>
																	</c:otherwise>
																</c:choose>




																<td><b>${jobPro.jobAssignmentDetails.challanNumber}</b></td>
															</tr>
														</c:forEach>



													</table>
												</div>


											</div>
											<br>

										</div>


										<!-- .......................................**********************DSP****************************************************...................................... -->

										<div id="DSP" class="tab-pane fade">

											<div style="width: 100%; overflow-x: scroll">
												<table class="table table-striped table-bordered">

													<tr>
														<td><b>Designer Number:</b></td>


														<td><b>Product Description</b></td>


														<td><b>Quantity</b></td>



														<td><b>UOM </b></td>


														<c:choose>
															<c:when test="${p.category.attrNmae1!=null}">
																<td><b>${p.category.attrNmae1} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute1 </b></td>
															</c:otherwise>

														</c:choose>


														<c:choose>
															<c:when test="${p.category.attrNmae2!=null}">
																<td><b>${p.category.attrNmae2} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute2 </b></td>
															</c:otherwise>

														</c:choose>

														<c:choose>
															<c:when test="${p.category.attrNmae3!=null}">
																<td><b>${p.category.attrNmae3} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute3 </b></td>
															</c:otherwise>

														</c:choose>
														<c:choose>
															<c:when test="${p.category.attrNmae4!=null}">
																<td><b>${p.category.attrNmae4} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute4 </b></td>
															</c:otherwise>

														</c:choose>
														<c:choose>
															<c:when test="${p.category.attrNmae5!=null}">
																<td><b>${p.category.attrNmae5} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute5 </b></td>
															</c:otherwise>

														</c:choose>
														<c:choose>
															<c:when test="${p.category.attrNmae6!=null}">
																<td><b>${p.category.attrNmae6} </b></td>
															</c:when>
															<c:otherwise>
																<td style="color: #e5ccb3"><b>Attribute6 </b></td>
															</c:otherwise>

														</c:choose>



														<td><b>Cost/unit</b></td>


														<td><b>wsp</b></td>


														<td><b>mrp</b></td>


														<td><b>Vendor</b></td>


														<td><b>Agent</b></td>


														<td><b>Lot Number</b></td>

														<td><b>Barcode</b></td>


														<td><b>Purchase challan number</b></td>

													</tr>

													<c:forEach items="${purchasePro}" var="purPro1">
														<c:if test="${!purPro1.isInitialInventory()}">
															<tr>
																<td><b>${purPro1.productDetail.code}</b></td>


																<td><b>${purPro1.productDetail.description}</b></td>
																<td><b>${purPro1.quantity}</b></td>


																<td><b>${purPro1.productDetail.qtyUnit.name} </b></td>



																<td><b>${purPro1.attrValue1}</b></td>


																<td><b>${purPro1.attrValue2}</b></td>


																<td><b>${purPro1.attrValue3}</b></td>


																<td><b>${purPro1.attrValue4}</b></td>


																<td><b>${purPro1.attrValue5}</b></td>


																<td><b> ${purPro1.attrValue6}</b></td>


																<td><b>${purPro1.cost}</b></td>


																<td><b>${purPro1.wsp}</b></td>


																<td><b>${purPro1.mrp}</b></td>

																<td><b>${purPro1.purchase_Entry.vendor.name}</b></td>


																<td><b>${sessionScope['ejb'].getVendorById(purPro1.purchase_Entry.agentId).name}</b></td>


																<td><b>${purPro1.lotNumber}</b></td>

																<td><b>${purPro1.id}/${purPro1.lotNumber}/${purPro1.productDetail.code}</b></td>

																<td><b>${purPro1.purchase_Entry.challanNumber}</b></td>

															</tr>


														</c:if>
													</c:forEach>


												</table>
											</div>
										</div>
										<!-- ........................................................................*****************End******************..............-->
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

</html>
