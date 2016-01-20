<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<strong>Identify Yourself</strong>
					<%-- <h1>${requestScope['userName']}</h1> --%>
				</h5>
				<c:set var="ans"
					value="${sessionScope['ejb'].getAllSecurityAnswerByUserId(requestScope['userName'])}"></c:set>
				<form action="forgotPassVarify" method="post" id="forgotPassForm">
					<fieldset>
						<input type="text" placeholder="Name" name="name" id="name" />
					</fieldset>
					<fieldset>
						<input type="text" placeholder="Mobile no." name="ph" id="ph" />
					</fieldset>
					<fieldset>
						<input type="text"
							placeholder="${ans.get(0).getSequrityQuestions().getQuestion()}"
							name="ans1" id="ans1" />
					</fieldset>
					<fieldset>
						<input type="text"
							placeholder="${ans.get(1).getSequrityQuestions().getQuestion()}"
							name="ans2" id="ans2" />
					</fieldset>
					<input type="button" class="blue" onclick="submitForm();"
						value="Submit" align="right" style="float: right;"> <input
						type="hidden" value="${requestScope['userName']}" name="uId">
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
		if ($("#name").val() == "" || $("#ph").val() == ""
				|| $("#ans1").val() == "" || $("#ans2").val() == "") {
			alert("Any field can not be blank...");
		} else if ($("#name").val() != "${ans.get(0).users.name}") {
			alert("Invalid name!");
			$("#name").val("");
		} else if ($("#ph").val() != "${ans.get(0).users.ph}") {
			alert("Invalid mobile no!");
			$("#ph").val("");
		} else if ($("#ans1").val().toUpperCase() != "${ans.get(0).answer.toUpperCase()}") {
			alert("Invalid Answer of ${ans.get(0).getSequrityQuestions().getQuestion()} !");
			$("#ans1").val("");
		} else if ($("#ans2").val().toUpperCase() != "${ans.get(1).answer.toUpperCase()}") {
			alert("Invalid Answer of ${ans.get(0).getSequrityQuestions().getQuestion()} !");
			$("#ans2").val("");
		} else {
			$("#forgotPassForm").submit();
		}
	}
</script>
</html>