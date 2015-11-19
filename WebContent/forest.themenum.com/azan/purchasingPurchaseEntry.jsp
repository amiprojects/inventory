<!DOCTYPE html>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

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
								<div class="breadcrumbs">
									<ul>
										<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
										<li><a title="">Purchase Entry : </a></li>
									</ul>
								</div>
								<br>
								<form role="form" class="sec">
									<div class="col-md-6">
										&nbsp; &nbsp; &nbsp; <b class="font">Vendor Name :</b>
										<div class="col-md-10">
											<div class="sec">
												<select class="form-control">
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
												</select>
											</div>
										</div>
										<div class="col-md-2">
											<button type="submit" class="btn green pull-right">Add</button>
										</div>
										<div class="col-md-12">
											<div class="breadcrumbs">
												<ul>
													<li><a title="" class="font">Vendor Details :</a></li>
												</ul>
											</div>
											<textarea rows="" cols="" id="" class="form-control"
												readonly="readonly"></textarea>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="" class="font">Purchase Date :</label> <input
												type="date" placeholder="" id="" class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="font">PO no. :</label> <input
												type="number" placeholder="" id="" class="form-control">
										</div>
										<div class="form-group">
											<label for="" class="font">Vendor SO :</label> <input
												type="number" placeholder="" id="" class="form-control">
										</div>
									</div>
									&nbsp; &nbsp; <b class="font">Product Code :</b>
									<div class="row">
										<div class="col-md-11">
											<div class="sec">
												<select class="form-control">
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
													<option>SLC</option>
												</select>
											</div>
										</div>
										<div class="col-md-1">
											<button type="submit" class="btn green pull-right">Add</button>
										</div>
									</div>
									<table id="stream_table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Product code</th>
												<th>Product Name</th>
												<th>Product Description</th>
												<th>Qty</th>
												<th>Rate</th>
												<th>Total</th>
												<th>WSP</th>
												<th>MRP</th>
												<th>Lot no.</th>
												<th>EXp. Date</th>
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
											<button type="submit">Save</button>
											<button type="submit">Cancel</button>
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

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>