<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Backup Restore</title>
</head>
<body>
	<form action="restore" method="post" enctype="multipart/form-data">
		<input type="submit" name="submit" value="Restore">
	</form>
	<form action="backup" method="post">
		<input type="submit" name="submit" value="Backup">
	</form>
	<h1>${requestScope['msg']}</h1>
	<h3>${requestScope['msgdet']}</h3>
</body>
</html>