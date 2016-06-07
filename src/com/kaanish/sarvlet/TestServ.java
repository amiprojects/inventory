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
import com.kaanish.model.PaymentDetails;

@WebServlet({ "/testServ" })
public class TestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	public void init() throws ServletException {
		for (int i = 0; i < ejb.getAllPaymentDetailsAsc().size(); i++) {
			PaymentDetails paymentDetails = ejb.getAllPaymentDetailsAsc()
					.get(i);
			int j = i + 1;
			paymentDetails.setUniqueNo(j);
			ejb.updatePaymentDetails(paymentDetails);
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
