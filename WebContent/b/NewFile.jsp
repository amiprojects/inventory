<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
body {
  background: rgb(204,204,204); 
}
page[size="A4"] {
  background: white;
  width: 20.5cm;
  height: 29cm;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
}
@media print {
  body, page[size="A4"] {
    margin: 0;
    box-shadow: 0;
  }
}
</style>
</head>
<body>
	<div id="ledgerAcount" class="tab-pane fade">

											<br>
											<br>
											<div class="col-md-12">
												<div class="col-md-4">
													<h4>Select your Ledger Type:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -120px;">
													<h4>
														<select class="form-control" onchange="ledger()" id="ledSel">
															<option value="0">select ledger type</option>
															<option value="vendorLed">Vendor</option>
															<option value="AgentLed">Agent</option>
															<option value="CustomerLed">Customer</option>
														</select>
													</h4>
												</div>

											</div>

											<div class="col-md-12" id="cus">
												<div class="col-md-4">
													<h4>Enter your Customer Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div>
											<div class="col-md-12" id="vend">
												<div class="col-md-4">
													<h4>Enter your vendor Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div>
											<div class="col-md-12" id="agen">
												<div class="col-md-4">
													<h4>Enter your Agent Name:</h4>
												</div>
												<div class="col-md-4" style="margin-left: -122px;">

													<input class="form-control" type="text">

												</div>

											</div><br><br>
											<div id="custTable">
											<h3 style="float: center;">Name of Customer </h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													</tbody>
													</table>
										</div><br><br>
										<div id="venTable">
										<h3 style="float: center;">Name of Vendor</h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													</tbody>
													</table>
										</div>
										<br><br>
										<div id="agenTable">
										<h3 style="float: center;">Name of Agent</h3>
										<table id="" class="table table-bordered display"
													cellspacing="0" width="100%">
													<thead>
														<tr>
															<th>Date</th>
															<th>Description</th>
															<th>Type</th>
															<th>Voucher No</th>
															<th>Debit Amount</th>
															<th>Credit Amount</th>
														</tr>
													</thead>

													<tbody>
													<tr>
													<td></td><td></td>
													</tr>
													</tbody>
													</table>
										</div>
										</div>
										
	</page>
</body>
</html>