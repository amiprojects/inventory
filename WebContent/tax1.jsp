<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="editTaxGroup" method="post">
	<c:set var="tg" value="${sessionScope['ejb'].getTax_Type_GroupById(param.id)}"/>
	<input type="hidden" value="${tg.name}" name="id">
			<input type="text" value="${tg.name}" name="name">
		<c:forEach
			items="${sessionScope['ejb'].getAllTaxByTaxTypeGroupId(param.id)}"
			var="tax">
			
			<c:choose>
				<c:when test="${tax.isAvailable()}">
					<input checked="checked" type="checkbox" value="${tax.name}"
						name="tax">${tax.name}
	</c:when>
				<c:otherwise>
					<input type="checkbox" value="${tax.name}" name="tax">${tax.name}
	</c:otherwise>
			</c:choose>
		</c:forEach>
		<input type="submit" value="update">
	</form>
</body>
</html>