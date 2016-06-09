<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
// correcting voucher details
							for (VoucherAssign va : ejb.getAllVoucherAssign()) {
								float totCr = 0;
								float totDb = 0;

								for (int ind = 0; ind < ejb.getAllVoucherDetailsByVoucherAssignId(va.getId())
										.size(); ind++) {
									VoucherDetails vd = ejb.getAllVoucherDetailsByVoucherAssignId(va.getId()).get(ind);
									if (vd.isCredit()) {
										totCr = totCr + vd.getValue();
									} else {
										totDb = totDb + vd.getValue();
									}

									if (vd.getVoucherAssign().getVendor() != null) {
										vd.setTotalCreditNote(totCr - totDb);
										ejb.updateVoucherDetails(vd);
									} else if (vd.getVoucherAssign().getCustomerEntry() != null) {
										vd.setTotalDebitNote(totDb - totCr);
										ejb.updateVoucherDetails(vd);
									}
								}
							}
// correcting voucher details

// correcting purchase entry payment details
							for (Purchase_Entry pe : ejb.getAllPurchaseEntry()) {
								int pSize = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId()).size();
								if (pSize > 0) {
									float tot = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId()).get(pSize - 1)
											.getTotalAmount();
									for (int ind = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId()).size()
											- 1; ind > -1; ind--) {
										PaymentDetails paymentDetails = ejb
												.getPaymentDetailsByPurchaseEntryId(pe.getId()).get(ind);
										paymentDetails.setTotalAmount(tot);
										tot = tot - paymentDetails.getPaidAmount();
										ejb.updatePaymentDetails(paymentDetails);
									}
								}
							}
// correcting purchase entry payment details

// correcting lot number
								for (ProductDetail pd : ejb.getAllProductDetail()) {
									for (int pdQ = 0; pdQ < ejb.getPurchaseProductDetailsByProductIdAsc(pd.getId())
											.size(); pdQ++) {
										Purchase_Product_Details purchase_Product_Details = ejb
												.getPurchaseProductDetailsByProductIdAsc(pd.getId()).get(pdQ);
										int j = pdQ + 1;
										purchase_Product_Details.setLotNumber("" + j);
										ejb.updatePurchaseProductDetails(purchase_Product_Details);
									}
								}
// correcting lot number

// correcting sales entry payment details
							for (SalesEntry se : ejb.getAllSalesEntries()) {
								int pSize = ejb
										.getPaymentDetailsBySalesEntryId(
												se.getId()).size();
								if (pSize > 0) {
									float tot = ejb
											.getPaymentDetailsBySalesEntryId(
													se.getId()).get(pSize - 1)
											.getTotalAmount();
									for (int ind = ejb
											.getPaymentDetailsBySalesEntryId(
													se.getId()).size() - 1; ind > -1; ind--) {
										PaymentDetails paymentDetails = ejb
												.getPaymentDetailsBySalesEntryId(
														se.getId()).get(ind);
										paymentDetails.setTotalAmount(tot);
										tot = tot
												- paymentDetails
														.getPaidAmount();
										ejb.updatePaymentDetails(paymentDetails);
									}
								}
							}
// correcting sales entry payment details

// correcting job assignment payment details
						for (JobAssignmentDetails ja : ejb
								.getAllJobassignmentDetails()) {
							int pSize = ejb.getPaymentDetailsByJobAsignId(
									ja.getId()).size();
							if (pSize > 0) {
								float tot = ejb
										.getPaymentDetailsByJobAsignId(
												ja.getId()).get(pSize - 1)
										.getTotalAmount();
								for (int ind = ejb
										.getPaymentDetailsByJobAsignId(
												ja.getId()).size() - 1; ind > -1; ind--) {
									PaymentDetails paymentDetails = ejb
											.getPaymentDetailsByJobAsignId(
													ja.getId()).get(ind);
									paymentDetails.setTotalAmount(tot);
									tot = tot - paymentDetails.getPaidAmount();
									ejb.updatePaymentDetails(paymentDetails);
								}
							}
						}
// correcting job assignment payment details


</body>
</html>