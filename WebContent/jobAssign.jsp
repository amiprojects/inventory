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
<script src="js/jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			maxDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jAssign").attr("style", "color: red;");

	});
</script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
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
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="widget-area">
								<div class="breadcrumbs" style="height: 39px">
									<ul>
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Job Assignment</b>
											</p></li>
									</ul>
								</div>
								<div class="col-md-12">
									<form role="form" class="sec" method="post" id="jobForm"
										action="jobAssignment">
										<div class="widget-area">
											<div class="col-md-6">
												<div class="col-md-12"></div>
												<div class="col-md-12">
													<b class="font">Jobber Name :</b>
													<!-- <input type="text"
														class="form-control" id="jName" name="jName">
													<input type="hidden" id="jId" name="jId"> -->
													<select class="form-control" name="jName" id="jName"
														onchange="getDetailsByJobberName();" required="required">
														<option value="0">Select Jobber Name</option>
														<c:forEach
															items="${sessionScope['ejb'].getVendorsByVendorTypeJobber('Jobber')}"
															var="jobber">
															<option value="${jobber.id}">${jobber.name}</option>
														</c:forEach>
													</select>
												</div>
												<div class="col-md-12">

													&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
													<textarea rows="5" cols="" id="jDetail"
														class="form-control" readonly="readonly"></textarea>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="" class="font">Job Challan no :</label>
													<!-- <input
														type="text" placeholder="" id="jobChallanNo"
														class="form-control" name="jobChallanNo"> -->
													<c:set var="fy"
														value="${sessionScope['ejb'].getCurrentFinancialYear()}" />
													<c:set var="cno"
														value="${sessionScope['ejb'].getLastJobChallanNumber()+1}" />
													<c:set var="csuf"
														value="${sessionScope['ejb'].getLastJobChallanSuffix()+1}" />
													<c:set var="suf" value="JOB" />
													<c:set var="bs"
														value="${sessionScope['ejb'].getLastBillSetupBySufix(suf)}" />
													<fmt:formatNumber value="${cno}" var="lastChNo"
														minIntegerDigits="4" groupingUsed="false" />
													<fmt:formatNumber value="${csuf}" var="lastSuf"
														minIntegerDigits="3" groupingUsed="false" />
													<fmt:formatDate
														value="${sessionScope['ejb'].getCurrentDateTime()}"
														pattern="MM" var="yr" />
													<input readonly="readonly" type="text" placeholder=""
														name="jobChallanNo" id="jobChallanNo" class="form-control"
														value="${bs.companyInitial}/${fy}/${yr}/${bs.billType}/${lastChNo}/${lastSuf}">
													<input type="hidden" name="challanNo" value="${lastChNo}"
														id="challanNo"> <input type="hidden"
														name="challanSuffix" value="${lastSuf}">
												</div>
												<div class="form-group">

													<label for="" class="font">Asigned Date :</label> <input
														type="text" class="form-control" name="assignedDate"
														required="required" id="datepicker" readonly="readonly">
												</div>

												<br> <input type="button" class="btn green pull-right"
													data-toggle="modal" data-target="#addProduct"
													value="Add Product" style="width: 100%" onclick="manage();">
											</div>
											<div class='toast' style='display: none'>
												<h3 id="msg">${requestScope['msg']}</h3>
											</div>
										</div>
										<!-- <div class="widget-area">
											<input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%" onclick="manage();">
										</div> -->
										<table id="purProTable"
											class="table table-striped table-bordered">
											<thead style="background-color: #F0F0F0;">
												<tr>
													<th>#</th>
													<th>Product code</th>
													<th>Product Description</th>
													<th>Quantity</th>
													<th>UOM</th>
													<th>Work</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>er65</td>
													<td>gfhg</td>
													<td>56</td>
													<td>kg</td>
													<td></td>
												<tr>
												<tr>
													<td colspan="2">Total Products:
													<td>
													<td colspan="2">Quantity:
													<td>
												</tr>
											</tbody>
										</table>
										<div class="col-md-6">
											<b class="font">Estimated Submission Date :</b> <input
												type="text" class="form-control" name="estSubmissionDate"
												name="subDate" required="required" id="datepicker1"
												readonly="readonly">
										</div>
										<br> <br> <input type="button"
											class="btn green pull-right" value="Save" style="width: 40%"
											onclick="submitForm()">
									</form>

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





	<div id="addProduct" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="close1" class="close">&times;</button>

				</div>
				<div class="modal-body">
					<span>Product Code :</span> <input type="text" id="prodcode"
						name="code" class="form-control">
					<div class="row">
						<div class="col-md-8">
							<span>Product Description :</span>
							<textarea rows="5" cols="" readonly="readonly"
								class="form-control"></textarea>
						</div>
						<div class="col-md-4" style="float: right;">
							<span>Product Image :</span><br> <img alt=""
								src="img/Koala.jpg" height="115px">
						</div>
					</div>
					<span>Quantity :</span> <input type="text" id="prodqty" name="qty"
						class="form-control"> <span>Describe Work :</span>
					<textarea rows="5" cols="" id="work" name="work"
						class="form-control"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="ProdSave">Add</button>
					<button type="button" class="btn btn-default" id="close">Close</button>
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
		$("#close").click(function() {
			$("#addProduct").modal("hide");

		});

		$("#close1").click(function() {
			$("#addProduct").modal("hide");

		});

		function getDetailsByJobberName() {
			if ($("#jName").val() != 0) {
				$.ajax({
					url : 'getJobberDetailsByName',
					type : 'post',
					dataType : "json",
					data : {
						id : $("#jName").val()
					},
					success : function(data) {
						$("#jDetail").val(
								"Address :\n\t" + data.address + "\nPh1 : "
										+ data.ph1 + "\nPh2 : " + data.ph2);
					},
					error : function(a, b, c) {
						alert(b + ": " + c);
					}
				});
			} else {
				alert("please select one jobber name");
				$("#jDetail").val("");
			}
		}
		function submitForm() {
			if ($("#jName").val() == 0) {
				alert("please select jobber name");
			} else if ($("#datepicker").val() == "") {
				alert("please select Assigning date");
			} else if ($("#datepicker1").val() == "") {
				alert("please select Estimated submission date");
			} else {
				$("#jobForm").submit();
			}
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>