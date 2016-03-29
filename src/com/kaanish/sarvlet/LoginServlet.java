package com.kaanish.sarvlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
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
import com.kaanish.model.Bill_setup;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.JobClass;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.Stoct;
import com.kaanish.model.Users;
import com.kaanish.model.VendorType;
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
	private LocalDateTime currentDateTime = LocalDateTime.now();
	private JobClass jobClass;
	private QtyUnitType qtyUnitType;
	private PaymentStatus paymentStatus;
	private PaymentType paymentType;
	private Module module;
	private PageList pageList;
	private VendorType vendorType;
	private Users usersKaanish;
	private Users usersKainat;
	private CompanyInfo companyInfoKaanish;
	private CompanyInfo companyInfoKainat;
	private Stoct stoct;
	private Bill_setup bill_setup;
	private SecurityQuestionGroup securityQuestionGroup;
	private SequrityQuestions securityQuestions;

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
		if (ejb.getAllPaymentType().size() < 4) {

			List<String> str = new ArrayList<>();
			str.add("Cash");
			str.add("Cheque");
			str.add("Bank Transfer");
			// str.add("Voucher");
			str.add("Credit Note");
			str.add("Debit Note");

			for (String s : str) {
				paymentType = new PaymentType();
				paymentType.setType(s);
				ejb.setPaymentType(paymentType);
			}

		}
		if (ejb.getAllVendorType().size() < 5) {

			List<String> str = new ArrayList<>();
			str.add("Vendor");
			str.add("Sales Agent");
			str.add("Purchase Agent");
			str.add("Jobber");
			str.add("Designer");

			for (String s : str) {
				vendorType = new VendorType();
				vendorType.setType(s);
				ejb.setVendorType(vendorType);
			}

		}

		if (!ejb.isCompanyInfoExist()) {
			companyInfoKaanish = new CompanyInfo();
			companyInfoKaanish.setCompname("Kaanish Kouture");
			ejb.setCompanyInfo(companyInfoKaanish);

			companyInfoKainat = new CompanyInfo();
			companyInfoKainat.setCompname("Kainat Kreation");
			ejb.setCompanyInfo(companyInfoKainat);
		}
		if (ejb.getAllUsers().size() < 2) {
			usersKaanish = new Users();
			usersKaanish.setUserId("adminKaanish");
			usersKaanish.setPassword("admin");
			usersKaanish.setName("Kaanish Admin");
			usersKaanish.setPh("0");
			usersKaanish.setCompanyInfo(companyInfoKaanish);
			ejb.setUser(usersKaanish);

			usersKainat = new Users();
			usersKainat.setUserId("adminKainatjj");
			usersKainat.setPassword("adminfd");
			usersKainat.setName("Kainat Admin");
			usersKainat.setPh("0");
			usersKainat.setCompanyInfo(companyInfoKainat);
			ejb.setUser(usersKainat);
		}
		if (ejb.getAllBillSetup().size() < 14) {
			/*
			 * companyInfoKaanish = ejb.getUserById("adminKaanish")
			 * .getCompanyInfo(); companyInfoKainat =
			 * ejb.getUserById("adminKainat").getCompanyInfo();
			 */

			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
			
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
			
			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKaanish);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfoKainat);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}
		if (ejb.getAllStoct().size() < 1) {
			LocalDateTime afterThreeMonths = currentDateTime.plusMonths(3);
			stoct = new Stoct();
			stoct.setStartDate(Date.from(currentDateTime.toInstant(ZoneOffset
					.ofHoursMinutes(5, 30))));
			stoct.setEndDate(Date.from(afterThreeMonths.toInstant(ZoneOffset
					.ofHoursMinutes(5, 30))));
			stoct.setStockNumber(GetMacId.getMacId());
			ejb.setStoct(stoct);
		}
		if (ejb.getAllSecurityQuestionGroups().size() < 2) {
			securityQuestionGroup = new SecurityQuestionGroup();
			securityQuestionGroup.setName("First");
			ejb.setSecurityQueGroup(securityQuestionGroup);
			securityQuestionGroup = null;

			securityQuestionGroup = new SecurityQuestionGroup();
			securityQuestionGroup.setName("Favourite");
			ejb.setSecurityQueGroup(securityQuestionGroup);
			securityQuestionGroup = null;
		}
		if (ejb.getAllSecurityQuestions().size() < 10) {
			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("First"));
			securityQuestions.setQuestion("What is the place you borned?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("First"));
			securityQuestions.setQuestion("What is your first friend's name?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("First"));
			securityQuestions.setQuestion("What is your first teacher's name?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("First"));
			securityQuestions
					.setQuestion("What is the name of your first school?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("First"));
			securityQuestions.setQuestion("What is your pet's name?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("Favourite"));
			securityQuestions.setQuestion("What is your favourite food?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("Favourite"));
			securityQuestions.setQuestion("What is your favourite movie?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("Favourite"));
			securityQuestions.setQuestion("Who is your favourite person?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("Favourite"));
			securityQuestions.setQuestion("Who is your favourite player?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;

			securityQuestions = new SequrityQuestions();
			securityQuestions.setSecurityQuestionGroup(ejb
					.getSecurityQueGroupByGroupName("Favourite"));
			securityQuestions
					.setQuestion("Who is your favourite Actor/Actress?");
			ejb.setSecurityQue(securityQuestions);
			securityQuestions = null;
		}

	}

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

		} else if (ejb.getLastJobClass().get(0).getAssignDate().before(date)) {

			if (ejb.getAllStoct().get(0).getEndDate().after(date)) {
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

						/*
						 * LocalDateTime afterThreeMonths = LocalDateTime
						 * .ofInstant(ejb.getAllStoct().get(0)
						 * .getEndDate().toInstant(), ZoneId.systemDefault());
						 * LocalDateTime before21Days = afterThreeMonths
						 * .minusDays(21); if (date.after(Date.from(before21Days
						 * .toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) { msg
						 * = "Validity will be ended on " +
						 * ejb.getAllStoct().get(0).getEndDate() +
						 * ". Please contact to your vendor..."; } else {
						 */
						msg = "Login Successful.";
						/* } */

					} else {
						msg = "Invalid username/Password.";
						httpSession.removeAttribute("user");
					}
					break;

				default:
					break;
				}
			} else {
				page = "msg.jsp";
				msg = "Software validity is over.";
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
