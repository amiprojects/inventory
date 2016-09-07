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
	<c:set var="jobAssi"
		value="${sessionScope['ejb'].getJobRecievedDetailsById(param.id)}" />


	<page size="A4">
	<h2 align="center">Job Receive Challan</h2>

	<table class="tg"
		style="border: 1px solid; height: 1080px; width: 750px">
		<tr style="height: 10px">
			<td class="tg-031e" style="width: 60%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Jobber Name</strong></span> <span
				style="padding-left: 10px"><strong> :
						${jobAssi.jobAssignmentDetails.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Jobber Details</strong></span> <span
				style="padding-left: 02px"><strong> : <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address:
						${jobAssi.jobAssignmentDetails.vendor.address} <br> &nbsp;
						&nbsp; &nbsp; &nbsp; Phone Number:
						${jobAssi.jobAssignmentDetails.vendor.ph1} <br> &nbsp; &nbsp;
						&nbsp; &nbsp; Email: ${jobAssi.jobAssignmentDetails.vendor.email}
						<br> &nbsp; &nbsp; &nbsp; &nbsp; Company Name:
						${jobAssi.jobAssignmentDetails.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 40%"><span
				style="padding-left: 20px"><strong>Job Chalan No</strong></span> <strong>
					: <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${jobAssi.jobAssignmentDetails.challanNumber}
			</strong><br> <br> <span style="padding-left: 20px"><strong>Job
						Receive Challan No</strong></span> <span><strong>:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${jobAssi.challanNumber}
				</strong></span><br> <br> <span style="padding-left: 20px"><strong>Received
						Date</strong></span> <span style="padding-left: 01px"><strong>:<fmt:formatDate
							value="${jobAssi.recievingDate}" pattern="dd-MM-yyyy" /></strong></span><br>
				<br> <span style="padding-left: 20px"><strong>Design
						No</strong></span> <span><strong> :
						${jobAssi.jobAssignmentDetails.jobPlan.designCostSheet.designNumber}</strong></span><br>
				<br> <span style="padding-left: 20px"><strong>Plan
						No</strong></span> <span><strong> :
						${jobAssi.jobAssignmentDetails.jobPlan.id}</strong></span><br> <br> <br>
				<br> <br> <br></td>
		</tr>

		<tr>
			<td class="tg-031e" colspan="2">
				<table class="tg"
					style="height: auto; width: 753px; border-color: white; margin-left: -6px; margin-right: -6px; margin-top: -11px;">
					<tr>
						<td colspan="6"><b>List of material :</b></td>
					</tr>
					<tr>
						<th>#</th>
						<th>P.Code</th>
						<th>Description</th>
						<th>For Item</th>
						<th>Qty</th>
						<th>UOM</th>
					</tr>

					<tbody>
						<c:set var="i" value="1"></c:set>
						<c:forEach var="jobp" items="${jobAssi.jobRecieveProductsDetails}">
							<tr>
								<td style="border-bottom: none; border-top: none;">${i}</td>
								<td style="border-bottom: none; border-top: none;">${jobp.jobPlanProducts.productsForDesignCostSheet.productDetail.code}</td>
								<td style="border-bottom: none; border-top: none;"><span
									style="font-size: 10px;">${jobp.jobPlanProducts.productsForDesignCostSheet.productDetail.description}</span></td>
								<td style="border-bottom: none; border-top: none;">${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobp.jobPlanProducts.productsForDesignCostSheet.id).itemDetails.name}</td>
								<td style="border-bottom: none; border-top: none;">${jobp.qtyReturn}</td>
								<td style="border-bottom: none; border-top: none;">${jobp.jobPlanProducts.productsForDesignCostSheet.productDetail.qtyUnit.name}</td>
							</tr>
							<c:set var="i" value="${i+1}"></c:set>
						</c:forEach>
						<tr style="height: 0px;">
							<td colspan="6" style="border-bottom: none;"></td>
						</tr>
					</tbody>
				</table> <span style="float: right;">continued...</span>
			</td>
		</tr>

		<tr style="height: 10px">
			<td class="tg-031e" style="width: 70%"><strong>Declaration:</strong><br>Finished
				goods must be returned within submission date. Check all the raw
				materials provided, before leaving the counter.</td>
			<td class="tg-031e" style="width: 30%; text-align: right;">for <strong>${companyInfo.compname}</strong><br>
				<br>Authorised Signatory
			</td>
		</tr>
	</table>
	<center>This is a Computer Generated Invoice</center>
	</page>
	<page size="A4">
	<h2 align="center">Job Receive Challan (Page-2)</h2>
	<table class="tg"
		style="border: 1px solid; height: 1080px; width: 750px">
		<tr style="height: 10px">
			<td class="tg-031e" style="width: 60%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Jobber Name</strong></span> <span
				style="padding-left: 10px"><strong> :
						${jobAssi.jobAssignmentDetails.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Jobber Details</strong></span> <span
				style="padding-left: 02px"><strong> : <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address:
						${jobAssi.jobAssignmentDetails.vendor.address} <br> &nbsp;
						&nbsp; &nbsp; &nbsp; Phone Number:
						${jobAssi.jobAssignmentDetails.vendor.ph1} <br> &nbsp; &nbsp;
						&nbsp; &nbsp; Email: ${jobAssi.jobAssignmentDetails.vendor.email}
						<br> &nbsp; &nbsp; &nbsp; &nbsp; Company Name:
						${jobAssi.jobAssignmentDetails.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 40%"><span
				style="padding-left: 20px"><strong>Job Chalan No</strong></span> <strong>
					: <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${jobAssi.jobAssignmentDetails.challanNumber}
			</strong><br> <br> <span style="padding-left: 20px"><strong>Job
						Receive Challan No</strong></span> <span><strong>:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${jobAssi.challanNumber}
				</strong></span><br> <br> <span style="padding-left: 20px"><strong>Received
						Date</strong></span> <span style="padding-left: 01px"><strong>:<fmt:formatDate
							value="${jobAssi.recievingDate}" pattern="dd-MM-yyyy" /></strong></span><br>
				<br> <span style="padding-left: 20px"><strong>Design
						No</strong></span> <span><strong> :
						${jobAssi.jobAssignmentDetails.jobPlan.designCostSheet.designNumber}</strong></span><br>
				<br> <span style="padding-left: 20px"><strong>Plan
						No</strong></span> <span><strong> :
						${jobAssi.jobAssignmentDetails.jobPlan.id}</strong></span><br> <br> <br>
				<br> <br> <br></td>
		</tr>

		<tr>
			<td class="tg-031e" colspan="2">
				<table class="tg"
					style="height: auto; width: 752px; border-color: white; margin-left: -6px; margin-right: -5px; margin-top: -11px;">
					<tr>
						<td colspan="8"><b>List of Jobs :</b></td>
					</tr>

					<tr>
						<th>#</th>
						<th>Job Name :</th>
						<th>P.Code</th>
						<th>Quantity</th>
						<th>UOM</th>
						<th>Rate</th>
						<th>Amount</th>
						<th>Received Date</th>
					</tr>
					<tbody>
						<c:set var="i" value="1"></c:set>
						<c:set var="totJobCost" value="${0}" />
						<c:forEach var="jobp" items="${jobAssi.jobRecieveProductsDetails}">
							<c:forEach items="${jobp.jobReceiveJobDetails}" var="jobProjob">
								<tr>
									<td style="border-bottom: none; border-top: none;">${i}</td>
									<td style="border-bottom: none; border-top: none;">${jobProjob.jobPlanJobStock.jobsForDesignCostSheet.jobTypes.jobName}</td>
									<td style="border-bottom: none; border-top: none;">${jobProjob.jobRecieveProductsDetails.jobPlanProducts.productsForDesignCostSheet.productDetail.code}</td>
									<td style="border-bottom: none; border-top: none;">${jobProjob.qtyDone}</td>
									<td style="border-bottom: none; border-top: none;">${jobProjob.jobRecieveProductsDetails.jobPlanProducts.productsForDesignCostSheet.productDetail.qtyUnit.name}</td>
									<td style="border-bottom: none; border-top: none;"><c:set
											var="rate"
											value="${sessionScope['ejb'].getJobAssignmentJobDetailsByJobPlanJobIdAndJobAssignmentId(jobProjob.jobPlanJobStock.id, jobAssi.jobAssignmentDetails.id).rate}"></c:set>${rate}</td>
									<td style="border-bottom: none; border-top: none;">${sessionScope['ejb'].getJobAssignmentJobDetailsByJobPlanJobIdAndJobAssignmentId(jobProjob.jobPlanJobStock.id, jobAssi.jobAssignmentDetails.id).ammount}</td>
									<td style="border-bottom: none; border-top: none;"><fmt:formatDate
											value="${jobProjob.jobRecieveProductsDetails.jobRecievedDetails.recievingDate}"
											pattern="dd-MM-yyyy" /></td>
								</tr>
								<c:set var="i" value="${i+1}"></c:set>
								<c:set var="totJobCost"
									value="${totJobCost+(jobProjob.qtyDone*rate)}" />
							</c:forEach>
						</c:forEach>
						<tr style="height: 0px;">
							<td colspan="8" style="border-bottom: none;"></td>
						</tr>
						<%-- <tr>
							<td colspan="6" align="right">Total Job Cost :</td>
							<td colspan="2"><fmt:formatNumber var="totJC"
									value="${totJobCost}" maxFractionDigits="2" groupingUsed="false" />${totJC}</td>
						</tr> --%>
					</tbody>
				</table>
			</td>
		</tr>

		<%-- <tr style="height: 10px;">
			<td class="tg-031e" colspan="2"><span><strong>Amount Chargeable
					(in words)</strong></span><br> <span>${sessionScope['ejb'].getNumberToWords(totJobCost)} only.</span></td>
		</tr> --%>
		<tr style="height: 10px">
			<td class="tg-031e" style="width: 70%"><strong>Declaration:</strong><br>Finished
				goods must be returned within submission date. Check all the raw
				materials provided, before leaving the counter.</td>
			<td class="tg-031e" style="width: 30%; text-align: right;">for <strong>${companyInfo.compname}</strong><br>
				<br>Authorised Signatory
			</td>
		</tr>
	</table>
	<center>This is a Computer Generated Invoice</center>
	</page>
</body>
</html>