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
								<label for="" class="">Username : </label> <input type="text"
									placeholder="Enter username" id="" class="">
							</div>
							<div class="form-group">
								<label for="" class="">First name : </label> <input type="text"
									placeholder="Enter lastname" id="" class="">
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
									<th>Username</th>
									<th>Firstname</th>
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
								<li><a title="">User Details : </a></li>
							</ul>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#general">General</a></li>
							<li><a data-toggle="tab" href="#locGroups">Location
									Groups</a></li>
							<li><a data-toggle="tab" href="#memo">Memo</a></li>
						</ul>
						<div class="tab-content">
							<div id="general" class="tab-pane fade ">
								<div class="wizard-form-h">
									<div id="wizard" class="swMain">
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">First Name</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Last Name</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Username</label><input
													class="input-style" type="text" placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Email</label><input type="text"
													placeholder="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="inline-form">
												<label class="c-label">Phone</label><input type="text"
													placeholder="" />
											</div>
										</div>
										&nbsp&nbsp&nbsp
										<button class="btn green btn-default" type="submit">Change
											Password</button>
										&nbsp&nbsp&nbsp&nbsp
										<button class="btn green btn-default" type="submit">Update</button>
									</div>
								</div>
								<br>
								<hr>
								<br>
								<table align="center" border="1" bordercolor="gray">
									<tr>
										<th colspan="2">User Groups</th>
									</tr>
									<tr>
										<td>Available Groups</td>
										<td>User belongs to</td>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>

							<div id="locGroups" class="tab-pane fade ">
								Default location groups :
								<div class="sec">
									<select class="form-control">
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
										<option>SLC</option>
									</select>
								</div>
								<table border="1" bordercolor="gray">
									<tr>
										<th colspan="2">Location Groups</th>
									</tr>
									<tr>
										<td>Available</td>
										<td>Member of</td>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
								</table>
							</div>
							<div id="memo" class="tab-pane fade ">
								<button type="submit">Print Memos</button>
								<hr>
								<table border="1" bordercolor="gray" align="center">
									<tr>
										<th>Date</th>
										<th>User</th>
										<th>Memo</th>
									</tr>
									<tr>
										<td colspan="3"><textarea rows="" cols=""></textarea></td>
									</tr>
									<tr>
										<td colspan="3"><button type="submit">Add</button>
											<button type="submit">Edit</button>
											<button type="submit">Delete</button></td>
									</tr>
								</table>
								<hr>
								<table>
									<tr>
										<th>Memo</th>
									</tr>
									<tr>
										<td><textarea rows="" cols=""></textarea></td>
									</tr>
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