<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="testServManage" method="post">
		<input type="text" placeholder="Job Name" name="name"> <input
			type="text" placeholder="Job Desc" name="desc"><br> <input
			type="radio" name="yn" value="yes" checked="checked">Yes<input
			type="radio" name="yn" value="no">No <input type="text"
			placeholder="Item Name" name="iName"> <input type="submit"
			value="Submit">
	</form>
	<h1>${requestScope['msg']}</h1>
</body>
</html>