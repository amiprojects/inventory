<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#notpaid").hide();
		$("#semipaid").hide();
		$("#fullpaid").hide();
		$("#cash").hide();
		$("#bank").hide();
		$("#cheque").hide();
		$("#scash").hide();

	});
	function pstatus() {
		var val = $('[name="pstatus"]').val();
		//alert(val);
		if (val == '-') {
			alert('Please select Payment status...');
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'npaid') {
			$("#notpaid").show();
			$("#fullpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'fpaid') {
			$("#fullpaid").show();
			$("#notpaid").hide();
			$("#semipaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'spaid') {
			$("#semipaid").show();
			$("#notpaid").hide();
			$("#fullpaid").hide();
			$("#bank").hide();
			$("#cheque").hide();
		}
	}
	function fptype() {
		var val = $('[name="fptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#cash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#cash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#cash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#cash").hide();
		}
	}
	function sptype() {
		var val = $('[name="sptype"]').val();
		if (val == '-') {
			alert('Please select Payment type...');
			$("#scash").hide();
			$("#bank").hide();
			$("#cheque").hide();
		} else if (val == 'cash') {
			$("#scash").show();
			$("#cheque").hide();
			$("#bank").hide();
		} else if (val == 'cheq') {
			$("#cheque").show();
			$("#scash").hide();
			$("#bank").hide();
		} else if (val == 'btra') {
			$("#bank").show();
			$("#cheque").hide();
			$("#scash").hide();
		}
	}
</script>
</head>
<body>
	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">
													
								<div class="breadcrumbs" style="height:39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Purchase Entry</b>
											</p></li>
									</ul>
								</div>
								<br><br>
								<form role="form" class="sec">
									<br>
									<div class="row">
										<div class="col-md-6">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b> <input
												type="text" class="form-control">
										</div>
										<div class="col-md-6">
											&nbsp; &nbsp; &nbsp; <b class="font">Vendor Bill no. :</b> <input
												type="text" class="form-control">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-2">
											<b>Challan no. :</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" readonly="readonly">
										</div>
										<div class="col-md-3">
											<input type="text" class="form-control">
										</div>
									</div>
									<br>
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Product code</th>
												<th>Product Name</th>
												<th>Product Description</th>
												<th>Qty</th>
												<th>Qty unit</th>
												<th>Rate</th>
												<th>WSP</th>
												<th>MRP</th>
												<th>Attr1</th>
												<th>Attr2</th>
												<th>Attr3</th>
												<th>Attr4</th>
												<th>Attr5</th>
												<th>Attr6</th>
												<th>Is saleable</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td>---</td>
												<td><input type="checkbox"></td>
											</tr>
										</tbody>
									</table>
									<div style="width: 40%; float: right;">
										<table id="stream_table"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<td colspan="2">Sub Total :</td>
													<td><input type="number" class="form-control"
														placeholder="0.0" readonly="readonly"></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="3">Select TAX type :</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td><select class="form-control">
															<option>TAX type</option>
															<option>TAX type</option>
															<option>TAX type</option>
															<option>TAX type</option>
															<option>TAX type</option>
													</select></td>
													<td>%</td>
													<td><input type="number" class="form-control"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">VAT Amount :</td>
													<td><input type="number" class="form-control"
														readonly="readonly"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Surcharge :</td>
													<td><input type="number" class="form-control"></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td colspan="2">Transport charge :</td>
													<td><input type="number" class="form-control"></td>
												</tr>
											</tbody>
											<thead>
												<tr>
													<td colspan="2">Grand Total :</td>
													<td><input type="number" class="form-control"
														placeholder="0.0" readonly="readonly"></td>
												</tr>
											</thead>
										</table>
										<div style="float: right;">
											<button type="button" class="btn btn-info btn-lg"
												data-toggle="modal" data-target="#savePurchase">Save</button>
										</div>
									</div>
								</form>
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

	<div id="savePurchase" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Payment Details</h4>
				</div>
				<div class="modal-body">
					<div class="col-md-6">
						<div class="widget-area">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Select Payment status : </a></li>
								</ul>
							</div>
							<br> <br> <br>
							<div class="row">
								<div class="col-md-5">Payment status :</div>
								<div class="col-md-7">
									<div class="sec">
										<select class="form-control" name="pstatus"
											onchange="pstatus()">
											<option value="-" selected="selected">---</option>
											<option value="fpaid">Full paid</option>
											<option value="spaid">Semi paid</option>
											<option value="npaid">not paid</option>
										</select>
									</div>
								</div>
							</div>
							<div class="widget-area" id="fullpaid">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Select Payment type : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Payment type :</div>
									<div class="col-md-7">
										<div class="sec">
											<select class="form-control" name="fptype"
												onchange="fptype()">
												<option value="-" selected="selected">---</option>
												<option value="cash">Cash</option>
												<option value="cheq">Cheque</option>
												<option value="btra">Bank transfer</option>
											</select>
										</div>
									</div>
									<div class="col-md-5">Payment Date :</div>
									<div class="col-md-7">
										<input type="text" id="datepicker1" class="form-control">
									</div>
									<div class="col-md-5">Amount :</div>
									<div class="col-md-7">
										<input type="text" class="form-control" readonly="readonly">
									</div>
								</div>
								<br>
								<div class="breadcrumbs" id="cash">
									<button type="submit" class="btn green pull-right">Save</button>
								</div>
							</div>

							<div id="semipaid">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Select Payment type : </a></li>
									</ul>
								</div>
								<br> <br> <br>
								<div class="row">
									<div class="col-md-5">Payment type :</div>
									<div class="col-md-7">
										<div class="sec">
											<select class="form-control" name="sptype"
												onchange="sptype()">
												<option value="-" selected="selected">---</option>
												<option value="cash">Cash</option>
												<option value="cheq">Cheque</option>
												<option value="btra">Bank transfer</option>
											</select>
										</div>
									</div>
									<div class="col-md-5">Payment Date :</div>
									<div class="col-md-7">
										<input type="text" id="datepicker" class="form-control">
									</div>
									<div class="col-md-5">Full Amount :</div>
									<div class="col-md-7">
										<input type="text" class="form-control" readonly="readonly">
									</div>
									<div class="col-md-5">Payment Amount :</div>
									<div class="col-md-7">
										<input type="text" class="form-control">
									</div>
									<div class="col-md-5">Due Amount :</div>
									<div class="col-md-7">
										<input type="text" class="form-control" readonly="readonly">
									</div>
								</div>
								<br>
								<div class="breadcrumbs" id="scash">
									<button type="submit" class="btn green pull-right">Save</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6" style="float: right;" id="notpaid">
						<div class="widget-area">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Not Paid : </a></li>
								</ul>
							</div>
							<br> <br> <br>
							<div class="row">
								<div class="col-md-4">Due Amount :</div>
								<div class="col-md-8">
									<input type="text" class="form-control" readonly="readonly">
								</div>
							</div>
							<br>
							<div class="breadcrumbs">
								<button type="submit" class="btn green pull-right">Save</button>
							</div>
						</div>
					</div>
					<div class="col-md-6" style="float: right;" id="cheque">
						<div class="widget-area">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Provide Cheque details : </a></li>
								</ul>
							</div>
							<br> <br> <br>
							<div class="row">
								<div class="col-md-5">Cheque No. :</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-5">Description(if any):</div>
								<div class="col-md-7">
									<textarea rows="" cols="" class="form-control"></textarea>
								</div>
							</div>
							<br>
							<div class="breadcrumbs">
								<button type="submit" class="btn green pull-right">Save</button>
							</div>
						</div>
					</div>
					<div class="col-md-6" style="float: right;" id="bank">
						<div class="widget-area">
							<div class="breadcrumbs">
								<ul>
									<li><a title="">Provide Bank transfer details : </a></li>
								</ul>
							</div>
							<br> <br> <br>
							<div class="row">
								<div class="col-md-5">Transaction ID :</div>
								<div class="col-md-7">
									<input type="text" class="form-control">
								</div>
								<div class="col-md-5">Description(if any):</div>
								<div class="col-md-7">
									<textarea rows="" cols="" class="form-control"></textarea>
								</div>
							</div>
							<br>
							<div class="breadcrumbs">
								<button type="submit" class="btn green pull-right">Save</button>
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