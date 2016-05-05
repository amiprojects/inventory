<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
private PurchaseOrderEntry purchaseOrderEntry;
	private PurchaseOrderProductdetails purchaseOrderProductdetails;

 "/purchaseOrderEntry",
		"/purchaseSearchForPORecieve", "/purchaseOrderReceive",
		
		
case "purchaseOrderEntry":
				page = "purchasingPurchaseOrderGive.jsp";

				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				purchaseOrderEntry = new PurchaseOrderEntry();
				paymentDetails = new PaymentDetails();

				List<PurchaseOrderEntry> purOdEty = ejb
						.getAllPurchaseOrderEntry();
				int fm1 = 0;
				for (PurchaseOrderEntry pe : purOdEty) {
					if (pe.getVendor_bill_no().equals(
							req.getParameter("vendorBillNo"))) {
						fm1 = 1;
						break;
					}
				}
				if (fm1 == 0) {
					purchaseOrderEntry.setVendor_bill_no(req.getParameter(
							"vendorBillNo").toUpperCase());

					dt = new Date();
					purchaseOrderEntry.setChallan_no(Integer.parseInt(req
							.getParameter("challanNo")));
					purchaseOrderEntry.setChallanSuffix(Integer.parseInt(req
							.getParameter("challanSuffix")));
					purchaseOrderEntry.setChallanNumber(req
							.getParameter("challanNumber"));

					purchaseOrderEntry.setPurchaseOrderDate(DateConverter
							.getDate(req.getParameter("purchaseDate")));
					purchaseOrderEntry.setVendor(ejb.getVendorById(Integer
							.parseInt(req.getParameter("vId"))));
					purchaseOrderEntry.setUsers(ejb.getUserById(httpSession
							.getAttribute("user").toString()));
					purchaseOrderEntry.setEntry_date(dt);

					purchaseOrderEntry.setSur_charge(Float.parseFloat(req
							.getParameter("surcharge")));
					purchaseOrderEntry.setTransport_cost(Float.parseFloat(req
							.getParameter("transportCost")));
					purchaseOrderEntry.setTotalCost(Float.parseFloat(req
							.getParameter("spAmount")));
					purchaseOrderEntry.setTax_Type_Group(ejb
							.getTax_Type_GroupById(Integer.parseInt(req
									.getParameter("taxGroup"))));
					purchaseOrderEntry.setSubTotal(Float.parseFloat(req
							.getParameter("subTotal")));
					purchaseOrderEntry.setTaxAmount(Float.parseFloat(req
							.getParameter("taxAmount")));

					purchaseOrderEntry.setCompanyInfo(ejb.getUserById(
							(String) httpSession.getAttribute("user"))
							.getCompanyInfo());
					purchaseOrderEntry.setRoundOf(Float.parseFloat(req
							.getParameter("roundvalue")));
					if (req.getParameter("isAgent").equals("yes")) {
						purchaseOrderEntry.setAgentId(Integer.parseInt(req
								.getParameter("agentName")));
					}
					ejb.setPurchaseOrderEntry(purchaseOrderEntry);

					if (ejb.getVoucherAssignByVendorId(
							Integer.parseInt(req.getParameter("vId"))).size() == 0) {
						voucherAssign = new VoucherAssign();
						vendor = ejb.getVendorById(Integer.parseInt(req
								.getParameter("vId")));
						voucherAssign.setVendor(vendor);
						voucherAssign.setVoucherDetailsNumber(vendor.getPh1());
						ejb.setVoucherAssign(voucherAssign);
					} else {
						voucherAssign = ejb.getVoucherAssignByVendorId(
								Integer.parseInt(req.getParameter("vId"))).get(
								0);
					}

					if (!req.getParameter("pstatus").equals("Full Paid")) {
						voucherDetails = new VoucherDetails();
						voucherDetails.setVoucherAssign(voucherAssign);
						voucherDetails.setCredit(true);
						voucherDetails.setValue(Float.parseFloat(req
								.getParameter("spDueAmount")));
						voucherDetails.setTotalCreditNote(Float.parseFloat(req
								.getParameter("finalDC")));
						if (ejb.getVoucherDetailsByVendorId(
								Integer.parseInt(req.getParameter("vId")))
								.size() == 0) {
							voucherDetails
									.setTotalCreditNote(Float.parseFloat(req
											.getParameter("spDueAmount")));
						} else {
							float totalCreditNote = ejb
									.getVoucherDetailsByVendorId(
											Integer.parseInt(req
													.getParameter("vId")))
									.get(ejb.getVoucherDetailsByVendorId(
											Integer.parseInt(req
													.getParameter("vId")))
											.size() - 1).getTotalCreditNote();
							voucherDetails
									.setTotalCreditNote(Float.parseFloat(req
											.getParameter("spDueAmount"))
											+ totalCreditNote);
						}
						voucherDetails.setVoucherDate(DateConverter.getDate(req
								.getParameter("payDate")));
						voucherDetails.setUsers(ejb
								.getUserById((String) httpSession
										.getAttribute("user")));
						voucherDetails
								.setPurchaseOrderEntry(purchaseOrderEntry);
						ejb.setVoucherDetails(voucherDetails);
					}

					paymentDetails.setPaymentDate(DateConverter.getDate(req
							.getParameter("payDate")));
					paymentDetails.setTotalAmount(Float.parseFloat(req
							.getParameter("spAmount")));
					paymentDetails.setPaidAmount(Float.parseFloat(req
							.getParameter("spPaymentAmount")));
					paymentDetails.setDescription(req.getParameter("desc"));
					paymentDetails.setPurchaseOrderEntry(purchaseOrderEntry);
					paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
							.getParameter("pType")));
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus(req
									.getParameter("pstatus")));
					ejb.setPaymentDetails(paymentDetails);

					String attr1a[] = req.getParameterValues("attr1H");
					String attr2a[] = req.getParameterValues("attr2H");
					String attr3a[] = req.getParameterValues("attr3H");
					String attr4a[] = req.getParameterValues("attr4H");
					String attr5a[] = req.getParameterValues("attr5H");
					String attr6a[] = req.getParameterValues("attr6H");

					String mrpa[] = req.getParameterValues("mrpH");
					String wspa[] = req.getParameterValues("wspH");

					String qtya[] = req.getParameterValues("qtyH");
					String costa[] = req.getParameterValues("rateH");
					String productIda[] = req.getParameterValues("pCodeIdH");

					for (int l = 0; l < qtya.length; l++) {
						purchaseOrderProductdetails = new PurchaseOrderProductdetails();

						purchaseOrderProductdetails.setAttrValue1(attr1a[l]);
						purchaseOrderProductdetails.setAttrValue2(attr2a[l]);
						purchaseOrderProductdetails.setAttrValue3(attr3a[l]);
						purchaseOrderProductdetails.setAttrValue4(attr4a[l]);
						purchaseOrderProductdetails.setAttrValue5(attr5a[l]);
						purchaseOrderProductdetails.setAttrValue6(attr6a[l]);
						purchaseOrderProductdetails.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productIda[l])));
						if (req.getParameter("isSalable").equals("yes")) {
							purchaseOrderProductdetails.setMrp(Float
									.parseFloat(mrpa[l]));
							purchaseOrderProductdetails.setWsp(Float
									.parseFloat(wspa[l]));
						}

						purchaseOrderProductdetails.setQuantity(Float
								.parseFloat(qtya[l]));

						purchaseOrderProductdetails
								.setRemaining_quantity(Integer
										.parseInt(qtya[l]));
						purchaseOrderProductdetails.setCost(Float
								.parseFloat(costa[l]));
						purchaseOrderProductdetails
								.setPurchaseOrderEntry(purchaseOrderEntry);
						purchaseOrderProductdetails.setCompanyInfo(companyInfo);
						ejb.setPurchaseOrderProductdetails(purchaseOrderProductdetails);

						purchaseOrderProductdetails = null;
					}

					req.setAttribute("print", 0);

					req.setAttribute("purDetIdforPC",
							purchaseOrderEntry.getId());
					purchaseOrderEntry = null;
					msg = "Purchase order was successfull.";
				} else {
					msg = "Duplicate Vendor Bill no. not allowed.";
				}

				break;
				
case "purchaseOrderReceive":
				page = "purchasingPurchaseOrderRecive.jsp";

				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				purchaseEntry = new Purchase_Entry();
				paymentDetails = new PaymentDetails();

				purchaseEntry.setVendor_bill_no(req
						.getParameter("vendorBillNo").toUpperCase());

				dt = new Date();
				purchaseEntry.setChallan_no(Integer.parseInt(req
						.getParameter("challanNo")));
				purchaseEntry.setChallanSuffix(Integer.parseInt(req
						.getParameter("challanSuffix")));
				purchaseEntry.setChallanNumber(req
						.getParameter("challanNumber"));
				purchaseEntry.setPurchase_date(dt);
				purchaseEntry.setVendor(ejb.getVendorById(Integer.parseInt(req
						.getParameter("vId"))));
				purchaseEntry.setUsers(ejb.getUserById(httpSession
						.getAttribute("user").toString()));
				purchaseEntry.setEntry_date(dt);

				purchaseEntry.setSur_charge(Float.parseFloat(req
						.getParameter("surcharge")));

				purchaseEntry.setTransport_cost(Float.parseFloat(req
						.getParameter("transportCost")));

				purchaseEntry.setTotalCost(Float.parseFloat(req
						.getParameter("spAmount")));

				purchaseEntry.setTax_Type_Group(ejb
						.getTax_Type_GroupById(Integer.parseInt(req
								.getParameter("taxGroupID"))));

				purchaseEntry.setSubTotal(Float.parseFloat(req
						.getParameter("subTotalname")));
				purchaseEntry.setTaxAmount(Float.parseFloat(req
						.getParameter("taxAmount")));

				purchaseEntry.setCompanyInfo(ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo());
				purchaseEntry.setRoundOf(Float.parseFloat(req
						.getParameter("roundvalue")));

				if (req.getParameter("agentyes").equals("yes")) {
					purchaseEntry.setAgentId(Integer.parseInt(req
							.getParameter("agentName")));
				}
				purchaseEntry.setPurchaseOrderEntry(purchaseOrderEntry);
				ejb.setPurchaseEntry(purchaseEntry);

				if (ejb.getVoucherAssignByVendorId(
						Integer.parseInt(req.getParameter("vId"))).size() == 0) {
					voucherAssign = new VoucherAssign();
					vendor = ejb.getVendorById(Integer.parseInt(req
							.getParameter("vId")));
					voucherAssign.setVendor(vendor);
					voucherAssign.setVoucherDetailsNumber(vendor.getPh1());
					ejb.setVoucherAssign(voucherAssign);
				} else {
					voucherAssign = ejb.getVoucherAssignByVendorId(
							Integer.parseInt(req.getParameter("vId"))).get(0);
				}

				if (!req.getParameter("pstatus").equals("Full Paid")) {
					voucherDetails = new VoucherDetails();
					voucherDetails.setVoucherAssign(voucherAssign);
					voucherDetails.setCredit(true);
					voucherDetails.setValue(Float.parseFloat(req
							.getParameter("spDueAmount")));
					voucherDetails.setTotalCreditNote(Float.parseFloat(req
							.getParameter("finalDC")));
					if (ejb.getVoucherDetailsByVendorId(
							Integer.parseInt(req.getParameter("vId"))).size() == 0) {
						voucherDetails.setTotalCreditNote(Float.parseFloat(req
								.getParameter("spDueAmount")));
					} else {
						float totalCreditNote = ejb
								.getVoucherDetailsByVendorId(
										Integer.parseInt(req
												.getParameter("vId")))
								.get(ejb.getVoucherDetailsByVendorId(
										Integer.parseInt(req
												.getParameter("vId"))).size() - 1)
								.getTotalCreditNote();
						voucherDetails
								.setTotalCreditNote(Float.parseFloat(req
										.getParameter("spDueAmount"))
										+ totalCreditNote);
					}
					voucherDetails.setVoucherDate(DateConverter.getDate(req
							.getParameter("payDate")));
					voucherDetails.setUsers(ejb
							.getUserById((String) httpSession
									.getAttribute("user")));
					voucherDetails.setPurchase_Entry(purchaseEntry);
					ejb.setVoucherDetails(voucherDetails);
				}

				paymentDetails.setPaymentDate(DateConverter.getDate(req
						.getParameter("payDate")));
				paymentDetails.setTotalAmount(Float.parseFloat(req
						.getParameter("spAmount")));
				paymentDetails.setPaidAmount(Float.parseFloat(req
						.getParameter("spPaymentAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				paymentDetails.setPurchase_Entry(purchaseEntry);
				paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
						.getParameter("pType")));
				paymentDetails.setPaymentStatus(ejb
						.getPaymentStatusByStatus(req.getParameter("pstatus")));
				ejb.setPaymentDetails(paymentDetails);

				String attr1[] = req.getParameterValues("attr1H");
				String attr2[] = req.getParameterValues("attr2H");
				String attr3[] = req.getParameterValues("attr3H");
				String attr4[] = req.getParameterValues("attr4H");
				String attr5[] = req.getParameterValues("attr5H");
				String attr6[] = req.getParameterValues("attr6H");

				String mrp[] = req.getParameterValues("mrpH");
				String wsp[] = req.getParameterValues("wspH");

				String qty[] = req.getParameterValues("rQty");
				String cost[] = req.getParameterValues("rateH");
				String productIdaa[] = req
						.getParameterValues("purProductDetailsID");
				String lot[] = req.getParameterValues("lotH");
				String isRawable[] = req.getParameterValues("isRawable");

				for (int l = 0; l < qty.length; l++) {
					purchaseProductDetails = new Purchase_Product_Details();
					purchaseProductDetails.setAttrValue1(attr1[l]);
					purchaseProductDetails.setAttrValue2(attr2[l]);
					purchaseProductDetails.setAttrValue3(attr3[l]);
					purchaseProductDetails.setAttrValue4(attr4[l]);
					purchaseProductDetails.setAttrValue5(attr5[l]);
					purchaseProductDetails.setAttrValue6(attr6[l]);
					purchaseProductDetails.setProductDetail(ejb
							.getProductDetailsById(Integer
									.parseInt(productIdaa[l])));
					if (req.getParameter("isSalable").equals("yes")) {
						purchaseProductDetails.setMrp(Float.parseFloat(mrp[l]));
						purchaseProductDetails.setWsp(Float.parseFloat(wsp[l]));
					}

					purchaseProductDetails
							.setQuantity(Integer.parseInt(qty[l]));

					purchaseProductDetails.setRemaining_quantity(Integer
							.parseInt(qty[l]));
					purchaseProductDetails.setCost(Float.parseFloat(cost[l]));
					purchaseProductDetails.setPurchase_Entry(purchaseEntry);
					purchaseProductDetails.setLotNumber(lot[l]);
					purchaseProductDetails.setCompanyInfo(companyInfo);
					ejb.setPurchaseProductDetails(purchaseProductDetails);
					if (isRawable[l].equals("yesRaw")) {

						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductId(Integer
										.parseInt(productIdaa[l]));
						rawMaterialsStock.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productIdaa[l])));
						rawMaterialsStock.setRemainingQty(rawMaterialsStock
								.getRemainingQty() + Integer.parseInt(qty[l]));
						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						rawMaterialsStock = null;
					} else {

						readyGoodsStock = ejb
								.getReadyGoodsStoctByProductId(Integer
										.parseInt(productIdaa[l]));
						readyGoodsStock.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productIdaa[l])));
						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty() + Float.parseFloat(qty[l]));
						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
						readyGoodsStock = null;
					}

					purchaseOrderProductdetails = ejb
							.getPurchaseOrderProductdetailsByPurchaseOrderIdandProdctId(
									Integer.parseInt(req
											.getParameter("purOrId")), Integer
											.parseInt(productIdaa[l]));
					float g = purchaseOrderProductdetails
							.getRemaining_quantity() - Float.parseFloat(qty[l]);
					purchaseOrderProductdetails.setRemaining_quantity(g);
					ejb.updatePurchaseOrderProductdetails(purchaseOrderProductdetails);
					purchaseProductDetails = null;

				}
				if (req.getParameter("isBarPrint").equals("yes")) {
					req.setAttribute("print", 1);
					req.setAttribute("purDet", purchaseEntry.getId());
				} else {
					req.setAttribute("print", 0);
				}

				req.setAttribute("purDetIdforPC", purchaseEntry.getId());

				purchaseEntry = null;
				msg = "Purchase Order Receive was successfull.";

				break;
				
case "purchaseSearchForPORecieve":
				page = "purchasingPurchaseOrderRecive.jsp";

				List<PurchaseOrderEntry> purOListR = ejb
						.getPurchaseOrderByChallanNo(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));

				if (purOListR.size() > 0) {
					req.setAttribute("pId", purOListR.get(0).getId());

					msg = "Your search for Purchase order challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Purchase challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				}
				break;				
</body>
</html>