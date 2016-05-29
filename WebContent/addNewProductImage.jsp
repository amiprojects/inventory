<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">

		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Product/Material')}">
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
		<%@include file="includeLeftOrTop.jsp"%>
		<div class="content-sec"
			style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
			<div class="container">
				<div class="row">
					<div class="masonary-grids">

						<div class="breadcrumbs" style="height: 50px; text-align: center;">
							<h3 style="margin-top: 11px;">Upload Multiple product Image</h3>
						</div>

						<div class="widget-area">
							<div class="col-md-12">
								<div align="center">
									<form action="uploadProductImage" enctype="multipart/form-data"
										method="post">
										<input type="hidden" value="${param.id}" name="id"> <input
											type="hidden" name="proImage1" id="proImage1" value="">


										<div style="width: 100%; float: left;">

											<!-- Choose -->
											<div style="width: 40%; float: left; height: 262px;">
												<div align="left">

													<h5>Upload From Computer</h5>
													<br>
													<center>
														<input type="file" name="proImg" size="20"
															onchange="readURL(this);">
													</center>
												</div>
											</div>

											<div style="width: 20%; float: left;"></div>

											<!-- Sanp -->
											<div style="width: 40%; float: right;">
												<div align="right">
													<h5>Upload From Web Camp</h5>
													<br>
													<center>
														<a href="javascript:void(take_snapshot())">

															<button class="btn blue btn-default" type="button">Take
																Snapshot</button>
														</a>
													</center>

													<div id="my_camera" style="width: 320px; height: 240px;"></div>
												</div>
											</div>





										</div>



										<!-- Show -->
										<div style="width: 50%; height: 100px; margin-top: 27px;">
											<img id="image" alt="" src="">
										</div>



										<!-- submit -->
										<div>
											<input style="margin-top: 10%;" class="btn green btn-default"
												type="submit" value="Save">
										</div>
									</form>
									<br> <br> <br>
									<div
										style="overflow-y: scroll; overflow-x: hidden; height: 300px">
										<div
											style="overflow-x: scroll; overflow-y: hidden; width: 500px;">
											<c:forEach
												items="${sessionScope['ejb'].getAllProductImageByProductId(param.id)}"
												var="img">
												<div style="float: left;">
													<img width="100" height="100" style="" alt=""
														src="data:image/jpeg;base64,${img.getImageAsString()}"><br>
													<c:if
														test="${sessionScope['ejb'].getAllProductImageByProductId(param.id).size()>1}">
														<a
															href="deleteProductImage?imageId=${img.id}&id=${param.id}">delete
															Image</a>
													</c:if>
												</div>
											</c:forEach>
										</div>
									</div>
									<div align="right">
										<a href="MaterialPartDetailsGenerals.jsp"><button
												class="btn blue btn-default" type="button">Back</button></a>
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


	<!-- main -->

	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image').attr('src', e.target.result).width(120).height(
							85);
					var str = e.target.result;
					$("#proImage1")
							.val(str.substring(str.lastIndexOf(',') + 1));
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#prodact").attr("id", "activeSubMenu");
			$("#sProduct").attr("style", "color: #6a94ff;");
		});
	</script>


	<script type="text/javascript" src="js/webcam.js"></script>
	<script>
		Webcam.set({
			width : 320,
			height : 240,
			image_format : 'jpeg',
			jpeg_quality : 90
		});
		Webcam.attach('#my_camera');

		function take_snapshot() {
			Webcam.snap(function(data_uri) {
				$('#image').attr('src', data_uri).width(120).height(85);
				str = data_uri;
				$("#proImage1").val(str.substring(str.lastIndexOf(',') + 1));
			});
		}
	</script>


</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>