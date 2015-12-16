<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				<div class="row">
					<div class="masonary-grids">
					   
						<div class="col-md-12" style="height:800px;">
						<div class="row">
						<div class="col-md-6">
						<div class="widget-area" style="height:250px;">
									<div  style="background-color:lightgrey;">
										<h3>Bill To:</h3>
									</div>
									    <table cellspacing="2">
										      <tr>
										       <td>Name :</td>
										        <td><input type="text" name="cusname" style="align:center;"></input></td>
										       </tr><br>
										       <tr>
										        <td>Address :</td>
										        <td><input type="text" name="addr" style="length:40px;" style="align:center;"></input></td>
										       </tr>
										       <tr>
										       <td>City :</td>
										       <td><input type="text" name="addr" style="length:40px;"></input></td>
										       </tr>
										
										       <tr>
										       <td>Phone No. :</td>
										       <td><input type="text" name="phone" style="length:40px;"></input></td>
										       </tr>
										
										         <tr>
										         <td>Vat No./CST No. :</td>
										         <td><input type="text" name="vatcst" style="length:40px;"></input></td>
										          </tr>
									              </table>
					                         </div>
					                         </div>
					                         <div class="col-md-6">
						                       <div class="widget-area" style="height:250px;">
									                 <div style="background-color:lightgrey;">
										                     <h3>Invoice Details:</h3>
									                </div>
									    <table>
									       <tr>
									       <td>Invoice No. :</td>
										    <td><input type="text" name="inv"></input></td>
									       </tr>
									       <tr>
									          <td>Date :</td>
										      <td><input type="text"  name="date" id="datepicker" readonly="readonly"></td>
									       </tr>
									       
									    </table>
					</div>
					</div>
						</div>
						<div class="widget-area">
						<div style="background-color:lightgrey;">
						    <h3>Sale Product at:</h3>
						</div>
						<input type="radio" class="chk" name="prod" value="mrp" id="mrp" style="display: none;"><label for="mrp"></label>MRP<input
										type="radio" class="chk" name="prod" value="wsp" id="wsp" style="display: none;">&nbsp;<label for="wsp"></label>WSP
									
								</div>
					<div class="widget-area">
						         <b>Quantity :</b>
										<input type="text" name="qty" style="width:70px"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								 <b>Product :</b>
										<input type="text" name="product" style="width:540px"></input><br>
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
												<th id="perqty">MRP/Qty</th>
												<th id="total">Total</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="serialvalue">1</td>
												<td id="codevalue">---</td>
												<td id="descvalue">---</td>
												<td id="qtyvalue">---</td>
												<td id="qtyvalue">---</td>
												<td id="totalvalue">---</td>
												
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
													placeholder="" readonly="readonly" id="roundvalue"></td>
										    </tr>
											<tr>
												<td colspan="2" id="sub">Sub Total :</td>
												<td><input type="number" class="form-control"
													placeholder="0.0" readonly="readonly" id="subvalue"></td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">Discount :<br><input type="radio" class="chk1" name="dis" id="percent" style="display: none;"><label for="percent" style="top: -2px;"></label>% <input
										type="radio" class="chk1" name="dis" id="flat" style="display: none;"><label for="flat" style="top: 7px;">&nbsp;</label>FLAT</td>
										<td><input type="number" class="form-control"
													placeholder="" readonly="readonly"></td>
											</tr>
										</tbody>
										
										<tbody>
											<tr>
												<td colspan="2" id="disc">Discount Value:</td>
												<td><input type="number" class="form-control" readonly="readonly" id="discount"></td>	
											</tr>
											
										</tbody>
										<tbody>
											<tr>
												<td colspan="2" id="trans">Transport charge :</td>
												<td><input type="number" class="form-control" id="transcharge"></td>
											</tr>
										</tbody>
										
										<tbody>
											<tr>
												<td colspan="2" id="sur">Surcharge :</td>
												<td><input type="number" class="form-control" id="surcharge"></td>
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
										<button type="button" class="btn btn-info btn-lg"
											data-toggle="modal" data-target="#savePurchase" id="save">Save</button>
									</div>
								</div>
							
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
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>