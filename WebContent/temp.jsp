<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">
<link rel="stylesheet" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" href="css/dataTables.searchHighlight.css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />

<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<link rel="stylesheet" href="js/dist/sweetalert2.css" type="text/css" />
</head>
<body>
	<table id="example" cellspacing="0" width="100%" class="display">
		<thead>
			<tr>
				<th>#</th>
				<th>Product code:</th>
				<th>Product Description:</th>
				<th>UOM</th>
				<th>Quantity</th>
				<th>WSP</th>
				<th>MRP</th>
				<th onclick="viewF();">view</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>#</th>
				<th>Product code:</th>
				<th>Product Description:</th>
				<th>UOM</th>
				<th>Quantity</th>
				<th>WSP</th>
				<th>MRP</th>
				<th onclick="viewF();">view</th>
			</tr>
			<tr>
				<th>#</th>
				<th>Product code:</th>
				<th>Product Description:</th>
				<th>UOM</th>
				<th>Quantity</th>
				<th>WSP</th>
				<th>MRP</th>
				<th onclick="viewF();">view</th>
			</tr>
			<tr>
				<th>#</th>
				<th>Product code:</th>
				<th>Product Description:</th>
				<th>UOM</th>
				<th>Quantity</th>
				<th>WSP</th>
				<th>MRP</th>
				<th onclick="viewF();">view</th>
			</tr>
		</tbody>
	</table>
	<!-- Script -->

	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.fixedHeader.min.js"></script>
	<script src="js/buttons.flash.min.js"></script>
	<script src="js/buttons.html5.min.js"></script>
	<script src="js/buttons.print.min.js"></script>
	<script src="js/dataTables.buttons.min.js"></script>
	<script src="js/jszip.min.js"></script>
	<script src="js/vfs_fonts.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/dataTables.searchHighlight.min.js"></script>
	<script src="js/pdfmake.min.js"></script>
	<script src="js/jquery.highlight.js"></script>
	<script type="text/javascript" src="js/dist/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#example').DataTable({
				"scrollY" : 200,
				"scrollX" : true,
				dom : 'Bfrtip',
				buttons : [ 'copy', 'excel', 'print' ]
			});

			table.on('draw', function() {
				var body = $(table.table().body());

				body.unhighlight();
				body.highlight(table.search());
			});
		});

		function viewF() {
			//sweetAlert('Oops...', 'Hi' , 'error');
			//sweetAlert('Hi');
			//swal('Update', 'Data successfully saved!', 'success');
		}
	</script>


	//class and no print excel or anything
	<!-- <link rel="stylesheet" href="css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="css/fixedHeader.dataTables.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />

	<table id="" class="table table-bordered display" cellspacing="0"
		width="100%"></table>


	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.fixedHeader.min.js"></script>
	<script>
		$(document).ready(function() {
			$('table.display').DataTable();
		});
	</script> -->
</body>

<!-- Mirrored from forest.themenum.com/azan/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 28 Jul 2015 06:40:29 GMT -->
</html>