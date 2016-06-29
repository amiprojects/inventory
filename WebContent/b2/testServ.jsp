package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VoucherDetails;

@WebServlet({ "/testServ" })
public class TestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	public void init() throws ServletException {
		Users user = ejb.getUserById("adminKaanish");
		user.setUserId("adminProduction");
		ejb.updateUser(user);
		for (Tax tax : ejb.getAllTax()) {
			tax.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateTax(tax);
		}
		for (Tax_Type_Group ttg : ejb.getAllTax_Type_Groups()) {
			ttg.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateTaxTypeGroup(ttg);
		}
		for (SalesReturn salesReturn : ejb.getAllSalesReturn()) {
			salesReturn.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateSalesReturn(salesReturn);
		}
		for (VoucherDetails voucherDetails : ejb.getAllVoucherDetails()) {
			voucherDetails.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateVoucherDetails(voucherDetails);
		}
		for (AccountDetails accountDetails : ejb.getAllAccountDetails()) {
			accountDetails.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateAccountDetails(accountDetails);
		}
		for (Purchase_Entry puEntry : ejb.getAllPurchaseEntry()) {
			puEntry.setUsers(ejb.getUserById("adminProduction"));
			ejb.updatePurchaseEntry(puEntry);
		}
		for (Vendor vendor : ejb.getAllVendors()) {
			vendor.setUsers(ejb.getUserById("adminProduction"));
			ejb.updateVendor(vendor);
		}
		ejb.deleteUserById("adminKaanish");
		
		
		public void init() throws ServletException {
		for (int i = 0; i < ejb.getAllPaymentDetailsAsc().size(); i++) {
			PaymentDetails paymentDetails = ejb.getAllPaymentDetailsAsc()
					.get(i);
			int j = i + 1;
			paymentDetails.setUniqueNo(j);
			ejb.updatePaymentDetails(paymentDetails);
		}
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
