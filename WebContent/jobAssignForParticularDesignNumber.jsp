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
		var d = new Date();
		var m = d.getMonth();
		if (m > 3) {
			var n = d.getFullYear();
		} else {
			var n = d.getFullYear() - 1;
		}
		$("#datepicker").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : new Date(n, 3, 1),
			maxDate : 0
		});
		$("#datepicker").datepicker('setDate', new Date());
	});
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : "dd-mm-yy",
			minDate : 0
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jobs").attr("id", "activeSubMenu");
		$("#jAssign").attr("style", "color: #6a94ff;");
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
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Assignment')}">
				<c:set var="i" value="5" />
			</c:if>
		</c:forEach>
		<c:if test="${i!=5}">
			<script type="text/javascript">
				alert('you have no permission to view this page');
				window.location = "dashboard.jsp";
			</script>
		</c:if>
	</c:if>
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">

							<div class="breadcrumbs"
								style="height: 50px; text-align: center;">
								<h3 style="margin-top: 11px;">Job Assignment For Particular
									Design Number</h3>
							</div>

							<!-- <div class="widget-area"> -->
			
			
							<div class="col-md-12">
								<form role="form" class="sec" method="post" id="jobForm"
									action="jobAssignment">
									<div class="widget-area">
										<div class="col-md-6">
											<div class="col-md-12"></div>
											<div class="col-md-12">
												<b class="font">Jobber Name :</b> <input type="text"
													class="form-control" id="jId" name="jId"
													onchange="emptyForm();" autocomplete="off"> <input
													type="hidden" id="jName" name="jName">
											</div>
											<div class="col-md-12">

												&nbsp; &nbsp; &nbsp; <b class="font">Jobber Details :</b>
												<textarea rows="5" cols="" id="jDetail" class="form-control"
													readonly="readonly"></textarea>

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
													value="${sessionScope['ejb'].getLastJobChallanNumberByCompany()+1}" />
												<c:set var="csuf"
													value="${sessionScope['ejb'].getLastJobChallanSuffixByCompany()+1}" />
												<c:set var="suf" value="JOB" />
												<c:set var="bs"
													value="${sessionScope['ejb'].getLastBillSetupBySufixAndCompany(suf)}" />
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

											<div class="form-group">

												<label for="" class="font">Design No. :</label> <input
													type="text" class="form-control" name="dNo"
													required="required" id="dNo">
											</div>

											<div class="form-group">

												<label for="" class="font">Qty :</label> <input type="text"
													class="form-control" name="qty" required="required"
													id="qty">
											</div>

											<!-- <br> <input type="button" class="btn green pull-right"
												data-toggle="modal" data-target="#addProduct"
												value="Add Product" style="width: 100%"> -->
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
									<h3>List of material use</h3>
									<table id="products" class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Product code</th>
												<th>Product Description</th>
												<th>Quantity</th>
												<th>UOM</th>
												<th>rate</th>
												<th>Amount</th>
												<th>Remove</th>
											</tr>
										</thead>
									</table>
									<!-- <a href="#" onclick="addProduct();"><img src="img/add.png"
										height="20px" style="float: right;"></a> -->
									<h3>List of jobs</h3>
									<table id="jobs" class="table table-striped table-bordered">
										<thead style="background-color: #F0F0F0;">
											<tr>
												<th>#</th>
												<th>Job Name</th>
												<th>Product Code</th>
												<th>Qty</th>
												<th>UOM</th>
												<th>Rate</th>
												<th>Amount</th>
												<th>Estimated Submission Date</th>
												<th>Remove</th>
											</tr>
										</thead>
									</table>
									<div class="row">
										<div class="col-md-2">
											<span><b>Total Products: </b></span>
										</div>
										<div class="col-md-5">
											<input type="text" readonly="readonly" class="form-control"
												id="totProd" name="totProd" value="0">
										</div>
										<div class="col-md-1">
											<span><b>Quantity: </b></span>
										</div>
										<div class="col-md-4">
											<input type="text" readonly="readonly" class="form-control"
												id="totQty" name="totQty" value="0">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-3">
											<!-- <span><b>Estimated Submission Date: </b></span> -->
										</div>
										<div class="col-md-7">
											<!-- <input type="text" class="form-control"
												name="estSubmissionDate" required="required"
												id="datepicker1" readonly="readonly"> -->
										</div>
										<div class="col-md-2">
											<input type="button" onclick="cancelF();"
												class="btn btn-danger small" value="Cancel"
												data-toggle="modal"><input type="button"
												class="btn green pull-right" value="Save"
												onclick="submitForm();">
										</div>
									</div>
								</form>

							</div>
							<!-- </div> -->
						</div>
					</div>
				</div>
			</div>
			<!-- Content Sec -->
		</div>
		<!-- Page Container -->
	</div>
	<!-- main -->

	<div id="cancelOrNot" class="modal fade" role="dialog"
		style="top: 25px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- <h4 class="modal-title">Modal Header</h4> -->
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="widget-area">
							<div class="row">
								<span>Do you want to cancel?</span>
							</div>
							<br>
							<div class="row">
								<button type="button" class="btn btn-success medium" id="yesC">Yes</button>
								<button type="button" class="btn btn-danger medium" id="noC">No</button>
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
	<script src="js/numericInput.min.js"></script>
	<script>
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

		function getDetailsByJobberName(id1) {
			if (id1 != 0) {
				$.ajax({
					url : 'getJobberDetailsByName',
					type : 'post',
					dataType : "json",
					data : {
						id : id1
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
		function emptyForm() {
			if ($("#jId").val() == "") {
				getDetailsByJobberName(0);
			}
		}
		$(function() {
			$("#jId").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeJobberAndName",
						data : {
							name : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.name,
									id : item.id
								});
							}));
						},

						error : function(a, b, c) {
							alert(a + b + c);
						}

					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#jName").val("");
						getDetailsByJobberName(0);
					} else {
						$("#jName").val(ui.item.id);
						getDetailsByJobberName(ui.item.id);
					}
				},
				select : function(event, ui) {
					if (ui.item != null) {
						$("#jName").val(ui.item.id);
						getDetailsByJobberName(ui.item.id);
					} else {
						$(this).val("");
						$("#jName").val("");
						getDetailsByJobberName(0);
					}

				}
			});
		});
		function cancelF() {
			$("#cancelOrNot").modal("show");
		}
		$("#yesC").click(function() {
			window.location = 'jobAssign.jsp';
		});
		$("#noC").click(function() {
			$("#cancelOrNot").modal("hide");
		});

		$(function() {
			$("#dNo").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getSampleDesignCostSheetByDesignNumber",
						data : {
							dNo : req.term
						},
						dataType : "json",
						success : function(data) {
							resp($.map(data, function(item) {
								return ({
									value : item.dNumber,
									id : item.dId
								});
							}));
						}

					});
				},
				change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
					}
				}
			});
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
