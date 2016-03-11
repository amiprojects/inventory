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
<script type="text/javascript">
Url = {
	    get get(){
	        var vars= {};
	        if(window.location.search.length!==0)
	            window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value){
	                key=decodeURIComponent(key);
	                if(typeof vars[key]==="undefined") {vars[key]= decodeURIComponent(value);}
	                else {vars[key]= [].concat(vars[key], decodeURIComponent(value));}
	            });
	        return vars;
	    }
	};
$(document).ready(function(){
	if(Url.get.print==1){
		var myWindow = window
		/* .open(
				"barcodePrint.jsp?id=${param.id}&ip=${sessionScope['sip']}&port=${sessionScope['port']}",
				'name', 'width=600,height=400'); */
		.open(
				"purchaseEntryBarcodePrint.jsp?id=${param.id}",
				'name', 'width=600,height=400');
myWindow.print();
	}
});
</script>

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
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Purchase Entry')}">
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
	<c:set value="${sessionScope['ejb'].getPurchaseEntryById(param.id)}"
		var="purEntry" />
	<page id="print1" size="A4">
	<h3 align="center">Purchase Challan</h3>
	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="3" style="width: 50%">
				<strong>${companyInfo.compname}</strong><br> <br> <br>
				${companyInfo.addr}<br> EMail: ${companyInfo.email}<br>
				Mobile: ${companyInfo.mobile}
			</td>
			<td class="tg-031e" colspan="2" style="width: 25%">Purchase
				Challan no:</td>
			<td class="tg-031e" colspan="2" style="width: 25%">${purEntry.challanNumber}</td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Dated:</td>
			<td class="tg-031e" colspan="2"><fmt:formatDate
					value="${sessionScope['ejb'].getCurrentDateTime()}"
					pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="2">Purchase date:</td>
			<td class="tg-031e" colspan="2"><fmt:formatDate
					value="${purEntry.purchase_date}" pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr style="height: 50px">
			<td class="tg-031e" colspan="3" rowspan="4"><strong> <c:choose>
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
			</span> ${purEntry.vendor.address} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph1
					:</span> ${purEntry.vendor.ph1} <br> &nbsp;&nbsp;&nbsp;&nbsp;<span>Ph2
					:</span> ${purEntry.vendor.ph2}</td>
			<td class="tg-031e" colspan="2">Vendor bill No:</td>
			<td class="tg-031e" colspan="2">${purEntry.vendor_bill_no}</td>
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
			<td class="tg-031e" colspan="2">${purEntry.vendor.aliseName}</td>
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
					<c:set value="${1}" var="sl" />
					<c:set value="${0}" var="tqty" />
					<c:set value="${0}" var="gtot" />
					<c:forEach items="${purEntry.purchase_Product_Details}" var="ppdet">
						<tr>
							<td>${sl}</td>
							<td>${ppdet.productDetail.description}</td>
							<td>${ppdet.quantity}</td>
							<c:set value="${tqty+ppdet.quantity}" var="tqty" />
							<td>${ppdet.cost}</td>
							<td>${ppdet.productDetail.qtyUnit.name}</td>
							<td>${ppdet.cost*ppdet.quantity}</td>
							<c:set value="${gtot+ppdet.cost*ppdet.quantity}" var="gtot" />
						</tr>
						<c:set value="${sl+1}" var="sl" />
					</c:forEach>
					<tr>
						<td colspan="5" align="right">Tax Amount
							(${purEntry.tax_Type_Group.getTotalTaxValue()}%) :</td>
						<td>${purEntry.taxAmount}</td>
					</tr>
					<tr>
						<td colspan="5" align="right">Transport Charge :</td>
						<td>${purEntry.transport_cost}</td>
					</tr>
					<tr>
						<td colspan="5" align="right">Surcharge :</td>
						<td>${purEntry.sur_charge}</td>
					</tr>
					<tr>
						<td colspan="5" align="right">RoundOf :</td>
						<td>${purEntry.roundOf}</td>
					</tr>
					<tr>
						<td colspan="2" align="right">Total Quantity :</td>
						<td>${tqty}</td>
						<td colspan="2" align="right">Grand Total :</td>
						<td>${purEntry.totalCost}<%-- ${gtot} --%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
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