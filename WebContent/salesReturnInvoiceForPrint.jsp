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
	width: 21.0cm;
	height: 29.7cm;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.0cm;
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
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Sales Entry')}">
				<c:set var="i" value="5" />
			</c:if>
		</c:forEach>
		<c:if test="${i!=5}">
			<script type="text/javascript">
				alert('you have no permission to view this page');
				window.location = "dashboard.jsp";
			</script>
		</c:if>
	</c:if>
	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set
		value="${sessionScope['ejb'].getSalesReturnDetailsById(param.id)}"
		var="salesReturn" />
	<page id="print1" size="A4">
	<h3 align="center">Sales Return Invoice</h3>
	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
				<strong>${companyInfo.compname}</strong><br> <br> <br>
				${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
				Mobile: ${companyInfo.mobile}
			</td>
			<td class="tg-031e" colspan="2" style="width: 25%">Sales Return
				Invoice no:<br> ${salesReturn.challanNumber}
			</td>
			<td class="tg-031e" colspan="2" style="width: 25%">Dated:<fmt:formatDate
					value="${sessionScope['ejb'].getCurrentDateTime()}"
					pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Reference Invoice No.</td>
			<td class="tg-031e" colspan="2">${salesReturn.referenceSalesChallan}</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Sales Return date :</td>
			<td class="tg-031e" colspan="2"><fmt:formatDate
					value="${salesReturn.returnDate}" pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="4"><strong>Customer
					Details:</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
				${salesReturn.salesEntry.customer.name} <br>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>City :</span>
				${salesReturn.salesEntry.customer.city} <br>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span> ${salesReturn.salesEntry.customer.address} <br>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph :</span>
				${salesReturn.salesEntry.customer.mobile}</td>
			<td class="tg-031e" colspan="2">Mode of payment :</td>
			<td class="tg-031e" colspan="2"><c:choose>
					<c:when
						test="${salesReturn.paymentDetails.get(0).paymentType.type!=null}">${salesReturn.paymentDetails.get(0).paymentType.type}</c:when>
					<c:otherwise>NA</c:otherwise>
				</c:choose></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Supplier reference(Agent Alias
				name):</td>
			<td class="tg-031e" colspan="2"><c:choose>
					<c:when test="${salesReturn.salesEntry.vendor!=null}">${salesReturn.salesEntry.vendor.aliseName}</c:when>
					<c:otherwise>NA</c:otherwise>
				</c:choose></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2"></td>
			<td class="tg-031e" colspan="2"></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="4"></td>
		</tr>
		<tr>
			<td class="tg-031e" colspan="7">
				<table class="tg"
					style="height: auto; width: 750px; border-color: white; margin-left: -6px; margin-right: -4px; margin-top: -11px;">
					<tr>
						<th>Sl No</th>
						<th>Description of returning goods</th>
						<th>Returning Quantity</th>
						<th>Cost</th>
						<th>Per</th>
						<th>Amount</th>
					</tr>

					<c:set value="${1}" var="sl" />
					<c:set value="${0}" var="tqty" />
					<c:set value="${0}" var="gtot" />

					<c:forEach items="${salesReturn.salesProductReturnDetail}"
						var="ppdet">

						<tr>
							<td>${sl}</td>
							<td>${ppdet.salesProductDetails.purchase_Product_Details.productDetail.description}</td>
							<td>${ppdet.qtyReturn}</td>
							<c:set value="${tqty+ppdet.qtyReturn}" var="tqty" />
							<td>${ppdet.salesProductDetails.getSalesPrice()}</td>
							<td>${ppdet.salesProductDetails.purchase_Product_Details.productDetail.qtyUnit.name}</td>
							<td>${ppdet.salesProductDetails.getSalesPrice()*ppdet.qtyReturn}</td>
							<c:set
								value="${gtot+ppdet.salesProductDetails.getSalesPrice()*ppdet.qtyReturn}"
								var="gtot" />
						</tr>
						<c:set value="${sl+1}" var="sl" />
					</c:forEach>
					<%-- <tr>
						<td colspan="2">Total</td>
						<td>${tqty}</td>
						<td>${gtot}</td>
					</tr> --%>
					<tr>
						<td colspan="5" align="right">Discount Value <c:set var="dis"
								value="${salesReturn.salesEntry.isFlatDiscount()?'Flat':'%'}" />
							(${salesReturn.salesEntry.discountValue}(${dis})) :
						</td>
						<td><c:set var="disVal"
								value="${salesReturn.salesEntry.isFlatDiscount()?gtot*salesReturn.salesEntry.discountValue/salesReturn.salesEntry.subTotal:gtot*salesReturn.salesEntry.discountValue/100}" />
							${disVal}</td>
					</tr>
					<tr>
						<td colspan="5" align="right">Tax Amount
							(${salesReturn.salesEntry.tax_Type_Group.getTotalTaxValue()}%) :</td>
						<td>${gtot*salesReturn.salesEntry.tax_Type_Group.getTotalTaxValue()/100}</td>
					</tr>
					<tr>
						<td colspan="5" align="right">RoundOf :</td>
						<td>${salesReturn.roundOff}</td>
					</tr>
					<tr>
						<td colspan="2" align="right">Total Quantity :</td>
						<td>${tqty}</td>
						<td colspan="2" align="right">Grand Total :</td>
						<td>${salesReturn.totalReCost}<%-- ${gtot} --%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:if test="${salesReturn.salesEntry.salesReturn.size()!=0}">
			<tr>
				<td colspan="6" align="left">Previous Return Details :</td>
			</tr>
			<tr>
				<th>#</th>
				<th>Return Date</th>
				<th>Purchase Return challan no.</th>
				<th>Product Code</th>
				<th>Product Description</th>
				<th>Returning Qty</th>
			</tr>
			<c:set value="${1}" var="slno" />
			<c:forEach items="${salesReturn.salesEntry.salesReturn}" var="pret">
				<tr>
					<td>${slno}</td>
					<td><fmt:formatDate value="${pret.returnDate}"
							pattern="dd-MM-yy" /> <%-- ${pret.returnDate} --%></td>
					<td>${pret.challanNumber}</td>
					<td><c:forEach var="purchaseReturnProd"
							items="${pret.salesProductReturnDetail}">
						${purchaseReturnProd.salesProductDetails.purchase_Product_Details.productDetail.code}
						<br>
						</c:forEach></td>
					<td><c:forEach var="purchaseReturnProd"
							items="${pret.salesProductReturnDetail}">
						${purchaseReturnProd.salesProductDetails.purchase_Product_Details.productDetail.description}
						<br>
						</c:forEach></td>
					<td><c:forEach var="purchaseReturnProd"
							items="${pret.salesProductReturnDetail}">
						${purchaseReturnProd.qtyReturn}
						<br>
						</c:forEach></td>
				</tr>
				<c:set value="${slno+1}" var="slno" />
			</c:forEach>
		</c:if>
		<tr style="height: 75px">
			<td class="tg-031e" colspan="7"><span>Amount Chargeable
					(in words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(gtot)}</span></td>
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