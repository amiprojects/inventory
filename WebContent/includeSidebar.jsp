<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <jsp:include page="include.jsp" /> --%>

<aside class="sidebar" style="height: 100%; overflow-y: scroll;">
	<div class="menu-sec">
		<div id="menu-toogle" class="menus">
			<div class="single-menu">
				<h2 class="" id="dash">
					<a title=""><span>Dashboard</span></a>
				</h2>
				<div class="sub-menu" style="" id="dashSub">
					<ul>
						<li><a id="sDash" href="dashboard.jsp" title="">Dashboard</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 class="" id="noti">
					<a title=""><span>Notification</span></a>
				</h2>
				<div class="sub-menu" style="" id="notiSub">
					<ul>
						<li><a id="sNoti" href="notification.jsp" title="">All
								Notifications</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="reports">
					<a title=""><span>Reports</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="report" href="report.jsp" title="">Report</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="prodact">
					<a href="#" title=""><span>Product/Material Module</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sProduct" href="MaterialPartDetailsGenerals.jsp"
							title="">Product/Material </a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="purch">
					<a title=""><span>Purchase Module</span></a>
				</h2>
				<div class="sub-menu">
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
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="sales">
					<a title=""><span>Sales Module</span></a>
				</h2>
				<div class="sub-menu">
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
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="approval">
					<a title=""><span>Approval Module</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="approvalEntry" href="approvalEntry.jsp" title="">Approval
								Entry</a></li>
						<li><a id="approvalSearch" href="approvalSearch.jsp" title="">Approval
								Search</a></li>
						<li><a id="approvalReturn" href="approvalReturn.jsp" title="">Approval
								Return</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="vendor">
					<a title=""><span>Vendor Module</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="vVendor" href="purchasingVendor.jsp" title="">Vendor/Agent/Jobber/Designer</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="stock">
					<a title=""><span>Stock Module</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sStock" href="stockView.jsp" title="">Stock
								View</a></li>
					</ul>
				</div>
			</div>
			<c:if test="${sessionScope['user']=='adminProduction'}">
				<div class="single-menu">
					<h2 id="jobs">
						<a title=""><span>Jobs Module</span></a>
					</h2>
					<div class="sub-menu">
						<ul>
							<li><a id="designCostSheet" href="jobDesignCostSheet.jsp"
								title="">Sample Job CostSheet</a></li>
							<li><a id="jAssign" href="jobAssign.jsp" title="">Job
									Assignment</a></li>
							<li><a id="jR" href="jobReceive.jsp" title="">Job
									Receive</a></li>
							<li><a id="jobPayment" href="jobPayment.jsp" title="">Job
									Payment</a></li>
							<li><a id="designCostSheetSearch"
								href="jobDesignCostSheetSearch.jsp" title="">SampleJobCostSheet
									Search</a></li>
							<li><a id="jobPlan" href="jobPlanSearch.jsp" title="">Job
									Plan</a></li>
							<li><a id="jSearch" href="jobAssignSearch.jsp" title="">Job
									Assignment Search</a></li>
						</ul>
					</div>
				</div>
			</c:if>
			<div class="single-menu">
				<h2 id="debitCreditNote">
					<a title=""><span>Debit/Credit Note</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="debitNote" href="noteDebit.jsp" title="">Customer's
								Note</a></li>
						<li><a id="creditNote" href="noteCredit.jsp" title="">Vendor/Agent/Jobber's
								Note</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="setup">
					<a title=""><span>Setup Module</span></a>
				</h2>
				<div class="sub-menu">
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
						<li><a id="sSetupCity" href="setupCountryStateCity.jsp"
							title="">Country/State/City</a></li>
						<li><a id="sSetupBill" href="billSetup.jsp" title="">Bill
								Setup</a></li>

						<c:if test="${sessionScope['user']=='adminProduction'}">
							<li><a id="jobSetup" href="jobSetup.jsp" title="">Job
									Setup</a></li>
							<li><a id="itemSetup" href="setupItem.jsp" title="">Item
									Setup</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<p>
			<c:if test="${sessionScope['ejb'].is21Days()=='true'}">
				<!-- background-color: #ff0000; color: #F0F0F0; -->
				<div style="color: #ff0000;">
					<h4>Validity will be ended on
						${sessionScope['ejb'].getAllStoct().get(0).getEndDate()} . Please
						contact to your vendor...</h4>
				</div>
			</c:if>
		</p>
		<p>
			2015 powered by <a href="http://www.aminfotrix.com" title="">AM
				INFOTRIX</a>
		</p>
	</div>
	<!-- Menu Sec -->
</aside>
<!-- Aside Sidebar -->
