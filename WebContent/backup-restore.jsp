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
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
</head>
<body style="background-image: url('images/resource/login-bg.jpg')">
	<div class="login-sec">
		<div class="login">
			<div class="login-form">
				<form action="#" id="restoreForm" method="post">
					<button type="button" class="btn green pull-right"
						style="width: 100%; margin-bottom: 3px;" onclick="restoreOCF();">
						<b>Restore</b>
					</button>
				</form>
				<form action="#" id="backupForm" method="post">
					<button type="button" class="btn green pull-right"
						style="width: 100%; margin-bottom: 25px;" onclick="backupOCF();">
						<b>Backup</b>
					</button>
				</form>
				<h2 style="color: white;" id="msg">${requestScope['msg']}</h2>
				<h3 style="color: white;" id="msgdet">${requestScope['msgdet']}</h3>
			</div>
		</div>
	</div>
</body>
<div id="verifyModal" class="modal fade" role="dialog"
	style="top: 25px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<!-- <h4 class="modal-title">Modal Header</h4> -->
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="widget-area">
						<div class="row">
							<div class="col-md-3">Username :<input type="hidden" value="0" id="flag"> </div>
							<div class="col-md-9">
								<input type="text" class="form-control" name="" id="usrname"
									style="text-transform: none;" value="" autocomplete="off">
							</div>
							<div class="col-md-3">Pasword :</div>
							<div class="col-md-9">
								<input type="password" class="form-control" name="" id="password"
									style="text-transform: none;" value="" autocomplete="off">
							</div>
							<div class="col-md-12">
								<button class="btn green pull-right" onclick="submit();">
									<b>Submit</b>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			</div>
		</div>
	</div>
</div>
<!-- Script -->
<script type="text/javascript" src="js/modernizr.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/enscroll.js"></script>
<script type="text/javascript" src="js/grid-filter.js"></script>
<script type="text/javascript">
	function restoreOCF() {
		$("#verifyModal").modal("show");
		$("#flag").val("rs");
	}
	function backupOCF() {
		$("#verifyModal").modal("show");
		$("#flag").val("bk");
	}
	function submit(){
		if($("#flag").val()=="rs"){
			$.post( "restore", { usrname: $("#usrname").val(), password: $("#password").val() } , function(data){
				$("#verifyModal").modal("hide");
				$("#msg").html(data.msg);	
				$("#msgdet").html(data.msgdet);	
			});
		}else if($("#flag").val()=="bk"){
			$.post( "backup", { usrname: $("#usrname").val(), password: $("#password").val() }, function(data){
				$("#verifyModal").modal("hide");
				$("#msg").html(data.msg);	
				$("#msgdet").html(data.msgdet);	
			});
		}else{}
		
	}
	
</script>
</html>