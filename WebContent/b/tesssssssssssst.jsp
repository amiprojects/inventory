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
<link rel="stylesheet" href="css/scroll.css" type="text/css" />
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
	<div class="main" style="height: 664px;">
		<%@include file="includeHeader.html"%>
		<div class="page-container menu-left" style="height: 100%;">
			<%@include file="includeSidebar.html"%>
			<div class="content-sec"
				style="height: 100%; overflow-y: scroll; overflow-x: hidden;">
				<div class="container">
					<div class="row">
						<div class="masonary-grids">
							<div class="col-md-12">
								<div class="breadcrumbs" style="height: 39px">
									<ul>                                            
										<li><p
												style="right: -422px; font-size: 20px; position: absolute;">
												<b>Upload Product Image</b>
											</p></li>
									</ul>
								</div>
								<div class="widget-area">
									
								<table class="scroll">
    <thead>
        <tr>
            <th >Hiiuiyui 1</th>
            <th >Head 2</th>
            <th >Head 3</th>
            <th >Head 4</th>
            <th >Head 5</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center">Content 1</td>
            <td align="center">Content 2</td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
        <tr>
            <td align="center">Content 1</td>
            <td align="center">Lorem ipsum </td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
         <tr>
            <td align="center">Content 1</td>
            <td align="center">Lorem ipsum dolor sit amet.</td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
         <tr>
            <td align="center">Content 1</td>
            <td align="center">Lorem ipsum dolor sit amet.</td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
         <tr>
            <td align="center">Content 1</td>
            <td align="center">Lorem ipsum dolor sit amet.</td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
         <tr>
            <td align="center">Content 1</td>
            <td align="center">Lorem ipsum dolor sit amet.</td>
            <td align="center">Content 3</td>
            <td align="center">Content 4</td>
            <td align="center">Content 5</td>
        </tr>
       
    </tbody>
</table>
									
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
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
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
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script>// Change the selector if needed
var $table = $('table.scroll'),
    $bodyCells = $table.find('tbody tr:first').children(),
    colWidth;

// Adjust the width of thead cells when window resizes
$(window).resize(function() {
    // Get the tbody columns width array
    colWidth = $bodyCells.map(function() {
        return $(this).width();
    }).get();
    
    // Set the width of thead columns
    $table.find('thead tr').children().each(function(i, v) {
        $(v).width(colWidth[i]);
    });    
}).resize(); // Trigger resize handler</script>
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>