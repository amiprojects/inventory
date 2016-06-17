<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.ui-autocomplete {
	max-height: 150px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
}
/* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
* html .ui-autocomplete {
	height: 150px;
}
</style>
<%-- <jsp:include page="include.jsp" /> --%>
<header class="header" id="header">
	<div class="responsive-header">
		<span><i class="fa fa-align-justify"></i></span>
		<%@include file="includeHeaderM.jsp"%>

		<div class="dropdown profile"
			style="display: block; float: left; margin-left: 21px;">
			<a title="" style="width: 100%; font-size: 13px;"> <!--  <img src="images/resource/me.jpg" alt="" /> -->
				${sessionScope['ejb'].getUserById(sessionScope['user']).name}<i
				class="caret"></i>
			</a>
			<div class="profile drop-list">
				<ul>
					<li><a href="changePassword.jsp" title="")><i
							class="fa fa-edit"></i>Change Password</a></li>
					<li><a href="logout" title=""><i class="fa fa-info"></i>
							Logout</a></li>
				</ul>
			</div>
			<!-- Profile DropDown -->
		</div>
	</div>
	<!--Responsive header-->

	<nav class="horizontal-menu">
		<%@include file="includeHeaderM.jsp"%>

		<div class="dropdown profile" style="float: right;">
			<a title="" style="font-size: 14px; width: 100%;"> <!--  <img src="images/resource/me.jpg" alt="" /> -->${sessionScope['ejb'].getUserById(sessionScope['user']).name}<i
				class="caret"></i>
			</a>
			<div class="profile drop-list">
				<ul>
					<li><a href="changePassword.jsp" title="")><i
							class="fa fa-edit"></i>Change Password</a></li>
					<li><a href="logout" title=""><i class="fa fa-info"></i>
							Logout</a></li>
				</ul>
			</div>
			<!-- Profile DropDown -->
		</div>
	</nav>

</header>
<!-- Header -->
<!-- <script type="text/javascript">
function criticalStockService(){
	setTimeout(getCritcalStock(), 30000);
}
var l=0;
function getCritcalStock(){
	$.ajax({
		url : "getCriticalStock",
		dataType : "json",		
		success : function(data) {
			if (data.length>l) {				
				$("#notification").html(data.length);
				$("#notificationStatement").html('you have '+data.length+' notification ');
				$("#notificationDetails").empty();
				$.map(data,function(item){
					$("#notificationDetails").append('<li><a href="#" title=""><span>'+
							'<i class="fa fa-bug red"></i></span><h6>Yor product '+item.productCode+": "+item.productDescription+' is in critical condition</h6></a></li>');	
				});
				l=data.length;
			}
		},
		complete:function(){
			criticalStockService();
		}
	});	
	
}
$(document).ready(function(){
	//getCritcalStock();
});
</script>-->