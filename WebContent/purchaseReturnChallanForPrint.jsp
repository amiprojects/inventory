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
	height: 29.0cm;
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
<%-- <c:if test="${param.print==1}">
	<script type="text/javascript">
		var myWindow = window
				.open(
						"barcodePrint.jsp?id=${param.id}&ip=${sessionScope['sip']}&port=${sessionScope['port']}",
						'name', 'width=600,height=400');
		myWindow.print();
	</script>
</c:if> --%>
</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set value="${sessionScope['ejb'].getPurchaseReturnById(param.id)}"
		var="purEntry" />
	<c:set value="${purEntry.purchaseReturnProductDetails.size()}"
		var="proLength" />
	<c:set value="${Math.ceil(proLength/8)}" var="qPage" />

	<c:set value="${1}" var="sl" />
	<c:set value="${0}" var="tqty" />
	<c:set value="${0}" var="gtot" />
	<c:forEach var="i" begin="1" end="${qPage}">
		<page id="print1" size="A4">
		<h3 align="center">
			Purchase Return Challan
			<c:if test="${i>1}">(Page ${i})</c:if>
		</h3>
		<table class="tg"
			style="border: 1px solid; height: 1080px; width: 750px">
			<c:choose>
				<c:when test="${companyInfo.isPurchaseAgentShow()}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2" style="width: 50%">
							<strong>${companyInfo.compname}</strong><br>
							${companyInfo.addr}<br> Email: ${companyInfo.email}<br>
							Mobile: ${companyInfo.mobile}
						</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Purchase
							Return Challan no: <br>${purEntry.challanNumber}</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Refference
							Challan No.: <br>${purEntry.referencePurchaseChallan}
						</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Vendor bill No:</td>
						<td class="tg-031e" colspan="2">${purEntry.purchaseEntry.vendor_bill_no}</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="3"><strong>
								<c:choose>
									<c:when
										test="${purEntry.purchaseEntry.vendor.vendorType.type=='Vendor'}">Vendor
					Details:</c:when>
									<c:when
										test="${purEntry.purchaseEntry.vendor.vendorType.type=='Purchase Agent'}">Vendor
					Details:</c:when>
									<c:otherwise>Vendor/Agent
					Details:</c:otherwise>
								</c:choose>
						</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
							${purEntry.purchaseEntry.vendor.name} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>City :</span>
							${purEntry.purchaseEntry.vendor.city.cityName} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> ${purEntry.purchaseEntry.vendor.address} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph1 :</span>
							${purEntry.purchaseEntry.vendor.ph1} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph2 :</span>
							${purEntry.purchaseEntry.vendor.ph2}</td>
						<td class="tg-031e" colspan="2">System Date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${sessionScope['ejb'].getCurrentDateTime()}"
								pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Return date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${purEntry.returnDate}" pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Supplier reference (Agent
							name):</td>
						<td class="tg-031e" colspan="2"><c:choose>
								<c:when test="${purEntry.purchaseEntry.agentId!=0}">${sessionScope['ejb'].getVendorById(purEntry.purchaseEntry.agentId).name}</c:when>
								<c:otherwise>NA</c:otherwise>
							</c:choose></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2" style="width: 50%">
							<strong>${companyInfo.compname}</strong><br>
							${companyInfo.addr}<br> Email: ${companyInfo.email}<br>
							Mobile: ${companyInfo.mobile}
						</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Purchase
							Return Challan no: <br>${purEntry.challanNumber}</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Refference
							Challan No.: <br>${purEntry.referencePurchaseChallan}
						</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Vendor bill No:</td>
						<td class="tg-031e" colspan="2">${purEntry.purchaseEntry.vendor_bill_no}</td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2"><strong>
								<c:choose>
									<c:when
										test="${purEntry.purchaseEntry.vendor.vendorType.type=='Vendor'}">Vendor
					Details:</c:when>
									<c:when
										test="${purEntry.purchaseEntry.vendor.vendorType.type=='Purchase Agent'}">Vendor
					Details:</c:when>
									<c:otherwise>Vendor/Agent
					Details:</c:otherwise>
								</c:choose>
						</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
							${purEntry.purchaseEntry.vendor.name} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>City :</span>
							${purEntry.purchaseEntry.vendor.city.cityName} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> ${purEntry.purchaseEntry.vendor.address} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph1 :</span>
							${purEntry.purchaseEntry.vendor.ph1} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph2 :</span>
							${purEntry.purchaseEntry.vendor.ph2}</td>
						<td class="tg-031e" colspan="2">System Date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${sessionScope['ejb'].getCurrentDateTime()}"
								pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Return date:</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${purEntry.returnDate}" pattern="dd-MM-yyyy" /></td>
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
							items="${purEntry.purchaseReturnProductDetails}" var="ppdet">
							<tr>
								<td style="border-bottom: none; border-top: none;">${sl}</td>
								<td style="border-bottom: none; border-top: none;"><b
									style="font-size: 12px;">${ppdet.purchaseProductDetails.productDetail.description}</b><br>
									<span style="font-size: 10px;">Barcode :
										${ppdet.purchaseProductDetails.id}<br>Design No :
										${ppdet.purchaseProductDetails.productDetail.universalCode}
								</span></td>
								<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
										var="qty" value="${ppdet.qtyReturn}" maxFractionDigits="3"
										groupingUsed="false" />${qty}</td>
								<c:set value="${tqty+ppdet.qtyReturn}" var="tqty" />
								<td style="border-bottom: none; border-top: none;">${ppdet.purchaseProductDetails.cost}</td>
								<td style="border-bottom: none; border-top: none;">${ppdet.purchaseProductDetails.productDetail.qtyUnit.name}</td>
								<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
										var="amount"
										value="${ppdet.purchaseProductDetails.cost*ppdet.qtyReturn}"
										maxFractionDigits="2" groupingUsed="false" /> ${amount}</td>
								<c:set
									value="${gtot+ppdet.purchaseProductDetails.cost*ppdet.qtyReturn}"
									var="gtot" />
							</tr>
							<c:set value="${sl+1}" var="sl" />
						</c:forEach>
						<c:if test="${i!=qPage}">
							<tr style="height: 0px;">
								<td colspan="6" style="border-bottom: none;"></td>
							</tr>
						</c:if>
						<c:if test="${i==qPage}">
							<%-- <c:if test="${purEntry.purchaseEntry.discountTotal!=0}"> --%>
							<tr>
								<td style="border-bottom: none;" colspan="5" align="right">Discount
									<c:set var="dis"
										value="${purEntry.purchaseEntry.isFlatDiscount()?'Flat':'%'}" />
									(${purEntry.purchaseEntry.discountValue}(${dis})) :
								</td>
								<td style="border-bottom: none;"><fmt:formatNumber
										var="disTot"
										value="${gtot*purEntry.purchaseEntry.discountTotal/purEntry.purchaseEntry.subTotal}"
										maxFractionDigits="2" groupingUsed="false" /> ${disTot}</td>
							</tr>
							<%-- </c:if> --%>
							<c:if test="${purEntry.purchaseEntry.taxAmount!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Tax Amount
										(${purEntry.purchaseEntry.tax_Type_Group.getTotalTaxValue()}%)
										:</td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
											var="taxAmnt"
											value="${gtot*purEntry.purchaseEntry.taxAmount/purEntry.purchaseEntry.subTotal}"
											maxFractionDigits="2" groupingUsed="false" /> ${taxAmnt}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.roundOff!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">RoundOf :</td>
									<td style="border-bottom: none; border-top: none;">${purEntry.roundOff}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right">Total Quantity :</td>
								<td><fmt:formatNumber var="totalQ" value="${tqty}"
										maxFractionDigits="3" groupingUsed="false" />${totalQ}</td>
								<td colspan="2" align="right">Grand Total :</td>
								<td><fmt:formatNumber var="grandT"
										value="${purEntry.totalReCost}" maxFractionDigits="2"
										groupingUsed="false" />${grandT}</td>
							</tr>
						</c:if>
					</table> <span style="float: right;"><c:if test="${i<qPage}">continued...</c:if></span>
				</td>
			</tr>
			<c:if test="${i==qPage}">
				<tr style="height: 10px;">
					<td class="tg-031e" colspan="7"><span><strong>Amount
								Chargeable (in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(purEntry.totalReCost)}
							only.</span></td>
				</tr>
				<tr style="height: 10px;">
					<td class="tg-031e" colspan="5"><strong>Declaration:</strong><br>We
						declare that this invoice shows the actual price of the goods
						described and all particulars are true and correct.</td>
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