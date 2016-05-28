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
<header class="header">
	<div class="responsive-header">
		<span><i class="fa fa-align-justify"></i></span>
		<%@include file="includeHeaderM.jsp"%>
	</div>
	<!--Responsive header-->

	<nav class="horizontal-menu">
		<%@include file="includeHeaderM.jsp"%>
	</nav>
	<div class="custom-dropdowns" style="margin-left: 180px;">
		<div class="notification-list dropdown">
			<a title=""> <c:if
					test="${sessionScope['ejb'].getNotifications().size()>0}">
					<span class="green" id="notification">${sessionScope['ejb'].getNotifications().size()}</span>
				</c:if><i class="fa fa-bell-o"></i></a>
			<div class="notification drop-list">
				<span id="notificationStatement">You have
					${sessionScope['ejb'].getNotifications().size()} Notifications</span>
				<ul id="notificationDetails">
					<c:forEach var="i"
						items="${sessionScope['ejb'].getNotifications()}"
						end="${sessionScope['ejb'].getNotifications().size()>=5?4:sessionScope['ejb'].getNotifications().size()}"
						begin="0">

						<li><a href="${i.link}" title=""><span><i
									class="fa fa-info green"></i></span>${i.description}</a></li>
					</c:forEach>

					<c:if test="${sessionScope['ejb'].getNotifications().size()>0}">
						<li><a href="notification.jsp">See all</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- Notification List -->


		<c:if test="${sessionScope['ejb'].is21Days()=='true'}">
			<div style="color: #ff0000;">
				<h6>Validity will be ended on
					${sessionScope['ejb'].getAllStoct().get(0).getEndDate()} . Please
					contact to your vendor...</h6>
			</div>
		</c:if>

	</div>
	<div class="dropdown profile">
		<a title=""> <!--  <img src="images/resource/me.jpg" alt="" /> -->${sessionScope['ejb'].getUserById(sessionScope['user']).name}<i
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