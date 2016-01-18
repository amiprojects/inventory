<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




<div id="addV" class="modal fade" role="dialog" style="top: 25px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="closePayment();">&times;</button>
					<center>
						<h3 class="modal-title">Vendor/Agent</h3>
					</center>
				</div>
				<div class="modal-body">
					<form role="form" class="sec" action="addVendorbyjson" id="addVen"
						method="post">
						<ul class="nav nav-tabs">
							<li class="active" id="detl"><a data-toggle="tab"
								href="#detail">Details</a></li>
							<li id="addr"><a data-toggle="tab" href="#address">Address</a></li>
							<li id="vAcc"><a data-toggle="tab" href="#vendorAccount">Vendor
									Account Info</a></li>
							<li id="bAcc"><a data-toggle="tab" href="#bankAccount">Bank
									Account info</a></li>
							<!-- <li id="prts"><a data-toggle="tab" href="#part">Parts</a></li> -->
						</ul>
						<div class="tab-content">
							<div id="bankAccount" class="tab-pane fade">
								<div class="widget-area">
									<h5 align="center">(All the below fields are optional)</h5>
									<br>
									<div class="col-md-3">
										<b>Bank Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankName"
											id="idbankName">
									</div>
									<br>
									<div class="col-md-3">
										<b>A/C no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankAccNo"
											id="acno">
									</div>
									<br>
									<div class="col-md-3">
										<b>Branch:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankBranch"
											id="idbankBranch">
									</div>
									<br>
									<div class="col-md-3">
										<b>City:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" id="bankCity">
										<input type="hidden" value="" name="bankCity" id="bankCityId">
									</div>
									<br>
									<div class="col-md-3">
										<b>IFSC no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankIFSC"
											id="idbankIFSC">
									</div>
									<br>
									<div class="col-md-3">
										<b>MICR no:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankMICR"
											id="idbankMICR">
									</div>
									<br>
									<div class="col-md-3">
										<b>RTGS code:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankRTGS"
											id="idbankRTGS">
									</div>
									<br>
									<div class="col-md-3">
										<b>Check lebel:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="bankCheckLebel"
											id="idbankCheckLebel">
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="bankButtonPrev();"> <input
										class="btn green pull-right" type="button" value="Finish"
										onclick="submitform1();">
								</div>

							</div>
							<div id="vendorAccount" class="tab-pane fade">
								<div class="widget-area">
									<div class="row">
										<h5 align="center">(All the below fields are optional)</h5>
										<br>
										<div class="col-md-5">
											<b>VAT no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorVATno"
												id="idvendorVATno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>VAT registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorVATregDate" id="datepickerA" readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorCSTno"
												id="idvendorCSTno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>CST registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorCSTregDate" id="datepickerB" readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>PAN no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" name="vendorPANno"
												id="idvendorPANno">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegNo" id="idvendorExciseRegNo">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Excise registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorExciseRegDate" id="datepickerC"
												readonly="readonly">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration no:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegNo" id="idvendorServiceTaxRegNo">
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<b>Service tax registration date:</b>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control"
												name="vendorServiceTaxRegDate" id="datepickerD"
												readonly="readonly">
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<b>Tax group id:</b>
										</div>
										<div class="col-md-7">
											<select class="form-control" name="taxTypeGroupId"
												id="taxgroup">
												<!-- 	<option value="0">select a tax group</option> -->
												<c:forEach
													items="${sessionScope['ejb'].getAllTax_Type_Groups()}"
													var="taxTypeGroup">
													<option value="${taxTypeGroup.id}">${taxTypeGroup.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input type="button" value="Next" class="btn green pull-right"
										onclick="vendorButtonNext();"> <input type="button"
										value="Previous" class="btn green pull-left"
										onclick="vendorButtonPrev();">
								</div>
							</div>

							<div id="detail" class="tab-pane fade active in">
								<div class="widget-area">

									<div class="col-md-3">
										<b>Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorName"
											id="idName">
									</div>
									<br>
									<div class="col-md-3">
										<b>Company Name:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control"
											name="vendorCompanyName" id="idvendorCompanyName">
									</div>

									<div class="col-md-3">
										<b>Ph No1:</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh1"
											id="iphone">
									</div>

									<div class="col-md-3">
										<b>Ph No2:(optional)</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorPh2"
											id="idvendorPh2">
									</div>

									<div class="col-md-3">
										<b>Email :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorMail"
											style="text-transform: none;" id="idvendorMail">
									</div>

									<div class="col-md-3">
										<b>Alias name :</b>
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name="vendorAlias"
											id="idvendorAlias">
									</div>

									<div class="col-md-3">
										<b>Vendor type :</b>
									</div>
									<div class="col-md-9">

										<select class="form-control" name="vendorType"
											id="idvendorType" value="${vendor.vendorType}"
											disabled="disabled">

											<option value="0">Select Vendor Type</option>

											<c:forEach items="${sessionScope['ejb'].getAllVendorType()}"
												var="vType">

												<c:choose>
													<c:when
														test="${vType.type.equals('Vendor') || vType.type.equals('Purchase Agent')}">
														<option value="${vType.id}">${vType.type}</option>

													</c:when>
												</c:choose>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<!-- <input class="btn green pull-left" type="button"
														value="Previous" onclick="detailButtonPrev();"> -->
									<input class="btn green pull-right" type="button" value="Next"
										onclick="detailButtonNext();">
								</div>
							</div>
							<div id="address" class="tab-pane fade ">
								<div class="widget-area">
									<div class="row">
										<div class="col-md-3">
											<b>Address :</b>
										</div>

										<div class="col-md-9">
											<textarea rows="" cols="" class="form-control"
												name="vendorAddress" id="idAdd"></textarea>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-3">
											<b>City :</b>
										</div>
										<div class="col-md-8">
											<input type="text" class="form-control cityAuto"
												name="vendorCity" required="required" id="vendorCity"
												autocomplete="off"> <input type="hidden"
												name="vendorCityId" id="vendorCityId" autocomplete="off">
										</div>
										<div class="col-md-1">
											<a onclick="addCitySC()" title="Add New City"> <img
												style="margin-top: 4px; cursor: pointer" height="30px"
												width="30px" alt="" src="img/add.png">
											</a>

										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-3">
											<b>Pin code :</b>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="vendorPin"
												id="idvendorPin" required="required">
										</div>
									</div>
								</div>
								<br>
								<div class="col-md-12">
									<input class="btn green pull-left" type="button"
										value="Previous" onclick="addressButtonPrev();"> <input
										class="btn green pull-right" type="button" value="Next"
										onclick="addressButtonNext();">
								</div>
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


<script type="text/javascript">
		function submitform1() {
			var vID;
			var vvName;
			var vvphone1;
			var vvphone2;
			var vvadres;
			if ($("#idName").val() == 0) {
				alert("please select  name");
			} else if ($("#idvendorCompanyName").val() == "") {
				alert("please select Company Name");
			} else if ($("#iphone").val() == "") {
				alert("please select Ph No1");
			} else if ($("#idvendorMail").val() == "") {
				alert("please select email");
			} else if ($("#idvendorAlias").val() == "") {
				alert("please select Alias name");
			} else if ($("#cityname").val() == "") {
				alert("please select cityname");
			} else if ($("#idAdd").val() == "") {
				alert("please select Adress");
			} else if ($("#vendorCity").val() == "") {
				alert("please select vendor city");
			} else if ($("#idvendorPin").val() == "") {
				alert("please select pin code");
			} else if ($("#service").val() == "") {
				alert("please select Service Tax");
			} else {

				var dataa1 = {
					vendorName : $("#idName").val(),
					vendorAddress : $("#idAdd").val(),
					vendorAlias : $("#idvendorAlias").val(),
					vendorCityId : $("#vendorCityId").val(),
					vendorCompanyName : $("#idvendorCompanyName").val(),
					vendorMail : $("#idvendorMail").val(),
					vendorPh1 : $("#iphone").val(),
					vendorPh2 : $("#idvendorPh2").val(),
					vendorPin : $("#idvendorPin").val(),
					vendorType : $("#idvendorType").val(),
					bankAccNo : $("#idbankAccNo").val(),
					bankName : $("#idbankName").val(),
					bankCheckLebel : $("#idbankCheckLebel").val(),
					bankIFSC : $("#idbankIFSC").val(),
					bankMICR : $("#idbankMICR").val(),
					bankRTGS : $("#idbankRTGS").val(),
					bankBranch : $("#idbankBranch").val(),
					taxTypeGroupId : $("#taxgroup").val(),
					bankCity : $("#bankCityId").val(),
					vendorCSTno : $("#idvendorCSTno").val(),
					vendorCSTregDate : $("#datepickerB").val(),
					vendorExciseRegNo : $("#idvendorExciseRegNo").val(),
					vendorExciseRegDate : $("#datepickerC").val(),
					vendorVATno : $("#idvendorVATno").val(),
					vendorVATregDate : $("#datepickerA").val(),
					vendorServiceTaxRegNo : $("#idvendorServiceTaxRegNo").val(),
					vendorServiceTaxRegDate : $("#datepickerD").val(),
					vendorPANno : $("#idvendorPANno").val()
				};
				$.ajax({
					url : "addVendorbyjson",
					dataType : "json",
					data : dataa1,
					type : "post",
					success : function(data1) {
						alert(data1.result);
						vID = data1.vid;
						vvName = data1.vname;
						vvphone1 = data1.vph1;
						vvphone2 = data1.vph2;
						vvadres = data1.vvadd;
						$("#addV").modal('hide');
					},

					complete : function() {

						$("#vName").val(vvName);
						$("#vId").val(vID);
						$("#vDetail").val(
								"\nAddress :" + vvadres + "\nPhone1 : "
										+ vvphone1 + "\nPhone2 : " + vvphone2);
					}

				});
			}
		}
	</script>
























</body>
</html>