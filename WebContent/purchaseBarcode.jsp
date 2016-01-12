<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	background: rgb(204, 204, 204);
}

page[size="A4"] {
	background: white;
	width: 3.8cm;
	height: 2cm;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}

@media print {
	body, page[size="A4"] {
		margin: 0;
		box-shadow: 0;
	}
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope['sip']=='0:0:0:0:0:0:0:1'}">
			<c:set value="localhost" var="ip" />
		</c:when>
		<c:otherwise>
			<c:set value="${sessionScope['sip']}" var="ip" />
		</c:otherwise>
	</c:choose>
	<c:set value="${requestScope['purProdDetLst']}" var="purProlst" />
	<c:forEach items="${purProlst}" var="purProDet">
		<c:forEach begin="1" end="${purProDet.numberForBarcodePrint}">
			<page size="A4">
			<center style="padding-top: 12px;">
				<span style="font-weight: bold; font-size: 9px">Kaanish
					Kouture</span><br> <span style="font-size: 9px">Pcode:${purProDet.productDetail.code}</span><br>
				<span style="font-size: 9px">MRP:${purProDet.mrp}</span><br> <img
					src="http://${ip}:${sessionScope['port']}/barbecue/BarcodeServlet?data=${purProDet.id}/${purProDet.lotNumber}/${purProDet.productDetail.code}&drawText=true&width=2&height=30"
					width="110" /><br>
				<center>
					<span style="font-size: 5px">${purProDet.id}/${purProDet.lotNumber}/${purProDet.productDetail.code}</span>
				</center>
			</center>
			<br>
			</page>
		</c:forEach>
	</c:forEach>

	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			window.print();
		});
	</script>
</body>
</html>
