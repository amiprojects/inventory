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
	<c:if
		test="${!(sessionScope['user']=='adminKaanish' || sessionScope['user']=='adminKainat')}">
		<c:forEach
			items="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"
			var="page">

			<c:if test="${page.name.equals('Job Assignment')}">
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
	<c:set var="jobAssi"
		value="${sessionScope['ejb'].getJobAssignmentById(param.id)}" />


	<page size="A4">
	<h2 align="center">Job Challan</h2>

	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">

			<td class="tg-031e" style="width: 45%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Jobber Name</strong></span> <span
				style="padding-left: 10px"><strong> :
						${jobAssi.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Jobber Details</strong></span> <span
				style="padding-left: 02px"><strong> : <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address: ${jobAssi.vendor.address} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Phone Number: ${jobAssi.vendor.ph1} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Email: ${jobAssi.vendor.email} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Company Name:
						${jobAssi.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 55%"><span
				style="padding-left: 15px"><strong>Job Challan No</strong></span> <span><strong>:
						${jobAssi.challanNumber}</strong></span><br> <br> <span
				style="padding-left: 15px"><strong>Asign Date</strong></span> <span
				style="padding-left: 30px"><strong>: <fmt:formatDate
							value="${jobAssi.assignDate}" pattern="dd-MM-yyyy" />
				</strong></span><br> <br> <span style="padding-left: 15px"><strong>Design
						No</strong></span> <span style="padding-left: 34px"><strong> :
						${jobAssi.jobPlan.designCostSheet.designNumber} </strong></span><br> <br>
				<span style="padding-left: 20px"><strong>Plan No</strong></span> <span
				style="padding-left: 52px"><strong>
						:${jobAssi.jobPlan.id}</strong></span><br> <br> <br> <br> <br>
				<br></td>

		</tr>

		<tr>
			<td class="tg-031e" colspan="2">
				<table class="tg"
					style="height: auto; width: 753px; border-color: white; margin-left: -6px; margin-right: -6px; margin-top: -11px;">
					<tr>
						<td colspan="6"><b>List of material used :</b></td>
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
						<c:forEach var="jobp" items="${jobAssi.jobAssignmentProducts}">
							<tr>
								<td>${i}</td>
								<td>${jobp.productsForDesignCostSheet.productDetail.code}</td>
								<td>${jobp.productsForDesignCostSheet.productDetail.description}</td>
								<td>${sessionScope['ejb'].getItmProductsForSampleByProductForDesignCostSheetId(jobp.productsForDesignCostSheet.id).itemDetails.name}</td>
								<td>${jobp.qty}</td>
								<td>${jobp.productsForDesignCostSheet.productDetail.qtyUnit.name}</td>
							</tr>
							<c:set var="i" value="${i+1}"></c:set>
						</c:forEach>
					</tbody>
				</table> <span style="float: right;">continued...</span>
			</td>
		</tr>
		<tr style="height: 100px">
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
	<h2 align="center">Job Challan (Page-2)</h2>

	<table class="tg"
		style="border: 1px solid; height: 1050px; width: 750px">
		<tr style="height: 50px">

			<td class="tg-031e" style="width: 45%"><span
				style="padding-left: 20px"><strong>Company Name</strong></span> <span
				style="padding-left: 05px"><strong> :
						${companyInfo.compname}</strong></span> <br> <br> <span
				style="padding-left: 20px"><strong>Jobber Name</strong></span> <span
				style="padding-left: 10px"><strong> :
						${jobAssi.vendor.name}</strong></span><br> <br> <span
				style="padding-left: 20px"><strong>Jobber Details</strong></span> <span
				style="padding-left: 02px"><strong> : <br>&nbsp;
						&nbsp; &nbsp; &nbsp; Address: ${jobAssi.vendor.address} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Phone Number: ${jobAssi.vendor.ph1} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Email: ${jobAssi.vendor.email} <br>
						&nbsp; &nbsp; &nbsp; &nbsp; Company Name:
						${jobAssi.vendor.companyName}
				</strong></span><br> <br> <br> <br></td>


			<td class="tg-031e" style="width: 55%"><span
				style="padding-left: 15px"><strong>Job Challan No</strong></span> <span><strong>:
						${jobAssi.challanNumber}</strong></span><br> <br> <span
				style="padding-left: 15px"><strong>Asign Date</strong></span> <span
				style="padding-left: 30px"><strong>: <fmt:formatDate
							value="${jobAssi.assignDate}" pattern="dd-MM-yyyy" />
				</strong></span><br> <br> <span style="padding-left: 15px"><strong>Design
						No</strong></span> <span style="padding-left: 34px"><strong> :
						${jobAssi.jobPlan.designCostSheet.designNumber} </strong></span><br> <br>
				<br> <br> <br> <br></td>

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
						<th>Expected Date</th>
					</tr>

					<tbody>
						<c:set var="i" value="1"></c:set>
						<c:set var="totJobCost" value="${0}" />
						<c:forEach var="jobp" items="${jobAssi.jobAssignmentProducts}">
							<c:forEach items="${jobp.jobAssignmentJobDetails}"
								var="jobProjob">
								<tr>
									<td>${i}</td>
									<td>${jobProjob.jobType.jobName}</td>
									<td>${jobProjob.assignmentProducts.productsForDesignCostSheet.productDetail.code}</td>
									<td>${jobProjob.qty}</td>
									<td>${jobProjob.assignmentProducts.productsForDesignCostSheet.productDetail.qtyUnit.name}</td>
									<td>${jobProjob.rate}</td>
									<td>${jobProjob.ammount}</td>
									<td><fmt:formatDate
											value="${jobProjob.estimatedCompletionDate}"
											pattern="dd-MM-yyyy" /></td>
								</tr>
								<c:set var="i" value="${i+1}"></c:set>
							</c:forEach>
							<c:set var="totJobCost" value="${totJobCost+jobp.totalJobCost}" />
						</c:forEach>
						<tr>
							<td colspan="6" align="right">Total Job Cost :</td>
							<td colspan="2"><fmt:formatNumber var="totJC"
									value="${totJobCost}" maxFractionDigits="2" />${totJC}</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>

		<tr style="height: 75px">
			<td class="tg-031e" colspan="2"><span>Amount Chargeable
					(in words)</span><br> <span>${sessionScope['ejb'].getNumberToWords(totJobCost)}</span></td>
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