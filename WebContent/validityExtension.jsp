<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Validity Extension</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body>
	<input id="btn" type="button" value="extend">
	<h2>${requestScope['msg']}</h2>
</body>
<script type="text/javascript">
	$("#btn")
			.click(
					function() {
						$
								.ajax({
									url : "http://aminfotrix.com/aminfotrix/inventory/kaanishkouture/kaanishValidityExtension/validityExten_kaanish.php",
									type : "post",
									dataType : "json",
									success : function(data) {
										$.ajax({
											url : "validity",
											type : "post",
											dataType : "json",
											data : {
												key : data.key,
												validity : data.validityMonth
											},
											success : function(data1) {
												alert(data1.msg);
											}
										});
									}
								});
					});
</script>
</html>