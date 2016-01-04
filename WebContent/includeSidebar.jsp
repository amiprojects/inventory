<jsp:include page="include.jsp"/>
<aside class="sidebar" style="height: 100%; overflow-y: scroll;">
	<div class="menu-sec">
		<div id="menu-toogle" class="menus">

			<div class="single-menu">
				<h2 class="" id="dash">
					<a title=""><span>Dashboards</span></a>
				</h2>
				<div class="sub-menu" style="" id="dashSub">
					<ul>
						<li><a id="sDash" href="dashboard.jsp" title="">Dashboard</a></li>
						<li><a href="#" title="">Dashboard</a></li>
					</ul>
				</div>
			</div>

			<div class="single-menu">
				<h2 id="prodact">
					<a href="#" title=""><span>Product/Material</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sProduct" href="MaterialPartDetailsGenerals.jsp"
							title="">Product/Material</a></li>
						<!-- <li><a href="#" title="">Raw Product</a></li>
						<li><a href="#" title="">Ready Product</a></li>
						<li><a href="#" title="">Search</a></li> -->
					</ul>
				</div>
			</div>

			<div class="single-menu">
				<h2 id="purch">
					<a title=""><span>Purchasing</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sPurchEntry" href="purchasingPurchaseEntry.jsp"
							title="">Purchase Entry</a></li>
						<li><a id="sPurchSearch" href="purchasingPurchaseSearch.jsp"
							title="">Search Purchase Entry</a></li>
						<!-- <li><a id="sPurchVendor" href="purchasingVendor.jsp" title="">Vendor</a></li> -->
						<!-- <li><a id="sPurchVtype" href="purchasingVendorType.jsp"
							title="">Vendor Type</a></li> -->
					</ul>
				</div>
			</div>
			<%-- <c:if test="${sessionScope['ejb'].getUserById(sessionScope['user']).userGroup.pageLists}"> --%>

			<div class="single-menu">
				<h2 id="sales">
					<a title=""><span>Sales</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sSalesEntry" href="salesSalesEntry.jsp" title="">Sales
								Entry</a></li>
						<li><a id="sSalesReturn" href="salesReturn.jsp" title="">Sales
								Return</a></li>
						<li><a id="sSalesDiscount" href="salesDiscount.jsp" title="">Discount</a></li>
					</ul>
				</div>
			</div>

			<div class="single-menu">
				<h2 id="vendor">
					<a title=""><span>Vendor</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="vVendor" href="purchasingVendor.jsp" title="">Vendor/Agent/Jobber</a></li>
					</ul>
				</div>
			</div>

			<div class="single-menu">
				<h2 id="stock">
					<a title=""><span>Stock</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sStock" href="stockView.jsp" title="">Stock
								View</a></li>

					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="jobs">
					<a title=""><span>Jobs</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="jAssign" href="jobAssign.jsp" title="">Job
								Assignment</a></li>
						<li><a id="jSearch" href="jobAssignSearch.jsp" title="">Job
								Assignment Search</a></li>
						<li><a id="jR" href="jobReceive.jsp" title="">Job Receive</a></li>
					</ul>
				</div>
			</div>
			<div class="single-menu">
				<h2 id="setup">
					<a title=""><span>Setup</span></a>
				</h2>
				<div class="sub-menu">
					<ul>
						<li><a id="sSetupComp" href="setupCompanyInfo.jsp" title="">Company
								info.</a></li>
						<li><a id="sSetupUOM" href="setupUnitOfMeasure.jsp" title="">Unit
								of measurement</a></li>
						<li><a id="sSetupUser" href="setupUser.jsp" title="">User</a></li>
						<li><a id="sSetupUgroup" href="setupUserGroup.jsp" title="">User
								group</a></li>
						<li><a id="sSetupDept" href="setupDepartment.jsp" title="">Department</a></li>
						<li><a id="sSetupTax" href="setupTaxManagement.jsp" title="">Tax
								Management</a></li>
						<li><a id="sSetupCity" href="setupCountryStateCity.jsp"
							title="">Country/State/City</a></li>
						<li><a id="sSetupBill" href="billSetup.jsp" title="">Bill
								Setup</a>
					</ul>
				</div>
			</div>




		</div>
		<p>
			2015 powered by  <a href="http://www.aminfotrix.com"
				title="">AM Infotrix</a>
		</p>
	</div>
	<!-- Menu Sec -->
</aside>
<!-- Aside Sidebar -->
