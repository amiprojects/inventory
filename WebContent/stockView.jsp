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
<link rel="stylesheet" href="bootstrapcdn.css">
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
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -470px; font-size: 20px; position: absolute;">
												<b>Stock Table:</b>
											</p></li>
									</ul>
								</div>
								<div class="row">
								<div class="widget-area" style="width: 34%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Product Code: </label> <input
												type="text" placeholder="" id="prodcode" class="form-control">
											<label for="" class="">Product Description: </label> <input
												type="text" placeholder="" id="prodesc" class="form-control">
												<label for="" class="">Department/Sub Department/Category: </label> <input
												type="text" placeholder="" id="deptcat" class="form-control">
												
										</div>


										<button class="btn green btn-default" type="submit">Search
										</button>
										<button class="btn green btn-default" type="submit">Show All</button>
									</form>
									<br> <br>
									


								</div>
								<div class="widget-area" style="width: 66%">
									<div class="breadcrumbs">
										<ul>
											<li><a title="">Stock View : </a></li>
										</ul>
									</div>



									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
                                                <th>#</th>
												<th>Product Code:</th>
												<th>Product Description:</th>
												<th>Quantity</th>
												<th>UOM</th>
												<th>MRP</th>
												
												<th></th>
												
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>13 Assassins</td>
												<td>Takashi Miike</td>
												<td>Takashi Miike</td>
												<td>Takashi Miike</td>
												<td>Takashi Miike</td>
												<td>Takashi Miike</td>
												
												<td><img alt="" src="images/eye.png" height="25px" onclick="viewPage()"></td>

											</tr>
										</tbody>
									</table>


								</div>
								</div>
								<!--<div class="widget-area" style="width: 34%;">
									<table class="table">
										<tbody>
											<tr>
												<td>
												    
													<table cellspacing="0" cellpadding="1" width="304">
														<tbody>
															<tr style="">
																<th>Product Code</th>
																<th>Product Description</th>

															</tr>
														</tbody>
													</table>
													
												</td>
											</tr>
											<tr>
												<td>
													<div style="width: 293px; height: 310px; overflow-x:none; overflow-y:scroll;">
														<table cellspacing="0" cellpadding="1" width="300">
															<tbody>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>

																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
																<tr>
																	<td>789456123</td>
																	<td>466545644</td>
																</tr>
															</tbody>
														</table>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									</div>-->
								 
								 	
						         
								
								
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
		<div id="step8"
		style="position: absolute; top: 57px; right: 2px; width: 568px; height: 439px; padding: 2px; font-family: arial; overflow: auto;">
						<div></div>
						<div>
							<fieldset>
								<legend> Summary </legend>
								<form action="productSumary" id="fs" method="Post">
									<h4>
										<u>Products:</u>
									</h4>
									<table>
										<tr>
											<td>Code:</td>
											<td><input id="pcodedisp" name="productCode" type="text"
												class="form-control " readonly></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Description:</td>
											<td><input type="text" class="form-control "
												name="description" id="desc" readonly id="description1"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Universal Product Code:</td>
											<td><input type="text" class="form-control " readonly
												name="upc" id="upc"></td>
										<tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Unit of Measurement:</td>
											<td><input type="text" class="form-control " readonly
												name="uom" id="uom1"></td>
										</tr>

										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Is Salable:</td>
											<td>
												<div id="tick">
													<p style="font-size:  29px">&#10004;</p>


												</div>
												<div id="cross">
													<p style="font-size:29px">&#10007;</p> 


												</div>
											</td>
										</tr>
									</table>
									<hr width="100%">
									<h4>
										<u>Add initial inventory:</u>
									</h4>
									<table>
										<tr>
											<td>Maximum Retail Price:</td>
											<td><input id="mrp1" class="form-control " readonly
												type="text" name="mrp1"></td>
										</tr>

										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Wholesale Price:</td>
											<td><input type="text" class="form-control " readonly
												name="wsp1" id="wsp"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Quantity:</td>
											<td><input id="quantity" class="form-control " readonly
												name="qty1" id="qty" type="text"></td>
										<tr>
										<tr>
											<td>&nbsp;</td>
										<tr>

											<td>Unit of Measurement:</td>
											<td><input id="uom" readonly class="form-control "
												name="uom" id="UOM" type="text"></td>
										<tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Unit Cost:</td>
											<td><input id="ucost" class="form-control " readonly
												name="ucost" id="cost" type="text"></td>
										<tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Date:</td>
											<td><input id="date2" class="form-control " readonly
												name="date2" id="date" type="text"></td>
										</tr>
									</table>
									<hr width="100%">

									<h4>
										<u>Initial inventory tracking:</u>
									</h4>
									<b>Lot Number:</b> <input class="form-control " type="text"
										name="lotnumber" id="ltnum"> <br> <b>Serial
										Number:</b> <br>
									<div
										style="width: 190px; height: 224px; border: 1px solid; overflow: auto;">
										<table align="center">
											<tr>
												<td><span id="slNo"></span></td>
											</tr>
										</table>

									</div>
									<hr width="100%">

									<h4>
										<u>Products Custom Field:</u>
									</h4>
									<table>
										<tr>
											<td>Attribute 1:</td>
											<td><input readonly class="form-control " id="att1"
												name="att1"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Attribute 2:</td>
											<td><input readonly class="form-control " name="a2"
												id="att2">
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Attribute 3:</td>
											<td><input readonly class="form-control " name="a3"
												id="att3"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Attribute 4:</td>
											<td><input readonly class="form-control " name="a4"
												id="att4"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Attribute 5:</td>
											<td><input readonly class="form-control " name="a5"
												id="att5"></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										<tr>
										<tr>
											<td>Attribute 6:</td>
											<td><input readonly class="form-control " name="a6"
												id="att6"></td>
										</tr>
									</table>

									<hr width="100%">
									<h4>
										<u>Product Image Fields:</u>
									</h4>
									<div
										style="width: 190px; height: 224px; border: 1px solid; overflow: auto;">
									</div>
									<hr width="100%">
								</form>
							</fieldset>
						</div>
					</div>
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#stock").attr("id", "activeSubMenu");
			$("#sStock").attr("style", "color: red;");
			$("#step8").hide();
	
		});
		
		function viewPage(){
			window.location='productDisplay.jsp';
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>