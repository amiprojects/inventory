 class="tab-pane fade active in"
<link rel="stylesheet" href="bootstrapcdn.css">
<script src="maxcdn.bootstrapcdn.js"></script>

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