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

</head>
<body>
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set value="${sessionScope['ejb'].getApprovalEntryById(param.id)}"
		var="approvalEntry" />


	<c:set value="${approvalEntry.approvalProductDetails.size()}"
		var="proLength" />
	<c:set value="${Math.ceil(proLength/8)}" var="qPage" />

	<c:set value="${1}" var="sl" />
	<c:set value="${0}" var="tqty" />
	<c:set value="${0}" var="gtot" />
	<c:set value="${0}" var="j" />
	<c:forEach var="i" begin="1" end="${qPage}">
		<page id="print1" size="A4">
		<h3 align="center">
			Approval Bill
			<c:if test="${i>1}">(Page ${i})</c:if>
		</h3>
		<table class="tg"
			style="border: 1px solid; height: 1080px; width: 750px">
			<%-- <c:choose>
				<c:when test="${companyInfo.isSalesAgentShow()}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3" rowspan="2" style="width: 50%">
							<strong>${companyInfo.compname}</strong> ${companyInfo.addr}<br>
							Email: ${companyInfo.email}<br> Mobile:
							${companyInfo.mobile}
						</td>
						<td class="tg-031e" colspan="2" style="width: 25%">Approval
							bill no:</td>
						<td class="tg-031e" colspan="2" style="width: 25%">${approvalEntry.challanNumber}</td>
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
							${approvalEntry.customer.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
								:</span> ${approvalEntry.customer.city} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span> ${approvalEntry.customer.address} <br>
							&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph :</span>
							${approvalEntry.customer.mobile}</td>
						<td class="tg-031e" colspan="2">Sales date :</td>
						<td class="tg-031e" colspan="2"><fmt:formatDate
								value="${approvalEntry.approvalDate}" pattern="dd-MM-yyyy" /></td>
					</tr>
					<tr style="height: 10px">
						<td class="tg-031e" colspan="2">Supplier reference (Agent
							name):</td>
						<td class="tg-031e" colspan="2"><c:choose>
								<c:when test="${approvalEntry.vendor!=null}">${approvalEntry.vendor.name}</c:when>
								<c:otherwise>NA</c:otherwise>
							</c:choose></td>
					</tr>
				</c:when>
				<c:otherwise> --%>
			<tr style="height: 10px">
				<td class="tg-031e" colspan="3" style="width: 50%"><strong>${companyInfo.compname}</strong>
					${companyInfo.addr}<br> Email: ${companyInfo.email}<br>
					Mobile: ${companyInfo.mobile}</td>
				<td class="tg-031e" colspan="2" style="width: 25%">Approval
					Bill no:</td>
				<td class="tg-031e" colspan="2" style="width: 25%">${approvalEntry.challanNumber}</td>
			</tr>
			<tr style="height: 10px">
				<td class="tg-031e" colspan="3" rowspan="2"><strong>Customer
						Details:</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
					${approvalEntry.customer.name} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>City
						:</span> ${approvalEntry.customer.city} <br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span> ${approvalEntry.customer.address} <br>
					&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph :</span>
					${approvalEntry.customer.mobile}</td>
				<td class="tg-031e" colspan="2">System Date:</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${sessionScope['ejb'].getCurrentDateTime()}"
						pattern="dd-MM-yyyy" /></td>
			</tr>
			<tr style="height: 10px">
				<td class="tg-031e" colspan="2">Approval date :</td>
				<td class="tg-031e" colspan="2"><fmt:formatDate
						value="${approvalEntry.approvalDate}" pattern="dd-MM-yyyy" /></td>
			</tr>
			<%-- </c:otherwise>
			</c:choose> --%>
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
							items="${approvalEntry.approvalProductDetails}" var="ppdet">
							<tr>
								<td style="border-bottom: none; border-top: none;">${sl}</td>
								<td style="border-bottom: none; border-top: none;"><b
									style="font-size: 12px;">${ppdet.purchase_Product_Details.productDetail.description}</b><br>
									<span style="font-size: 10px;">Barcode :
										${ppdet.purchase_Product_Details.id}<br>Design No :
										${ppdet.purchase_Product_Details.productDetail.universalCode}
								</span></td>
								<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
										var="qty" value="${ppdet.quantity}" maxFractionDigits="3"
										groupingUsed="false" />${qty}</td>
								<c:set value="${tqty+ppdet.quantity}" var="tqty" />
								<td style="border-bottom: none; border-top: none;">${ppdet.getPrice()}</td>
								<td style="border-bottom: none; border-top: none;">${ppdet.purchase_Product_Details.productDetail.qtyUnit.name}</td>
								<td style="border-bottom: none; border-top: none;"><fmt:formatNumber
										var="amount" value="${ppdet.getPrice()*ppdet.quantity}"
										maxFractionDigits="2" groupingUsed="false" /> ${amount}</td>
								<c:set value="${gtot+ppdet.getPrice()*ppdet.quantity}"
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
							<c:if test="${approvalEntry.discountValue!=0}">
								<tr>
									<td style="border-bottom: none;" colspan="5" align="right">Discount
										Value <c:set var="dis"
											value="${approvalEntry.isFlatDiscount()?'Flat':'%'}" />
										(${approvalEntry.discountValue}(${dis})) :
									</td>
									<td style="border-bottom: none;"><c:set var="disVal"
											value="${approvalEntry.isFlatDiscount()?approvalEntry.discountValue:approvalEntry.subTotal*approvalEntry.discountValue/100}" />
										${disVal}</td>
								</tr>
							</c:if>
							<c:if test="${approvalEntry.taxAmount!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Tax Amount
										(${approvalEntry.tax_Type_Group.getTotalTaxValue()}%) :</td>
									<td style="border-bottom: none; border-top: none;">${approvalEntry.taxAmount}</td>
								</tr>
							</c:if>
							<c:if test="${approvalEntry.transportcCharge!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Transport Charge :</td>
									<td style="border-bottom: none; border-top: none;">${approvalEntry.transportcCharge}</td>
								</tr>
							</c:if>
							<c:if test="${approvalEntry.surcharge!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">Surcharge :</td>
									<td style="border-bottom: none; border-top: none;">${approvalEntry.surcharge}</td>
								</tr>
							</c:if>
							<c:if test="${approvalEntry.roundOf!=0}">
								<tr>
									<td style="border-bottom: none; border-top: none;" colspan="5"
										align="right">RoundOf :</td>
									<td style="border-bottom: none; border-top: none;">${approvalEntry.roundOf}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2" align="right">Total Quantity :</td>
								<td><fmt:formatNumber var="totalQ" value="${tqty}"
										maxFractionDigits="3" groupingUsed="false" />${totalQ}</td>
								<td colspan="2" align="right">Grand Total :</td>
								<td><fmt:formatNumber var="grandT"
										value="${approvalEntry.totalCost}" maxFractionDigits="2"
										groupingUsed="false" />${grandT}</td>
							</tr>
						</c:if>
					</table> <span style="float: right;"><c:if test="${i<qPage}">continued...</c:if>
						<c:if test="${i==qPage && approvalEntry.approvalReturn.size()>0}">continued...</c:if></span>
				</td>
			</tr>
			<c:if test="${i==qPage}">
				<c:if test="${approvalEntry.description==null}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="7"><span><strong>Total
									Amount (in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(approvalEntry.totalCost)}
								only.</span></td>
					</tr>
				</c:if>
				<c:if test="${approvalEntry.description!=null}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="3"><strong>Description
								: </strong><br> <span>${approvalEntry.description}</span></td>
						<td class="tg-031e" colspan="4"><span><strong>Total
									Amount (in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(approvalEntry.totalCost)}
								only.</span></td>
					</tr>
				</c:if>
				<c:if test="${approvalEntry.approvalReturn.size()==0}">
					<tr style="height: 10px">
						<td class="tg-031e" colspan="5"><strong>Declaration:</strong><br>We
							declare that this invoice shows the actual price of the goods
							described and all particulars are true and correct.</td>
						<td class="tg-031e" colspan="2" style="text-align: right;">for
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
	<c:if test="${approvalEntry.approvalReturn.size()!=0}">
		<c:set value="${0}" var="qPage" />
		<c:forEach var="purchaseReturnProd"
			items="${sessionScope['ejb'].getAllSalesProductReturnDetailBySalesEntryId(approvalEntry.id)}">
			<c:set value="${qPage+1}" var="qPage" />
		</c:forEach>
		<c:set value="${Math.ceil(qPage/15)}" var="qPage" />
		<c:set value="${1}" var="slno" />
		<c:set var="idlist" value="" />
		<c:set value="${j}" var="k" />
		<c:forEach var="j" begin="${j}" end="${qPage+k-1}">
			<page id="print1" size="A4">
			<h3 align="center">Sales Invoice (Page ${j})</h3>
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
							<td class="tg-031e" colspan="2" style="width: 25%">${approvalEntry.challanNumber}</td>
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
								${approvalEntry.customer.name} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>City :</span>
								${approvalEntry.customer.city} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span> ${approvalEntry.customer.address} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph :</span>
								${approvalEntry.customer.mobile}</td>
							<td class="tg-031e" colspan="2">Sales date :</td>
							<td class="tg-031e" colspan="2"><fmt:formatDate
									value="${approvalEntry.approvalDate}" pattern="dd-MM-yyyy" /></td>
						</tr>
						<tr style="height: 10px">
							<td class="tg-031e" colspan="2">Supplier reference (Agent
								name):</td>
							<td class="tg-031e" colspan="2"><c:choose>
									<c:when test="${approvalEntry.vendor!=null}">${approvalEntry.vendor.name}</c:when>
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
							<td class="tg-031e" colspan="2" style="width: 25%">${approvalEntry.challanNumber}</td>
						</tr>
						<tr style="height: 10px">
							<td class="tg-031e" colspan="3" rowspan="2"><strong>Customer
									Details:</strong> <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Name :</span>
								${approvalEntry.customer.name} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>City :</span>
								${approvalEntry.customer.city} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>Address :<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</span> ${approvalEntry.customer.address} <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span>Ph :</span>
								${approvalEntry.customer.mobile}</td>
							<td class="tg-031e" colspan="2">System Date:</td>
							<td class="tg-031e" colspan="2"><fmt:formatDate
									value="${sessionScope['ejb'].getCurrentDateTime()}"
									pattern="dd-MM-yyyy" /></td>
						</tr>
						<tr style="height: 10px">
							<td class="tg-031e" colspan="2">Sales date :</td>
							<td class="tg-031e" colspan="2"><fmt:formatDate
									value="${approvalEntry.approvalDate}" pattern="dd-MM-yyyy" /></td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr style="height: 10px">
					<td colspan="7" align="left">Return Details :</td>
				</tr>
				<tr>
					<td class="tg-031e" colspan="7">
						<table class="tg"
							style="height: auto; width: 750px; border-color: white; margin-left: -6px; margin-right: -6px; margin-top: -11px;">
							<tr style="height: 10px">
								<th>#</th>
								<th>Return Date</th>
								<th>Sales Return challan no.</th>
								<th>Product Code</th>
								<th colspan="2">Product Description</th>
								<th>Returning Qty</th>
							</tr>
							<c:forEach begin="${(j-k)*15}" end="${(j-k+1)*15-1}"
								var="purchaseReturnProd"
								items="${sessionScope['ejb'].getAllSalesProductReturnDetailBySalesEntryId(approvalEntry.id)}">
								<c:choose>
									<c:when test="${idlist==''}">
										<c:set var="idFlag" value="${0}" />
									</c:when>
									<c:otherwise>
										<c:set var="idFlag" value="${0}" />
										<c:set var="isBreaked" value="${0}" />
										<c:if test="${isBreaked==0}">
											<c:forTokens items="${idlist}" delims="," var="id">
												<c:if test="${purchaseReturnProd.approvalReturn.id==id}">
													<c:set var="idFlag" value="${1}" />
													<c:set var="isBreaked" value="${1}" />
												</c:if>
											</c:forTokens>
										</c:if>
									</c:otherwise>
								</c:choose>
								<c:set
									value="${purchaseReturnProd.approvalReturn.salesProductReturnDetail.size()}"
									var="proRetLength" />
								<tr>
									<c:if test="${idFlag!=1}">
										<c:set var="idlist"
											value="${idlist},${purchaseReturnProd.approvalReturn.id}" />
										<td style="border-bottom: none; border-top: none;"
											class="tg-031e">${slno}</td>
										<c:set value="${slno+1}" var="slno" />
										<td style="border-bottom: none; border-top: none;"
											class="tg-031e"><fmt:formatDate
												value="${purchaseReturnProd.approvalReturn.returnDate}"
												pattern="dd-MM-yy" /></td>
										<td style="border-bottom: none; border-top: none;"
											class="tg-031e">
											${purchaseReturnProd.approvalReturn.challanNumber}</td>
									</c:if>
									<c:if test="${idFlag==1}">
										<td style="border-bottom: none; border-top: none;"></td>
										<td style="border-bottom: none; border-top: none;"></td>
										<td style="border-bottom: none; border-top: none;"></td>
									</c:if>
									<td style="border-bottom: none; border-top: none;"
										class="tg-031e">
										${purchaseReturnProd.approvalProductDetails.purchase_Product_Details.productDetail.code}
									</td>
									<td style="border-bottom: none; border-top: none;"
										class="tg-031e" colspan="2"><span
										style="font-size: 10px;">
											${purchaseReturnProd.approvalProductDetails.purchase_Product_Details.productDetail.description}</span></td>
									<td style="border-bottom: none; border-top: none;"
										class="tg-031e"><fmt:formatNumber var="totalQ"
											value="${purchaseReturnProd.qtyReturn}" maxFractionDigits="3"
											groupingUsed="false" />${totalQ}</td>
								</tr>
							</c:forEach>
							<tr style="height: 0px;">
								<td colspan="7" style="border-bottom: none;"></td>
							</tr>
						</table> <span style="float: right;"><c:if test="${j<(qPage+k-1)}">continued...</c:if></span>
					</td>
				</tr>
				<c:if test="${j==(qPage+k-1)}">
					<tr style="height: 10px">
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
	</c:if>
</body>
</html>