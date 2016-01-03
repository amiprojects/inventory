package com.kaanish.sarvlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.JobClass;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.Users;
import com.kaanish.model.VendorType;

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
	private QtyUnitType qtyUnitType;
	private PaymentStatus paymentStatus;
	private PaymentType paymentType;
	private Module module;
	private PageList pageList;
	private VendorType vendorType;
	private Users users;
	private CompanyInfo companyInfo;

	@Override
	public void init() throws ServletException {

		if (ejb.getAllPageList().size() < 5) {
			module = new Module();
			module.setName("Dashboard");
			ejb.setModule(module);
			pageList = new PageList();
			pageList.setName("dashboard");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Product/Material");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("MaterialPartDetailsGenerals");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Purchase Module");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Purchase Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Purchase Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Vendor Management");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Sales module");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Sales Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Sales Return");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Discount");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			module = null;
			pageList = null;

			module = new Module();
			module.setName("Stock");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Stock");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			module = null;
			pageList = null;

			module = new Module();
			module.setName("JOB");
			ejb.setModule(module);

			pageList = new PageList();
			pageList.setName("Job Assignment");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Job Recieve");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Job Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			module = null;
			pageList = null;

			module = new Module();
			module.setName("Setup");
			ejb.setModule(module);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Company Info");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Unit Of Measure");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("User");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("User Group");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Department/Sub-Department/Category");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("TaxManagement");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Country/State/City");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			pageList = null;
			pageList = new PageList();
			pageList.setName("Bill Setup");
			pageList.setModule(module);
			ejb.setPageList(pageList);

			module = null;
			pageList = null;
		}

		if (ejb.getAllQtyUnitTypes().size() < 6) {

			List<String> str = new ArrayList<>();
			str.add("Count");
			str.add("Weight");
			str.add("Length");
			str.add("Area");
			str.add("Volume");
			str.add("Time");

			for (String s : str) {
				qtyUnitType = new QtyUnitType();
				qtyUnitType.setName(s);
				ejb.setQtyUnitType(qtyUnitType);
			}

		}
		if (ejb.getAllPaymentStatus().size() < 3) {

			List<String> str = new ArrayList<>();
			str.add("Full Paid");
			str.add("Semi Paid");
			str.add("Not Paid");

			for (String s : str) {
				paymentStatus = new PaymentStatus();
				paymentStatus.setStatus(s);
				ejb.setPaymentStatus(paymentStatus);
			}

		}
		if (ejb.getAllPaymentType().size() < 3) {

			List<String> str = new ArrayList<>();
			str.add("Cash");
			str.add("Cheque");
			str.add("Bank Transfer");

			for (String s : str) {
				paymentType = new PaymentType();
				paymentType.setType(s);
				ejb.setPaymentType(paymentType);
			}

		}
		if (ejb.getAllVendorType().size() < 4) {

			List<String> str = new ArrayList<>();
			str.add("Vendor");
			str.add("Sales Agent");
			str.add("Purchase Agent");
			str.add("Jobber");

			for (String s : str) {
				vendorType = new VendorType();
				vendorType.setType(s);
				ejb.setVendorType(vendorType);
			}

		}

		if (!ejb.isCompanyInfoExist()) {
			companyInfo = new CompanyInfo();
			ejb.setCompanyInfo(companyInfo);
		}
		if (ejb.getAllUsers().size() == 0) {
			users = new Users();
			users.setUserId("admin");
			users.setPassword("admin");
			users.setName("admin");
			users.setPh("0");
			ejb.setUser(users);
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		date = new Date();
		if (!(ejb.getLastJobClass().size() > 0)) {
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
					jobClass = new JobClass();
					jobClass.setJobTitle(user);
					jobClass.setAssignDate(date);
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
				break;

			default:
				break;
			}

		}else if(ejb.getLastJobClass().get(0).getAssignDate().before(date)){
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
					jobClass = new JobClass();
					jobClass.setJobTitle(user);
					jobClass.setAssignDate(date);
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
				break;

			default:
				break;
			}

		}else{
			page="msg.jsp";
			msg="Your PC is not running in right time.";
		}

		req.setAttribute("msg", msg);
		req.getRequestDispatcher(page).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
