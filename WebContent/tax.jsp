<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="editTax" method="post">
		<c:set var="tax" value="${sessionScope['ejb'].getTaxById(param.id)}" />
		<input type="text" name="name" value="${tax.name}"> <input
			type="number" name="value" value="${tax.value}"> <input
			type="submit" value="Update">
	</form>
</body>
</html>