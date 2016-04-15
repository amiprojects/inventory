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
<link rel="stylesheet" href="css/scrollTable.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<link rel="stylesheet" href="js/jquery-ui/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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

			<c:if test="${page.name.equals('Job Search')}">
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
								<h3 style="margin-top: 11px;">Sample Job Cost Sheet Search</h3>
							</div>
							<div class="col-md-12">
								<div class="widget-area">
									<form role="form" class="sec" action="sampleJobSearchAll"
										method="post">
										<div class="row">
											<div class="col-md-12">
												<button class="btn green pull-right" type="submit"
													style="margin-right: 63px;">Show All</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="sampleJobSearchByDesignNo" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Design No. :</label> <input
														type="" placeholder="Enter Design No." id="designNo"
														name="designNo" class="form-control" autocomplete="off">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>
										</div>
									</form>
									<form role="form" class="sec"
										action="sampleJobSearchByDesignerName" method="post">
										<div class="row">
											<div class="col-md-10">
												<div class="form-group">
													<label for="" style="float: left;">Designer Name :</label>
													<input type="" placeholder="Enter Designer Name"
														id="designerName" name="designerName" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button class="btn green pull-left"
													style="margin-top: 25px;" type="submit">Search</button>
											</div>

										</div>
									</form>
									<br>
									<h3 align="center" style="color: #6a94ff;">${requestScope['msg']}</h3>
									<br>
									<table class="table table-fixedheader">
										<thead>
											<tr>
												<th width="5%">#</th>
												<th width="20%">Design No.</th>
												<th width="35%">Design Description</th>
												<th width="30%">Designer Name</th>
											</tr>
										</thead>
										<tbody style="height: 300px;">
											<c:set var="count" value="${1}" />
											<c:forEach
												items="${requestScope['sampleDesignCostSheetList']}"
												var="sampleDesignCostSheet">

												<tr>
													<td width="5%">${count}</td>
													<td width="20%"><a href="#"
														onclick="viewInvoice(${sampleDesignCostSheet.id});"><b>${sampleDesignCostSheet.designNumber.toUpperCase()}</b></a></td>
													<td width="35%">${sampleDesignCostSheet.designDescription.toUpperCase()}</td>
													<td width="30%">${sampleDesignCostSheet.vendor.name}</td>
													<td width="10%">
														<form action="sampleJobCostSheetView" method="post"
															id="JobDetails${sampleDesignCostSheet.id}">
															<a href="#"
																onclick="jobShowDetails('${sampleDesignCostSheet.id}');"><input
																type="hidden" value="${sampleDesignCostSheet.id}"
																name="sampleDesignCostSheetId"><img alt=""
																src="images/eye.png" height="25px"></a>
														</form>
													</td>
												</tr>
												<c:set var="count" value="${count+1}" />
											</c:forEach>
										</tbody>
									</table>
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

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#jobs").attr("id", "activeSubMenu");
			$("#designCostSheetSearch").attr("style", "color: #6a94ff;");
		});
	</script>
	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
	</script>
	<script>
		$(function() {
			$("#datepicker1").datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		function dateSet() {
			var dt = $("#datepicker").datepicker('getDate');
			var dt1 = $("#datepicker1").datepicker('getDate');
			if ($("#datepicker1").val() != "" && dt >= dt1) {
				alert("Start date must be before than end date...");
				$("#datepicker").val("");
			}
		}
		function checkDate() {
			var d = $("#datepicker").datepicker('getDate');
			var d1 = $("#datepicker1").datepicker('getDate');
			if ($("#datepicker").val() != "" && d >= d1) {
				alert("End date must be later than start date...");
				$("#datepicker1").val("");
			}
		}
	</script>
	<script type="text/javascript">
		function jobShowDetails(id) {
			//alert(id);
			$("#JobDetails" + id).submit();
		}

		$(function() {
			$("#designNo").autocomplete({
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
									value : item.dNumber.toUpperCase(),
									id : item.dId
								});
							}));
						}

					});
				},
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#designNo").val("");
					} else {
						$("#designNo").val($(this).val());
					}
				}
			});
		});

		$(function() {
			$("#designerName").autocomplete({
				source : function(req, resp) {
					$.ajax({
						type : "post",
						url : "getVendorsByVendorTypeDesignerAndName",
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
				/* change : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#jobberName").val("");
					} else {
						$("#jobberName").val(ui.item.name);
					}
				}, */
				select : function(event, ui) {
					if (ui.item == null) {
						$(this).val("");
						$("#jobberName").val("");
					} else {
						$("#jobberName").val(ui.item.name);
					}

				}
			});
		});

		function jobSearchByDateSubmit() {
			if ($("#datepicker").val() == "" || $("#datepicker1").val() == "") {
				alert("Please enter start date and end date");
			} else {
				$("#jobSearchByDateId").submit();
			}
		}

		function viewInvoice(id) {
			window.open("jobChallanForSampleDesignCostSheet.jsp?id=" + id, 'name',
					'width=900,height=700').print();
		}
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>
