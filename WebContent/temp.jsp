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
							.getPaymentStatusByStatus(req
									.getParameter("pstatus")));
					ejb.setPaymentDetails(paymentDetails);