package com.kaanish.sarvlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.Country;
import com.kaanish.model.CustomerEntry;
import com.kaanish.model.Department;
import com.kaanish.model.JobAssignmentDetails;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobClass;
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.State;
import com.kaanish.util.GetMacId;

@WebServlet({ "/backup", "/restore", "/macid" })
public class BackupRestoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		// Date dt=new Date();
		switch (url) {

		case "backup":
			FileOutputStream fos;
			ObjectOutputStream oos;

			List<AccountDetails> accountDetails = ejb.getAllAccountDetails();
			fos = new FileOutputStream("backup/AccountDetails.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(accountDetails);

			List<Bill_setup> bill_setups = ejb.getAllBillSetup();
			fos = new FileOutputStream("backup/Bill_setup.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(bill_setups);

			List<Category> categories = ejb.getAllCategory();
			fos = new FileOutputStream("backup/Category.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(categories);

			List<State> states = ejb.getAllState();
			fos = new FileOutputStream("backup/State.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(states);

			List<City> cities = ejb.getAllCity();
			fos = new FileOutputStream("backup/City.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(cities);

			List<CompanyInfo> companyInfos = ejb.getAllCompanyInfo();
			fos = new FileOutputStream("backup/CompanyInfo.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(companyInfos);

			List<Country> countries = ejb.getAllCountry();
			fos = new FileOutputStream("backup/Country.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(countries);

			List<CustomerEntry> customerEntries = ejb.getAllCustomerEntry();
			fos = new FileOutputStream("backup/CustomerEntry.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(customerEntries);

			List<Department> departments = ejb.getAllDepartments();
			fos = new FileOutputStream("backup/Department.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(departments);

			List<JobAssignmentDetails> jobAssignmentDetails = ejb.getAllJobassignmentDetails();
			fos = new FileOutputStream("backup/JobAssignmentDetails.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(jobAssignmentDetails);

			List<JobAssignmentProducts> jobAssignmentProducts = ejb.getAllJobAssignmentProductDetails();
			fos = new FileOutputStream("backup/JobAssignmentProducts.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(jobAssignmentProducts);

			List<JobClass> jobClasses = ejb.getAllJobClasses();
			fos = new FileOutputStream("backup/JobClass.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(jobClasses);

			List<JobRecievedDetails> jobRecievedDetails = ejb.getAllJobRecievedDetails();
			fos = new FileOutputStream("backup/JobRecievedDetails.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(jobRecievedDetails);

			List<JobStock> jobStock = ejb.getAllJobStock();
			fos = new FileOutputStream("backup/JobStock.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(jobStock);

			List<Module> module = ejb.getAllModule();
			fos = new FileOutputStream("backup/Module.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(module);

			List<PageList> pageList = ejb.getAllPageList();
			fos = new FileOutputStream("backup/PageList.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(pageList);

			List<PaymentDetails> paymentDetails = ejb.getAllPaymentDetails();
			fos = new FileOutputStream("backup/PaymentDetails.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(paymentDetails);

			List<PaymentStatus> paymentStatus = ejb.getAllPaymentStatus();
			fos = new FileOutputStream("backup/PaymentStatus.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(paymentStatus);

			List<PaymentType> paymentType = ejb.getAllPaymentType();
			fos = new FileOutputStream("backup/PaymentType.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(paymentType);

			List<ProductDetail> productDetail = ejb.getAllProductDetail();
			fos = new FileOutputStream("backup/ProductDetail.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(productDetail);

			List<ProductImage> productImage = ejb.getAllProductImage();
			fos = new FileOutputStream("backup/ProductImage.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(productImage);

			List<Purchase_Entry> pPurchase_Entry = ejb.getAllPurchaseEntry();
			fos = new FileOutputStream("backup/Purchase_Entry.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(pPurchase_Entry);

			List<Purchase_Product_Details> pPurchase_Product_Details = ejb.getAllPurchase_Product_Details();
			fos = new FileOutputStream("backup/Purchase_Product_Details.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(pPurchase_Product_Details);

			List<QtyUnit> pQtyUnit = ejb.getAllQtyUnit();
			fos = new FileOutputStream("backup/QtyUnit.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(pQtyUnit);

			List<QtyUnitConversion> pQtyUnitConversion = ejb.getAllQtyUnitConversion();
			fos = new FileOutputStream("backup/QtyUnitConversion.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(pQtyUnitConversion);

			/*
			 * List<QtyUnitConversionPK> pQtyUnitConversionPK = ejb
			 * .getAllQtyUnitConversionPK(); FileOutputStream fos24 = new
			 * FileOutputStream( "backup/QtyUnitConversionPK.txt");
			 * ObjectOutputStream oos24 = new ObjectOutputStream(fos24);
			 * oos24.writeObject(pQtyUnitConversionPK); oos24.close();
			 * fos24.close();
			 */

			oos.close();
			fos.close();

			break;

		case "restore":
			FileInputStream fis;
			ObjectInputStream ois;

			fis = new FileInputStream(new File("backup/Country.txt"));
			ois = new ObjectInputStream(fis);
			List<Country> cont = new ArrayList<>();
			try {
				cont = (List<Country>) ois.readObject();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			for (Country c : cont) {
				for (Country c1 : ejb.getAllCountry()) {
					if (c1.getId() != c.getId()) {
						ejb.setCountry(c);
					}
				}
			}
			
			fis = new FileInputStream(new File("backup/State.txt"));
			ois = new ObjectInputStream(fis);
			List<State> state = new ArrayList<>();
			try {
				state = (List<State>) ois.readObject();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			for (State s : state) {
				for (State s1 : ejb.getAllState()) {
					if (s1.getId() != s.getId()) {
						ejb.setState(s);
					}
				}
			}
			
			
			

			fis.close();
			ois.close();
			break;
		case "macid":
			resp.getWriter().println(GetMacId.getMacId());
			break;

		default:
			break;
		}
	}
}
