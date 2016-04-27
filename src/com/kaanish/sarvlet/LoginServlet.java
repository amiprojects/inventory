package com.kaanish.sarvlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
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
import com.kaanish.model.AccountDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.JobClass;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.Stoct;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.GetMacId;

@WebServlet({ "/login", "/test" })
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
	private Users usersKainat;
	private Users usersKaanish;
	private CompanyInfo companyInfoKainat;
	private Stoct stoct;
	private Bill_setup bill_setup;
	private SecurityQuestionGroup securityQuestionGroup;
	private SequrityQuestions securityQuestions;
	private CompanyInfo companyInfo;
	private CompanyInfo companyInfoKaanish;
	private Vendor vendor;
	private Date dt;
	private AccountDetails accountDetails;

	@Override
	public void init() throws ServletException {
		// adding module and pages

		// deleting and editing bekars, kainat kaanish
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("JOB")) {
				module = ejb.getModuleByName("JOB");
				module.setName("Job");
				ejb.updateModule(module);
				break;
			}
		}
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Sales module")) {
				module = ejb.getModuleByName("Sales module");
				module.setName("Sales");
				ejb.updateModule(module);
				break;
			}
		}
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Purchase Module")) {
				module = ejb.getModuleByName("Purchase Module");
				module.setName("Purchase");
				ejb.updateModule(module);
				break;
			}
		}
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Discount")) {
				pageList = ejb.getPageByName("Discount");
				ejb.deletePageListById(pageList.getId());
				break;
			}
		}
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("dashboard")) {
				pageList = ejb.getPageByName("dashboard");
				pageList.setName("Dashboard");
				ejb.updatePageList(pageList);
				break;
			}
		}
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Vendor Management")) {
				pageList = ejb.getPageByName("Vendor Management");
				ejb.deletePageListById(pageList.getId());
				break;
			}
		}
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("MaterialPartDetailsGenerals")) {
				pageList = ejb.getPageByName("MaterialPartDetailsGenerals");
				pageList.setName("Product/Material");
				ejb.updatePageList(pageList);
				break;
			}
		}
		// deleting and editing bekars

		// dashboard
		int flagMdashboard = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Dashboard")) {
				flagMdashboard = 1;
				module = ejb.getModuleByName("Dashboard");
				break;
			}
		}
		if (flagMdashboard == 0) {
			module = new Module();
			module.setName("Dashboard");
			ejb.setModule(module);
		}

		int flagPdashboard = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Dashboard")) {
				flagPdashboard = 1;
				break;
			}
		}
		if (flagPdashboard == 0) {
			pageList = new PageList();
			pageList.setName("Dashboard");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// dashboard

		// reports
		int flagMreport = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Reports")) {
				flagMreport = 1;
				module = ejb.getModuleByName("Reports");
				break;
			}
		}
		if (flagMreport == 0) {
			module = new Module();
			module.setName("Reports");
			ejb.setModule(module);
		}

		int flagPreport = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Report")) {
				flagPreport = 1;
				break;
			}
		}
		if (flagPreport == 0) {
			pageList = new PageList();
			pageList.setName("Report");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// reports

		// products
		int flagMproduct = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Product/Material")) {
				flagMproduct = 1;
				module = ejb.getModuleByName("Product/Material");
				break;
			}
		}
		if (flagMproduct == 0) {
			module = new Module();
			module.setName("Product/Material");
			ejb.setModule(module);
		}

		int flagPproduct = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Product/Material")) {
				flagPproduct = 1;
				break;
			}
		}
		if (flagPproduct == 0) {
			pageList = new PageList();
			pageList.setName("Product/Material");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// products

		// purchase
		int flagMpurchase = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Purchase")) {
				flagMpurchase = 1;
				module = ejb.getModuleByName("Purchase");
				break;
			}
		}
		if (flagMpurchase == 0) {
			module = new Module();
			module.setName("Purchase");
			ejb.setModule(module);
		}

		int flagPpe = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Purchase Entry")) {
				flagPpe = 1;
				break;
			}
		}
		if (flagPpe == 0) {
			pageList = new PageList();
			pageList.setName("Purchase Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPps = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Purchase Search")) {
				flagPps = 1;
				break;
			}
		}
		if (flagPps == 0) {
			pageList = new PageList();
			pageList.setName("Purchase Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPrps = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Ready Production Search")) {
				flagPrps = 1;
				break;
			}
		}
		if (flagPrps == 0) {
			pageList = new PageList();
			pageList.setName("Ready Production Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPpr = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Purchase Return")) {
				flagPpr = 1;
				break;
			}
		}
		if (flagPpr == 0) {
			pageList = new PageList();
			pageList.setName("Purchase Return");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPpedit = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Purchase Edit")) {
				flagPpedit = 1;
				break;
			}
		}
		if (flagPpedit == 0) {
			pageList = new PageList();
			pageList.setName("Purchase Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// purchase

		// sales
		int flagMsale = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Sales")) {
				flagMsale = 1;
				module = ejb.getModuleByName("Sales");
				break;
			}
		}
		if (flagMsale == 0) {
			module = new Module();
			module.setName("Sales");
			ejb.setModule(module);
		}

		int flagPse = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sales Entry")) {
				flagPse = 1;
				break;
			}
		}
		if (flagPse == 0) {
			pageList = new PageList();
			pageList.setName("Sales Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPss = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sales Search")) {
				flagPss = 1;
				break;
			}
		}
		if (flagPss == 0) {
			pageList = new PageList();
			pageList.setName("Sales Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsr = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sales Return")) {
				flagPsr = 1;
				break;
			}
		}
		if (flagPsr == 0) {
			pageList = new PageList();
			pageList.setName("Sales Return");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// sales

		// vendor
		int flagMvendor = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Vendor")) {
				flagMvendor = 1;
				module = ejb.getModuleByName("Vendor");
				break;
			}
		}
		if (flagMvendor == 0) {
			module = new Module();
			module.setName("Vendor");
			ejb.setModule(module);
		}

		int flagPve = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Vendor/Agent/Jobber/Designer")) {
				flagPve = 1;
				break;
			}
		}
		if (flagPve == 0) {
			pageList = new PageList();
			pageList.setName("Vendor/Agent/Jobber/Designer");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPvedit = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Vendor/Agent/Jobber/Designer Edit")) {
				flagPvedit = 1;
				break;
			}
		}
		if (flagPvedit == 0) {
			pageList = new PageList();
			pageList.setName("Vendor/Agent/Jobber/Designer Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// vendor

		// stock
		int flagMstock = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Stock")) {
				flagMstock = 1;
				module = ejb.getModuleByName("Stock");
				break;
			}
		}
		if (flagMstock == 0) {
			module = new Module();
			module.setName("Stock");
			ejb.setModule(module);
		}

		int flagPs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Stock")) {
				flagPs = 1;
				break;
			}
		}
		if (flagPs == 0) {
			pageList = new PageList();
			pageList.setName("Stock");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// stock

		// job
		int flagMjob = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Job")) {
				flagMjob = 1;
				module = ejb.getModuleByName("Job");
				break;
			}
		}
		if (flagMjob == 0) {
			module = new Module();
			module.setName("Job");
			ejb.setModule(module);
		}

		int flagPja = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Assignment")) {
				flagPja = 1;
				break;
			}
		}
		if (flagPja == 0) {
			pageList = new PageList();
			pageList.setName("Job Assignment");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPjs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Search")) {
				flagPjs = 1;
				break;
			}
		}
		if (flagPjs == 0) {
			pageList = new PageList();
			pageList.setName("Job Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPjr = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Recieve")) {
				flagPjr = 1;
				break;
			}
		}
		if (flagPjr == 0) {
			pageList = new PageList();
			pageList.setName("Job Recieve");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsjcs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sample Job CostSheet")) {
				flagPsjcs = 1;
				break;
			}
		}
		if (flagPsjcs == 0) {
			pageList = new PageList();
			pageList.setName("Sample Job CostSheet");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsjcss = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sample Job CostSheet Search")) {
				flagPsjcss = 1;
				break;
			}
		}
		if (flagPsjcss == 0) {
			pageList = new PageList();
			pageList.setName("Sample Job CostSheet Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsjplan = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Plan")) {
				flagPsjplan = 1;
				break;
			}
		}
		if (flagPsjplan == 0) {
			pageList = new PageList();
			pageList.setName("Job Plan");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsjpay = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Payment")) {
				flagPsjpay = 1;
				break;
			}
		}
		if (flagPsjpay == 0) {
			pageList = new PageList();
			pageList.setName("Job Payment");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// job

		// setup
		int flagMsetup = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Setup")) {
				flagMsetup = 1;
				module = ejb.getModuleByName("Setup");
				break;
			}
		}
		if (flagMsetup == 0) {
			module = new Module();
			module.setName("Setup");
			ejb.setModule(module);
		}

		int flagPci = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Company Info")) {
				flagPci = 1;
				break;
			}
		}
		if (flagPci == 0) {
			pageList = new PageList();
			pageList.setName("Company Info");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPcie = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Company Info Edit")) {
				flagPcie = 1;
				break;
			}
		}
		if (flagPcie == 0) {
			pageList = new PageList();
			pageList.setName("Company Info Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPuom = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Unit Of Measure")) {
				flagPuom = 1;
				break;
			}
		}
		if (flagPuom == 0) {
			pageList = new PageList();
			pageList.setName("Unit Of Measure");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPu = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("User")) {
				flagPu = 1;
				break;
			}
		}
		if (flagPu == 0) {
			pageList = new PageList();
			pageList.setName("User");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPug = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("User Group")) {
				flagPug = 1;
				break;
			}
		}
		if (flagPug == 0) {
			pageList = new PageList();
			pageList.setName("User Group");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPd = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Department/Sub-Department/Category")) {
				flagPd = 1;
				break;
			}
		}
		if (flagPd == 0) {
			pageList = new PageList();
			pageList.setName("Department/Sub-Department/Category");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPtm = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("TaxManagement")) {
				flagPtm = 1;
				break;
			}
		}
		if (flagPtm == 0) {
			pageList = new PageList();
			pageList.setName("TaxManagement");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPtme = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("TaxManagement Edit")) {
				flagPtme = 1;
				break;
			}
		}
		if (flagPtme == 0) {
			pageList = new PageList();
			pageList.setName("TaxManagement Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPcsc = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Country/State/City")) {
				flagPcsc = 1;
				break;
			}
		}
		if (flagPcsc == 0) {
			pageList = new PageList();
			pageList.setName("Country/State/City");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPbs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Bill Setup")) {
				flagPbs = 1;
				break;
			}
		}
		if (flagPbs == 0) {
			pageList = new PageList();
			pageList.setName("Bill Setup");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPbse = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Bill Setup Edit")) {
				flagPbse = 1;
				break;
			}
		}
		if (flagPbse == 0) {
			pageList = new PageList();
			pageList.setName("Bill Setup Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPjsetup = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Setup")) {
				flagPjsetup = 1;
				break;
			}
		}
		if (flagPjsetup == 0) {
			pageList = new PageList();
			pageList.setName("Job Setup");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPjse = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Job Setup Edit")) {
				flagPjse = 1;
				break;
			}
		}
		if (flagPjse == 0) {
			pageList = new PageList();
			pageList.setName("Job Setup Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPis = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Item Setup")) {
				flagPis = 1;
				break;
			}
		}
		if (flagPis == 0) {
			pageList = new PageList();
			pageList.setName("Item Setup");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPise = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Item Setup Edit")) {
				flagPise = 1;
				break;
			}
		}
		if (flagPise == 0) {
			pageList = new PageList();
			pageList.setName("Item Setup Edit");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// setup

		// adding module and pages

		// if (ejb.getAllPageList().size() < 20) {
		// module = new Module();
		// module.setName("Dashboard");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("dashboard");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Product/Material");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("MaterialPartDetailsGenerals");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Purchase Module");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Purchase Entry");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Purchase Search");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Vendor Management");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Sales module");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Sales Entry");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Sales Return");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Discount");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Stock");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Stock");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("JOB");
		// ejb.setModule(module);
		//
		// pageList = new PageList();
		// pageList.setName("Job Assignment");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Job Recieve");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Job Search");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		//
		// module = new Module();
		// module.setName("Setup");
		// ejb.setModule(module);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Company Info");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Unit Of Measure");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("User");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("User Group");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Department/Sub-Department/Category");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("TaxManagement");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Country/State/City");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// pageList = null;
		//
		// pageList = new PageList();
		// pageList.setName("Bill Setup");
		// pageList.setModule(module);
		// ejb.setPageList(pageList);
		//
		// module = null;
		// pageList = null;
		// }

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
			// companyInfoKaanish = new CompanyInfo();
			// companyInfoKaanish.setCompname("Kaanish Kouture");
			// ejb.setCompanyInfo(companyInfoKaanish);

			companyInfoKaanish = new CompanyInfo();
			companyInfoKaanish.setCompname("KK");
			ejb.setCompanyInfo(companyInfoKaanish);

			// companyInfoKainat = new CompanyInfo();
			// companyInfoKainat.setCompname("Kainat Kreation");
			// ejb.setCompanyInfo(companyInfoKainat);
		}
		if (ejb.getAllUsers().size() < 1) {
			// usersKaanish = new Users();
			// usersKaanish.setUserId("adminKaanish");
			// usersKaanish.setPassword("admin");
			// usersKaanish.setName("Kaanish Admin");
			// usersKaanish.setPh("0");
			// usersKaanish.setCompanyInfo(companyInfoKaanish);
			// ejb.setUser(usersKaanish);
			//
			usersKaanish = new Users();
			usersKaanish.setUserId("adminKaanish");
			usersKaanish.setPassword("productionKaanish");
			usersKaanish.setName("Production Admin");
			usersKaanish.setPh("0");
			usersKaanish.setCompanyInfo(companyInfoKaanish);
			ejb.setUser(usersKaanish);

			// usersKainat = new Users();
			// usersKainat.setUserId("adminKainat");
			// usersKainat.setPassword("admin");
			// usersKainat.setName("Kainat Admin");
			// usersKainat.setPh("0");
			// usersKainat.setCompanyInfo(companyInfoKainat);
			// ejb.setUser(usersKainat);
		}

		// adding vendor
		int flagV = 0;
		for (Vendor v : ejb.getAllVendors()) {
			if (v.getName().equals("Production Vendor")) {
				flagV = 1;
				break;
			}
		}
		if (flagV == 0) {
			dt = new Date();
			vendor = new Vendor();
			vendor.setName("Production Vendor");
			vendor.setPh1("Production Phone");
			vendor.setAddress("NA");
			vendor.setAliseName("NA");
			vendor.setCompanyName("NA");
			vendor.setEmail("NA");
			vendor.setPh2("NA");
			vendor.setPinCode("NA");
			vendor.setLastModifiedDate(dt);
			vendor.setVendorType(ejb.getVendorTypeByName("Vendor"));
			// vendor.setUsers(ejb.getUserById("adminKainat"));
			vendor.setUsers(ejb.getUserById("adminKaanish"));
			ejb.setVendor(vendor);

			accountDetails = new AccountDetails();
			// accountDetails.setUsers(ejb.getUserById("adminKainat"));
			accountDetails.setUsers(ejb.getUserById("adminKaanish"));
			accountDetails.setVendor(vendor);
			ejb.setAccountDetails(accountDetails);
		}
		// adding vendor

		// correcting voucher details
		// purchase id
		for (PurchaseReturn pr : ejb.getAllPurchaseReturn()) {
			for (int i = 0; i < ejb.getAllVoucherDetailsByPurchaseReturnId(
					pr.getId()).size(); i++) {
				VoucherDetails vd = ejb.getAllVoucherDetailsByPurchaseReturnId(
						pr.getId()).get(i);
				vd.setPurchase_Entry(pr.getPurchaseEntry());
				ejb.updateVoucherDetails(vd);
			}
		}
		// purchase id
		// sales id
		for (SalesReturn sr : ejb.getAllSalesReturn()) {
			for (int i = 0; i < ejb.getAllVoucherDetailsBySalesReturnId(
					sr.getId()).size(); i++) {
				VoucherDetails vd = ejb.getAllVoucherDetailsBySalesReturnId(
						sr.getId()).get(i);
				vd.setSalesEntry(sr.getSalesEntry());
				ejb.updateVoucherDetails(vd);
			}
		}
		// sales id
		for (VoucherAssign va : ejb.getAllVoucherAssign()) {
			float totCr = 0;
			float totDb = 0;

			for (int i = 0; i < ejb.getAllVoucherDetailsByVoucherAssignId(
					va.getId()).size(); i++) {
				VoucherDetails vd = ejb.getAllVoucherDetailsByVoucherAssignId(
						va.getId()).get(i);
				if (vd.isCredit()) {
					totCr = totCr + vd.getValue();
				} else {
					totDb = totDb + vd.getValue();
				}

				if (vd.getVoucherAssign().getVendor() != null) {
					vd.setTotalCreditNote(totCr - totDb);
					ejb.updateVoucherDetails(vd);
				} else if (vd.getVoucherAssign().getCustomerEntry() != null) {
					vd.setTotalDebitNote(totDb - totCr);
					ejb.updateVoucherDetails(vd);
				}
			}
		}
		// correcting voucher details

		// correcting purchase entry payment details
		for (PurchaseReturn pr : ejb.getAllPurchaseReturn()) {
			for (int i = 0; i < ejb.getPaymentDetailsByPurchaseReturnId(
					pr.getId()).size(); i++) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsByPurchaseReturnId(pr.getId()).get(i);
				paymentDetails.setPurchase_Entry(pr.getPurchaseEntry());
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		for (Purchase_Entry pe : ejb.getAllPurchaseEntry()) {
			int pSize = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId())
					.size();
			float tot = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId())
					.get(pSize - 1).getTotalAmount();
			for (int i = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId())
					.size() - 1; i > -1; i--) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsByPurchaseEntryId(pe.getId()).get(i);
				paymentDetails.setTotalAmount(tot);
				tot = tot - paymentDetails.getPaidAmount();
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		for (PurchaseReturn pr : ejb.getAllPurchaseReturn()) {
			for (int i = 0; i < ejb.getPaymentDetailsByPurchaseReturnId(
					pr.getId()).size(); i++) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsByPurchaseReturnId(pr.getId()).get(i);
				if (paymentDetails.getTotalAmount() > paymentDetails
						.getPaidAmount()) {
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus("Semi Paid"));
				} else {
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus("Full Paid"));
				}
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		// correcting purchase entry payment details

		// correcting sales entry payment details
		for (SalesReturn sr : ejb.getAllSalesReturn()) {
			for (int i = 0; i < ejb
					.getPaymentDetailsBySalesReturnId(sr.getId()).size(); i++) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsBySalesReturnId(sr.getId()).get(i);
				paymentDetails.setSalesEntry(sr.getSalesEntry());
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		for (SalesEntry se : ejb.getAllSalesEntries()) {
			int pSize = ejb.getPaymentDetailsBySalesEntryId(se.getId()).size();
			float tot = ejb.getPaymentDetailsBySalesEntryId(se.getId())
					.get(pSize - 1).getTotalAmount();
			for (int i = ejb.getPaymentDetailsBySalesEntryId(se.getId()).size() - 1; i > -1; i--) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsBySalesEntryId(se.getId()).get(i);
				paymentDetails.setTotalAmount(tot);
				tot = tot - paymentDetails.getPaidAmount();
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		for (SalesReturn sr : ejb.getAllSalesReturn()) {
			for (int i = 0; i < ejb
					.getPaymentDetailsBySalesReturnId(sr.getId()).size(); i++) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsBySalesReturnId(sr.getId()).get(i);
				if (paymentDetails.getTotalAmount() > paymentDetails
						.getPaidAmount()) {
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus("Semi Paid"));
				} else {
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus("Full Paid"));
				}
				ejb.updatePaymentDetails(paymentDetails);
			}
		}
		// correcting sales entry payment details

		if (ejb.getAllBillSetup().size() < 8) {
			// companyInfoKaanish = ejb.getUserById("adminKaanish")
			// .getCompanyInfo();
			// companyInfoKainat =
			// ejb.getUserById("adminKainat").getCompanyInfo();

			companyInfo = ejb.getUserById("adminKaanish").getCompanyInfo();

			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("PUR");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("RPUR");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("PURO");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("INV");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("SRINV");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("JOB");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOBR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("JOBR");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;

			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKaanish);
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;

			// bill_setup = new Bill_setup();
			// bill_setup.setBillType("ROAD");
			// bill_setup.setCompanyInitial("KK");
			// bill_setup.setSufix("000");
			// bill_setup.setCompanyInfo(companyInfoKainat);
			// ejb.setBillSetup(bill_setup);
			// bill_setup = null;
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
					jobClass.setMacId(GetMacId.getMacId());
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
						jobClass.setMacId(GetMacId.getMacId());
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
					break;
				case "test":
					resp.getWriter().println(GetMacId.getMacId());
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
