//every time on making .war
...................................
loginservlet.java / inits.java,
getmacid.java - production only,
testServ
//include sidebar 
//(include- all, production entry- production only , job module- production only)
//dashboard (job assignment) - kainat and kaanish
//stockshowdetails (job work, production inventory, production purchase tab)- production only



http://jqueryui.com/autocomplete/#maxheight
C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kaanish/kaanish BUFFER=10000000 FILE=d:/backup/exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y


//////////////////////////////////////////////////////////////////
COMPANYINFO
....................
ALTER TABLE COMPANYINFO ADD (isMRPbarcode NUMBER(1) DEFAULT 1);



<%-- <%@include file="includeHeaderMenu.jsp"%>
		<div class="page-container wide"> --%>


<div class="responsive-logo">
			<a href="dashboard.html" title=""><img src="images/logo2.png"
				alt="Logo" /></a>
		</div>
		
<div class="logo">
			<a href="dashboard.html" title=""><img src="images/logo2.png"
				alt="" /></a>
		</div>

/////////////////////////////////////////////////////////////////////////////////////
COMPANYINFO
...............
barcodeHeader String 255 null
.........................................................
ALTER TABLE SALESENTRY ADD (isFlatProfitAgent NUMBER(1) DEFAULT 1);
ALTER TABLE SALESENTRY ADD (isEfectiveProfit NUMBER(1) DEFAULT 1);
agentProfitValue 19,4 null
agentProfitTotal 19,4 null

UPDATE SALESENTRY
	SET AGENTPROFITVALUE = 0
	WHERE ID IN (select ID from SALESENTRY);
	
UPDATE SALESENTRY
	SET AGENTPROFITTOTAL = 0
	WHERE ID IN (select ID from SALESENTRY);
	
	
PURCHASE_ENTRY
.....................................
update PURCHASE_ENTRY set ISFLATPROFITAGENT=1;
update PURCHASE_ENTRY set ISEFECTIVEPROFIT=1;

delete ISINCLUSIVEAGENT

PURCHASERETURN
...............
retAgentProfitTotal 19,4 null

UPDATE PURCHASERETURN
	SET RETAGENTPROFITTOTAL = 0
	WHERE ID IN (select ID from PURCHASERETURN);

SALESRETURN
...............
retAgentProfitTotal 19,4 null

UPDATE SALESRETURN
	SET RETAGENTPROFITTOTAL = 0
	WHERE ID IN (select ID from SALESRETURN);
	
JOBPLANPRODUCTSTOCK
.....................
cost 19,4 null

JOBPLANPRODUCTS
..................
ProductsForDesignCostSheetId->PRODFORDSNCSTSHTID

UPDATE PURCHASE_PRODUCT_DETAILS 
	SET REMAINING_QUANTITY = 24
	WHERE PRODUCTID = 54646666666666664;
	
select * from READYGOODSSTOCK where PRODUCTID in (select ID from PRODUCTDETAIL where CODE like '0%');

select * from SAMPLEDESIGNCOSTSHEET where ID not in (select
distinct SAMPLEDESIGNCOSTSHEETID from JOBSFORDESIGNCOSTSHEET where
JOBTYPE=480);

<script>
	$(document).ready(function() {
		$("#taxVal").change(function() {
			$("#taxVal").val(Number($("#taxVal").val()).toFixed(2));
		});
	});
</script>
------
<fmt:formatNumber var="a" value="${val}" maxFractionDigits="2" groupingUsed="false" />
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
<fmt:formatNumber var="" value="" maxFractionDigits="2" groupingUsed="false" />
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