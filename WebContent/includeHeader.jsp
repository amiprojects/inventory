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
<header class="header" id="header">
	<div class="logo">
		<!-- <a href="dashboard.html" title=""><img src="images/logo2.png"
			alt="" /></a>  -->
		<!-- <a title="" class="toggle-menu"><i class="fa fa-bars"></i></a> -->
	</div>
	<div class="custom-dropdowns">
		<div class="notification-list dropdown">
			<a title=""> <c:if
					test="${sessionScope['ejb'].getNotifications().size()>0}">
					<span class="green" id="notification">${sessionScope['ejb'].getNotifications().size()}</span>
				</c:if><i class="fa fa-bell-o"></i></a>
			<div class="notification drop-list">
				<span id="notificationStatement">You have
					${sessionScope['ejb'].getNotifications().size()} New Notifications</span>
				<ul id="notificationDetails" style="height: 300px; overflow: auto;">

					<c:forEach var="i"
						items="${sessionScope['ejb'].getNotifications()}"
						end="${sessionScope['ejb'].getNotifications().size()>=5?4:sessionScope['ejb'].getNotifications().size()}"
						begin="0">

						<li><a href="${i.link}" title=""><span><i
									class="fa fa-info green"></i></span>${i.description}</a></li>

					</c:forEach>

					<li><a href="notification.jsp">See all</a></li>
				</ul>
			</div>
		</div>
		<!-- Notification List -->
	</div>
	<!-- <a title="" class="slide-panel-btn"><i class="fa fa-gear fa-spin"></i></a> -->
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
<!-- Header -->
