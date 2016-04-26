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
	<c:set value="${Math.ceil(proLength/6)}" var="qPage" />

	<c:set value="${1}" var="sl" />
	<c:forEach var="i" begin="1" end="${qPage}">
		<page id="print1" size="A4">
		<h3 align="center">
			Purchase Return Challan
			<c:if test="${i>1}">(Page ${i})</c:if>
		</h3>
		<table class="tg"
			style="border: 1px solid; height: 1050px; width: 750px">
			<tr style="height: 50px">
				<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
					<strong>${companyInfo.compname}</strong><br> <br> <br>
					${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
					Mobile: ${companyInfo.mobile}
				</td>
				<td class="tg-031e" colspan="2" style="width: 25%">Purchase
					Return Challan no: <br>${purEntry.challanNumber}</td>
				<td class="tg-031e" colspan="2" style="width: 25%">Dated: <fmt:formatDate
						value="${sessionScope['ejb'].getCurrentDateTime()}"
						pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 50px">
				<td class="tg-031e" colspan="2">Refference Challan No.:</td>
				<td class="tg-031e" colspan="2">${purEntry.referencePurchaseChallan}</td>
			</tr>
			<tr style="height: 50px">
				<%-- <td class="tg-031e" colspan="2">Dated:</td>
			<td class="tg-031e" colspan="2"><fmt:formatDate
					value="${sessionScope['ejb'].getCurrentDateTime()}"
					pattern="dd-MM-yyyy" /></td> --%>


				<td class="tg-031e" colspan="2">Return date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${purEntry.returnDate}" pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 50px">
				<td class="tg-031e" colspan="3" rowspan="4"><strong> <c:choose>
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
				<td class="tg-031e" colspan="2">Vendor bill No:</td>
				<td class="tg-031e" colspan="2">${purEntry.purchaseEntry.vendor_bill_no}</td>
			</tr>
			<tr style="height: 50px">
				<td class="tg-031e" colspan="2">Mode of payment :</td>
				<td class="tg-031e" colspan="2"><c:choose>
						<c:when
							test="${purEntry.paymentDetails.get(0).paymentType.type!=null}">${purEntry.paymentDetails.get(0).paymentType.type}</c:when>
						<c:otherwise>NA</c:otherwise>
					</c:choose></td>
			</tr>
			<tr style="height: 50px">
				<td class="tg-031e" colspan="2">Supplier reference(Agent Alias
					name):</td>
				<td class="tg-031e" colspan="2">${purEntry.purchaseEntry.vendor.aliseName}</td>
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
							<th>Description of goods</th>
							<th>Quantity</th>
							<th>Cost</th>
							<th>Per</th>
							<th>Amount</th>
						</tr>
						<c:set value="${0}" var="tqty" />
						<c:set value="${0}" var="gtot" />
						<c:forEach begin="${(i-1)*6}" end="${i*6-1}"
							items="${purEntry.purchaseReturnProductDetails}" var="ppdet">
							<tr>
								<td>${sl}</td>
								<td>
									<%-- ${ppdet.purchaseProductDetails.productDetail.description} --%>

									<b>${ppdet.purchaseProductDetails.productDetail.description}</b><br>Barcode
									:
									${ppdet.purchaseProductDetails.id}/${ppdet.purchaseProductDetails.lotNumber}/${ppdet.purchaseProductDetails.productDetail.code}<br>Design
									No :
									${ppdet.purchaseProductDetails.productDetail.universalCode}
								</td>
								<td><fmt:formatNumber var="qty" value="${ppdet.qtyReturn}"
										maxFractionDigits="3" />${qty}</td>
								<c:set value="${tqty+ppdet.qtyReturn}" var="tqty" />
								<td>${ppdet.purchaseProductDetails.cost}</td>
								<td>${ppdet.purchaseProductDetails.productDetail.qtyUnit.name}</td>
								<td><fmt:formatNumber var="amount"
										value="${ppdet.purchaseProductDetails.cost*ppdet.qtyReturn}"
										maxFractionDigits="2" /> ${amount}</td>
								<c:set
									value="${ppdet.purchaseProductDetails.cost*ppdet.qtyReturn}"
									var="gtot" />
							</tr>
							<c:set value="${sl+1}" var="sl" />
						</c:forEach>
						<c:if test="${i==qPage}">
							<c:if test="${purEntry.purchaseEntry.discountTotal!=0}">
								<tr>
									<td colspan="5" align="right">Discount <c:set var="dis"
											value="${purEntry.purchaseEntry.isFlatDiscount()?'Flat':'%'}" />
										(${purEntry.purchaseEntry.discountValue}(${dis})) :
									</td>
									<td><c:set var="disTot"
											value="${gtot*purEntry.purchaseEntry.discountTotal/purEntry.purchaseEntry.subTotal}" />
										${disTot}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.purchaseEntry.taxAmount!=0}">
								<tr>
									<td colspan="5" align="right">Tax Amount
										(${purEntry.purchaseEntry.tax_Type_Group.getTotalTaxValue()}%)
										:</td>
									<td>
										${gtot*purEntry.purchaseEntry.taxAmount/purEntry.purchaseEntry.subTotal}
									</td>
								</tr>
							</c:if>
							<c:if
								test="${purEntry.purchaseEntry.agentProfitTotal!=0 && purEntry.purchaseEntry.isEfectiveProfit()==true}">
								<tr>
									<td colspan="5" align="right">Agent Profit <c:set
											var="prof"
											value="${purEntry.purchaseEntry.isFlatProfitAgent()?'Flat':'%'}" />
										(${purEntry.purchaseEntry.agentProfitValue}(${prof})) :
									</td>
									<td><fmt:formatNumber var="profTot"
											value="${gtot*purEntry.purchaseEntry.agentProfitTotal/purEntry.purchaseEntry.subTotal}"
											maxFractionDigits="2" /> ${profTot}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.roundOff!=0}">
								<tr>
									<td colspan="5" align="right">RoundOf :</td>
									<td>${purEntry.roundOff}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right">Total Quantity :</td>
								<td><fmt:formatNumber var="totalQ" value="${tqty}"
										maxFractionDigits="3" />${totalQ}</td>
								<td colspan="2" align="right">Grand Total :</td>
								<td><fmt:formatNumber var="grandT"
										value="${purEntry.totalReCost}" maxFractionDigits="2" />${grandT}
								</td>
							</tr>
						</c:if>
					</table> <span style="float: right;"><c:if test="${i<qPage}">continued...</c:if></span>
				</td>
			</tr>
			<c:if test="${i==qPage}">
				<tr style="height: 75px">
					<td class="tg-031e" colspan="7"><span>Amount Chargeable
							(in words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(purEntry.totalReCost)}</span></td>
				</tr>
				<tr style="height: 75px">
					<td class="tg-031e" colspan="4"><strong>Declaration:</strong><br>We
						declare that this invoice shows the actual price of the goods
						describe and that all particular are true and correct.</td>
					<td class="tg-031e" colspan="3" style="text-align: right;">for
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