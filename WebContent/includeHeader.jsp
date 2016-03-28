<header class="header" id="header">
	<div class="logo">
		 <a href="dashboard.html" title=""><img src="images/logo2.png"
			alt="" /></a> 
		<a title="" class="toggle-menu"><i class="fa fa-bars"></i></a>
	</div>
	<div class="custom-dropdowns">
		<div class="message-list dropdown">
			<a title=""><span class="blue">0</span><i
				class="fa fa-envelope-o"></i></a>
			<div class="message drop-list">
				<span >You have 4 New Messages</span>
				<ul>
					<li><a href="#" title=""><span><img
								src="images/resource/sender1.jpg" alt="" /></span><i>${sessionScope['user']}</i>Hi!
							How are you?...
							<h6>2 min ago..</h6>
							<p class="status blue">New</p></a></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender2.jpg" alt="" /></span><i>Jonathan</i>Hi!
							How are you?...
							<h6>2 min ago..</h6>
							<p class="status red">Unsent</p></a></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender3.jpg" alt="" /></span><i>Barada knol</i>Hi!
							How are you?...
							<h6>2 min ago..</h6>
							<p class="status green">Reply</p></a></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender4.jpg" alt="" /></span><i>Samtha Gee</i>Hi!
							How are you?...
							<h6>2 min ago..</h6>
							<p class="status">New</p></a></li>
				</ul>
				<a href="inbox.html" title="">See All Messages</a>
			</div>
		</div>
		<!-- Message List -->
		<div class="notification-list dropdown">
			<a title=""><span class="green" id="notification">0</span><i class="fa fa-bell-o"></i></a>
			<div class="notification drop-list">
				<span id="notificationStatement">You have 3 New Notifications</span>
				<ul id="notificationDetails">
					<!-- <li><a href="#" title=""><span><i
								class="fa fa-bug red"></i></span>Server 3 is Over Loader Please
							Check...
							<h6>2 min ago..</h6></a></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender2.jpg" alt="" /></span><i>MD Daisal</i>New
							User Registered
							<h6>4 min ago..</h6>
							<p class="status red">Urgent</p></a></li>
					<li><a href="#" title=""><span><i
								class="fa fa-bullhorn green"></i></span>Envato Has change the policies
							<h6>7 min ago..</h6></a></li> -->
				</ul>
				<a href="#" title="">See All Notifications</a>
			</div>
		</div>
		<!-- Notification List -->
		<div class="activity-list dropdown">
			<a title=""><span class="red">4</span><i class="fa fa-clock-o"></i></a>
			<div class="activity drop-list">
				<span>Recent Activity</span>
				<ul>
					<li><a href="#" title=""><span><img
								src="images/resource/sender2.jpg" alt="" /></span><i>Jona Than</i>Uploading
							new files
							<h6>2 min ago..</h6>
							<p class="status green">Online</p></a>
						<div class="progress">
							<div style="width: 60%;" aria-valuemax="100" aria-valuemin="0"
								aria-valuenow="60" role="progressbar" class="progress-bar blue">60%</div>
						</div></li>
					<li><a href="#" title=""><span><img
								src="images/resource/sender1.jpg" alt="" /></span><i>Bela Nisaa</i>Downloading
							new Documents
							<h6>2 min ago..</h6></a>
						<div class="progress">
							<div style="width: 34%;" aria-valuemax="100" aria-valuemin="0"
								aria-valuenow="34" role="progressbar" class="progress-bar red">
								34%</div>
						</div></li>
				</ul>
				<a href="#" title="">See All Activity</a>
			</div>
		</div>
		<!-- Activity List -->
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
				<li><a href="#" title=""><i class="fa fa-wrench"></i>
						Setting</a></li>
				<li><a href="profile.html" title=""><i class="fa fa-user"></i>
						Profile</a></li>
				<li><a href="faq.html" title=""><i class="fa fa-info"></i>
						Help</a></li>
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
</script> -->
<!-- Header -->
