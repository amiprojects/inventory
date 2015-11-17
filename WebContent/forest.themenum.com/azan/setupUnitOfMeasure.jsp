<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>

<%@include file="includeStyle.html"%>

</head>
<body>

	<div class="main">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec">
				<div class="container">
					<div class="widget-area" style="width: 300px;">
						<form role="form" class="sec">
							<div class="form-group">
								<label for="" class="">Name : </label> <input type="text"
									placeholder="" id="" class="">
							</div>
							<div class="form-group">
								<label for="" class="">Abbrev : </label> <input type="text"
									placeholder="" id="" class="">
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
									<th>Name</th>
									<th>Abbrev</th>
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

					<div class="widget-area" style="width: 600px">
						<div class="breadcrumbs">
							<ul>
								<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
								<li><a title="">Unit of Measurements : </a></li>
							</ul>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#general">General</a></li>
							<li><a data-toggle="tab" href="#con">Conversions</a></li>
						</ul>
						<br>
						<div class="tab-content">
							<div id="general" class="tab-pane fade ">
								<table>
									<tr>
										<th>Abreve :</th>
										<td><input type="text" readonly="readonly"></td>
									</tr>
									<tr>
										<th>Name :</th>
										<td><input type="text" readonly="readonly"></td>
									</tr>
									<tr>
										<th>Description :</th>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>
							<div id="con" class="tab-pane fade ">
								<div class="breadcrumbs">
									<ul>
										<li><a title="">Conversions </a></li>
									</ul>
								</div>
								<br>
								<br>
								<table border="1" bordercolor="gray" align="center">
									<tr>
										<th>Description</th>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
									<tr><td>
									<button type="submit">New</button>
									<button type="submit">Edit</button>
									<button type="submit">Delete</button>
									</td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main -->
</body>
</html>