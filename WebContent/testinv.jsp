<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 20.5cm;
	height: 29cm;
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

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.tg .tg-031e {
	vertical-align: top
}
</style>
</head>
<body>
	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo"/>
		<c:set value="${sessionScope['ejb'].getPurchaseEntryById(param.id)}" var="purEntry"/>
	<page size="A4">
	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
				<strong>${companyInfo.compname}</strong><br> <br> <br>
				${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
				Mobile: ${companyInfo.mobile}
			</td>
			<td class="tg-031e" colspan="2" style="width: 25%">Invoce:</td>
			<td class="tg-031e" colspan="2" style="width: 25%">Dated:</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Delivery Note:</td>
			<td class="tg-031e" colspan="2">Mode/Time of payment</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Supplier reference</td>
			<td class="tg-031e" colspan="2">Other references</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="4">Buyer Cash</td>
			<td class="tg-031e" colspan="2">Buyer's Oder No:</td>
			<td class="tg-031e" colspan="2">Date:</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Despatch Document No.</td>
			<td class="tg-031e" colspan="2">Dated.</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Despatch through</td>
			<td class="tg-031e" colspan="2">Destination</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="4">Terms of Delivery</td>
		</tr>
		<tr>
			<td class="tg-031e" colspan="7">
				<table style="height: auto; width: 730px; border-color: white;">
					<tr>
						<th>Sl No</th>
						<th>Description of goods</th>
						<th>Quantity</th>
						<th>Rate</th>
						<th>Per</th>
						<th>Amount</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="height: 75px">
			<td class="tg-031e" colspan="7"><span>Amount Chargeable (in words)</span><br><span>${sessionScope['ejb'].getNumberToWords('521421')}</span></td>
		</tr>
		<tr style="height: 75px">
			<td class="tg-031e" colspan="4"><strong>Declaration:</strong><br>We
				declare that this invoice shows the actual price of the goods
				describe and that all particular are true and correct.</td>
			<td class="tg-031e" colspan="3" style="text-align: right;">for <strong>${companyInfo.compname}</strong><br>
				<br>Authorised Signatory
			</td>
		</tr>
	</table>
	<center>This is a Computer Generated Invoice</center>
	</page>
</body>
</html>