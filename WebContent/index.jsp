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
	<input type="hidden" id="url"
		value="${sessionScope['ejb'].getURL().getUri()}">
	<div class="login-sec">
		<div class="login">
			<div class="login-form">
				<h5>
					<strong>Identify</strong> Yourself
				</h5>
				<form action="login" method="post">
					<fieldset>
						<input type="text" placeholder="Username" name="usrName" /><i
							class="fa fa-user"></i>
					</fieldset>
					<fieldset>
						<input type="password" placeholder="Password" name="password" /><i
							class="fa fa-unlock-alt"></i>
					</fieldset>
					<!-- <label><input type="checkbox" />Remember me</label> -->
					<button type="submit" class="blue">LOG IN</button>
				</form>
				<a href="forgotPassword.jsp" title="">Forgot Password?</a>
			</div>
			<span>Copyright � 2015 AMi</span>
		</div>
	</div>
	<!-- Log in Sec -->
	<div class='toast' style='display: none'>
		<h3 id="msg">${requestScope['msg']}</h3>
	</div>
	<a href="#" style="color: white;" onclick="validityExtend();">.</a>
	<div style="float: right; margin-top: 500px; margin-right: 50px;">
		<h3>
			<a href="backup-restore.jsp" target="_blank"><u
				style="color: white;">Backup & Restore</u></a>
		</h3>
	</div>
</body>
<script type="text/javascript">
	function validityExtend() {
		$.ajax({
			//url : $("#url").val()+"kaanishValidityExtension/validityExten_kaanish.php",
			//url : $("#url").val()+"kaanishValidityExtension/validityExten_kainat.php",
			//url : $("#url").val()+ "kaanishValidityExtension/validityExten_production.php",
			url : $("#url").val()
					+ "kaanishValidityExtension/validityExtentesion.php",
			type : "post",
			dataType : "json",
			success : function(data) {
				$.ajax({
					url : "validity",
					type : "post",
					dataType : "json",
					data : {
						key : data.key,
						validity : data.validityMonth,
						uniqueNm : data.uniqueName
					},
					success : function(data1) {
						alert(data1.msg);
					}
				});
			}
		});
	}
</script>
</html>