package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kaanish.ejb.Ejb;

@WebServlet("/getcountry")
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	Ejb ejb;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		resp.setContentType("application/json");
		PrintWriter pw=resp.getWriter();
		try {
			switch (url) {
			case "getcountry":				
				String cat=new Gson().toJson(ejb.getCountryByName(req.getParameter("term")));
				pw.print(cat);				
				break;

			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
