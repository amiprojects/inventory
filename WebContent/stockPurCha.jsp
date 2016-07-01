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
		padding-left: 1.0cm;
		padding-right: 1.0cm;
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
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<c:if test="${param.print==1}">
	<script type="text/javascript">
		var myWindow = window
				.open(
						"barcodePrint.jsp?id=${param.id}&ip=${sessionScope['sip']}&port=${sessionScope['port']}",
						'name', 'width=600,height=400');
		myWindow.print();
	</script>
</c:if>
</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>

	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set value="${sessionScope['ejb'].getPurchaseEntryById(param.id)}"
		var="purEntry" />


	<c:set value="${purEntry.purchase_Product_Details.size()}"
		var="proLength" />
	<c:set value="${Math.ceil(proLength/6)}" var="qPage" />

	<c:set value="${1}" var="sl" />
	<c:set value="${0}" var="tqty" />
	<c:set value="${0}" var="gtot" />
	<c:set value="${0}" var="j" />
	<c:forEach var="i" begin="1" end="${qPage}">
		<page id="print1" size="A4">
		<h3 align="center">
			Purchase Challan
			<c:if test="${i>1}">(Page ${i})</c:if>
		</h3>
		<table class="tg"
			style="border: 1px solid; height: 1050px; width: 750px">
			<tr style="height: 40px">
				<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
					<strong>${companyInfo.compname}</strong><br> <br>
					${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
					Mobile: ${companyInfo.mobile}
				</td>
				<td class="tg-031e" colspan="2" style="width: 25%">Purchase
					Challan no:</td>
				<td class="tg-031e" colspan="2" style="width: 25%">${purEntry.challanNumber}</td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">System Date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${sessionScope['ejb'].getCurrentDateTime()}"
						pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">Purchase date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${purEntry.purchase_date}" pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="3" rowspan="3"><strong> <c:choose>
							<c:when test="${purEntry.vendor.vendorType.type=='Vendor'}">Vendor
					Details:</c:when>
							<c:when
								test="${purEntry.vendor.vendorType.type=='Purchase Agent'}">Vendor
					Details:</c:when>
							<c:otherwise>Vendor/Agent
					Details:</c:otherwise>
						</c:choose>
				</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
					${purEntry.vendor.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
						:</span> ${purEntry.vendor.city.cityName} <br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span> ${purEntry.vendor.address} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph
						:</span> ${purEntry.vendor.ph1}</td>
				<td class="tg-031e" colspan="2">Vendor bill No:</td>
				<td class="tg-031e" colspan="2">${purEntry.vendor_bill_no}</td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">Supplier reference(Agent Alias
					name):</td>
				<td class="tg-031e" colspan="2">${purEntry.vendor.aliseName}</td>
			</tr>
			<tr style="height: 40px">
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
						<c:forEach begin="${(i-1)*6}" end="${i*6-1}"
							items="${purEntry.purchase_Product_Details}" var="ppdet">
							<tr>
								<td>${sl}</td>
								<td><b>${ppdet.productDetail.description}</b><br>Barcode
									: ${ppdet.id}/${ppdet.lotNumber}/${ppdet.productDetail.code}<br>Design
									No : ${ppdet.productDetail.universalCode}</td>
								<td><fmt:formatNumber var="qty" value="${ppdet.quantity}"
										maxFractionDigits="3" groupingUsed="false" />${qty}</td>
								<c:set value="${tqty+ppdet.quantity}" var="tqty" />
								<td>${ppdet.cost}</td>
								<td>${ppdet.productDetail.qtyUnit.name}</td>
								<td><fmt:formatNumber var="amount"
										value="${ppdet.cost*ppdet.quantity}" maxFractionDigits="2"
										groupingUsed="false" /> ${amount}</td>
								<c:set value="${gtot+ppdet.cost*ppdet.quantity}" var="gtot" />
							</tr>
							<c:set value="${sl+1}" var="sl" />
						</c:forEach>
						<c:if test="${i==qPage}">
							<c:if test="${purEntry.discountTotal!=0}">
								<tr>
									<td colspan="5" align="right">Discount <c:set var="dis"
											value="${purEntry.isFlatDiscount()?'Flat':'%'}" />
										(${purEntry.discountValue}(${dis})) :
									</td>
									<td>${purEntry.discountTotal}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.taxAmount!=0}">
								<tr>
									<td colspan="5" align="right">Tax Amount
										(${purEntry.tax_Type_Group.getTotalTaxValue()}%) :</td>
									<td>${purEntry.taxAmount}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.transport_cost!=0}">
								<tr>
									<td colspan="5" align="right">Transport Charge :</td>
									<td>${purEntry.transport_cost}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.sur_charge!=0}">
								<tr>
									<td colspan="5" align="right">Surcharge :</td>
									<td>${purEntry.sur_charge}</td>
								</tr>
							</c:if>
							<c:if test="${purEntry.roundOf!=0}">
								<tr>
									<td colspan="5" align="right">RoundOf :</td>
									<td>${purEntry.roundOf}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right">Total Quantity :</td>
								<td><fmt:formatNumber var="totalQ" value="${tqty}"
										maxFractionDigits="3" groupingUsed="false" />${totalQ}</td>
								<td colspan="2" align="right">Grand Total :</td>
								<td><fmt:formatNumber var="grandT"
										value="${purEntry.totalCost}" maxFractionDigits="2"
										groupingUsed="false" />${grandT}</td>
							</tr>
						</c:if>
					</table> <span style="float: right;"><c:if test="${i<qPage}">continued...</c:if>
						<c:if test="${i==qPage && purEntry.purchaseReturn.size()>0}">continued...</c:if></span>
				</td>
			</tr>
			<c:if test="${i==qPage}">
				<tr style="height: 75px">
					<td class="tg-031e" colspan="7"><span>Amount Chargeable
							(in words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(purEntry.totalCost)}</span></td>
				</tr>
				<c:if test="${purEntry.purchaseReturn.size()==0}">
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
			</c:if>
		</table>
		<center>This is a Computer Generated Invoice</center>
		</page>
		<c:set value="${i+1}" var="j" />
	</c:forEach>
	<c:if test="${purEntry.purchaseReturn.size()!=0}">
		<page id="print1" size="A4">
		<h3 align="center">Purchase Challan (Page ${j})</h3>
		<table class="tg"
			style="border: 1px solid; height: 1050px; width: 750px">
			<tr style="height: 40px">
				<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
					<strong>${companyInfo.compname}</strong><br> <br> <br>
					${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
					Mobile: ${companyInfo.mobile}
				</td>
				<td class="tg-031e" colspan="2" style="width: 25%">Purchase
					Challan no:</td>
				<td class="tg-031e" colspan="2" style="width: 25%">${purEntry.challanNumber}</td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">System Date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${sessionScope['ejb'].getCurrentDateTime()}"
						pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">Purchase date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${purEntry.purchase_date}" pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="3" rowspan="3"><strong> <c:choose>
							<c:when test="${purEntry.vendor.vendorType.type=='Vendor'}">Vendor
					Details:</c:when>
							<c:when
								test="${purEntry.vendor.vendorType.type=='Purchase Agent'}">Vendor
					Details:</c:when>
							<c:otherwise>Vendor/Agent
					Details:</c:otherwise>
						</c:choose>
				</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
					${purEntry.vendor.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
						:</span> ${purEntry.vendor.city.cityName} <br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span> ${purEntry.vendor.address} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph
						:</span> ${purEntry.vendor.ph1}</td>
				<td class="tg-031e" colspan="2">Vendor bill No:</td>
				<td class="tg-031e" colspan="2">${purEntry.vendor_bill_no}</td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="2">Supplier reference(Agent Alias
					name):</td>
				<td class="tg-031e" colspan="2">${purEntry.vendor.aliseName}</td>
			</tr>
			<tr style="height: 40px">
				<td class="tg-031e" colspan="4"></td>
			</tr>
			<tr style="height: 25px">
				<td colspan="7" align="left">Return Details :</td>
			</tr>
			<tr>
				<td class="tg-031e" colspan="7">
					<table class="tg"
						style="height: auto; width: 750px; border-color: white; margin-left: -6px; margin-right: -6px; margin-top: -11px;">
						<tr style="height: 25px">
							<th>#</th>
							<th>Return Date</th>
							<th>Purchase Return challan no.</th>
							<th>Product Code</th>
							<th colspan="2">Product Description</th>
							<th>Returning Qty</th>
						</tr>
						<c:set value="${1}" var="slno" />
						<c:forEach items="${purEntry.purchaseReturn}" var="pret">
							<c:set value="${pret.purchaseReturnProductDetails.size()}"
								var="proRetLength" />
							<tr>
								<td class="tg-031e" rowspan="${proRetLength}">${slno}</td>
								<td class="tg-031e" rowspan="${proRetLength}"><fmt:formatDate
										value="${pret.returnDate}" pattern="dd-MM-yy" /> <%-- ${pret.returnDate} --%></td>
								<td class="tg-031e" rowspan="${proRetLength}">${pret.challanNumber}</td>
								<c:set var="purchaseReturnProd"
									value="${pret.purchaseReturnProductDetails.get(0)}" />
								<td class="tg-031e">
									${purchaseReturnProd.purchaseProductDetails.productDetail.code}
								</td>
								<td class="tg-031e" colspan="2">
									${purchaseReturnProd.purchaseProductDetails.productDetail.description}</td>
								<td class="tg-031e"><fmt:formatNumber var="totalQ"
										value="${purchaseReturnProd.qtyReturn}" maxFractionDigits="3"
										groupingUsed="false" />${totalQ}</td>
							</tr>
							<c:forEach var="purchaseReturnProd" begin="${1}"
								end="${proRetLength}"
								items="${pret.purchaseReturnProductDetails}">
								<tr>
									<td class="tg-031e">
										${purchaseReturnProd.purchaseProductDetails.productDetail.code}
									</td>
									<td class="tg-031e" colspan="2">
										${purchaseReturnProd.purchaseProductDetails.productDetail.description}</td>
									<td class="tg-031e"><fmt:formatNumber var="totalQ"
											value="${purchaseReturnProd.qtyReturn}" maxFractionDigits="3"
											groupingUsed="false" />${totalQ}</td>
								</tr>
							</c:forEach>
							<c:set value="${slno+1}" var="slno" />
						</c:forEach>
					</table>
				</td>
			</tr>
			<%-- <tr style="height: 75px">
				<td class="tg-031e" colspan="7"><span>Amount Chargeable
						(in words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(purEntry.totalCost)}</span></td>
			</tr> --%>
			<tr style="height: 75px">
				<td class="tg-031e" colspan="4"><strong>Declaration:</strong><br>We
					declare that this invoice shows the actual price of the goods
					describe and that all particular are true and correct.</td>
				<td class="tg-031e" colspan="3" style="text-align: right;">for
					<strong>${companyInfo.compname}</strong><br> <br>Authorised
					Signatory
				</td>
			</tr>
		</table>
		<center>This is a Computer Generated Invoice</center>
		</page>
	</c:if>
</body>
</html>