<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<li><a href="#" title="">Dashboards</a>
		<ul>
			<li><a id="sDash" href="dashboard.jsp" title="">Dashboard</a></li>
		</ul> <!-- Drop Down --></li>
	<li><a href="#" title="">Notification<i
			class="fa fa-exclamation-triangle" style="color: red;"
			aria-hidden="true"></i></a>
		<ul>
			<li><a id="sNoti" href="notification.jsp" title="">All
					Notifications</a></li>
		</ul></li>
	<li><a href="#" title="">Reports</a>
		<ul>
			<li><a id="report" href="report.jsp" title="">Report</a></li>
		</ul></li>
	<li><a href="#" title="">Product/Material</a>
		<ul>
			<li><a id="sProduct" href="MaterialPartDetailsGenerals.jsp"
				title="">Product/Material </a></li>
		</ul></li>
	<li><a href="#" title="">Purchase</a>
		<ul>
			<li><a id="sPurchEntry" href="purchasingPurchaseEntry.jsp"
				title="">Purchase Entry</a></li>
			<li><a id="sPurchReturn" href="purchaseReturn.jsp" title="">Purchase
					Return</a></li>
			<li><a id="sPurchaseAgentProfitPayment"
				href="purchaseAgentProfitPayment.jsp" title="">PurchaseAgentProfit
					Payment</a></li>
			<li><a id="sPurchSearch" href="purchasingPurchaseSearch.jsp"
				title="">Search Purchase Entry</a></li>
			<li><a id="sPurchRetSearch" href="purchaseReturnSearch.jsp"
				title="">Search Purchase Return</a></li>
			<c:if test="${sessionScope['user']=='adminProduction'}">
				<li><a id="sProdPurchSearch"
					href="purchasingProductionSearch.jsp" title="">Search Ready
						Production</a></li>
			</c:if>
		</ul></li>
	<li><a href="#" title="">Sales</a>
		<ul>
			<li><a id="sSalesEntry" href="salesSalesEntry.jsp" title="">Sales
					Entry</a></li>
			<li><a id="sSalesReturn" href="salesReturn.jsp" title="">Sales
					Return</a></li>
			<li><a id="sSalesAgentProfitPayment"
				href="salesAgentProfitPayment.jsp" title="">SalesAgentProfit
					Payment</a></li>
			<li><a id="sSalesSearch" href="salesSearch.jsp" title="">Sales
					Search</a></li>
			<li><a id="sSalesRetSearch" href="salesSearchReturn.jsp"
				title="">Sales Return Search</a></li>
		</ul></li>
	<li><a href="#" title="">Approval</a>
		<ul>
			<li><a id="approvalEntry" href="approvalEntry.jsp" title="">Approval
					Entry</a></li>
			<li><a id="approvalSearch" href="approvalSearch.jsp" title="">Approval
					Search</a></li>
			<li><a id="approvalReturn" href="approvalReturn.jsp" title="">Approval
					Return</a></li>
			<li><a id="approvalReturnSearch" href="approvalReturnSearch.jsp"
				title="">Approval Return Search</a></li>
		</ul></li>
	<li><a href="#" title="">Vendor</a>
		<ul>
			<li><a id="vVendor" href="purchasingVendor.jsp" title="">Vendor/Agent/Jobber/Designer</a></li>
		</ul></li>
	<li><a href="#" title="">Stock</a>
		<ul>
			<li><a id="sStock" href="stockView.jsp" title="">Stock View</a></li>
		</ul></li>
	<c:if test="${sessionScope['user']=='adminProduction'}">
		<li><a href="#" title="">Jobs</a>
			<ul>
				<li><a id="designCostSheet" href="jobDesignCostSheet.jsp"
					title="">Sample Job CostSheet</a></li>
				<li><a id="jAssign" href="jobAssign.jsp" title="">Job
						Assignment</a></li>
				<li><a id="jR" href="jobReceive.jsp" title="">Job Receive</a></li>
				<li><a id="jobPayment" href="jobPayment.jsp" title="">Job
						Payment</a></li>
				<li><a id="designCostSheetSearch"
					href="jobDesignCostSheetSearch.jsp" title="">SampleJobCostSheet
						Search</a></li>
				<li><a id="jobPlan" href="jobPlanSearch.jsp" title="">Job
						Plan</a></li>
				<li><a id="jSearch" href="jobAssignSearch.jsp" title="">Job
						Assignment Search</a></li>
			</ul></li>
	</c:if>
	<li><a href="#" title="">Debit/Credit Note</a>
		<ul>
			<li><a id="debitNote" href="noteDebit.jsp" title="">Customer's
					Note</a></li>
			<li><a id="creditNote" href="noteCredit.jsp" title="">Vendor/Agent/Jobber's
					Note</a></li>
		</ul></li>
	<li><a href="#" title="">Setup</a>
		<ul>
			<li><a id="sSetupComp" href="setupCompanyInfo.jsp" title="">Company
					info.</a></li>
			<li><a id="sSetupUser" href="setupUser.jsp" title="">User</a></li>
			<li><a id="sSetupUgroup" href="setupUserGroup.jsp" title="">User
					group</a></li>
			<li><a id="sSetupUOM" href="setupUnitOfMeasure.jsp" title="">Unit
					of measurement</a></li>
			<li><a id="sSetupDept" href="setupDepartment.jsp" title="">Department</a></li>
			<li><a id="sSetupTax" href="setupTaxManagement.jsp" title="">Tax
					Management</a></li>
			<li><a id="sSetupCity" href="setupCountryStateCity.jsp" title="">Country/State/City</a></li>
			<li><a id="sSetupBill" href="billSetup.jsp" title="">Bill
					Setup</a></li>

			<c:if test="${sessionScope['user']=='adminProduction'}">
				<li><a id="jobSetup" href="jobSetup.jsp" title="">Job Setup</a></li>
				<li><a id="itemSetup" href="setupItem.jsp" title="">Item
						Setup</a></li>
			</c:if>
		</ul></li>
</ul>