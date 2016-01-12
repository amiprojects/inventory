<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="js/jquery.jkey.js"></script>
<script>
	$(document).jkey('ctrl+r', function() {
	});
	$(document).jkey('ctrl+shift+r', function() {
	});
	$(document).jkey('f5', function() {
	});
	$(document).jkey('ctrl+c', function() {
	});
	$(document).jkey('ctrl+v', function() {
	});
	$(document).jkey('ctrl+x', function() {
	});
	$(document).jkey('f12', function() {
	});
	$(document).jkey('f5', function() {
	});
	$(document).jkey('ctrl+shift+i', function() {
	});

	$(document).ready(function() {
		function disableBack() {
			window.history.forward()
		}

		window.onload = disableBack();
		window.onpageshow = function(evt) {
			if (evt.persisted)
				disableBack()
		}
	});

	document.onmousedown = disableclick;

	function disableclick(event) {
		if (event.button == 2) {
			alert("right click not allowed for this page.");
			return false;
		}
	}
</script>
</head>
<body>

</body>
</html>
