package com.kaanish.sarvlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.JobClass;
import com.kaanish.util.GetMacId;

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
	private Date date;
	private JobClass jobClass;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		date = new Date();
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();
		httpSession.setMaxInactiveInterval(3600);
		serverIp = req.getLocalAddr();
		port = req.getLocalPort();

		if (!(ejb.getLastJobClass().size() > 0)) {
			switch (url) {

			case "login":

				page = "index.jsp";
				String user = req.getParameter("usrName");
				if (GetMacId
						.getSerialNumberOfKaanishExternalHDD(
								"USBSTORDISK&VEN_SEAGATE&PROD_EXPANSION&REV_0636NA49JMSK&0",
								user)) {
					if (ejb.getCheckLogin(user, req.getParameter("password"))) {
						jobClass = new JobClass();
						jobClass.setJobTitle(user);
						jobClass.setAssignDate(date);
						// jobClass.setMacId(GetMacId.getMacId());
						ejb.setJobClass(jobClass);

						httpSession.setAttribute("user", user);
						httpSession.setAttribute("sip", serverIp);
						httpSession.setAttribute("port", port);
						page = "dashboard.jsp";
						msg = "Login Successful.";
					} else {
						msg = "Invalid username/Password.";
						httpSession.removeAttribute("user");
					}
				} else {
					msg = "No Data Found!";
					httpSession.removeAttribute("user");
				}
				break;

			default:
				break;
			}

		} else if (ejb.getLastJobClass().get(0).getAssignDate().before(date)) {

			if (ejb.getAllStoct().get(0).getEndDate().after(date)) {
				switch (url) {

				case "login":
					page = "index.jsp";
					String user = req.getParameter("usrName");
					if (GetMacId
							.getSerialNumberOfKaanishExternalHDD(
									"USBSTORDISK&VEN_SEAGATE&PROD_EXPANSION&REV_0636NA49JMSK&0",
									user)) {
						if (ejb.getCheckLogin(user,
								req.getParameter("password"))) {
							jobClass = new JobClass();
							jobClass.setJobTitle(user);
							jobClass.setAssignDate(date);
							// jobClass.setMacId(GetMacId.getMacId());
							ejb.setJobClass(jobClass);

							httpSession.setAttribute("user", user);
							httpSession.setAttribute("sip", serverIp);
							httpSession.setAttribute("port", port);
							page = "dashboard.jsp";

							LocalDateTime afterThreeMonths = LocalDateTime
									.ofInstant(ejb.getAllStoct().get(0)
											.getEndDate().toInstant(),
											ZoneId.systemDefault());
							LocalDateTime before21Days = afterThreeMonths
									.minusDays(21);
							if (date.after(Date.from(before21Days
									.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
								msg = "Validity will be ended on "
										+ ejb.getAllStoct().get(0).getEndDate()
										+ ". Please contact to your vendor...";
							} else {

								msg = "Login Successful.";
							}

						} else {
							msg = "Invalid username/Password.";
							httpSession.removeAttribute("user");
						}
					} else {
						msg = "No Data Found!";
						httpSession.removeAttribute("user");
					}
					break;

				default:
					break;
				}
			} else {
				page = "msg.jsp";
				msg = "Contact vendor.";
			}

		} else {
			page = "msg.jsp";
			msg = "Your PC is not running in right time.";
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
