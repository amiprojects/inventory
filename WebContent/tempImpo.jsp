ALTER TABLE PURCHASE_ENTRY ADD (isInclusiveAgent NUMBER(1) DEFAULT 1);
ALTER TABLE PURCHASE_ENTRY ADD (isFlatProfitAgent NUMBER(1) DEFAULT 0);
ALTER TABLE PURCHASE_ENTRY ADD (isEfectiveProfit NUMBER(1) DEFAULT 0);
agentProfitValue 19,4 null
agentProfitTotal 19,4 null
discountTotal 19,4, null

UPDATE PURCHASE_ENTRY
	SET DISCOUNTTOTAL = 0
	WHERE ID IN (select ID from PURCHASE_ENTRY);

UPDATE PURCHASE_ENTRY
	SET AGENTPROFITVALUE = 0
	WHERE ID IN (select ID from PURCHASE_ENTRY);
	
UPDATE PURCHASE_ENTRY
	SET AGENTPROFITTOTAL = 0
	WHERE ID IN (select ID from PURCHASE_ENTRY);
	
////////////////////////////////////////////////////

UPDATE PURCHASE_PRODUCT_DETAILS 
	SET REMAINING_QUANTITY = 24
	WHERE PRODUCTID = 4634;
	
select * from READYGOODSSTOCK where PRODUCTID in (select ID from PRODUCTDETAIL where CODE like '0%');


<script>
	$(document).ready(function() {
		$("#taxVal").change(function() {
			$("#taxVal").val(Number($("#taxVal").val()).toFixed(2));
		});
	});
</script>
------
<fmt:formatNumber var="a" value="${val}" maxFractionDigits="2" />
${a} ////////////////////////////
<script src="js/numericInput.min.js"></script>
<script>
	$(function() {
		$("#quantity").numericInput({
			allowFloat : true, // Accpets positive numbers (floating point)
			allowNegative : false, // Accpets positive or negative integer
		});
	});
</script>
//block special character
<script type="text/javascript">
	function blockSpecialChar(e) {
		var k = e.keyCode;
		return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
	}
	function blockSpecialCharNspace(e) {
		var k = e.keyCode;
		return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
	}
	function blockOtherThanEmail(e) {
		var k = e.keyCode;
		return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 64 || k == 46 || (k >= 48 && k <= 57));
	}
</script>

<input type="text" name="name"
	 onkeypress="return blockSpecialChar(event)"
	 onkeypress="return blockOtherThanEmail(event)" onkeypress="return blockSpecialCharNspace(event)" />
/////////////////////////////////////////// class="tab-pane fade active
in"
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
$("#id").modal("show"); //for toast
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
//autocomplete
autocomplete $(function() {
$("#bankCity").autocomplete({
 source : function(req, resp) { 
 	$.ajax({
		type : "post",
		url : "getCityByName",
 		data : { name : req.term },
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

<c:choose>
	<c:when test="${pCode.initialInventory.equals(false)}">
		<fmt:formatDate value="${pCode.purchase_Entry.purchase_date}"
			pattern="dd-MM-yy" />
	</c:when>
	<c:otherwise>Intial inventory</c:otherwise>
</c:choose>

<c:if test="${pEntryByD.vendor.vendorType.type=='Vendor'}">
	<td>${pEntryByD.vendor.name}</td>
</c:if>

//
<fmt:formatNumber var="" value="" maxFractionDigits="2" />
//
<fmt:formatDate value="" pattern="dd-MM-yy" />

//scroll table
<link rel="stylesheet" href="css/scrollTable.css" type="text/css" />
<table class="table table-fixedheader">
	<thead>
		<tr>
			<th width="50%">#</th>
			<th width="50%">Purchase challan no.</th>
		</tr>
	</thead>
	<tbody style="height: 300px;">
		<tr>
			<td width="50%"></td>
			<td width="50%"></td>
		</tr>
	</tbody>
</table>

//sum by class
if (!isNaN(this.value) && this.value.length != 0) {
	var sum = 0;
	$(".rQtyAm").each(function() {
 		sum += parseFloat(this.value);
  	});
	$("#subtotalvalue").val(sum.toFixed(2));
}


$("input:radio[name=bar]").click(function() {
	var value = $(this).val();
	//alert(value);
	if (value == "yesBar") {
		$("#isBarPrint").val('yes');
	}else {
		$("#isBarPrint").val('no');
	}
});

var count = $('#purProTable tbody').length;
alert(count);