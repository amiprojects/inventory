<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link rel="stylesheet" type="text/css" media="all"
	href="css/daterangepicker-bs3.css" />
<!-- Date Range Picker -->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="css/jquery-jvectormap.css" type="text/css" />
<!-- Vector Map -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" />
<!-- Carousal -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<!-- <script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script> -->
</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if test="${!sessionScope['user'].equals('admin')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('dashboard')}">
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

	<%-- <h1>${sessionScope['user']}</h1> --%>

	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.jsp"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.jsp"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="breadcrumbs">
					<ul>
						<li><a href="dashboard.html" title=""><i
								class="fa fa-home"></i></a>/</li>
						<li><a title="">Dashboard</a></li>
					</ul>
				</div>
				<!-- breadcrumbs -->
				<div class="container">
					<div class="title-date-range">
						<div class="row">
							<div class="col-md-6">
								<div class="main-title">
									<h1>Dashboard</h1>
									<h5>Welcome back, Labrina</h5>
									<span><i class="fa fa-map-marker"></i>New York City</span>
								</div>
							</div>
							<div class="col-md-6">
								<div id="reportrange" class="date-range">
									<i class="fa fa-calendar-o"></i> <span></span> <b class="caret"></b>
								</div>
							</div>
						</div>
					</div>
					<!-- title Date Range -->
					<div class="stats-counter-sec">
						<div class="top-margin">
							<div class="row">
								<div class="col-md-3">
									<%-- <div class='toast' style="display: none; z-index: 99999999999;">
										<h3 id="msg">${requestScope['msg']}</h3>
									</div> --%>
									<div class="stats-counter">
										<h3>New Visits</h3>
										<span>21,069</span> <i class="fa fa-clock-o green"></i>
										<h6>Total Visits : 9,34,001</h6>
									</div>
									<!-- Stats Counter -->
								</div>
								<div class="col-md-3">
									<div class="stats-counter">
										<h3>New Signups</h3>
										<span>1,346</span> <i class="fa fa-user red"></i>
										<h6>Total Users : 22,344</h6>
									</div>
									<!-- Stats Counter -->
								</div>
								<div class="col-md-3">
									<div class="stats-counter">
										<div class="ribbon-wrapper">
											<div class="ribbon-design blue">Today</div>
										</div>
										<h3>Todays Earning</h3>
										<span>2,345</span> <i class="fa fa-usd blue"></i>
										<h6>Total Earning : $345,00</h6>
									</div>
									<!-- Stats Counter -->
								</div>
								<div class="col-md-3">
									<div class="stats-counter">
										<h3>Real Visitors</h3>
										<span id="random"></span> <i class="fa  fa-area-chart gray"></i>
										<h6>Total Visitors : 235,670</h6>
									</div>
									<!-- Stats Counter -->
								</div>
							</div>
						</div>
					</div>
					<!-- Stats Counter Sec-->
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-8">
								<div class="widget-area pattern">
									<h2 class="widget-title">
										<strong>Visitor</strong> Statistics
									</h2>
									<ul class="panel-function">
										<li class="dropdown"><a role="button"
											data-toggle="dropdown" href="#"> <b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu">
												<li role="presentation"><a title="" class="hide-btn"><i
														class="fa fa-minus"></i></a></li>
												<li role="presentation"><a title="" class="close-sec"><i
														class="fa fa-close"></i></a></li>
											</ul></li>
									</ul>
									<!-- Panel Function -->
									<div class="widget">
										<div id="graph-wrapper">
											<div class="graph-info">
												<a href="#" class="visitors"><span class="green"></span>Visitors</a>
												<a href="#" class="returning"><span class="blue"></span>Returning
													Visitors</a> <a href="#" id="bars" class="graph-tab-btn"><span><i
														class="fa fa-bar-chart-o"></i></span></a> <a href="#" id="lines"
													class="active graph-tab-btn"><span><i
														class="fa fa-code-fork"></i></span></a>
											</div>
											<div class="graph-container">
												<div id="graph-lines"></div>
												<div id="graph-bars"></div>
											</div>
											<div class="graph-details">
												<ul>
													<li><span id="new-orders" class="sparkline">4,5,6,7,6,5,4,3,2,2,4</span>
														<p>
															18,304<i>New Orders</i>
														</p></li>
													<li><span id="new-sales" class="sparkline">2,3,4,5,2,5,6,2,8,5,1,5</span>
														<p>
															2,39,231<i>New Sales</i>
														</p></li>
													<li><span id="new-visitors" class="sparkline">6,5,3,1,4,5,6,7,3,2,3,8</span>
														<p>
															56,234<i>New Visitors</i>
														</p></li>
												</ul>
											</div>
										</div>
									</div>
									<!-- Widget -->
								</div>
								<!-- Widget Area -->
							</div>

							<div class="col-md-4">
								<div class="widget-area no-padding blank">
									<ul class="carousal-sec">
										<li><i class="fa fa-anchor"></i>
											<p>
												<strong>Steve Jobs</strong> Time Capsu le` is Finally
												Unearthed on these <strong>Skyacers News</strong>
											</p> <span>2 min ago</span></li>
										<li><i class="fa fa-anchor"></i>
											<p>
												<strong>Steve Jobs</strong> Time Capsu le` is Finally
												Unearthed on these <strong>Skyacers News</strong>
											</p> <span>2 min ago</span></li>
										<li><i class="fa fa-anchor"></i>
											<p>
												<strong>Steve Jobs</strong> Time Capsu le` is Finally
												Unearthed on these <strong>Skyacers News</strong>
											</p> <span>2 min ago</span></li>
									</ul>
									<!-- Carousal Sec -->
								</div>
							</div>

							<div class="col-md-4">
								<div class="widget-area pattern">
									<div class="balance-widget">
										<span class="sparkpie" id="pie">1,1,2</span>
										<h3>Our Balance</h3>
										<h2>
											<i>THIS MONTH EARNING</i>$9,34,145.0
										</h2>
										<div class="progress w-tooltip">
											<div class="red progress-bar" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 60%;">
												<span><i>Today</i>$2,230</span>
											</div>
										</div>
									</div>
									<!-- Balance Widget -->
								</div>
							</div>

							<div class="col-md-6">
								<div class="widget-area no-padding blank">
									<div class="status-upload">
										<form>
											<textarea placeholder="What are you doing right now?"></textarea>
											<ul>
												<li><a title="Audio" data-toggle="tooltip"
													data-placement="bottom"><i class="fa fa-music"></i></a></li>
												<li><a title="Video" data-toggle="tooltip"
													data-placement="bottom"><i class="fa fa-video-camera"></i></a></li>
												<li><a title="Sound Record" data-toggle="tooltip"
													data-placement="bottom"><i class="fa fa-microphone"></i></a></li>
												<li><a title="Picture" data-toggle="tooltip"
													data-placement="bottom"><i class="fa fa-picture-o"></i></a></li>
											</ul>
											<button type="submit" class="green">
												<i class="fa fa-share"></i> Share
											</button>
										</form>
									</div>
									<!-- Status Upload  -->
								</div>
								<!-- Widget Area -->
							</div>

							<div class="col-md-3">
								<div class="widget-area no-padding blank">
									<div class="social-widget">
										<span id="fb"><i class="fa fa-facebook"></i></span>
										<ul>
											<li><p>
													1,265<i>Friends</i>
												</p></li>
											<li><p>
													235<i>Likes</i>
												</p></li>
										</ul>
									</div>
									<!-- Social Widget -->
								</div>
								<!-- Widget Area -->
							</div>

							<div class="col-md-3">
								<div class="widget-area no-padding blank">
									<div class="social-widget">
										<span id="twitter"><i class="fa fa-twitter"></i></span>
										<ul>
											<li><p>
													3,345<i>Tweets</i>
												</p></li>
											<li><p>
													984<i>Followers</i>
												</p></li>
										</ul>
									</div>
									<!-- Social Widget -->
								</div>
								<!-- Widget Area -->
							</div>

							<div class="col-md-8">
								<div class="widget-area no-padding blank">
									<div class="panel panel-default work-progress-table">
										<!-- Default panel contents -->
										<div class="panel-heading">
											Lanbrina Scholar<i>My Work Progress</i>
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-default dropdown-toggle" type="button">
													Default <span class="caret"></span>
												</button>
												<ul role="menu" class="dropdown-menu">
													<li><a href="#">Action</a></li>
													<li><a href="#">Another action</a></li>
													<li><a href="#">Something else here</a></li>
													<li class="divider"></li>
													<li><a href="#">Separated link</a></li>
												</ul>
											</div>
										</div>
										<!-- Table -->
										<table class="table">
											<thead>
												<tr>
													<th>#</th>
													<th>Name</th>
													<th>Progress</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Mark</td>
													<td>
														<div class="progress">
															<div style="width: 60%;" aria-valuemax="100"
																aria-valuemin="0" aria-valuenow="60" role="progressbar"
																class="red progress-bar">
																<span>60%</span>
															</div>
														</div>
													</td>
													<td>Pending..</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Jacob</td>
													<td>
														<div class="progress">
															<div style="width: 80%;" aria-valuemax="100"
																aria-valuemin="0" aria-valuenow="80" role="progressbar"
																class="green progress-bar">
																<span>80%</span>
															</div>
														</div>
													</td>
													<td>Checking..</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Larry</td>
													<td>
														<div class="progress">
															<div style="width: 40%;" aria-valuemax="100"
																aria-valuemin="0" aria-valuenow="40" role="progressbar"
																class="blue progress-bar">
																<span>40%</span>
															</div>
														</div>
													</td>
													<td>Working...</td>
												</tr>
												<tr>
													<td>4</td>
													<td>John Doe</td>
													<td>
														<div class="progress">
															<div style="width: 90%;" aria-valuemax="100"
																aria-valuemin="0" aria-valuenow="90" role="progressbar"
																class="gray progress-bar">
																<span>90%</span>
															</div>
														</div>
													</td>
													<td>Almost Done</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Brandon Daril</td>
													<td>
														<div class="progress">
															<div style="width: 60%;" aria-valuemax="100"
																aria-valuemin="0" aria-valuenow="60" role="progressbar"
																class="red progress-bar">
																<span>60%</span>
															</div>
														</div>
													</td>
													<td>Pending..</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- Table Progress -->
								</div>
								<!-- Widget Area -->
							</div>

							<div class="col-md-4">
								<div class="widget-area">
									<h2 class="widget-title">
										<strong>Activity</strong> Feed
									</h2>
									<ul class="panel-function">
										<li class="dropdown"><a role="button"
											data-toggle="dropdown" href="#"> <b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu">
												<li role="presentation"><a title="" class="hide-btn"><i
														class="fa fa-minus"></i></a></li>
												<li role="presentation"><a title="" class="close-sec"><i
														class="fa fa-close"></i></a></li>
											</ul></li>
									</ul>
									<!-- Panel Function -->
									<div class="widget">
										<div class="activity-feed" id="activity-scroll">
											<ul>
												<li><span><i class="fa fa-upload green"></i></span>
													<h3>New Upload</h3>
													<p>
														New file <a href="#" title="">document.doc</a> uploaded to
														the cloud
													</p> <i>2 min ago</i></li>
												<li><span><i class="fa fa-file blue"></i></span>
													<h3>New Document</h3>
													<p>
														New document <a href="#" title="">lorem ipsum.txt</a>
														created
													</p> <i>4 min ago</i></li>
												<li><span><i class="fa fa-info red"></i></span>
													<h3>Important Notification</h3>
													<p>
														There is <a href="#" title="">Server 10</a> is not working
														Properly
													</p> <i>1 hour ago</i></li>
												<li><span><img src="images/resource/sender1.jpg"
														alt="" /></span>
													<h3>New Upload</h3>
													<p>
														New file <a href="#" title="">document.doc</a> uploaded to
														the cloud
													</p> <i>today</i></li>
												<li><span><i class="fa fa-info red"></i></span>
													<h3>Important Notification</h3>
													<p>
														There is <a href="#" title="">Server 10</a> is not working
														Properly
													</p> <i>1 hour ago</i></li>
												<li><span><img src="images/resource/sender1.jpg"
														alt="" /></span>
													<h3>New Upload</h3>
													<p>
														New file <a href="#" title="">document.doc</a> uploaded to
														the cloud
													</p> <i>today</i></li>
												<li><span><i class="fa fa-upload green"></i></span>
													<h3>New Upload</h3>
													<p>
														New file <a href="#" title="">document.doc</a> uploaded to
														the cloud
													</p> <i>2 min ago</i></li>
												<li><span><i class="fa fa-file blue"></i></span>
													<h3>New Document</h3>
													<p>
														New document <a href="#" title="">lorem ipsum.txt</a>
														created
													</p> <i>4 min ago</i></li>
												<li><span><i class="fa fa-info red"></i></span>
													<h3>Important Notification</h3>
													<p>
														There is <a href="#" title="">Server 10</a> is not working
														Properly
													</p> <i>1 hour ago</i></li>
											</ul>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="widget-area blank">
									<div class="full-width">
										<h2 class="widget-title">
											<strong>Country</strong> Visitors
										</h2>
										<ul class="panel-function">
											<li class="dropdown"><a role="button"
												data-toggle="dropdown" href="#"> <b class="caret"></b></a>
												<ul class="dropdown-menu" role="menu">
													<li role="presentation"><a title="" class="hide-btn"><i
															class="fa fa-minus"></i></a></li>
													<li role="presentation"><a title="" class="close-sec"><i
															class="fa fa-close"></i></a></li>
												</ul></li>
										</ul>
										<!-- Panel Function -->
										<div class="widget">
											<div class="row">
												<div class="col-md-8">
													<div id="map" style="width: 100%; height: 300px"
														class="map-vector"></div>
												</div>
												<div class="col-md-4">
													<div class="visit-table">
														<ul>
															<li class="table-head"><h2 class="location">Location</h2>
																<h2 class="visit">Visits</h2></li>
															<li><span class="location"><img
																	src="images/resource/us-flag.jpg" alt="" />United
																	States</span><i class="visit">2298</i></li>
															<li><span class="location"><img
																	src="images/resource/china-flag.jpg" alt="" />China</span><i
																class="visit">13244</i></li>
															<li><span class="location"><img
																	src="images/resource/turkey-flag.jpg" alt="" />Turkey</span><i
																class="visit">234</i></li>
															<li><span class="location"><img
																	src="images/resource/australia-flag.jpg" alt="" />Australia</span><i
																class="visit">2345</i></li>
															<li><span class="location"><img
																	src="images/resource/india-flag.jpg" alt="" />India</span><i
																class="visit">756</i></li>
															<li><span class="location"><img
																	src="images/resource/brazil-flag.jpg" alt="" />Brazil</span><i
																class="visit">65570</i></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="widget-area no-padding">
									<div class="my-profile-widget">
										<div class="profile-widget-head">
											<h3>Labrina Scholar</h3>
											<i>Creative Designer</i> <span><img
												src="images/resource/me.jpg" alt="" /></span>
										</div>
										<h4>@labrina_scholar</h4>
										<span class="blue"><i class="fa fa-map-marker"></i>San
											Francisco</span>
										<p>Print this page to PDF for te completet of vectors. Or
											to use othe the Font Aweo Awesome</p>
										<a href="#" title="">http://themeforest.net</a>
										<ul class="social-btns">
											<li><a title="" href="#"><i class="fa fa-facebook"></i></a></li>
											<li><a title="" href="#"><i
													class="fa fa-google-plus"></i></a></li>
											<li><a title="" href="#"><i class="fa fa-twitter"></i></a></li>
										</ul>
									</div>
									<!-- My Profile Widget -->
								</div>
							</div>

							<div class="col-md-8">
								<div class="widget-area">
									<h2 class="widget-title">
										<strong>User</strong> Timeline
									</h2>
									<ul class="panel-function">
										<li class="dropdown"><a role="button"
											data-toggle="dropdown" href="#"> <b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu">
												<li role="presentation"><a title="" class="hide-btn"><i
														class="fa fa-minus"></i></a></li>
												<li role="presentation"><a title="" class="close-sec"><i
														class="fa fa-close"></i></a></li>
											</ul></li>
									</ul>
									<!-- Panel Function -->
									<div class="widget">
										<div class="timeline-sec" id="timeline-scroll">
											<ul>
												<li>
													<div class="timeline">
														<div class="user-timeline">
															<span><img src="images/resource/sender2.jpg"
																alt="" /></span>
														</div>
														<div class="timeline-detail">
															<div class="timeline-head">
																<h3>
																	Jonathan Gardel<span>2 min ago</span><i class="red">Admin</i>
																</h3>
																<div class="social-share">
																	<a title=""><i class="fa fa-share-alt"></i></a>
																	<ul class="social-btns">
																		<li><a title="Facebook" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-facebook"></i></a></li>
																		<li><a title="Google" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-google-plus"></i></a></li>
																		<li><a title="Twitter" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-twitter"></i></a></li>
																	</ul>
																</div>
															</div>
															<div class="timeline-content">
																<p>
																	Set it as the font <a href="#" title="">John Doe</a> in
																	your applition, and copy and paste the icons. Print
																	this page.
																</p>
																<div class="progress w-tooltip">
																	<div style="width: 70%;" aria-valuemax="100"
																		aria-valuemin="0" aria-valuenow="70"
																		role="progressbar" class="red progress-bar">
																		<span><i>uploading</i>70%</span>
																	</div>
																</div>
																<div data-toggle="buttons"
																	class="btn-group btn-group-sm">
																	<label class="btn btn-default"> <input
																		type="radio" checked="" name="options" /><i
																		class="fa fa-comment-o"></i> Reply
																	</label> <label class="btn btn-default"> <input
																		type="radio" name="options" /> <i
																		class="fa fa-thumbs-o-up"></i> Like
																	</label>
																</div>
																<form class="post-reply">
																	<textarea placeholder="Write your comment"></textarea>
																	<i class="fa fa-comments-o"></i>
																</form>
															</div>
														</div>
													</div>
												</li>

												<li>
													<div class="timeline">
														<div class="user-timeline">
															<span><img src="images/resource/sender3.jpg"
																alt="" /></span>
														</div>
														<div class="timeline-detail">
															<div class="timeline-head">
																<h3>
																	Yameen khandil<span>2 hours ago</span><i class="blue">Mod</i>
																</h3>
																<div class="social-share">
																	<a title=""><i class="fa fa-share-alt"></i></a>
																	<ul class="social-btns">
																		<li><a title="Facebook" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-facebook"></i></a></li>
																		<li><a title="Google" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-google-plus"></i></a></li>
																		<li><a title="Twitter" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-twitter"></i></a></li>
																	</ul>
																</div>
															</div>
															<div class="timeline-content">
																<p>
																	at <a href="#" title="">Khana Zidi</a> Jonathan DOe
																	Uploaded 4 new photos.
																</p>
																<div class="timeline-gallery">
																	<ul>
																		<li><a title="Gallery Image"
																			class="html5lightbox" href="images/resource/view.gif"><i
																				class="fa fa-search"></i><img
																				src="images/resource/gallery1.jpg" alt="" /></a></li>
																		<li><a title="Gallery Image"
																			class="html5lightbox" href="images/resource/view.gif"><i
																				class="fa fa-search"></i><img
																				src="images/resource/gallery2.jpg" alt="" /></a></li>
																		<li><a title="Gallery Image"
																			class="html5lightbox" href="images/resource/view.gif"><i
																				class="fa fa-search"></i><img
																				src="images/resource/gallery3.jpg" alt="" /></a></li>
																		<li><a title="Gallery Image"
																			class="html5lightbox" href="images/resource/view.gif"><i
																				class="fa fa-search"></i><img
																				src="images/resource/gallery4.jpg" alt="" /></a></li>
																	</ul>
																</div>
																<div data-toggle="buttons"
																	class="btn-group btn-group-sm">
																	<label class="btn btn-default"> <input
																		type="radio" checked="" name="options" /><i
																		class="fa fa-comment-o"></i> Reply
																	</label> <label class="btn btn-default"> <input
																		type="radio" name="options" /> <i
																		class="fa fa-thumbs-o-up"></i> Like
																	</label>
																</div>
																<form class="post-reply">
																	<textarea placeholder="Write your comment"></textarea>
																	<i class="fa fa-comments-o"></i>
																</form>
															</div>
														</div>
													</div>
												</li>

												<li>
													<div class="timeline">
														<div class="user-timeline">
															<span><img src="images/resource/sender1.jpg"
																alt="" /></span>
														</div>
														<div class="timeline-detail">
															<div class="timeline-head">
																<h3>
																	Brindal Dazi<span>4 min ago</span><i class="green">User</i>
																</h3>
																<div class="social-share">
																	<a title=""><i class="fa fa-share-alt"></i></a>
																	<ul class="social-btns">
																		<li><a title="Facebook" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-facebook"></i></a></li>
																		<li><a title="Google" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-google-plus"></i></a></li>
																		<li><a title="Twitter" data-toggle="tooltip"
																			data-placement="left" href="#"><i
																				class="fa fa-twitter"></i></a></li>
																	</ul>
																</div>
															</div>
															<div class="timeline-content">
																<p>
																	Set it as the font <a href="#" title="">John Doe</a> in
																	your applition, and copy and paste the icons. Print
																	this page to PDF for te completet of vectors. Or to use
																	othe the Font Aweo Awesome
																</p>
																<div data-toggle="buttons"
																	class="btn-group btn-group-sm">
																	<label class="btn btn-default"> <input
																		type="radio" checked="" name="options" /><i
																		class="fa fa-comment-o"></i> Reply
																	</label> <label class="btn btn-default"> <input
																		type="radio" name="options" /> <i
																		class="fa fa-thumbs-o-up"></i> Like
																	</label>
																</div>
																<form class="post-reply">
																	<textarea placeholder="Write your comment"></textarea>
																	<i class="fa fa-comments-o"></i>
																</form>
															</div>
														</div>
													</div>
												</li>

											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- Content Sec -->
			<div class="slide-panel" id="panel-scroll">
				<ul role="tablist" class="nav nav-tabs panel-tab-btn">
					<li class="active"><a data-toggle="tab" role="tab"
						href="#tab1"><i class="fa fa-inbox"></i><span>Your
								Emails</span></a></li>
					<li><a data-toggle="tab" role="tab" href="#tab2"><i
							class="fa fa-wrench"></i><span>Your Setting</span></a></li>
				</ul>
				<div class="tab-content panel-tab">
					<div id="tab1" class="tab-pane fade in active">
						<div class="recent-mails-widget">
							<form>
								<div id="searchMail"></div>
							</form>
							<h3>Recent Emails</h3>
							<ul id="mail-list" class="mail-list">
								<li>
									<div class="title">
										<span><img src="images/resource/sender1.jpg" alt="" /><i
											class="online"></i></span>
										<h3>
											<a href="#" title="">Kim Hostwood</a><span>5 min ago</span>
										</h3>
										<a href="#" data-toggle="tooltip" data-placement="left"
											title="Attachment"><i class="fa fa-paperclip"></i></a>
									</div>
									<h4>Themeforest Admin Template</h4>
									<p>This product is so good that i manage to buy it 1 for me
										and 3 for my families.</p>
								</li>
								<li>
									<div class="title">
										<span><img src="images/resource/sender2.jpg" alt="" /><i
											class="online"></i></span>
										<h3>
											<a href="#" title="">John Doe</a><span>2 hours ago</span>
										</h3>
										<a href="#" data-toggle="tooltip" data-placement="left"
											title="Attachment"><i class="fa fa-paperclip"></i></a>
									</div>
									<h4>Themeforest Admin Template</h4>
									<p>This product is so good that i manage to buy it 1 for me
										and 3 for my families.</p>
								</li>
								<li>
									<div class="title">
										<span><img src="images/resource/sender3.jpg" alt="" /><i
											class="offline"></i></span>
										<h3>
											<a href="#" title="">Jonathan Doe</a><span>8 min ago</span>
										</h3>
										<a href="#" data-toggle="tooltip" data-placement="left"
											title="Attachment"><i class="fa fa-paperclip"></i></a>
									</div>
									<h4>Themeforest Admin Template</h4>
									<p>This product is so good that i manage to buy it 1 for me
										and 3 for my families.</p>
								</li>
							</ul>
							<a href="inbox.html" title="" class="red">View All Messages</a>
						</div>
						<!-- Recent Email Widget -->

						<div class="file-transfer-widget">
							<h3>
								FILE TRANSFER <i class="fa fa-angle-down"></i>
							</h3>
							<div class="toggle">
								<ul>
									<li><i class="fa fa-file-excel-o"></i>
										<h4>
											my-excel.xls<i>20 min ago</i>
										</h4>
										<div class="progress">
											<div style="width: 90%;" aria-valuemax="100"
												aria-valuemin="0" aria-valuenow="90" role="progressbar"
												class="progress-bar red">90%</div>
										</div>
										<div class="file-action-btn">
											<a href="#" title="Approve" class="green"
												data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-check"></i></a> <a href="#" title="Cancel"
												class="red" data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-close"></i></a>
										</div></li>
									<li><i class="fa fa-file-pdf-o"></i>
										<h4>
											my-cv.pdf<i>8 min ago</i>
										</h4>
										<div class="progress">
											<div style="width: 40%;" aria-valuemax="100"
												aria-valuemin="0" aria-valuenow="40" role="progressbar"
												class="progress-bar blue">40%</div>
										</div>
										<div class="file-action-btn">
											<a href="#" title="Approve" class="green"
												data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-check"></i></a> <a href="#" title="Cancel"
												class="red" data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-close"></i></a>
										</div></li>
									<li><i class="fa fa-file-video-o"></i>
										<h4>
											portfolio-shoot.mp4<i>12 min ago</i>
										</h4>
										<div class="progress">
											<div style="width: 70%;" aria-valuemax="100"
												aria-valuemin="0" aria-valuenow="70" role="progressbar"
												class="progress-bar green">70%</div>
										</div>
										<div class="file-action-btn">
											<a href="#" title="Approve" class="green"
												data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-check"></i></a> <a href="#" title="Cancel"
												class="red" data-toggle="tooltip" data-placement="bottom"><i
												class="fa fa-close"></i></a>
										</div></li>
								</ul>
							</div>
						</div>
						<!-- File Transfer -->
					</div>
					<div id="tab2" class="tab-pane fade">
						<div class="setting-widget">
							<form>
								<h3>Accounts</h3>
								<div class="toggle-setting">
									<span>Office Account</span> <label class="toggle-switch">
										<input type="checkbox"> <span data-unchecked="Off"
										data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>Personal Account</span> <label class="toggle-switch">
										<input type="checkbox" checked> <span
										data-unchecked="Off" data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>Business Account</span> <label class="toggle-switch">
										<input type="checkbox"> <span data-unchecked="Off"
										data-checked="On"></span>
									</label>
								</div>
							</form>

							<form>
								<h3>General Setting</h3>
								<div class="toggle-setting">
									<span>Notifications</span> <label class="toggle-switch">
										<input type="checkbox" checked> <span
										data-unchecked="Off" data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>Notification Sound</span> <label class="toggle-switch">
										<input type="checkbox" checked> <span
										data-unchecked="Off" data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>My Profile</span> <label class="toggle-switch"> <input
										type="checkbox"> <span data-unchecked="Off"
										data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>Show Online</span> <label class="toggle-switch">
										<input type="checkbox"> <span data-unchecked="Off"
										data-checked="On"></span>
									</label>
								</div>
								<div class="toggle-setting">
									<span>Public Profile</span> <label class="toggle-switch">
										<input type="checkbox" checked> <span
										data-unchecked="Off" data-checked="On"></span>
									</label>
								</div>
							</form>
						</div>
						<!-- Setting Widget -->
					</div>
				</div>
			</div>
			<!-- Slide Panel -->
		</div>
		<!-- Page Container -->
	</div>
	<!-- main -->
	<!-- Script -->
	<script type="text/javascript" src="js/modernizr.js"></script>

	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/enscroll.js"></script>
	<script type="text/javascript" src="js/daterangepicker.js"></script>
	<script type="text/javascript" src="js/moment.js"></script>
	<script type="text/javascript" src="js/grid-filter.js"></script>
	<script type="text/javascript" src="js/jquery-jvectormap.js"></script>
	<script type="text/javascript" src="js/jquery-jvectormap-world-en.js"></script>
	<script type="text/javascript" src="js/gdp-data.js"></script>
	<script type="text/javascript" src="js/chart-line-and-graph.js"></script>
	<script type="text/javascript" src="js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/html5lightbox.js"></script>

	<script type="text/javascript">
		function random_num(field, interval, range) {

			setInterval(function() {
				var chars = "0123456789";
				var string_length = range;
				var randomstring = '';
				for (var i = 0; i < string_length; i++) {
					var rnum = Math.floor(Math.random() * chars.length);
					randomstring += chars.substring(rnum, rnum + 1);
				}
				var a = jQuery("#" + field).html(randomstring);
				console.log(a);
			}, interval);
		};
	</script>
	<script>
		jQuery(document).ready(function() {
			random_num('random', 3000, 3);
		});
	</script>

	<script type="text/javascript">
		function display_c() {
			var refresh = 1000; // Refresh rate in milli seconds
			mytime = setTimeout('display_ct()', refresh)
		}

		function display_ct() {
			var strcount
			var x = new Date()
			//var x1=x.toUTCString();// changing the display to UTC string
			var x1 = x.getDate() + "/" + x.getMonth() + "/" + x.getYear();
			x1 = x1 + " - " + x.getHours() + ":" + x.getMinutes() + ":"
					+ x.getSeconds();
			document.getElementById('reportrange').innerHTML = x1;
			tt = display_c();
		}
		$(document).ready(function() {
			display_ct();

			$("#dash").attr("id", "activeSubMenu");
			$("#sDash").attr("style", "color: red;");

			/* 	$(".carousal-sec").owlCarousel({

				autoPlay : true,
				stopOnHover : true,
				goToFirstSpeed : 500,
				slideSpeed : 500,
				singleItem : true,
				autoHeight : true,
				transitionStyle : "backSlide",
				navigation : true
			});

			$("#pie").sparkline(
					[ 1, 1, 2 ],
					{
						type : 'pie',
						width : '40',
						height : '40',
						sliceColors : [ '#2dcb73', '#fd6a59',
								'#17c3e5', '#109618',
								'#66aa00', '#dd4477',
								'#0099c6', '#990099 ' ]
					});

			$(function() {
				$("#new-orders").sparkline(
						[ 4, 5, 6, 7, 6, 5, 4, 3, 2, 2, 3, 4 ],
						{
							type : 'bar',
							height : '40px',
							barSpacing : 3,
							barWidth : 6,
							barColor : '#2dcb73',
							negBarColor : '#D6A838'
						});
			});

			$(function() {
				$("#new-sales").sparkline(
						[ 2, 3, 4, 5, 2, 5, 6, 2, 8, 5, 1, 5 ],
						{
							type : 'bar',
							height : '40px',
							barSpacing : 3,
							barWidth : 6,
							barColor : '#ff604f',
							negBarColor : '#D6A838'
						});
			});

			$(function() {
				$("#new-visitors").sparkline(
						[ 6, 5, 3, 1, 4, 5, 6, 7, 3, 2, 3, 8 ],
						{
							type : 'bar',
							height : '40px',
							barSpacing : 3,
							barWidth : 6,
							barColor : '#17c3e5',
							negBarColor : '#D6A838'
						});
			});

			$('#reportrange')
					.daterangepicker(
							{
								startDate : moment().subtract(
										'days', 29),
								endDate : moment(),
								minDate : '01/01/2012',
								maxDate : '12/31/2014',
								dateLimit : {
									days : 60
								},
								showDropdowns : true,
								showWeekNumbers : true,
								timePicker : false,
								timePickerIncrement : 1,
								timePicker12Hour : true,
								ranges : {
									'Today' : [ moment(),
											moment() ],
									'Yesterday' : [
											moment().subtract(
													'days', 1),
											moment().subtract(
													'days', 1) ],
									'Last 7 Days' : [
											moment().subtract(
													'days', 6),
											moment() ],
									'Last 30 Days' : [
											moment().subtract(
													'days', 29),
											moment() ],
									'This Month' : [
											moment().startOf(
													'month'),
											moment().endOf(
													'month') ],
									'Last Month' : [
											moment()
													.subtract(
															'month',
															1)
													.startOf(
															'month'),
											moment()
													.subtract(
															'month',
															1)
													.endOf(
															'month') ]
								},
								opens : 'left',
								buttonClasses : [ 'btn btn-default' ],
								applyClass : 'btn-small btn-primary',
								cancelClass : 'btn-small',
								format : 'MM/DD/YYYY',
								separator : ' to ',
								locale : {
									applyLabel : 'Submit',
									fromLabel : 'From',
									toLabel : 'To',
									customRangeLabel : 'Custom Range',
									daysOfWeek : [ 'Su', 'Mo',
											'Tu', 'We', 'Th',
											'Fr', 'Sa' ],
									monthNames : [ 'January',
											'February',
											'March', 'April',
											'May', 'June',
											'July', 'August',
											'September',
											'October',
											'November',
											'December' ],
									firstDay : 1
								}
							},
							function(start, end) {
								console
										.log("Callback has been called!");
								$('#reportrange span')
										.html(
												start
														.format('MMMM D, YYYY')
														+ ' - '
														+ end
																.format('MMMM D, YYYY'));
							});
			//Set the initial state of the picker label
			$('#reportrange span').html(
					moment().subtract('days', 29).format(
							'MMMM D, YYYY')
							+ ' - '
							+ moment().format('MMMM D, YYYY'));

			$(function() {
				$('#map').vectorMap({
					map : 'world_en'
				});
			}) */

		});
	</script>
</body>
</html>