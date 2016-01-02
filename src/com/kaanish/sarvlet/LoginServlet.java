package com.kaanish.sarvlet;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaanish.ejb.Ejb;

@WebServlet({ "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private HttpSession httpSession;
	private String page;
	private String msg;
	private String url;
	private String serverIp;
	private int port;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();
		serverIp = req.getLocalAddr();
		port = req.getLocalPort();
		switch (url) {

		case "login":
			page = "index.jsp";
			String user = req.getParameter("usrName");
			if (ejb.getCheckLogin(user, req.getParameter("password"))) {
				httpSession.setAttribute("user", user);
				httpSession.setAttribute("sip", serverIp);
				httpSession.setAttribute("port", port);
				page = "dashboard.jsp";
				msg = "Login Successful.";
			} else {
				msg = "Invalid username/Password.";
				httpSession.removeAttribute("user");
			}
			break;

		default:
			break;
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
