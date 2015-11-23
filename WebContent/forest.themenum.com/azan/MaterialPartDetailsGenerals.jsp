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
	<link rel="stylesheet" href="bootstrapcdn.css">


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

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).width(120).height(85);
			};

			reader.readAsDataURL(input.files[0]);
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
								<div class="widget-area" style="width: 34%;">
									<form role="form" class="sec">
										<div class="form-group">
											<label for="" class="">Part Number : </label> <input
												type="text" placeholder="Enter Part Number" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Description : </label> <input
												type="text" placeholder="Enter Description" id="" class="">
										</div>
										<div class="form-group">
											<label for="" class="">Part Type : </label>&nbsp &nbsp <input
												type="text" placeholder="Enter part type" id="" class="">
										</div>

										<button class="btn green btn-default" type="submit">Search
										</button>
										<button class="btn green btn-default" type="submit">Advanced
											Search</button>
									</form>
									<br> <br>
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Number</th>
												<th>Description</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Jacob</td>
												<td>Thornton</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Larry</td>
												<td>the Bird</td>
											</tr>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
											</tr>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
											</tr>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
											</tr>
										</tbody>
									</table>
								</div>
																<div class="widget-area" style="width: 66%">
									<div class="breadcrumbs">
										<ul>
											<li ><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
											<li><a title="">Part Details : </a></li>
											<li><a title=""><button type="submit">New</button></a></li>
											<li><a title=""><button type="submit">Edit</button></a></li>
											<li><a title=""><button type="submit">Delete</button></a></li>
										</ul>
									</div>

									<ul class="nav nav-tabs">
										<li class="active">
										<a data-toggle="tab" href="#general">General</a></li>
										<li><a data-toggle="tab" href="#details">Details</a></li>
										<li><a data-toggle="tab" href="#report">Inventory</a></li>
										<li><a data-toggle="tab" href="#report">Vendor</a></li>
										<li><a data-toggle="tab" href="#report">Custom</a></li>
									</ul>
									<br>
									<div class="tab-content">
										<div id="general" class="tab-pane fade ">
											<div class="row">
												<div class="col-md-2"><label>Part No:</label></div>
												<div class="col-md-4">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												<div class="col-md-1"><label>UOM:</label></div>
												<div class="col-md-2">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												<div class="col-md-1"><label>Type:</label></div>
												<div class="col-md-2">
													<input type="text" readonly="readonly" class="form-control">
												</div><br><br><br>
													<div class="col-md-2"><label>Description:</label></div>
													
												<div class="col-md-10">
													<input type="text" readonly="readonly" class="form-control">
													<input type="checkbox" name="active" value="active">&nbsp Active<br>
													<br>
												</div>
												<div class="col-md-2"><label>Details:</label></div>
													
												<div class="col-md-10">
													
													<textarea readonly="readonly" class="form-control" name="adress" rows="5" cols="59"></textarea>
													<br>
												</div><br><br>
												<div class="col-md-2"><label>Image:</label> <input type="file" name="proImg" size="50" required
														onchange="readURL(this);"></div>
													
												<div class="col-md-8">
													
													<img id="image" alt="" src="">
													
												</div>
												
												
											</div>
											
											
										</div>
										
										
										
										
											<div id="Details" class="tab-pane fade ">
											<div class="row">
												<div class="col-md-2"><label>UPC Code:</label></div>
												<div class="col-md-4">
													<input type="text" readonly="readonly" class="form-control">
												</div>
												
											<br><br><br>
													<div class="col-md-2"><label>Description:</label></div>
													
												<div class="col-md-10">
													<input type="text" readonly="readonly" class="form-control">
													<input type="checkbox" name="active" value="active">&nbsp Active<br>
													<br>
												</div>
												<div class="col-md-2"><label>Details:</label></div>
													
												<div class="col-md-10">
													
													<textarea readonly="readonly" class="form-control" name="adress" rows="5" cols="59"></textarea>
													<br>
												</div><br><br>
												<div class="col-md-2"><label>Image:</label> <input type="file" name="proImg" size="50" required
														onchange="readURL(this);"></div>
													
												<div class="col-md-8">
													
													<img id="image" alt="" src="">
													
												</div>
												
												
											</div>
											
											
										</div>

										
									</div>

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

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	 <script src="maxcdn.bootstrapcdn.js"></script> 

</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>