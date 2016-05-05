<header class="header" id="header">
	<div class="logo">
		<!-- <a href="dashboard.html" title=""><img src="images/logo2.png"
			alt="" /></a>  -->
		<!-- <a title="" class="toggle-menu"><i class="fa fa-bars"></i></a> -->
	</div>
	<div class="custom-dropdowns">
		<div class="notification-list dropdown">
			<a title=""><span class="green" id="notification">0</span><i
				class="fa fa-bell-o"></i></a>
			<div class="notification drop-list">
				<span id="notificationStatement">You have 3 New Notifications</span>
				<ul id="notificationDetails">
					<li><a href="#" title=""><span><i
								class="fa fa-bug red"></i></span>Server 3 is Over Loader Please
							Check... </a></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender2.jpg" alt="" /></span><i>MD Daisal</i>New
							User Registered</a></li>
					<li><a href="#" title=""><span><i
								class="fa fa-bullhorn green"></i></span>Envato Has change the policies
					</a></li>
				</ul>
				<!-- <a href="#" title="">See All Notifications</a> -->
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
