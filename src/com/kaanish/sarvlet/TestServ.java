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
import com.kaanish.model.Dngr;
import com.kaanish.model.PaymentDetailsForViaAgents;
import com.kaanish.model.VoucherDetailsForViaAgents;

@WebServlet({ "/testServ" })
public class TestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	public void init() throws ServletException {
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
