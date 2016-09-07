<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
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
		/* margin: 0;
		box-shadow: 0; */
		display: block;
		margin-top: -20px;
		margin-left: 20px;
		margin-right: 0px;
		/* padding-left: 1.0cm;
		padding-right: 1.0cm; */
		page-break-after: always;
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

table {
	table-layout: fixed;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>

	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set value="${sessionScope['ejb'].getSalesEntryById(param.id)}"
		var="purEntry" />


	<c:set
		value="${sessionScope['ejb'].getSoldOnlySalesProductDetailsBySalesEntryId(purEntry.id).size()}"
		var="proLength" />
	<c:set value="${Math.ceil(proLength/8)}" var="qPage" />

	<c:set value="${1}" var="sl" />
	<c:set value="${0}" var="tqty" />
	<c:set value="${0}" var="gtot" />
	<c:forEach var="i" begin="1" end="${qPage}">
		<page id="print1" size="A4">
		<h3 align="center">
			Sales Invoice
			<c:if test="${i>1}">(Page ${i})</c:if>
		</h3>
		<table class="tg"
			style="border: 1px solid; height: 1080px; width: 750px">
			<c:choose>
				<c:when test="${companyInfo.isSalesAgentShow()}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2" style="width: 50%">
							<strong>${companyInfo.compname}</strong> ${companyInfo.addr}<br>
							Email: ${companyInfo.email}<br> Mobile:
							${companyInfo.mobile}
						</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Sales
							Invoice no:</td>
						<td class="tg-031e" colspan="2" style="width: 25%">${purEntry.challanNumber}</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">System Date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${sessionScope['ejb'].getCurrentDateTime()}"
								pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2"><strong>Customer
								Details:</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
							${purEntry.customer.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
								:</span> ${purEntry.customer.city} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Address
								:<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> ${purEntry.customer.address} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph
								:</span> ${purEntry.customer.mobile}</td>
						<td class="tg-031e" colspan="2">Sales date :</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${purEntry.sales_date}" pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Supplier reference (Agent
							name):</td>
						<td class="tg-031e" colspan="2"><c:choose>
								<c:when test="${purEntry.vendor!=null}">${purEntry.vendor.name}</c:when>
								<c:otherwise>NA</c:otherwise>
							</c:choose></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" style="width: 50%"><strong>${companyInfo.compname}</strong>
							${companyInfo.addr}<br> Email: ${companyInfo.email}<br>
							Mobile: ${companyInfo.mobile}</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Sales
							Invoice no:</td>
						<td class="tg-031e" colspan="2" style="width: 25%">${purEntry.challanNumber}</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2"><strong>Customer
								Details:</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
							${purEntry.customer.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
								:</span> ${purEntry.customer.city} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Address
								:<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> ${purEntry.customer.address} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph
								:</span> ${purEntry.customer.mobile}</td>
						<td class="tg-031e" colspan="2">System Date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${sessionScope['ejb'].getCurrentDateTime()}"
								pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Sales date :</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${purEntry.sales_date}" pattern="dd-MM-yyyy" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td class="tg-031e" colspan="7">
					<table class="tg"
						style="height: auto; width: 750px; border-color: white; margin-left: -6px; margin-right: -4px; margin-top: -11px;">
						<tr>
							<th>Sl No</th>
							<th>Description of goods</th>
							<th>Quantity</th>
							<th>Cost</th>
							<th>Per</th>
							<th>Amount</th>
						</tr>
						<c:forEach begin="${(i-1)*8}" end="${i*8-1}"
							items="${sessionScope['ejb'].getSoldOnlySalesProductDetailsBySalesEntryId(purEntry.id)}"
							var="ppdet">
							<c:if test="${ppdet.quantity-ppdet.salesReQty>0}">
								<tr>
									<td style="border-bottom: none; border-top: none;">${sl}</td>
									<td style="border-bottom: none; border-top: none;"><b
										style="font-size: 12px;">${ppdet.purchase_Product_Details.productDetail.description}</b><br>
										<span style="font-size: 10px;">Barcode :
											${ppdet.purchase_Product_Details.id}<br>Design No :
											${ppdet.purchase_Product_Details.productDetail.universalCode}
									</span></td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
											var="qty" value="${ppdet.quantity-ppdet.salesReQty}"
											maxFractionDigits="3" groupingUsed="false" />${qty}</td>
									<c:set value="${tqty+ppdet.quantity-ppdet.salesReQty}"
										var="tqty" />
									<td style="border-bottom: none; border-top: none;">${ppdet.getSalesPrice()}</td>
									<td style="border-bottom: none; border-top: none;">${ppdet.purchase_Product_Details.productDetail.qtyUnit.name}</td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
											var="amount"
											value="${ppdet.getSalesPrice()*(ppdet.quantity-ppdet.salesReQty)}"
											maxFractionDigits="2" groupingUsed="false" /> ${amount}</td>
									<c:set
										value="${gtot+ppdet.getSalesPrice()*(ppdet.quantity-ppdet.salesReQty)}"
										var="gtot" />
								</tr>
								<c:set value="${sl+1}" var="sl" />
							</c:if>
						</c:forEach>
						<c:if test="${i!=qPage}">
							<tr style="height: 0px;">
								<td colspan="6" style="border-bottom: none;"></td>
							</tr>
						</c:if>
						<c:if test="${i==qPage}">
							<%-- <c:if test="${purEntry.discountValue!=0}"> --%>
							<tr>
								<td style="border-bottom: none;" colspan="5" align="right">Discount
									Value <c:set var="dis"
										value="${purEntry.isFlatDiscount()?'Flat':'%'}" />
									(${purEntry.discountValue}(${dis})) :
								</td>
								<td style="border-bottom: none;"><fmt:formatNumber
										var="disVal"
										value="${purEntry.isFlatDiscount()?gtot*purEntry.discountValue/purEntry.subTotal:gtot*purEntry.discountValue/100}"
										maxFractionDigits="2" groupingUsed="false" />${disVal}</td>
							</tr>
							<%-- </c:if> --%>
							<c:if test="${purEntry.taxAmount!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Tax Amount
										(${purEntry.tax_Type_Group.getTotalTaxValue()}%) :</td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
											var="taxAmount"
											value="${(gtot-disVal)*purEntry.tax_Type_Group.getTotalTaxValue()/100}"
											maxFractionDigits="2" groupingUsed="false" /> ${taxAmount}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.transportcCharge!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Transport Charge :</td>
									<td style="border-bottom: none; border-top: none;">${purEntry.transportcCharge}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.surcharge!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Surcharge :</td>
									<td style="border-bottom: none; border-top: none;">${purEntry.surcharge}</td>
								</tr>
							</c:if>
							<c:set var="total"
								value="${gtot-disVal+taxAmount+purEntry.transportcCharge+purEntry.surcharge}"></c:set>
							<fmt:formatNumber var="roundValue"
								value="${gtot-disVal+taxAmount+purEntry.transportcCharge+purEntry.surcharge}"
								maxFractionDigits="0" groupingUsed="false" />
							<c:if test="${(roundValue-total)!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">RoundOf :</td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
											var="roundOff" value="${roundValue-total}"
											maxFractionDigits="2" groupingUsed="false" /> ${roundOff}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right">Total Quantity :</td>
								<td><fmt:formatNumber var="totalQ" value="${tqty}"
										maxFractionDigits="3" groupingUsed="false" />${totalQ}</td>
								<td colspan="2" align="right">Grand Total :</td>
								<td><fmt:formatNumber var="grandT" value="${roundValue}"
										maxFractionDigits="2" groupingUsed="false" />${grandT}</td>
							</tr>
						</c:if>
					</table> <span style="float: right;"><c:if test="${i<qPage}">continued...</c:if></span>
				</td>
			</tr>
			<c:if test="${i==qPage}">
				<c:if test="${purEntry.description==null}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="7"><span><strong>Amount
									Chargeable (in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(grandT)}
								only.</span></td>
					</tr>
				</c:if>
				<c:if test="${purEntry.description!=null}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3"><strong>Description
								: </strong><br> <span>${purEntry.description}</span></td>
						<td class="tg-031e" colspan="4"><span><strong>Amount
									Chargeable (in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(grandT)}
								only.</span></td>
					</tr>
				</c:if>
				<tr style="height: 10px;">
					<td class="tg-031e" colspan="5"><strong>Declaration:</strong><br>We
						declare that this invoice shows the actual price of the goods
						described and all particulars are true and correct. Payment must
						be cleared within 30 days. Goods once sold can not be taken back
						or exchanged. No Guarantee for colour Jari and Slippage of Fabric.
						Dry clean only.</td>
					<td class="tg-031e" colspan="2" style="text-align: right;">for
						<strong>${companyInfo.compname}</strong><br> <br>Authorised
						Signatory
					</td>
				</tr>
			</c:if>
		</table>
		<center>This is a Computer Generated Invoice</center>
		</page>
	</c:forEach>
</body>
</html>