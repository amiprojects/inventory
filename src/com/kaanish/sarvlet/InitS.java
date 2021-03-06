package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.ApprovalProductDetails;
import com.kaanish.model.ApprovalReturnProductDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.JobAssignmentDetails;
import com.kaanish.model.JobAssignmentJobDetails;
import com.kaanish.model.JobPlan;
import com.kaanish.model.JobPlanJobStock;
import com.kaanish.model.JobPlanProductStock;
import com.kaanish.model.JobPlanProducts;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.PurchaseReturnProductDetails;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.Stoct;
import com.kaanish.model.URL;
import com.kaanish.model.UniqueName;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.GetMacId;

@WebServlet({ "/justclick" })
public class InitS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private LocalDateTime currentDateTime = LocalDateTime.now();
	private QtyUnitType qtyUnitType;
	private PaymentStatus paymentStatus;
	private PaymentType paymentType;
	private Module module;
	private PageList pageList;
	private VendorType vendorType;
	private Users users;
	private Stoct stoct;
	private Bill_setup bill_setup;
	private SecurityQuestionGroup securityQuestionGroup;
	private SequrityQuestions securityQuestions;
	private CompanyInfo companyInfo;
	private Vendor vendor;
	private Date dt;
	private AccountDetails accountDetails;

	@Override
	public void init() throws ServletException {
		// here

		// iKaanish();
		// iKainat();
		iProduction();

		// ////////////////////////////////////////////////////////

		// stock manage
		// delete bekar job plans
		for (JobPlan jp : ejb.getAllJobPlan()) {
			if (jp.getJobAssignmentDetails().size() > 0) {
				// System.out.println(jp.getId() + "bekarNo");
			} else {
				System.out.println(jp.getId() + "bekarYes");
				for (JobPlanProducts jpp : jp.getJobPlanProducts()) {
					for (JobPlanJobStock jpjs : jpp.getJobPlanJobStock()) {
						ejb.deleteJobPlanJobStockById(jpjs.getId());
					}
					ejb.deleteJobPlanProductsById(jpp.getId());
				}
				ejb.deleteJobPlanById(jp.getId());
				System.out.println("Plan " + jp.getId() + " deleted");
			}
		}
		// delete bekar job plans

		// total sales product return qty on salesproductdetails table
		for (SalesProductDetails spd : ejb.getAllSalesProductDetails()) {
			float qtyReturn = 0;
			for (SalesProductReturnDetail sprd : spd
					.getSalesProductReturnDetail()) {
				qtyReturn = qtyReturn + sprd.getQtyReturn();
			}
			spd.setSalesReQty(qtyReturn);
			ejb.updateSalesProductDetails(spd);
		}
		// total sales product return qty on salesproductdetails table

		// total sales product return qty on salesproductdetails table
		for (ApprovalProductDetails apd : ejb.getAllApprovalProductDetails()) {
			float qtyReturn = 0;
			for (ApprovalReturnProductDetails aprd : apd
					.getApprovalReturnProductDetail()) {
				qtyReturn = qtyReturn + aprd.getQtyReturn();
			}
			apd.setApprovalRetQty(qtyReturn);
			ejb.updateApprovalProductDetails(apd);
		}
		// total sales product return qty on salesproductdetails table

		// purchase product details table stock manage
		for (Purchase_Product_Details ppd : ejb
				.getAllPurchase_Product_Details()) {
			// total purchase product return qty on purchaseproductdetails table
			float qtyReturn = 0;
			for (PurchaseReturnProductDetails prpd : ppd
					.getPurchaseReturnProductDetails()) {
				qtyReturn = qtyReturn + prpd.getQtyReturn();
			}
			ppd.setTotalReturningQty(qtyReturn);
			// total purchase product return qty on purchaseproductdetails table
			float qtySold = 0;
			for (SalesProductDetails spd : ppd.getSalesProductDetails()) {
				qtySold = qtySold + spd.getQuantity() - spd.getSalesReQty();
			}
			float qtyApproved = 0;
			for (ApprovalProductDetails apd : ppd.getApprovalProductDetails()) {
				qtyApproved = qtyApproved + apd.getQuantity()
						- apd.getApprovalRetQty();
			}
			float qtyJobPlanProdStock = 0;
			for (JobPlanProductStock jpps : ppd.getJobPlanProductStocks()) {
				qtyJobPlanProdStock = qtyJobPlanProdStock + jpps.getQty();
			}
			ppd.setRemaining_quantity(ppd.getQuantity() - qtyReturn - qtySold
					- qtyApproved - qtyJobPlanProdStock);
			ejb.updatePurchaseProductDetails(ppd);
		}
		// purchase product details table stock manage

		// raw materials stock table stock manage
		for (RawMaterialsStock rms : ejb.getAllRawMaterialStockDetail()) {
			float remQty = 0;
			for (Purchase_Product_Details ppd : rms.getProductDetail()
					.getPurchase_Product_Details()) {
				remQty = remQty + ppd.getRemaining_quantity();
			}
			rms.setRemainingQty(remQty);
			ejb.updateRawMaterialStockDetail(rms);
			// System.out.println("Product " + rms.getProductDetail().getCode()
			// + ": " + qty + ", " + remQty);
		}
		// raw materials stock table stock manage
		// ready goods stock table stock manage
		for (ReadyGoodsStock rgs : ejb.getAllReadyGoodStockDetails()) {
			float remQty = 0;
			for (Purchase_Product_Details ppd : rgs.getProductDetail()
					.getPurchase_Product_Details()) {
				remQty = remQty + ppd.getRemaining_quantity();
			}
			rgs.setRemainingQty(remQty);
			ejb.updateReadyGoodsStockDetail(rgs);
		}
		// ready goods stock table stock manage
		// stock manage

		// correcting lot number
		for (ProductDetail pd : ejb.getAllProductDetail()) {
			for (int i = 0; i < ejb.getPurchaseProductDetailsByProductIdAsc(
					pd.getId()).size(); i++) {
				Purchase_Product_Details purchase_Product_Details = ejb
						.getPurchaseProductDetailsByProductIdAsc(pd.getId())
						.get(i);
				int j = i + 1;
				purchase_Product_Details.setLotNumber("" + j);
				ejb.updatePurchaseProductDetails(purchase_Product_Details);
			}
		}
		// correcting lot number

		// correcting payment details unique number
		for (int i = 0; i < ejb.getAllPaymentDetailsAsc().size(); i++) {
			PaymentDetails paymentDetails = ejb.getAllPaymentDetailsAsc()
					.get(i);
			int j = i + 1;
			paymentDetails.setUniqueNo(j);
			ejb.updatePaymentDetails(paymentDetails);
		}
		// correcting payment details unique number

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
			int paySize = ejb.getPaymentDetailsByPurchaseEntryId(pr.getId())
					.size();
			if (paySize > 0) {
				PaymentDetails paymentDetails = ejb
						.getPaymentDetailsByPurchaseEntryId(pr.getId()).get(
								paySize - 1);
				if (!paymentDetails.getPaymentStatus().getStatus()
						.equals("Full Paid")) {
					VoucherDetails vd = ejb
							.getAllVoucherDetailsByPurchaseEntryId(pr.getId())
							.get(0);
					vd.setValue(paymentDetails.getTotalAmount()
							- paymentDetails.getPaidAmount());
					ejb.updateVoucherDetails(vd);
				}
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
		// for (VoucherAssign va : ejb.getAllVoucherAssign()) {
		// float totCr = 0;
		// float totDb = 0;
		//
		// for (int i = 0; i <
		// ejb.getAllVoucherDetailsByVoucherAssignId(va.getId()).size(); i++) {
		// VoucherDetails vd =
		// ejb.getAllVoucherDetailsByVoucherAssignId(va.getId()).get(i);
		// if (vd.isCredit()) {
		// totCr = totCr + vd.getValue();
		// } else {
		// totDb = totDb + vd.getValue();
		// }
		//
		// if (vd.getVoucherAssign().getVendor() != null) {
		// vd.setTotalCreditNote(totCr - totDb);
		// ejb.updateVoucherDetails(vd);
		// } else if (vd.getVoucherAssign().getCustomerEntry() != null) {
		// vd.setTotalDebitNote(totDb - totCr);
		// ejb.updateVoucherDetails(vd);
		// }
		// }
		// }
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
			if (pSize > 0) {
				float tot = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId())
						.get(pSize - 1).getTotalAmount();
				for (int i = ejb.getPaymentDetailsByPurchaseEntryId(pe.getId())
						.size() - 1; i > -1; i--) {
					PaymentDetails paymentDetails = ejb
							.getPaymentDetailsByPurchaseEntryId(pe.getId())
							.get(i);
					paymentDetails.setTotalAmount(tot);
					tot = tot - paymentDetails.getPaidAmount();
					ejb.updatePaymentDetails(paymentDetails);
				}
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
			if (pSize > 0) {
				float tot = ejb.getPaymentDetailsBySalesEntryId(se.getId())
						.get(pSize - 1).getTotalAmount();
				for (int i = ejb.getPaymentDetailsBySalesEntryId(se.getId())
						.size() - 1; i > -1; i--) {
					PaymentDetails paymentDetails = ejb
							.getPaymentDetailsBySalesEntryId(se.getId()).get(i);
					paymentDetails.setTotalAmount(tot);
					tot = tot - paymentDetails.getPaidAmount();
					ejb.updatePaymentDetails(paymentDetails);
				}
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

		// correcting job assignment payment details
		for (JobAssignmentDetails ja : ejb.getAllJobassignmentDetails()) {
			int pSize = ejb.getPaymentDetailsByJobAsignId(ja.getId()).size();
			if (pSize > 0) {
				float tot = ejb.getPaymentDetailsByJobAsignId(ja.getId())
						.get(pSize - 1).getTotalAmount();
				for (int ind = ejb.getPaymentDetailsByJobAsignId(ja.getId())
						.size() - 1; ind > -1; ind--) {
					PaymentDetails paymentDetails = ejb
							.getPaymentDetailsByJobAsignId(ja.getId()).get(ind);
					paymentDetails.setTotalAmount(tot);
					tot = tot - paymentDetails.getPaidAmount();
					ejb.updatePaymentDetails(paymentDetails);
				}
			}
		}
		// correcting job assignment payment details

		// ////////////////////////////////////////////////////////////
		// URL
		if (ejb.getAllURL().size() < 1) {
			String uri = "http://aminfotrix.com/aminfotrix/inventory/kaanishkouture/";

			URL url = new URL();
			url.setUri(uri);
			ejb.setURL(url);
		}
		// URL

		// adding module and pages
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

		// notification
		int flagMnoti = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Notification")) {
				flagMnoti = 1;
				module = ejb.getModuleByName("Notification");
				break;
			}
		}
		if (flagMnoti == 0) {
			module = new Module();
			module.setName("Notification");
			ejb.setModule(module);
		}

		int flagPnoti = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Notifications")) {
				flagPnoti = 1;
				break;
			}
		}
		if (flagPnoti == 0) {
			pageList = new PageList();
			pageList.setName("Notifications");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// notification

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
		int flagPproducte = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Edit Product/Material")) {
				flagPproducte = 1;
				break;
			}
		}
		if (flagPproducte == 0) {
			pageList = new PageList();
			pageList.setName("Edit Product/Material");
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

		int flagPpapp = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("PurchaseAgentProfit Payment")) {
				flagPpapp = 1;
				break;
			}
		}
		if (flagPpapp == 0) {
			pageList = new PageList();
			pageList.setName("PurchaseAgentProfit Payment");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPprs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Purchase Return Search")) {
				flagPprs = 1;
				break;
			}
		}
		if (flagPprs == 0) {
			pageList = new PageList();
			pageList.setName("Purchase Return Search");
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

		int flagPsapp = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("SalesAgentProfit Payment")) {
				flagPsapp = 1;
				break;
			}
		}
		if (flagPsapp == 0) {
			pageList = new PageList();
			pageList.setName("SalesAgentProfit Payment");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsrs = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sales Return Search")) {
				flagPsrs = 1;
				break;
			}
		}
		if (flagPsrs == 0) {
			pageList = new PageList();
			pageList.setName("Sales Return Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPsed = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Sales Edit")) {
				flagPsed = 1;
				break;
			}
		}
		if (flagPsed == 0) {
			pageList = new PageList();
			pageList.setName("Sales Edit");
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

		int flagEditSampleCostSheet = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Edit Sample Job CostSheet")) {
				flagEditSampleCostSheet = 1;
				break;
			}
		}
		if (flagEditSampleCostSheet == 0) {
			pageList = new PageList();
			pageList.setName("Edit Sample Job CostSheet");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// job

		// approval
		int flagMapproval = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Approval")) {
				flagMapproval = 1;
				module = ejb.getModuleByName("Approval");
				break;
			}
		}
		if (flagMapproval == 0) {
			module = new Module();
			module.setName("Approval");
			ejb.setModule(module);
		}

		int flagApprovalEntry = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Approval Entry")) {
				flagApprovalEntry = 1;
				break;
			}
		}
		if (flagApprovalEntry == 0) {
			pageList = new PageList();
			pageList.setName("Approval Entry");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagApprovalSearch = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Approval Search")) {
				flagApprovalSearch = 1;
				break;
			}
		}
		if (flagApprovalSearch == 0) {
			pageList = new PageList();
			pageList.setName("Approval Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagApprovalReturn = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Approval Return")) {
				flagApprovalReturn = 1;
				break;
			}
		}
		if (flagApprovalReturn == 0) {
			pageList = new PageList();
			pageList.setName("Approval Return");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagApprovalReturnSearch = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Approval Return Search")) {
				flagApprovalReturnSearch = 1;
				break;
			}
		}
		if (flagApprovalReturnSearch == 0) {
			pageList = new PageList();
			pageList.setName("Approval Return Search");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// approval

		// note
		int flagMnote = 0;
		for (Module m : ejb.getAllModule()) {
			if (m.getName().equals("Debit/Credit Note")) {
				flagMnote = 1;
				module = ejb.getModuleByName("Debit/Credit Note");
				break;
			}
		}
		if (flagMnote == 0) {
			module = new Module();
			module.setName("Debit/Credit Note");
			ejb.setModule(module);
		}

		int flagPdn = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Debit Note")) {
				flagPdn = 1;
				break;
			}
		}
		if (flagPdn == 0) {
			pageList = new PageList();
			pageList.setName("Debit Note");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}

		int flagPcn = 0;
		for (PageList p : ejb.getAllPageList()) {
			if (p.getName().equals("Credit Note")) {
				flagPcn = 1;
				break;
			}
		}
		if (flagPcn == 0) {
			pageList = new PageList();
			pageList.setName("Credit Note");
			pageList.setModule(module);
			ejb.setPageList(pageList);
			pageList = null;
		}
		module = null;
		// note

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

		if (ejb.getAllStoct().size() < 1) {
			LocalDateTime afterThreeMonths = currentDateTime.plusMonths(3);
			stoct = new Stoct();
			stoct.setStartDate(Date.from(currentDateTime.toInstant(ZoneOffset
					.ofHoursMinutes(5, 30))));
			stoct.setEndDate(Date.from(afterThreeMonths.toInstant(ZoneOffset
					.ofHoursMinutes(5, 30))));
			try {
				stoct.setStockNumber(GetMacId.getMacId());
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("Error in getting HDD serial number: "
						+ e.getMessage());
			}
			ejb.setStoct(stoct);
		}

	}

	public void iProduction() {
		// unique
		if (ejb.getAllUniqueName().size() < 1) {
			String uniqueName = "AMi@Production125";

			UniqueName unique = new UniqueName();
			unique.setUniqueNm(uniqueName);
			ejb.setUniqueName(unique);
		}
		// unique

		if (!ejb.isCompanyInfoExist()) {
			String compName = "KK";

			companyInfo = new CompanyInfo();
			companyInfo.setCompname(compName);
			ejb.setCompanyInfo(companyInfo);
		}
		if (ejb.getAllUsers().size() < 1) {
			String userId = "adminProduction";
			String password = "productionKaanish";
			String name = "Production Admin";

			users = new Users();
			users.setUserId(userId);
			users.setPassword(password);
			users.setName(name);
			users.setPh("0");
			users.setCompanyInfo(companyInfo);
			ejb.setUser(users);
		}

		// vendor type
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
		// vendor type

		// adding vendor- production house only
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
			vendor.setUsers(ejb.getUserById("adminProduction"));
			ejb.setVendor(vendor);

			accountDetails = new AccountDetails();
			accountDetails.setUsers(ejb.getUserById("adminProduction"));
			accountDetails.setVendor(vendor);
			ejb.setAccountDetails(accountDetails);
		}
		// adding vendor- production house only

		// bill setup
		companyInfo = ejb.getUserById("adminProduction").getCompanyInfo();

		if (ejb.getLastBillSetupBySufix("PUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("RPUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("PURO") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("INV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("SRINV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOB") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOBR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOBR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("ROAD") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVAL") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVAL");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVALRETURN") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVALRETURN");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}
		// bill setup
	}

	public void iKaanish() {
		// unique
		if (ejb.getAllUniqueName().size() < 1) {
			String uniqueName = "AMi@Kaanish125";

			UniqueName unique = new UniqueName();
			unique.setUniqueNm(uniqueName);
			ejb.setUniqueName(unique);
		}
		// unique

		if (!ejb.isCompanyInfoExist()) {
			String compName = "Kaanish Kouture";

			companyInfo = new CompanyInfo();
			companyInfo.setCompname(compName);
			ejb.setCompanyInfo(companyInfo);
		}
		if (ejb.getAllUsers().size() < 1) {
			String userId = "adminKaanish";
			String password = "admin";
			String name = "Kaanish Admin";

			users = new Users();
			users.setUserId(userId);
			users.setPassword(password);
			users.setName(name);
			users.setPh("0");
			users.setCompanyInfo(companyInfo);
			ejb.setUser(users);
		}

		// vendor type
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
		// vendor type

		// bill setup
		companyInfo = ejb.getUserById("adminKaanish").getCompanyInfo();

		if (ejb.getLastBillSetupBySufix("PUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("RPUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("PURO") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("INV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("SRINV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOB") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOBR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOBR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("ROAD") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVAL") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVAL");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVALRETURN") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVALRETURN");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}
		// bill setup
	}

	public void iKainat() {
		// unique
		if (ejb.getAllUniqueName().size() < 1) {
			String uniqueName = "AMi@Kainat125";

			UniqueName unique = new UniqueName();
			unique.setUniqueNm(uniqueName);
			ejb.setUniqueName(unique);
		}
		// unique

		if (!ejb.isCompanyInfoExist()) {
			String compName = "Kainat Kreation";

			companyInfo = new CompanyInfo();
			companyInfo.setCompname(compName);
			ejb.setCompanyInfo(companyInfo);
		}
		if (ejb.getAllUsers().size() < 1) {
			String userId = "adminKainat";
			String password = "admin";
			String name = "Kainat Admin";

			users = new Users();
			users.setUserId(userId);
			users.setPassword(password);
			users.setName(name);
			users.setPh("0");
			users.setCompanyInfo(companyInfo);
			ejb.setUser(users);
		}

		// vendor type
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
		// vendor type

		// bill setup
		companyInfo = ejb.getUserById("adminKainat").getCompanyInfo();

		if (ejb.getLastBillSetupBySufix("PUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("RPUR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("RPUR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("PURO") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("PURO");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("INV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("INV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("SRINV") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("SRINV");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOB") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOB");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("JOBR") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("JOBR");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("ROAD") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("ROAD");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVAL") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVAL");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}

		if (ejb.getLastBillSetupBySufix("APPROVALRETURN") == null) {
			bill_setup = new Bill_setup();
			bill_setup.setBillType("APPROVALRETURN");
			bill_setup.setCompanyInitial("KK");
			bill_setup.setSufix("000");
			bill_setup.setCompanyInfo(companyInfo);
			ejb.setBillSetup(bill_setup);
			bill_setup = null;
		}
		// bill setup
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
