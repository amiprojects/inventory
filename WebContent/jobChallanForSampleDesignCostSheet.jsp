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
</script>
</head>
<body bgcolor="#E6E6FA">
	<c:if test="${sessionScope['user']==null}">
		<c:redirect url="index.jsp" />
	</c:if>
	<c:set value="${sessionScope['ejb'].getCompanyInfo()}"
		var="companyInfo" />
	<c:set var="sampleJCS"
		value="${sessionScope['ejb'].getSampleDesignCostSheetById(param.id)}" />
	<page size="A4">
	<h2 align="center">Sample Design Cost Sheet Challan</h2>

	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">
			<td class="tg-031e" style="width: 60%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Design No</strong></span> <span
				style="padding-left: 22px"><strong> :
						${sampleJCS.designNumber}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Designer Name</strong></span> <span
				style="padding-left: 10px"><strong> :
						${sampleJCS.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Designer Details</strong></span>
				<span style="padding-left: 02px"><strong> : <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address: ${sampleJCS.vendor.address} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Phone Number: ${sampleJCS.vendor.ph1}
						<br> &nbsp; &nbsp; &nbsp; &nbsp; Email:
						${sampleJCS.vendor.email} <br> &nbsp; &nbsp; &nbsp; &nbsp;
						Company Name: ${sampleJCS.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 40%">
				<%-- <span
				style="padding-left: 20px"><strong>Job Chalan No</strong></span> <span
				style="padding-left: 30px"><strong> :
						${sampleJCS.id}</strong></span><br> --%> <br> <span
				style="padding-left: 20px"><strong>Design
						Description</strong></span> <span style="padding-left: 01px"><strong>:${sampleJCS.designDescription}</strong></span><br>
				<br> <br> <br> <span style="padding-left: 20px"><strong>Quantity</strong></span>
				<span style="padding-left: 73px"><strong> :1</strong></span> <br>
				<br> <br> <br>
			</td>
		</tr>

		<tr style="height: 50px">
			<td class="tg-031e" colspan="2"><img
				src="data:image/jpeg;base64,${sampleJCS.designImages.get(0).getImageAsString()}"
				width="300px"></td>
		</tr>

		<tr style="height: 50px">
			<td class="tg-031e" colspan="2"><strong>List of Items :</strong><br>
				<c:set var="i" value="1"></c:set> <c:forEach var="itmProd"
					items="${sessionScope['ejb'].getItemsForSampleBySampleId(sampleJCS.id)}">
					<br>
					${i}
					<span>. </span>
					${itmProd.name}
					<br>
					<c:set var="i" value="${i+1}"></c:set>
				</c:forEach><br></td>
		</tr>

		<tr>
			<td class="tg-031e" colspan="2">
				<table class="tg"
					style="height: auto; width: 750px; border-color: white; margin-left: -6px; margin-right: -5px; margin-top: -11px;">
					<tr>
						<td colspan="8"><b>List of material used :</b></td>
					</tr>
					<tr>
						<th>#</th>
						<th>P.Code</th>
						<th>Description</th>
						<th>For Item</th>
						<th>Qty</th>
						<th>UOM</th>
						<th>Rate</th>
						<th>Amount</th>
					</tr>

					<tbody>
						<c:set var="i" value="1"></c:set>
						<c:forEach var="jobp"
							items="${sampleJCS.productsForDesignCostSheets}">
							<tr>
								<td>${i}</td>
								<td>${jobp.productDetail.code}</td>
								<td>${jobp.productDetail.description}</td>
								<td>${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobp.id).itemDetails.name}</td>
								<td>${jobp.qty}</td>
								<td>${jobp.qtyUnit.name}</td>
								<td>${jobp.rate}</td>
								<td>${jobp.ammount}</td>

							</tr>
							<c:set var="i" value="${i+1}"></c:set>
						</c:forEach>
					</tbody>
				</table> <span style="float: right;">Continued...</span>
			</td>
		</tr>
		<tr style="height: 75px">
			<td class="tg-031e" style="width: 60%"><strong>Declaration:</strong><br>We
				declare that this invoice shows the actual price of the goods
				describe and that all particular are true and correct.</td>

			<td class="tg-031e" style="width: 40%; text-align: right;">for <strong>${companyInfo.compname}</strong><br>
				<br>Authorised Signatory
			</td>
		</tr>
	</table>
	</page>

	<page size="A4">

	<h2 align="center">Sample Design Cost Sheet Challan(Page-2)</h2>

	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">

			<td class="tg-031e" style="width: 60%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Design No</strong></span> <span
				style="padding-left: 22px"> <strong> :
						${sampleJCS.designNumber}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Designer Name</strong> </span> <span
				style="padding-left: 10px"><strong> :
						${sampleJCS.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Designer Details</strong></span>
				<span style="padding-left: 02px"><strong>: <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address: ${sampleJCS.vendor.address} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Phone Number: ${sampleJCS.vendor.ph1}
						<br> &nbsp; &nbsp; &nbsp; &nbsp; Email:
						${sampleJCS.vendor.email} <br> &nbsp; &nbsp; &nbsp; &nbsp;
						Company Name: ${sampleJCS.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 40%">
				<%-- <span
					style="padding-left: 20px"><strong>Job Chalan No</strong></span> <span
					style="padding-left: 30px"><strong> :
							${sampleJCS.id} </strong></span><br> --%> <br> <span
				style="padding-left: 20px"><strong>Design
						Description</strong></span> <span style="padding-left: 01px"><strong>
						:${sampleJCS.designDescription} </strong></span><br> <br> <br> <br>
				<span style="padding-left: 20px"><strong>Quantity</strong></span> <span
				style="padding-left: 73px"><strong> : 1 </strong></span> <br> <br>
				<br> <br>
			</td>

		</tr>

		<tr>
			<td class="tg-031e" colspan="2">
				<table class="tg"
					style="height: auto; width: 750px; border-color: white; margin-left: -4px; margin-right: -5px; margin-top: -11px;">
					<tr>
						<td colspan="7"><b>List of Jobs :</b></td>
					</tr>

					<tr>
						<th>#</th>
						<th>Job Name :</th>
						<th>P.Code</th>
						<th>Quantity</th>
						<th>UOM</th>
						<th>Rate</th>
						<th>Amount</th>
					</tr>

					<tbody>
						<c:set var="i" value="1"></c:set>
						<c:forEach var="jobp"
							items="${sampleJCS.productsForDesignCostSheets}">
							<c:forEach var="jobj" items="${jobp.jobsForDesignCostSheets}">
								<tr>
									<td>${i}</td>
									<td>${jobj.jobTypes.jobName}</td>
									<td>${jobp.productDetail.code}</td>
									<td>${jobj.qty}</td>
									<td>${jobj.qtyUnit.name}</td>
									<td>${jobj.rate}</td>
									<td>${jobj.ammount}</td>
								</tr>
							</c:forEach>
							<c:set var="i" value="${i+1}"></c:set>
						</c:forEach>
					</tbody>

					<tr>
						<td colspan="6" align="right">Total :</td>
						<td>${sampleJCS.grandTotal-sampleJCS.surcharge}</td>
					</tr>

					<tr>
						<td colspan="6" align="right">SurCharge :</td>
						<td>${sampleJCS.surcharge}</td>
					</tr>

					<tr>
						<td colspan="6" align="right">Grand Total :</td>
						<td>${sampleJCS.grandTotal}</td>
					</tr>


				</table>
			</td>
		</tr>

		<tr style="height: 75px">
			<td class="tg-031e" colspan="2"><span>Est. Amount (in
					words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(sampleJCS.grandTotal)}</span></td>
		</tr>
		<tr style="height: 75px">
			<td class="tg-031e" style="width: 60%"><strong>Declaration:</strong><br>We
				declare that this invoice shows the actual price of the goods
				describe and that all particular are true and correct.</td>

			<td class="tg-031e" style="width: 40%; text-align: right;">for <strong>${companyInfo.compname}</strong><br>
				<br>Authorised Signatory
			</td>
		</tr>
	</table>

	</page>
</body>
</html>