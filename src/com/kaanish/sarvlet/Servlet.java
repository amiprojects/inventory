package com.kaanish.sarvlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.Tax;

@WebServlet({"/addTax"})
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	Ejb ejb;
	private String page;
	private String msg;
	private String url;
	private Tax tax;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		url=req.getRequestURL().toString();
		url=url.substring(url.lastIndexOf('/')+1);
		
		try {
			switch (url) {
			case "addTax":
				page="setupTaxManagement.jsp";
				tax=new Tax();
				tax.setName(req.getParameter("name"));
				tax.setValue(Float.parseFloat(req.getParameter("value")));
				
				ejb.setTax(tax);
				msg="Tax added successfully.";
				break;

			default:
				break;
			}
		} catch (NumberFormatException e) {
			msg="error: "+e.getMessage();
			e.printStackTrace();
		}
		req.setAttribute("msg", msg);
		req.getRequestDispatcher(page).forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
