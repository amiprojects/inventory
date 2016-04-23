<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Styles -->
<link rel="stylesheet" href="font-awesome-4.2.0/css/font-awesome.css"
	type="text/css" />
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Style -->
<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<!-- Responsive -->
<link rel="stylesheet" href="css/toast.css" type="text/css" />

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>

</head>

<body style="background-image: url('images/resource/login-bg.jpg')">
	<div class="login-sec">
		<div class="login">
			<div class="login-form">
				<h5>
					<strong>Change Password</strong>
				</h5>
				<form action="changePass" method="post" id="changePassForm">
					<fieldset>
						<input type="password" placeholder="Current Password"
							name="curPassword" /><i class="fa fa-unlock-alt"></i>
					</fieldset>
					<fieldset>
						<input type="password" placeholder="New Password"
							name="newPassword" id="newPassword" /><i
							class="fa fa-unlock-alt"></i>
					</fieldset>
					<fieldset>
						<input type="password" placeholder="Confirm New Password"
							name="conNewPassword" id="conNewPassword" /><i
							class="fa fa-unlock-alt"></i>
					</fieldset>
					<!-- <label><input type="checkbox" />Remember me</label> -->
					<input type="button" class="blue" onclick="submitForm();"
						value="Update" align="right" style="float: right;">
				</form>
			</div>
			<span>Copyright © 2015 AMi</span>
		</div>
	</div>
	<!-- Log in Sec -->
	<div class='toast' style='display: none'>
		<h3 id="msg">${requestScope['msg']}</h3>
	</div>
</body>
<script type="text/javascript">
	function submitForm() {
		if ($("#newPassword").val() != $("#conNewPassword").val()) {
			alert("New Password Mismatch...");
		} else {
			$("#changePassForm").submit();
		}
	}
</script>
</html>