 class="tab-pane fade active in"
<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

//include includeHeader.jsp includeSidebar.jsp includeHeader.html
includeSidebar.html //tabs
<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#detail">Details</a></li>
	<li><a data-toggle="tab" href="#address">Address</a></li>
</ul>
<div class="tab-content">
	<div id="detail" class="tab-pane fade active in"></div>
	<div id="address" class="tab-pane fade "></div>
</div>

//jstl
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

//upercase
<input type="text" style="text-transform: uppercase;">

//form
<form role="form" class="sec"></form>

//for dialog
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
	data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" style="top: 25px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body">
				<p>Some text in the modal.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
$("#id").modal("show");


//for toast
<link rel="stylesheet" href="css/toast.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($('#msg').html() != "") {
			$('.toast').fadeIn(400).delay(3000).fadeOut(400);
		}
	});
</script>
<div class='toast' style='display: none'>
	<h3 id="msg">${requestScope['msg']}</h3>
</div>

//AUTOCOMPLETE
<input list="browsers" name="">
<datalist id="browsers">
	<option value="Internet Explorer">
	<option value="Firefox">
	<option value="Chrome">
	<option value="Opera">
	<option value="Safari">
</datalist>

// http://localhost:8088/kaanish_kouture/getProductDetailById?id=1

//Math.round((num) * 100) / 100

//<h1>${sessionScope['user']}</h1>

//autocomplete
$(function() {
		$("#bankCity").autocomplete({
			source : function(req, resp) {
				$.ajax({
					type : "post",
					url : "getCityByName",
					data : {
						name : req.term
					},
					dataType : "json",
					success : function(data) {
						resp($.map(data, function(item) {
							return ({
								value : item.cityName,
								id : item.id
							});
						}));
					}

				});
			},
			change : function(event, ui) {
				if (ui.item == null) {
					$(this).val("");
					$("#bankCityId").val("");
				} else {
					$("#bankCityId").val(ui.item.id);
				}
			},
			select : function(event, ui) {
				$("#bankCityId").val(ui.item.id);
			}
		});
	});
