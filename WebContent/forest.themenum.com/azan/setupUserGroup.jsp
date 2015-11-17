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
								<label for="" class="">Group Name : </label> <input type="text"
									placeholder="" id="" class="">
							</div>
							<button class="btn green btn-default" type="submit">Search
							</button>
						</form>
						<br> <br>
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Jacob</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Larry</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>1</td>
									<td>Mark</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="widget-area" style="width: 600px">
						<div class="breadcrumbs">
							<ul>
								<li><a href="#" title=""><i class="fa fa-home"></i></a>/</li>
								<li><a title="">User Group : </a></li>
							</ul>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#general">General</a></li>
							<li><a data-toggle="tab" href="#rights">Rights</a></li>
							<li><a data-toggle="tab" href="#report">Report Rights</a></li>
						</ul>
						<br>
						<div class="tab-content">
							<div id="general" class="tab-pane fade ">
								<table>
									<tr>
										<th>Group Name :</th>
										<td><input type="text" readonly="readonly"></td>
									</tr>
								</table>
								<br>
								<hr>
								<br>
								<table border="1" bordercolor="gray">
									<tr>
										<th>Available Users</th>
										<th>Members of Group</th>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>

							<div id="rights" class="tab-pane fade ">
								<button type="submit">Expand All</button>
								<button type="submit">Expand All</button>
								<br>
								
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