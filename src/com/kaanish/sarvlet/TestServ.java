package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.Dngr;
import com.kaanish.model.PaymentDetailsForViaAgents;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.Vendor;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetailsForViaAgents;

@WebServlet({ "/testServ" })
public class TestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	public void init() throws ServletException {
		String userId = "adminProduction";
		// String userId="adminKaanish";
		// String userId="adminKainat";

		boolean toDeleteViaAgentPaymentAndVoucher = true;
		for (Dngr dng : ejb.getAllDngr()) {
			if (dng.getWhatDone().equals("deletedViaAgentPaymentAndVoucher")) {
				toDeleteViaAgentPaymentAndVoucher = false;
				break;
			}
		}
		if (toDeleteViaAgentPaymentAndVoucher) {
			for (PaymentDetailsForViaAgents pd : ejb
					.getAllPaymentDetails4ViaAgent()) {
				ejb.deletePaymentDetails4ViaAgent(pd.getId());
			}
			for (VoucherDetailsForViaAgents vd : ejb
					.getAllVoucherDetails4ViaAgent()) {
				ejb.deleteVoucherDetails4ViaAgentById(vd.getId());
			}

			Dngr dngr = new Dngr();
			dngr.setWhatDone("deletedViaAgentPaymentAndVoucher");
			ejb.setDngr(dngr);
		}

		boolean toAddViaAgentPaymentAndVoucherForSales = true;
		for (Dngr dng : ejb.getAllDngr()) {
			if (dng.getWhatDone().equals(
					"toAddViaAgentPaymentAndVoucherForSales")) {
				toAddViaAgentPaymentAndVoucherForSales = false;
				break;
			}
		}
		if (toAddViaAgentPaymentAndVoucherForSales) {
			for (SalesEntry se : ejb.getAllSalesEntries()) {
				if (se.getVendor() != null) {
					int uniqueNo = ejb.getLastUniqueNoOfPayDet4ViaAgent() + 1;

					VoucherAssign voucherAssign;
					Vendor vendor;
					VoucherDetailsForViaAgents voucherDetForViaAgent;
					PaymentDetailsForViaAgents payDetForViaAgent;

					if (ejb.getVoucherAssignByVendorId(se.getVendor().getId())
							.size() == 0) {
						voucherAssign = new VoucherAssign();
						vendor = ejb.getVendorById(se.getVendor().getId());
						voucherAssign.setVendor(vendor);
						voucherAssign.setVoucherDetailsNumber(vendor.getPh1());
						ejb.setVoucherAssign(voucherAssign);
					} else {
						voucherAssign = ejb.getVoucherAssignByVendorId(
								se.getVendor().getId()).get(0);
					}

					voucherDetForViaAgent = new VoucherDetailsForViaAgents();
					voucherDetForViaAgent.setVoucherAssignId(voucherAssign
							.getId());
					voucherDetForViaAgent.setAgentId(se.getVendor().getId());
					voucherDetForViaAgent.setSalesEntryId(se.getId());
					voucherDetForViaAgent.setCredit(true);
					voucherDetForViaAgent.setValue(se.getAgentProfitTotal());
					voucherDetForViaAgent.setVoucherDate(se.getSales_date());
					voucherDetForViaAgent.setEntryDate(new Date());
					voucherDetForViaAgent.setUserId(userId);
					ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

					payDetForViaAgent = new PaymentDetailsForViaAgents();
					payDetForViaAgent.setPaymentDate(se.getSales_date());
					payDetForViaAgent.setEntryDate(new Date());
					payDetForViaAgent.setPaidAmount(0);
					payDetForViaAgent.setSalesEntryId(se.getId());
					payDetForViaAgent.setAgentId(se.getVendor().getId());
					payDetForViaAgent.setPaymentStatusId(ejb
							.getPaymentStatusByStatus("Not Paid").getId());
					payDetForViaAgent.setUniqueNo(uniqueNo);
					payDetForViaAgent.setUserId(userId);
					ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);

					if (se.isEfectiveProfit()) {
						for (SalesReturn sr : se.getSalesReturn()) {
							uniqueNo = ejb.getLastUniqueNoOfPayDet4ViaAgent() + 1;

							voucherDetForViaAgent = new VoucherDetailsForViaAgents();
							voucherDetForViaAgent
									.setVoucherAssignId(voucherAssign.getId());
							voucherDetForViaAgent.setAgentId(se.getVendor()
									.getId());
							voucherDetForViaAgent.setSalesEntryId(se.getId());
							voucherDetForViaAgent.setSalesReturnId(sr.getId());
							voucherDetForViaAgent.setCredit(false);
							voucherDetForViaAgent.setValue(sr
									.getRetAgentProfitTotal());
							voucherDetForViaAgent.setVoucherDate(sr
									.getReturnDate());
							voucherDetForViaAgent.setEntryDate(new Date());
							voucherDetForViaAgent.setUserId(userId);
							ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

							payDetForViaAgent = new PaymentDetailsForViaAgents();
							payDetForViaAgent
									.setPaymentDate(sr.getReturnDate());
							payDetForViaAgent.setEntryDate(new Date());
							payDetForViaAgent.setPaidAmount(sr
									.getRetAgentProfitTotal());
							payDetForViaAgent.setSalesEntryId(se.getId());
							payDetForViaAgent.setSalesReturnId(sr.getId());
							payDetForViaAgent
									.setAgentId(se.getVendor().getId());
							payDetForViaAgent.setPaymentTypeId(ejb
									.getPaymentTypeByType("Credit Note")
									.getId());
							payDetForViaAgent.setPaymentStatusId(ejb
									.getPaymentStatusByStatus("Semi Paid")
									.getId());
							payDetForViaAgent.setUniqueNo(uniqueNo);
							payDetForViaAgent.setUserId(userId);
							ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
						}
					}
				}
			}

			Dngr dngr = new Dngr();
			dngr.setWhatDone("toAddViaAgentPaymentAndVoucherForSales");
			ejb.setDngr(dngr);
		}

		boolean toAddViaAgentPaymentAndVoucherForPurchase = true;
		for (Dngr dng : ejb.getAllDngr()) {
			if (dng.getWhatDone().equals(
					"toAddViaAgentPaymentAndVoucherForPurchase")) {
				toAddViaAgentPaymentAndVoucherForPurchase = false;
				break;
			}
		}
		if (toAddViaAgentPaymentAndVoucherForPurchase) {
			for (Purchase_Entry pe : ejb.getAllPurchaseEntry()) {
				if (pe.getAgentId() != 0) {
					int uniqueNo = ejb.getLastUniqueNoOfPayDet4ViaAgent() + 1;

					VoucherAssign voucherAssign;
					Vendor vendor;
					VoucherDetailsForViaAgents voucherDetForViaAgent;
					PaymentDetailsForViaAgents payDetForViaAgent;

					if (ejb.getVoucherAssignByVendorId(pe.getAgentId()).size() == 0) {
						voucherAssign = new VoucherAssign();
						vendor = ejb.getVendorById(pe.getAgentId());
						voucherAssign.setVendor(vendor);
						voucherAssign.setVoucherDetailsNumber(vendor.getPh1());
						ejb.setVoucherAssign(voucherAssign);
					} else {
						voucherAssign = ejb.getVoucherAssignByVendorId(
								pe.getAgentId()).get(0);
					}

					voucherDetForViaAgent = new VoucherDetailsForViaAgents();
					voucherDetForViaAgent.setVoucherAssignId(voucherAssign
							.getId());
					voucherDetForViaAgent.setAgentId(pe.getAgentId());
					voucherDetForViaAgent.setPurchaseEntryId(pe.getId());
					voucherDetForViaAgent.setCredit(true);
					voucherDetForViaAgent.setValue(pe.getAgentProfitTotal());
					voucherDetForViaAgent.setVoucherDate(pe.getPurchase_date());
					voucherDetForViaAgent.setEntryDate(new Date());
					voucherDetForViaAgent.setUserId(userId);
					ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

					payDetForViaAgent = new PaymentDetailsForViaAgents();
					payDetForViaAgent.setPaymentDate(pe.getPurchase_date());
					payDetForViaAgent.setEntryDate(new Date());
					payDetForViaAgent.setPaidAmount(0);
					payDetForViaAgent.setPurchaseEntryId(pe.getId());
					payDetForViaAgent.setAgentId(pe.getAgentId());
					payDetForViaAgent.setPaymentStatusId(ejb
							.getPaymentStatusByStatus("Not Paid").getId());
					payDetForViaAgent.setUniqueNo(uniqueNo);
					payDetForViaAgent.setUserId(userId);
					ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);

					if (pe.isEfectiveProfit()) {
						for (PurchaseReturn pr : pe.getPurchaseReturn()) {
							uniqueNo = ejb.getLastUniqueNoOfPayDet4ViaAgent() + 1;

							voucherDetForViaAgent = new VoucherDetailsForViaAgents();
							voucherDetForViaAgent
									.setVoucherAssignId(voucherAssign.getId());
							voucherDetForViaAgent.setAgentId(pe.getAgentId());
							voucherDetForViaAgent
									.setPurchaseEntryId(pe.getId());
							voucherDetForViaAgent.setPurchaseReturnId(pr
									.getId());
							voucherDetForViaAgent.setCredit(false);
							voucherDetForViaAgent.setValue(pr
									.getRetAgentProfitTotal());
							voucherDetForViaAgent.setVoucherDate(pr
									.getReturnDate());
							voucherDetForViaAgent.setEntryDate(new Date());
							voucherDetForViaAgent.setUserId(userId);
							ejb.setVoucherDetails4ViaAgent(voucherDetForViaAgent);

							payDetForViaAgent = new PaymentDetailsForViaAgents();
							payDetForViaAgent
									.setPaymentDate(pr.getReturnDate());
							payDetForViaAgent.setEntryDate(new Date());
							payDetForViaAgent.setPaidAmount(pr
									.getRetAgentProfitTotal());
							payDetForViaAgent.setPurchaseEntryId(pe.getId());
							payDetForViaAgent.setPurchaseReturnId(pr.getId());
							payDetForViaAgent.setAgentId(pe.getAgentId());
							payDetForViaAgent.setPaymentTypeId(ejb
									.getPaymentTypeByType("Credit Note")
									.getId());
							payDetForViaAgent.setPaymentStatusId(ejb
									.getPaymentStatusByStatus("Semi Paid")
									.getId());
							payDetForViaAgent.setUniqueNo(uniqueNo);
							payDetForViaAgent.setUserId(userId);
							ejb.setPaymentDetails4ViaAgent(payDetForViaAgent);
						}
					}
				}
			}

			Dngr dngr = new Dngr();
			dngr.setWhatDone("toAddViaAgentPaymentAndVoucherForPurchase");
			ejb.setDngr(dngr);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");

		PrintWriter out = resp.getWriter();
		out.println("<h1>" + "Successfull..." + "</h1>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
