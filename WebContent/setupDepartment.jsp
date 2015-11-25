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
								<div class="widget-area">
									<table border="1" bordercolor="gray" class="table">
										<tr>
											<th>Access right</th>
											<th>Value</th>
										</tr>
										<tr>
											<td><div class="widget-area">
													<!-- <h2 class="widget-title">
														<strong>Tree</strong> List
													</h2> -->
													<div class="tree-list">
														<p>
															<a href="#" id="tree-expand-all">Expand all</a> | <a
																href="#" id="tree-collapse-all">Collapse all</a>
														</p>
														<!-- Listing directory ZendX from ZendFramework library -->
														<ul id="tree">
															<li>Application
																<ul>
																	<li>Resource
																		<ul>
																			<li>Jquery.php</li>
																		</ul>
																	</li>
																</ul>
															</li>

															<li>Console
																<ul>
																	<li>Process
																		<ul>
																			<li>Exception.php</li>
																			<li>Unix.php</li>
																		</ul>
																	</li>
																	<li>Exception.php</li>
																</ul>
															</li>

															<li>JQuery
																<ul>
																	<li>Controller
																		<ul>
																			<li>Action
																				<ul>
																					<li>Helper
																						<ul>
																							<li>AutoComplete.php</li>
																						</ul>
																					</li>
																				</ul>
																			</li>
																		</ul>
																	</li>
																	<li>View
																		<ul>
																			<li>Helper
																				<ul>
																					<li>JQuery
																						<ul>
																							<li>Container.php</li>
																						</ul>
																					</li>
																					<li>UiWidgetPane.php</li>
																					<li>UiWidget.php</li>
																					<li>TabPane.php</li>
																					<li>TabContainer.php</li>
																					<li>Spinner.php</li>
																					<li>Slider.php</li>
																					<li>JQuery.php</li>
																					<li>AutoComplete.php</li>
																					<li>DialogContainer.php</li>
																					<li>DatePicker.php</li>
																					<li>ColorPicker.php</li>
																					<li>AccordionPane.php</li>
																					<li>AjaxLink.php</li>
																					<li>AccordionContainer.php</li>
																				</ul>
																			</li>
																			<li>Exception.php</li>
																		</ul>
																	</li>
																	<li>Form
																		<ul>
																			<li>Decorator
																				<ul>
																					<li>AccordionContainer.php</li>
																					<li>UiWidgetPane.php</li>
																					<li>UiWidgetElementMarker.php</li>
																					<li>UiWidgetElement.php</li>
																					<li>UiWidgetContainer.php</li>
																					<li>TabPane.php</li>
																					<li>TabContainer.php</li>
																					<li>DialogContainer.php</li>
																					<li>AccordionPane.php</li>
																				</ul>
																			</li>
																			<li>Element
																				<ul>
																					<li>AutoComplete.php</li>
																					<li>UiWidget.php</li>
																					<li>Spinner.php</li>
																					<li>Slider.php</li>
																					<li>DatePicker.php</li>
																					<li>ColorPicker.php</li>
																				</ul>
																			</li>
																			<li>Exception.php</li>
																		</ul>
																	</li>
																	<li>Form.php</li>
																	<li>Exception.php</li>
																</ul>
															</li>

															<li>Db
																<ul>
																	<li>Adapter
																		<ul>
																			<li>Firebird
																				<ul>
																					<li>Exception.php</li>
																				</ul>
																			</li>
																			<li>Firebird.php</li>
																		</ul>
																	</li>
																	<li>Statement
																		<ul>
																			<li>Firebird
																				<ul>
																					<li>Exception.php</li>
																				</ul>
																			</li>
																			<li>Firebird.php</li>
																		</ul>
																	</li>
																</ul>
															</li>
															<li>Form
																<ul>
																	<li>Decorator
																		<ul>
																			<li>AccordionContainer.php</li>
																			<li>UiWidgetPane.php</li>
																			<li>UiWidgetElementMarker.php</li>
																			<li>UiWidgetElement.php</li>
																			<li>UiWidgetContainer.php</li>
																			<li>TabPane.php</li>
																			<li>TabContainer.php</li>
																			<li>DialogContainer.php</li>
																			<li>AccordionPane.php</li>
																		</ul>
																	</li>
																	<li>Element
																		<ul>
																			<li>AutoComplete.php</li>
																			<li>UiWidget.php</li>
																			<li>Spinner.php</li>
																			<li>Slider.php</li>
																			<li>DatePicker.php</li>
																			<li>ColorPicker.php</li>
																		</ul>
																	</li>
																	<li>Exception.php</li>
																</ul>
															</li>
															<li>Helper
																<ul>
																	<li>JQuery
																		<ul>
																			<li>Container.php</li>
																		</ul>
																	</li>
																	<li>UiWidgetPane.php</li>
																	<li>UiWidget.php</li>
																	<li>TabPane.php</li>
																	<li>TabContainer.php</li>
																	<li>Spinner.php</li>
																	<li>Slider.php</li>
																	<li>JQuery.php</li>
																	<li>AutoComplete.php</li>
																	<li>DialogContainer.php</li>
																	<li>DatePicker.php</li>
																	<li>ColorPicker.php</li>
																	<li>AccordionPane.php</li>
																	<li>AjaxLink.php</li>
																	<li>AccordionContainer.php</li>
																</ul>
															</li>
														</ul>
													</div>
												</div></td>
											<td></td>
										</tr>
									</table>
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

	<script src="js/jquery-ui/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>

	<script type="text/javascript" src="js/abixTreeList.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#tree').abixTreeList();
		});
	</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>