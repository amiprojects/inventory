<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#rcorners3 {
	padding: 9px;
	width: 110px;
	height: 50px;
}
</style>
</head>
<body>
	<c:forEach items="${requestScope['purDet']}" var="purProDet">
		<c:forEach items="${purProDet.serialNumbers}" var="barcode">
			<div id="rcorners3">
				<span style="font-weight: bold; font-size: 9px">Kaanish
					Kouture</span><br> <span style="font-size: 9px">Pcode:${purProDet.productDetail.code}</span><br>
				<span style="font-size: 9px">MRP:${purProDet.mrp}</span><br> <img
					src="http://localhost:8080/barbecue/BarcodeServlet?data=${purProDet.id}/${barcode.lotNo}/${barcode.serialNumber}&drawText=true&width=2&height=30"
					width="110" /><br>
				<center>
					<span style="font-size: 5px">12345</span>
				</center>
				<br>
			</div>
		</c:forEach>
	</c:forEach>

	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			if (window.print()) {
				window.close();
			}

		});
	</script>

</body>
</html>