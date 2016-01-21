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
import com.kaanish.util.GetMacId;

@WebServlet({ "/backup", "/restore", "/macid" })
public class BackupRestoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		// Date dt=new Date();
		switch (url) {

		case "backup":
			List<AccountDetails> accountDetails = ejb.getAllAccountDetails();
			FileOutputStream fos2 = new FileOutputStream(
					"backup/AccountDetails.txt");
			ObjectOutputStream oos2 = new ObjectOutputStream(fos2);
			oos2.writeObject(accountDetails);
			oos2.close();
			fos2.close();

			List<Bill_setup> bill_setups = ejb.getAllBillSetup();
			FileOutputStream fos3 = new FileOutputStream(
					"backup/Bill_setup.txt");
			ObjectOutputStream oos3 = new ObjectOutputStream(fos3);
			oos3.writeObject(bill_setups);
			oos3.close();
			fos3.close();

			List<Category> categories = ejb.getAllCategory();
			FileOutputStream fos4 = new FileOutputStream("backup/Category.txt");
			ObjectOutputStream oos4 = new ObjectOutputStream(fos4);
			oos4.writeObject(categories);
			oos4.close();
			fos4.close();

			List<City> cities = ejb.getAllCity();
			FileOutputStream fos1 = new FileOutputStream("backup/City.txt");
			ObjectOutputStream oos1 = new ObjectOutputStream(fos1);
			oos1.writeObject(cities);
			oos1.close();
			fos1.close();

			List<CompanyInfo> companyInfos = ejb.getAllCompanyInfo();
			FileOutputStream fos5 = new FileOutputStream(
					"backup/CompanyInfo.txt");
			ObjectOutputStream oos5 = new ObjectOutputStream(fos5);
			oos5.writeObject(companyInfos);
			oos5.close();
			fos5.close();

			List<Country> countries = ejb.getAllCountry();
			FileOutputStream fos = new FileOutputStream("backup/Country.txt");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(countries);
			oos.close();
			fos.close();

			List<CustomerEntry> customerEntries = ejb.getAllCustomerEntry();
			FileOutputStream fos6 = new FileOutputStream(
					"backup/CustomerEntry.txt");
			ObjectOutputStream oos6 = new ObjectOutputStream(fos6);
			oos6.writeObject(customerEntries);
			oos6.close();
			fos6.close();

			List<Department> departments = ejb.getAllDepartments();
			FileOutputStream fos7 = new FileOutputStream(
					"backup/Department.txt");
			ObjectOutputStream oos7 = new ObjectOutputStream(fos7);
			oos7.writeObject(departments);
			oos7.close();
			fos7.close();

			List<JobAssignmentDetails> jobAssignmentDetails = ejb
					.getAllJobassignmentDetails();
			FileOutputStream fos8 = new FileOutputStream(
					"backup/JobAssignmentDetails.txt");
			ObjectOutputStream oos8 = new ObjectOutputStream(fos8);
			oos8.writeObject(jobAssignmentDetails);
			oos8.close();
			fos8.close();

			List<JobAssignmentProducts> jobAssignmentProducts = ejb
					.getAllJobAssignmentProductDetails();
			FileOutputStream fos9 = new FileOutputStream(
					"backup/JobAssignmentProducts.txt");
			ObjectOutputStream oos9 = new ObjectOutputStream(fos9);
			oos9.writeObject(jobAssignmentProducts);
			oos9.close();
			fos9.close();

			List<JobClass> jobClasses = ejb.getAllJobClasses();
			FileOutputStream fos10 = new FileOutputStream("backup/JobClass.txt");
			ObjectOutputStream oos10 = new ObjectOutputStream(fos10);
			oos10.writeObject(jobClasses);
			oos10.close();
			fos10.close();

			List<JobRecievedDetails> jobRecievedDetails = ejb
					.getAllJobRecievedDetails();
			FileOutputStream fos11 = new FileOutputStream(
					"backup/JobRecievedDetails.txt");
			ObjectOutputStream oos11 = new ObjectOutputStream(fos11);
			oos11.writeObject(jobRecievedDetails);
			oos11.close();
			fos11.close();

			List<JobStock> jobStock = ejb.getAllJobStock();
			FileOutputStream fos12 = new FileOutputStream("backup/JobStock.txt");
			ObjectOutputStream oos12 = new ObjectOutputStream(fos12);
			oos12.writeObject(jobStock);
			oos12.close();
			fos12.close();

			List<Module> module = ejb.getAllModule();
			FileOutputStream fos13 = new FileOutputStream("backup/Module.txt");
			ObjectOutputStream oos13 = new ObjectOutputStream(fos13);
			oos13.writeObject(module);
			oos13.close();
			fos13.close();

			List<PageList> pageList = ejb.getAllPageList();
			FileOutputStream fos14 = new FileOutputStream("backup/PageList.txt");
			ObjectOutputStream oos14 = new ObjectOutputStream(fos14);
			oos14.writeObject(pageList);
			oos14.close();
			fos14.close();

			List<PaymentDetails> paymentDetails = ejb.getAllPaymentDetails();
			FileOutputStream fos15 = new FileOutputStream(
					"backup/PaymentDetails.txt");
			ObjectOutputStream oos15 = new ObjectOutputStream(fos15);
			oos15.writeObject(paymentDetails);
			oos15.close();
			fos15.close();

			List<PaymentStatus> paymentStatus = ejb.getAllPaymentStatus();
			FileOutputStream fos16 = new FileOutputStream(
					"backup/PaymentStatus.txt");
			ObjectOutputStream oos16 = new ObjectOutputStream(fos16);
			oos16.writeObject(paymentStatus);
			oos16.close();
			fos16.close();

			List<PaymentType> paymentType = ejb.getAllPaymentType();
			FileOutputStream fos17 = new FileOutputStream(
					"backup/PaymentType.txt");
			ObjectOutputStream oos17 = new ObjectOutputStream(fos17);
			oos17.writeObject(paymentType);
			oos17.close();
			fos17.close();

			List<ProductDetail> productDetail = ejb.getAllProductDetail();
			FileOutputStream fos18 = new FileOutputStream(
					"backup/ProductDetail.txt");
			ObjectOutputStream oos18 = new ObjectOutputStream(fos18);
			oos18.writeObject(productDetail);
			oos18.close();
			fos18.close();

			List<ProductImage> productImage = ejb.getAllProductImage();
			FileOutputStream fos19 = new FileOutputStream(
					"backup/ProductImage.txt");
			ObjectOutputStream oos19 = new ObjectOutputStream(fos19);
			oos19.writeObject(productImage);
			oos19.close();
			fos19.close();

			List<Purchase_Entry> pPurchase_Entry = ejb.getAllPurchaseEntry();
			FileOutputStream fos20 = new FileOutputStream(
					"backup/Purchase_Entry.txt");
			ObjectOutputStream oos20 = new ObjectOutputStream(fos20);
			oos20.writeObject(pPurchase_Entry);
			oos20.close();
			fos20.close();

			List<Purchase_Product_Details> pPurchase_Product_Details = ejb
					.getAllPurchase_Product_Details();
			FileOutputStream fos21 = new FileOutputStream(
					"backup/Purchase_Product_Details.txt");
			ObjectOutputStream oos21 = new ObjectOutputStream(fos21);
			oos21.writeObject(pPurchase_Product_Details);
			oos21.close();
			fos21.close();

			List<QtyUnit> pQtyUnit = ejb.getAllQtyUnit();
			FileOutputStream fos22 = new FileOutputStream("backup/QtyUnit.txt");
			ObjectOutputStream oos22 = new ObjectOutputStream(fos22);
			oos22.writeObject(pQtyUnit);
			oos22.close();
			fos22.close();

			List<QtyUnitConversion> pQtyUnitConversion = ejb
					.getAllQtyUnitConversion();
			FileOutputStream fos23 = new FileOutputStream(
					"backup/QtyUnitConversion.txt");
			ObjectOutputStream oos23 = new ObjectOutputStream(fos23);
			oos23.writeObject(pQtyUnitConversion);
			oos23.close();
			fos23.close();

			List<QtyUnitConversionPK> pQtyUnitConversionPK = ejb
					.getAllQtyUnitConversionPK();
			FileOutputStream fos24 = new FileOutputStream(
					"backup/QtyUnitConversionPK.txt");
			ObjectOutputStream oos24 = new ObjectOutputStream(fos24);
			oos24.writeObject(pQtyUnitConversionPK);
			oos24.close();
			fos24.close();

			break;

		case "restore":
			FileInputStream fis = new FileInputStream(
					new File("d:/Country.txt"));
			ObjectInputStream ois = new ObjectInputStream(fis);
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
