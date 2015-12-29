package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.util.Base64;
import com.kaanish.util.DateConverter;

@MultipartConfig
@WebServlet({ "/login", "/logout", "/addTax", "/addTaxGroup", "/editTax", "/deleteTax", "/editTaxGroup",
		"/deleteTaxGroup", "/stockDetailShow", "/createDept", "/deleteDept", "/createSubDept", "/deleteSubDept",
		"/editproductSummary", "/createCategory", "/deleteCategory", "/newVendorType", "/addCountry", "/addState",
		"/createProduct", "/deleteCountry", "/addVendor", "/addUOM", "/editVendorType", "/deleteVendorType", "/addCity",
		"/deleteState", "/deleteCity", "/productSumary", "/addNewConversion", "/purchaseEntry", "/updateConversion",
		"/addBillSetup", "/updateCompanyInfo", "/updateVendor", "/purchaseSearchByDate", "/uploadProductImage",
		"/deleteProductImage", "/jobAssignment", "/jobAssignSearchByDate", "/salesEntry", "/createUserGroup",
		"/updateUserGroup", "/updateUser", "/goStockView" })
public class Servlet extends HttpServlet {
	static final long serialVersionUID = 1L;

	@EJB
	private Ejb ejb;
	private HttpSession httpSession;
	private Date dt;
	private String serverIp;
	private int port;
	private Users users;
	private String page;
	private String msg;
	private String url;
	private Tax tax;
	private Tax_Type_Group tax_type_group;
	private Department department;
	private SubDepartment subDepartment;
	private Category category;
	private VendorType vendorType;
	private Country country;
	private State state;
	private City city;
	private ProductDetail productDetail;
	private Vendor vendor;
	private AccountDetails accountDetails;
	private QtyUnit qtyUnit;
	private QtyUnitConversion qtyUnitConversion;
	private QtyUnitConversionPK qtyUnitConversionPK;
	private Bill_setup billSetup;
	private CompanyInfo companyInfo;
	private QtyUnitType qtyUnitType;
	private Purchase_Entry purchaseEntry;
	private Purchase_Product_Details purchaseProductDetails;
	private RawMaterialsStock rawMaterialsStock;
	private ReadyGoodsStock readyGoodsStock;
	private SerialNumber serialNumber;
	private PaymentStatus paymentStatus;
	private PaymentType paymentType;
	private PaymentDetails paymentDetails;
	private JobAssignmentDetails jobAssignmentDetails;
	private JobAssignmentProducts jobAssignmentProducts;
	private JobStock jobStock;
	private CustomerEntry customerEntry;
	private SalesEntry salesEntry;
	private Module module;
	private PageList pageList;
	private UserGroup userGroup;
	private Users usr;
	private SalesProductDetails salesProductDetails;

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
			users.setPh("0");
			ejb.setUser(users);
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();
		serverIp = req.getLocalAddr();
		port = req.getLocalPort();
		try {
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
			case "logout":
				page = "index.jsp";
				httpSession.removeAttribute("user");
				httpSession.removeAttribute("sip");
				httpSession.removeAttribute("port");
				msg = "Logout Successfull.";
				break;

			case "updateCompanyInfo":
				page = "setupCompanyInfo.jsp";
				companyInfo = ejb.getCompanyInfoById(Integer.parseInt(req.getParameter("companyId")));

				if (companyInfo.getChangeCount() < 3) {
					companyInfo.setCompname(req.getParameter("name"));
					companyInfo.setEmail(req.getParameter("email"));
					companyInfo.setMobile(req.getParameter("mono"));
					companyInfo.setPhone(req.getParameter("phno"));
					companyInfo.setAddr(req.getParameter("adress"));
					companyInfo.setCity(req.getParameter("city"));
					companyInfo.setCountry1(req.getParameter("country1"));
					companyInfo.setState(req.getParameter("state"));
					companyInfo.setVatno(req.getParameter("vatno"));
					companyInfo.setCstno(req.getParameter("cstno"));
					companyInfo.setTinno(req.getParameter("tinno"));
					companyInfo.setServicetaxno(req.getParameter("servicet"));
					companyInfo.setVatdate(req.getParameter("vatdate"));
					companyInfo.setCstdate(req.getParameter("cstDate"));
					companyInfo.setTindate(req.getParameter("tinDate"));
					companyInfo.setServtaxdate(req.getParameter("serviceDate"));
					companyInfo.setChangeCount(companyInfo.getChangeCount() + 1);

					Part p = req.getPart("proImg");
					InputStream is = p.getInputStream();
					byte[] content = new byte[is.available()];
					is.read(content);
					if (!(content.length == 0)) {
						companyInfo.setImage(content);
					}

					ejb.updateCompanyInfo(companyInfo);
					msg = "Company info updated successfully.";
				}else{
					msg = "You have already change companyinfo maximum limit.";
				}

				break;
			case "createProduct":
				page = "setupDepartment.jsp";
				productDetail = new ProductDetail();
				productDetail.setProductType(req.getParameter("name"));
				productDetail.setName(req.getParameter("productName"));
				productDetail.setCode(req.getParameter("productCode"));
				productDetail.setCategory(ejb.getCategoryById(Integer.parseInt(req.getParameter("catId"))));

				ejb.setProductDetail(productDetail);
				msg = "Product detail added successfully.";
				break;

			case "productSumary":
				page = "MaterialPartDetailsGenerals.jsp";

				int flagg = 0;
				List<ProductDetail> pro1 = ejb.getAllProductDetail();
				for (ProductDetail pqu : pro1) {
					if (pqu.getCode().equals(req.getParameter("productCode"))) {
						flagg = 1;
						break;
					}

				}
				if (flagg == 0) {
					productDetail = new ProductDetail();
					purchaseProductDetails = new Purchase_Product_Details();

					productDetail.setCode(req.getParameter("productCode").toUpperCase());
					productDetail.setDescription(req.getParameter("description").toUpperCase());
					productDetail.setUniversalCode(req.getParameter("upc").toUpperCase());
					productDetail.setQtyUnit(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("uom"))));
					productDetail.setSaleble(Boolean.parseBoolean(req.getParameter("isSalebi")));
					productDetail.setCategory(ejb.getCategoryById(Integer.parseInt(req.getParameter("catagoryId"))));

					productDetail.setActive(true);

					ejb.setProductDetail(productDetail);

					if (Boolean.parseBoolean(req.getParameter("isSalebi"))) {
						readyGoodsStock = new ReadyGoodsStock();
						readyGoodsStock.setProductDetail(productDetail);
						readyGoodsStock.setRemainingQty(0);
						ejb.setReadyGoodsStockDetail(readyGoodsStock);
					} else {
						rawMaterialsStock = new RawMaterialsStock();
						rawMaterialsStock.setProductDetail(productDetail);
						rawMaterialsStock.setRemainingQty(0);
						ejb.setRawMaterialsStocktDetail(rawMaterialsStock);
					}

					if (req.getParameter("addini").equals("add")) {

						purchaseProductDetails.setMrp(Float.parseFloat(req.getParameter("mrp1")));
						purchaseProductDetails.setWsp(Float.parseFloat(req.getParameter("wsp1")));
						purchaseProductDetails.setQuantity(Integer.parseInt(req.getParameter("qty1")));
						purchaseProductDetails.setCost(Float.parseFloat(req.getParameter("ucost")));
						purchaseProductDetails.setAttrValue1(req.getParameter("att1"));
						purchaseProductDetails.setAttrValue2(req.getParameter("att2"));
						purchaseProductDetails.setAttrValue3(req.getParameter("att3"));
						purchaseProductDetails.setAttrValue4(req.getParameter("att4"));
						purchaseProductDetails.setAttrValue5(req.getParameter("att5"));
						purchaseProductDetails.setAttrValue6(req.getParameter("att6"));
						purchaseProductDetails.setRemaining_quantity(Integer.parseInt(req.getParameter("qty1")));
						purchaseProductDetails.setInitialInventory(true);
						purchaseProductDetails.setProductDetail(productDetail);
						purchaseProductDetails.setLotNumber(req.getParameter("lotnumberS"));
						// purchaseProductDetails.setReady(true);

						ejb.setPurchaseProductDetails(purchaseProductDetails);
						serialNumber = new SerialNumber();
						serialNumber.setLotNo(req.getParameter("lotnumberS").toUpperCase());
						serialNumber.setPurchase_Product_Details(purchaseProductDetails);

						ejb.setSerialNumber(serialNumber);

						if (productDetail.isSaleble()) {
							readyGoodsStock = ejb.getReadyGoodsStoctByProductId(productDetail.getId());
							readyGoodsStock.setRemainingQty(
									readyGoodsStock.getRemainingQty() + Integer.parseInt(req.getParameter("qty1")));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
						} else {
							rawMaterialsStock = ejb.getRawMeterialStoctByProductId(productDetail.getId());
							rawMaterialsStock.setRemainingQty(
									rawMaterialsStock.getRemainingQty() + Integer.parseInt(req.getParameter("qty1")));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						}

					}

					String imgstr = req.getParameter("proImage1");

					ProductImage proimg = new ProductImage();
					proimg.setProductDetail(productDetail);
					proimg.setImage(Base64.decode(imgstr));
					ejb.setProductImage(proimg);

					msg = "Add successfully.";
				} else {
					msg = "Duplicate Product entry";

				}

				break;
			case "addBillSetup":
				page = "billSetup.jsp";
				billSetup = new Bill_setup();
				billSetup.setCompanyInitial(req.getParameter("comname"));
				billSetup.setBillType(req.getParameter("type"));
				billSetup.setSufix(req.getParameter("suffix"));
				ejb.setBillSetup(billSetup);

				msg = "Bill created successfully.";
				break;

			case "newVendorType":
				page = "purchasingVendorType.jsp";
				vendorType = new VendorType();
				List<VendorType> lst = new ArrayList<VendorType>();
				lst = ejb.getAllVendorType();
				int i = 0;
				for (VendorType vt : lst) {
					if (vt.getType().equals(req.getParameter("name"))) {
						i = 1;
						break;
					}
				}
				if (i == 0) {
					vendorType.setType(req.getParameter("name"));

					ejb.setVendorType(vendorType);
					msg = "Vendor type added successfully.";
				} else
					msg = "Vendor type already exist.";
				break;

			case "editVendorType":
				page = "purchasingVendorType.jsp";
				vendorType = ejb.getVendorTypeById(Integer.parseInt(req.getParameter("id")));
				vendorType.setType(req.getParameter("name"));

				ejb.updateVendorType(vendorType);
				msg = "Vendor type updated successfully.";
				break;

			case "updateVendor":
				page = "purchasingVendor.jsp";
				vendor = ejb.getVendorById(Integer.parseInt(req.getParameter("vendoeId")));// vendorid

				vendor.setName(req.getParameter("vendorName"));
				vendor.setCompanyName(req.getParameter("vendorCompanyName"));
				vendor.setPh1(req.getParameter("vendorPh1"));
				vendor.setPh2(req.getParameter("vendorPh2"));
				vendor.setEmail(req.getParameter("vendorMail"));
				vendor.setAliseName(req.getParameter("vendorAlias"));
				vendor.setAddress(req.getParameter("vendorAddress"));
				vendor.setPinCode(req.getParameter("vendorPin"));
				vendor.setVendorType(ejb.getVendorTypeById(Integer.parseInt(req.getParameter("vendorType"))));
				vendor.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("vendorCityId"))));

				accountDetails = ejb.getAccountDetailsByVendorId(Integer.parseInt(req.getParameter("vendoeId")));// vender
																													// id

				accountDetails.setVatNumber(req.getParameter("vendorVATno"));
				accountDetails.setVatRegistrationDate(DateConverter.getDate(req.getParameter("vendorVATregDate")));
				accountDetails.setCstNumber(req.getParameter("vendorCSTno"));
				accountDetails.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorVATregDate")));
				accountDetails.setPanNumber(req.getParameter("vendorPANno"));
				accountDetails.setExciseRegistrationNumber(req.getParameter("vendorExciseRegNo"));
				accountDetails
						.setExciseRegistrationDate(DateConverter.getDate(req.getParameter("vendorExciseRegDate")));
				accountDetails.setServiceTaxRegistrationNumber(req.getParameter("vendorServiceTaxRegNo"));
				accountDetails.setServiceTaxRegistrationDate(
						DateConverter.getDate(req.getParameter("vendorServiceTaxRegDate")));
				accountDetails.setBankName(req.getParameter("bankName"));
				accountDetails.setBankAccountNumber(req.getParameter("bankAccNo"));
				accountDetails.setBranch(req.getParameter("bankBranch"));
				accountDetails.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("bankCity"))));
				accountDetails.setBankIFSCnumber(req.getParameter("bankIFSC"));
				accountDetails.setBankMICRnumber(req.getParameter("bankMICR"));
				accountDetails.setBankRTGCnumber(req.getParameter("bankRTGS"));
				ejb.updateVendor(vendor);
				ejb.updateAccountDetails(accountDetails);
				msg = "Vendor details updated successfully.";
				break;

			case "editproductSummary":
				page = "MaterialPartDetailsGenerals.jsp";
				productDetail = new ProductDetail();

				productDetail = ejb.getProductDetailsById(Integer.parseInt(req.getParameter("productid")));
				productDetail.setCode(req.getParameter("productCode123"));

				productDetail.setDescription(req.getParameter("description123"));
				productDetail.setQtyUnit(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("uom123"))));

				productDetail.setUniversalCode(req.getParameter("upc123"));
				ejb.updateProductDetail(productDetail);

				msg = "update successfully.";

				break;
			case "deleteVendorType":
				page = "purchasingVendorType.jsp";
				ejb.deleteVendorTypeById(Integer.parseInt(req.getParameter("id")));
				msg = "Vendor type deleted successfully.";
				break;

			case "addTax":
				page = "setupTaxManagement.jsp";
				tax = new Tax();
				List<Tax> list = new ArrayList<Tax>();
				list = ejb.getAllTax();
				int f = 0;
				for (Tax t : list) {
					if (t.getName().equals(req.getParameter("name").toUpperCase()) && t.isActive()) {
						f = 1;
						break;
					}
				}
				if (f == 0) {
					tax.setName(req.getParameter("name").toUpperCase());
					tax.setValue(Float.parseFloat(req.getParameter("value")));
					tax.setActive(true);
					tax.setUsers(ejb.getUserById((String) httpSession.getAttribute("user")));

					ejb.setTax(tax);
					msg = "Tax added successfully.";
				} else {
					msg = "Tax already exists/active.";
				}

				break;

			case "addTaxGroup":
				page = "setupTaxManagement.jsp";
				tax_type_group = new Tax_Type_Group();
				List<Tax_Type_Group> list1 = new ArrayList<Tax_Type_Group>();
				list1 = ejb.getAllTax_Type_Groups();
				int f1 = 0;
				for (Tax_Type_Group t : list1) {
					if (t.getName().equals(req.getParameter("name").toUpperCase()) && t.isActive()) {
						f1 = 1;
						break;
					}
				}

				if (f1 == 0) {
					tax_type_group.setName(req.getParameter("name").toUpperCase());

					String[] taxes = req.getParameterValues("tax");

					if (taxes != null) {

						List<Tax> taxlst = new ArrayList<Tax>();

						for (String taxName : taxes) {
							taxlst.add(ejb.getTaxById(Integer.parseInt(taxName)));
						}

						tax_type_group.setTaxes(taxlst);
						tax_type_group.setActive(true);
						tax_type_group.setUsers(ejb.getUserById((String) httpSession.getAttribute("user")));

						ejb.setTaxTYpeGroup(tax_type_group);
						msg = "Tax group added succesfully.";
					} else {
						msg = "please select tax.";
					}
				} else {
					msg = "Tax group already exist/active.";
				}
				break;

			case "editTax":
				page = "setupTaxManagement.jsp";
				tax = ejb.getTaxById(Integer.parseInt(req.getParameter("id")));
				/*
				 * tax.setName(req.getParameter("name"));
				 * tax.setValue(Float.parseFloat(req.getParameter("value")));
				 */
				tax.setActive(Boolean.parseBoolean(req.getParameter("isActive")));

				ejb.updateTax(tax);
				msg = "Tax updated successfully.";
				break;

			case "deleteTax":
				page = "setupTaxManagement.jsp";
				ejb.deleteTax(Integer.parseInt(req.getParameter("id")));
				msg = "Tax deleted successfully.";
				break;

			case "editTaxGroup":
				page = "setupTaxManagement.jsp";
				tax_type_group = ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("id")));
				/*
				 * tax_type_group.setName(req.getParameter("name"));
				 * 
				 * String[] taxes1 = req.getParameterValues("tax");
				 * 
				 * if (taxes1 != null) {
				 * 
				 * List<Tax> taxlst = new ArrayList<Tax>();
				 * 
				 * for (String taxName : taxes1) {
				 * taxlst.add(ejb.getTaxById(Integer.parseInt(taxName))); }
				 * 
				 * tax_type_group.setTaxes(taxlst);
				 * 
				 * ejb.updateTaxTypeGroup(tax_type_group); msg =
				 * "Tax group updated succesfully."; } else { msg =
				 * "please select tax."; }
				 */
				tax_type_group.setActive(Boolean.parseBoolean(req.getParameter("isActiveG")));
				ejb.updateTaxTypeGroup(tax_type_group);
				msg = "Tax group updated succesfully.";
				break;

			case "deleteTaxGroup":
				page = "setupTaxManagement.jsp";
				ejb.deleteTaxTYpeGroupById(Integer.parseInt(req.getParameter("id")));
				msg = "Tax Group deleted successfully.";
				break;

			case "createDept":
				page = "setupDepartment.jsp";
				List<Department> dept = ejb.getAllDepartments();
				int fc = 0;
				for (Department dep : dept) {
					if (dep.getName().equals(req.getParameter("name"))) {
						fc = 1;
						break;
					}
				}
				if (fc == 0) {
					department = new Department();
					department.setName(req.getParameter("name").toUpperCase());
					ejb.setDepartment(department);
					msg = "Department added.";
				} else {
					msg = "Duplicate Entry";
				}
				break;

			case "deleteDept":
				page = "setupDepartment.jsp";
				ejb.deleteDepartmentById(Integer.parseInt(req.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createSubDept":
				page = "setupDepartment.jsp";
				List<SubDepartment> sdept = ejb
						.getAllSubDepartmentsByDepartmentId(Integer.parseInt(req.getParameter("deptId")));

				int counter = 0;

				for (SubDepartment sdep : sdept) {

					if (sdep.getName().equals(req.getParameter("name"))) {
						counter = 1;
						break;

					}
				}
				if (counter == 0) {
					subDepartment = new SubDepartment();
					subDepartment.setName(req.getParameter("name").toUpperCase());
					subDepartment.setDepartment(ejb.getDepartmentById(Integer.parseInt(req.getParameter("deptId"))));
					ejb.setSubDepartment(subDepartment);
					msg = "SubDepartment added.";
				} else {
					msg = "Duplicate Entry";
				}

				break;
			case "deleteSubDept":
				page = "setupDepartment.jsp";
				ejb.deleteSubDepartmentById(Integer.parseInt(req.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createCategory":
				page = "setupDepartment.jsp";
				List<Category> cat = ejb
						.getAllCategoryBySubDepartmentId(Integer.parseInt(req.getParameter("subDeptId")));

				int counter1 = 0;
				for (Category cate : cat) {
					if (cate.getName().equals(req.getParameter("name"))) {

						counter1 = 1;
						break;
					}

				}
				if (counter1 == 0) {
					category = new Category();
					category.setName(req.getParameter("name").toUpperCase());
					category.setAttrNmae1(req.getParameter("attr1").toUpperCase());
					category.setAttrNmae2(req.getParameter("attr2").toUpperCase());
					category.setAttrNmae3(req.getParameter("attr3").toUpperCase());
					category.setAttrNmae4(req.getParameter("attr4").toUpperCase());
					category.setAttrNmae5(req.getParameter("attr5").toUpperCase());
					category.setAttrNmae6(req.getParameter("attr6").toUpperCase());
					category.setSubDepartment(
							ejb.getSubDepartmentById(Integer.parseInt(req.getParameter("subDeptId"))));
					ejb.setCategory(category);
					msg = "Category added.";
				} else {
					msg = "Duplicate Entry";
				}

				break;
			case "deleteCategory":
				page = "setupDepartment.jsp";
				ejb.deleteCategoryById(Integer.parseInt(req.getParameter("id")));
				msg = "Category deleted.";
				break;
			case "addCountry":
				page = "setupCountryStateCity.jsp";

				int flagg1 = 0;
				List<Country> cuty = ejb.getAllCountry();
				for (Country coty : cuty) {
					if (coty.getCountryName().equals(req.getParameter("name"))) {
						flagg1 = 1;
						break;
					}

				}
				if (flagg1 == 0) {
					country = new Country();
					country.setCountryName(req.getParameter("name"));
					ejb.setCountry(country);
					msg = "country added successfully.";
				} else {
					msg = "Duplicate entry";

				}
				break;
			case "deleteCountry":
				page = "setupCountryStateCity.jsp";
				ejb.deleteCountryById(Integer.parseInt(req.getParameter("id")));
				msg = "country deleted successfully.";
				break;

			case "deleteState":
				page = "setupCountryStateCity.jsp";
				ejb.deleteStateById(Integer.parseInt(req.getParameter("id")));
				msg = "State deleted successfully.";
				break;

			case "addState":
				page = "setupCountryStateCity.jsp";
				List<State> sList = ejb.getAllStatesByCountryId(Integer.parseInt(req.getParameter("id")));
				int flag1 = 0;
				for (State st : sList) {
					if (st.getStateName().equals(req.getParameter("name"))) {
						flag1 = 1;
						break;
					}
				}
				if (flag1 == 0) {
					state = new State();
					state.setStateName(req.getParameter("name"));
					state.setCountry(ejb.getCountryById(Integer.parseInt(req.getParameter("id"))));
					ejb.setState(state);
					msg = "State added successfully.";
				} else {
					msg = "Duplicate entry";
				}
				break;

			case "addCity":
				page = "setupCountryStateCity.jsp";
				List<City> cities = ejb.getCityByState(Integer.parseInt(req.getParameter("id")));
				int flag2 = 0;
				for (City c : cities) {
					if (c.getCityName().equals(req.getParameter("name"))) {
						flag2 = 1;
						break;
					}
				}
				if (flag2 == 0) {
					city = new City();
					city.setCityName(req.getParameter("name"));
					city.setState(ejb.getStateById(Integer.parseInt(req.getParameter("id"))));

					ejb.setCity(city);
					msg = "City added susseccfully";
				} else {
					msg = "Duplicate entry.";
				}
				break;

			case "deleteCity":
				page = "setupCountryStateCity.jsp";
				ejb.deleteCityById(Integer.parseInt(req.getParameter("id")));
				msg = "City deleted successfully.";
				break;

			case "addVendor":
				page = "purchasingVendor.jsp";
				List<Vendor> vend = ejb.getAllVendors();
				int counter2 = 0;
				for (Vendor ven : vend) {

					if (ven.getEmail().equals(req.getParameter("vendorMail"))

							|| ven.getPh1().equals(req.getParameter("vendorPh1"))) {

						counter2 = 1;
						break;
					}
				}
				if (counter2 == 0) {
					vendor = new Vendor();
					accountDetails = new AccountDetails();
					dt = new Date();

					vendor.setName(req.getParameter("vendorName"));
					vendor.setLastModifiedDate(dt);
					vendor.setAddress(req.getParameter("vendorAddress"));
					vendor.setAliseName(req.getParameter("vendorAlias"));
					vendor.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("vendorCityId"))));
					vendor.setCompanyName(req.getParameter("vendorCompanyName"));
					vendor.setEmail(req.getParameter("vendorMail"));
					vendor.setPh1(req.getParameter("vendorPh1"));
					vendor.setPh2(req.getParameter("vendorPh2"));
					vendor.setPinCode(req.getParameter("vendorPin"));
					vendor.setVendorType(ejb.getVendorTypeById(Integer.parseInt(req.getParameter("vendorType"))));
					vendor.setUsers(ejb.getUserById((String) httpSession.getAttribute("user")));

					accountDetails.setBankAccountNumber(req.getParameter("bankAccNo"));
					accountDetails.setBankChequeLable(req.getParameter("bankCheckLebel"));
					accountDetails.setBankIFSCnumber(req.getParameter("bankIFSC"));
					accountDetails.setBankMICRnumber(req.getParameter("bankMICR"));
					accountDetails.setBankName(req.getParameter("bankName"));
					accountDetails.setBankRTGCnumber(req.getParameter("bankRTGS"));
					accountDetails.setBranch(req.getParameter("bankBranch"));
					accountDetails.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("bankCity"))));
					accountDetails.setCstNumber(req.getParameter("vendorCSTno"));
					accountDetails.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorCSTregDate")));
					accountDetails
							.setExciseRegistrationDate(DateConverter.getDate(req.getParameter("vendorExciseRegDate")));
					accountDetails.setExciseRegistrationNumber(req.getParameter("vendorExciseRegNo"));
					accountDetails.setPanNumber(req.getParameter("vendorPANno"));
					accountDetails.setServiceTaxRegistrationDate(
							DateConverter.getDate(req.getParameter("vendorServiceTaxRegDate")));
					accountDetails.setServiceTaxRegistrationNumber(req.getParameter("vendorServiceTaxRegNo"));
					accountDetails.setVatNumber(req.getParameter("vendorVATno"));
					accountDetails.setVatRegistrationDate(DateConverter.getDate(req.getParameter("vendorVATregDate")));

					/*
					 * if(req.getParameter("bankAccNo")==null){
					 * accountDetails.setBankAccountNumber(" ");
					 * 
					 * } if(req.getParameter("bankCheckLebel")==null){
					 * accountDetails.setBankChequeLable(" ");
					 * 
					 * } if(req.getParameter("bankIFSC")==null){
					 * accountDetails.setBankIFSCnumber(" ");
					 * 
					 * } if(req.getParameter("bankMICR")==null){
					 * accountDetails.setBankMICRnumber(" ");
					 * 
					 * } if(req.getParameter("bankName")==null){
					 * accountDetails.setBankName(" ");
					 * 
					 * } if(req.getParameter("bankRTGS")==null){
					 * accountDetails.setBankRTGCnumber(" ");
					 * 
					 * } if(req.getParameter("bankBranch")==null){
					 * accountDetails.setBranch(" ");
					 * 
					 * } if(req.getParameter("bankCity")==null){
					 * accountDetails.setCity(ejb.getCityById(Integer.parseInt(
					 * " ")));
					 * 
					 * } if(req.getParameter("vendorCSTno")==null){
					 * accountDetails.setCstNumber(" ");
					 * 
					 * } if(req.getParameter("vendorCSTregDate")==null){
					 * accountDetails.setCstRegistrationDate(DateConverter
					 * .getDate(""));
					 * 
					 * } if(req.getParameter("vendorExciseRegNo")==null){
					 * accountDetails.setExciseRegistrationNumber(" ");
					 * 
					 * } if(req.getParameter("vendorExciseRegDate")==null){
					 * accountDetails.setExciseRegistrationDate(DateConverter
					 * .getDate(" "));
					 * 
					 * } if(req.getParameter("vendorPANno")==null){
					 * accountDetails.setPanNumber(" ");
					 * 
					 * } if(req.getParameter("vendorServiceTaxRegNo")==null){
					 * accountDetails.setServiceTaxRegistrationNumber(" ");
					 * 
					 * } if(req.getParameter("vendorServiceTaxRegDate")==null){
					 * accountDetails.setServiceTaxRegistrationDate(
					 * DateConverter .getDate(" "));
					 * 
					 * } if(req.getParameter("vendorVATno")==null){
					 * accountDetails.setVatNumber(" ");
					 * 
					 * } if(req.getParameter("vendorVATregDate")==null){
					 * accountDetails.setVatRegistrationDate(DateConverter
					 * .getDate(" "));
					 * 
					 * } if(req.getParameter("taxTypeGroupId")==null){
					 * accountDetails.setTax_Type_Group(ejb
					 * .getTax_Type_GroupById(Integer.parseInt(" ")));
					 * 
					 * }
					 */

					accountDetails.setTax_Type_Group(
							ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("taxTypeGroupId"))));
					accountDetails.setUsers(ejb.getUserById((String) httpSession.getAttribute("user")));
					accountDetails.setVendor(vendor);

					ejb.setVendor(vendor);
					ejb.setAccountDetails(accountDetails);

					msg = "vendor added successfully;";

				} else {
					msg = "Duplicate vendor Entry";
				}

				break;

			case "purchaseEntry":
				page = "purchasingPurchaseEntry.jsp";

				purchaseEntry = new Purchase_Entry();
				paymentDetails = new PaymentDetails();

				List<Purchase_Entry> purEntry = ejb.getAllPurchaseEntry();
				int fm = 0;
				for (Purchase_Entry pe : purEntry) {
					if (pe.getVendor_bill_no().equals(req.getParameter("vendorBillNo"))) {
						fm = 1;
						break;
					}
				}
				if (fm == 0) {
					purchaseEntry.setVendor_bill_no(req.getParameter("vendorBillNo"));

					dt = new Date();
					purchaseEntry.setChallan_no(Integer.parseInt(req.getParameter("challanNo")));
					purchaseEntry.setChallanSuffix(Integer.parseInt(req.getParameter("challanSuffix")));
					purchaseEntry.setChallanNumber(req.getParameter("challanNumber"));

					purchaseEntry.setPurchase_date(DateConverter.getDate(req.getParameter("purchaseDate")));
					purchaseEntry.setVendor(ejb.getVendorById(Integer.parseInt(req.getParameter("vId"))));
					purchaseEntry.setUsers(ejb.getUserById(httpSession.getAttribute("user").toString()));
					purchaseEntry.setEntry_date(dt);

					purchaseEntry.setSur_charge(Float.parseFloat(req.getParameter("surcharge")));
					purchaseEntry.setTransport_cost(Float.parseFloat(req.getParameter("transportCost")));
					purchaseEntry.setTotalCost(Float.parseFloat(req.getParameter("spAmount")));
					purchaseEntry.setTax_Type_Group(
							ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("taxGroup"))));
					if (req.getParameter("isAgent").equals("yes")) {
						purchaseEntry.setAgentId(Integer.parseInt(req.getParameter("agentName")));
					}
					ejb.setPurchaseEntry(purchaseEntry);

					paymentDetails.setPaymentDate(DateConverter.getDate(req.getParameter("purchaseDate")));
					paymentDetails.setTotalAmount(Float.parseFloat(req.getParameter("spAmount")));
					paymentDetails.setPaidAmount(Float.parseFloat(req.getParameter("spPaymentAmount")));
					paymentDetails.setDescription(req.getParameter("desc"));
					paymentDetails.setPurchase_Entry(purchaseEntry);
					paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req.getParameter("pType")));
					paymentDetails.setPaymentStatus(ejb.getPaymentStatusByStatus(req.getParameter("pstatus")));
					ejb.setPaymentDetails(paymentDetails);

					String attr1[] = req.getParameterValues("attr1H");
					String attr2[] = req.getParameterValues("attr2H");
					String attr3[] = req.getParameterValues("attr3H");
					String attr4[] = req.getParameterValues("attr4H");
					String attr5[] = req.getParameterValues("attr5H");
					String attr6[] = req.getParameterValues("attr6H");

					String mrp[] = req.getParameterValues("mrpH");
					String wsp[] = req.getParameterValues("wspH");

					String qty[] = req.getParameterValues("qtyH");
					String cost[] = req.getParameterValues("rateH");
					String productId[] = req.getParameterValues("pCodeIdH");
					String lot[] = req.getParameterValues("lotH");

					for (int l = 0; l < qty.length; l++) {
						purchaseProductDetails = new Purchase_Product_Details();

						purchaseProductDetails.setAttrValue1(attr1[l]);
						purchaseProductDetails.setAttrValue2(attr2[l]);
						purchaseProductDetails.setAttrValue3(attr3[l]);
						purchaseProductDetails.setAttrValue4(attr4[l]);
						purchaseProductDetails.setAttrValue5(attr5[l]);
						purchaseProductDetails.setAttrValue6(attr6[l]);
						purchaseProductDetails
								.setProductDetail(ejb.getProductDetailsById(Integer.parseInt(productId[l])));
						if (req.getParameter("isSalable").equals("yes")) {
							purchaseProductDetails.setMrp(Float.parseFloat(mrp[l]));
							purchaseProductDetails.setWsp(Float.parseFloat(wsp[l]));
							purchaseProductDetails.setReady(true);
						}

						purchaseProductDetails.setQuantity(Integer.parseInt(qty[l]));

						purchaseProductDetails.setRemaining_quantity(Integer.parseInt(qty[l]));
						purchaseProductDetails.setCost(Integer.parseInt(cost[l]));
						purchaseProductDetails.setPurchase_Entry(purchaseEntry);
						purchaseProductDetails.setLotNumber(lot[l]);
						ejb.setPurchaseProductDetails(purchaseProductDetails);
						/*
						 * int lq = Integer.parseInt(qty[l]); if
						 * (req.getParameter("isSerial").equals("yes")) { int
						 * InitialSlNo =
						 * Integer.parseInt(req.getParameter("serialH")); for
						 * (int ln = 0; ln < lq; ln++) { serialNumber = new
						 * SerialNumber();
						 * serialNumber.setSerialNumber(String.valueOf(
						 * InitialSlNo)); InitialSlNo++; if
						 * (req.getParameter("isLot").equals("yes")) {
						 * serialNumber.setLotNo(req.getParameter("lotH")); }
						 * else { serialNumber.setLotNo("0"); } //
						 * serialNumber.setBarcode();
						 * serialNumber.setPurchase_Product_Details(
						 * purchaseProductDetails);
						 * ejb.setSerialNumber(serialNumber); serialNumber =
						 * null; } } else { if
						 * (req.getParameter("isLot").equals("yes")) { for (int
						 * ln = 0; ln < lq; ln++) { serialNumber = new
						 * SerialNumber();
						 * serialNumber.setLotNo(req.getParameter("lotH"));
						 * serialNumber.setSerialNumber("0");
						 * serialNumber.setPurchase_Product_Details(
						 * purchaseProductDetails);
						 * ejb.setSerialNumber(serialNumber);
						 * 
						 * serialNumber = null; } } else { for (int ln = 0; ln <
						 * lq; ln++) { serialNumber = new SerialNumber();
						 * serialNumber.setLotNo("0");
						 * serialNumber.setSerialNumber("0");
						 * serialNumber.setPurchase_Product_Details(
						 * purchaseProductDetails);
						 * ejb.setSerialNumber(serialNumber);
						 * 
						 * serialNumber = null; } } }
						 */
						if (req.getParameter("isSalable").equals("yes")) {
							readyGoodsStock = ejb
									.getReadyGoodsStoctByProductId(purchaseProductDetails.getProductDetail().getId());
							readyGoodsStock.setProductDetail(ejb.getProductDetailsById(Integer.parseInt(productId[l])));
							readyGoodsStock
									.setRemainingQty(readyGoodsStock.getRemainingQty() + Integer.parseInt(qty[l]));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
							readyGoodsStock = null;
						} else {
							// rawMaterialsStock = new RawMaterialsStock();
							rawMaterialsStock = ejb
									.getRawMeterialStoctByProductId(purchaseProductDetails.getProductDetail().getId());
							rawMaterialsStock
									.setProductDetail(ejb.getProductDetailsById(Integer.parseInt(productId[l])));
							rawMaterialsStock
									.setRemainingQty(rawMaterialsStock.getRemainingQty() + Integer.parseInt(qty[l]));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
							rawMaterialsStock = null;
						}

						purchaseProductDetails = null;
					}
					if (req.getParameter("isBarPrint").equals("yes")) {
						req.setAttribute("print", 1);
						req.setAttribute("purDet", purchaseEntry.getId());
					} else {
						req.setAttribute("print", 0);
					}

					req.setAttribute("purDetIdforPC", purchaseEntry.getId());
					purchaseEntry = null;
					msg = "Purchase entry was successfull.";
				} else {
					msg = "Duplicate Vendor Bill no. not allowed.";
				}

				break;

			case "salesEntry":
				page = "salesSalesEntry.jsp";

				customerEntry = new CustomerEntry();
				customerEntry.setName(req.getParameter("custName"));
				customerEntry.setAddress(req.getParameter("addr"));
				customerEntry.setCity(req.getParameter("city"));
				customerEntry.setMobile(req.getParameter("phone"));
				customerEntry.setVat_cst_no(req.getParameter("vatcst"));
				ejb.setCustomerEntry(customerEntry);

				salesEntry = new SalesEntry();
				dt = new Date();
				salesEntry.setChallanNumber(req.getParameter("challanNumber"));
				salesEntry.setChallanNo(Integer.parseInt(req.getParameter("challanNo")));
				salesEntry.setChallanSuffix(Integer.parseInt(req.getParameter("challanSuffix")));
				salesEntry.setEntry_Date(dt);
				salesEntry.setSales_date(DateConverter.getDate(req.getParameter("salesDate")));
				salesEntry.setTax_Type_Group(ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("taxGroup"))));
				salesEntry.setTransportcCharge(Float.parseFloat(req.getParameter("transcharge")));
				salesEntry.setSurcharge(Float.parseFloat(req.getParameter("surcharge")));
				salesEntry.setRoundOf(Float.parseFloat(req.getParameter("roundvalue")));
				salesEntry.setTotalCost(Float.parseFloat(req.getParameter("grandtotal")));
				salesEntry.setCustomer(customerEntry);
				ejb.setSalesEntry(salesEntry);

				paymentDetails = new PaymentDetails();
				paymentDetails.setPaymentDate(DateConverter.getDate(req.getParameter("salesDate")));
				paymentDetails.setTotalAmount(Float.parseFloat(req.getParameter("spAmount")));
				paymentDetails.setPaidAmount(Float.parseFloat(req.getParameter("spPaymentAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				paymentDetails.setSalesEntry(salesEntry);
				paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req.getParameter("pType")));
				paymentDetails.setPaymentStatus(ejb.getPaymentStatusByStatus(req.getParameter("pstatus")));
				ejb.setPaymentDetails(paymentDetails);

				String productId[] = req.getParameterValues("productId");
				String qtyvalue[] = req.getParameterValues("qtyvalue");
				String mrpQty[] = req.getParameterValues("mrpQty");
				String purchaseProductDetId[] = req.getParameterValues("purchaseProductDetId");

				for (int l = 0; l < productId.length; l++) {
					salesProductDetails = new SalesProductDetails();
					salesProductDetails.setSalesEntry(salesEntry);
					salesProductDetails.setSalesPrice(Float.parseFloat(mrpQty[l]));
					salesProductDetails.setQuantity(Integer.parseInt(qtyvalue[l]));
				/*	salesProductDetails.setProductDetail(ejb.getProductDetailById(Integer.parseInt(productId[l])));*//*URGENT CHANGE*/
					ejb.setSalesProductDetails(salesProductDetails);

					purchaseProductDetails = ejb
							.getPurchaseProductDetailsById(Integer.parseInt(purchaseProductDetId[l]));
					purchaseProductDetails.setRemaining_quantity(
							purchaseProductDetails.getRemaining_quantity() - Integer.parseInt(qtyvalue[l]));
					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					readyGoodsStock = ejb
							.getReadyGoodsStoctByProductId(purchaseProductDetails.getProductDetail().getId());
					readyGoodsStock.setRemainingQty(readyGoodsStock.getRemainingQty() - Integer.parseInt(qtyvalue[l]));
					ejb.updateReadyGoodsStockDetail(readyGoodsStock);

					readyGoodsStock = null;
					purchaseProductDetails = null;
					salesProductDetails = null;
				}

				req.setAttribute("purDetIdforPC", salesEntry.getId());
				salesEntry = null;
				msg = "Sales entry is successfull...";
				break;

			case "purchaseSearchByDate":
				page = "purchasingPurchaseSearch.jsp";
				List<Purchase_Entry> purEntryList = ejb.getPurchaseEntryByDate(
						DateConverter.getDate(req.getParameter("fDate")),
						DateConverter.getDate(req.getParameter("lDate")));
				req.setAttribute("purEntryList", purEntryList);
				break;

			case "jobAssignment":
				page = "jobAssign.jsp";
				jobAssignmentDetails = new JobAssignmentDetails();
				dt = new Date();

				jobAssignmentDetails.setAssignDate(DateConverter.getDate(req.getParameter("assignedDate")));
				jobAssignmentDetails
						.setEstimatedCompletionDate(DateConverter.getDate(req.getParameter("estSubmissionDate")));
				jobAssignmentDetails.setChallanNumber(req.getParameter("jobChallanNo"));
				jobAssignmentDetails.setChallan_no(Integer.parseInt(req.getParameter("challanNo")));
				jobAssignmentDetails.setChallanSuffix(Integer.parseInt(req.getParameter("challanSuffix")));
				jobAssignmentDetails.setEntryDate(dt);
				jobAssignmentDetails.setVendor(ejb.getVendorById(Integer.parseInt(req.getParameter("jName"))));

				ejb.setJobAssignment(jobAssignmentDetails);

				String pProdDetIdH[] = req.getParameterValues("pProdDetIdH");
				String qtyH[] = req.getParameterValues("qtyH");
				String workH[] = req.getParameterValues("workH");

				for (int l = 0; l < pProdDetIdH.length; l++) {
					jobAssignmentProducts = new JobAssignmentProducts();

					jobAssignmentProducts.setPurchase_Product_Details(
							ejb.getPurchaseProductDetailsById(Integer.parseInt(pProdDetIdH[l])));
					jobAssignmentProducts.setQty(Integer.parseInt(qtyH[l]));
					jobAssignmentProducts.setWorkDescription(workH[l]);
					jobAssignmentProducts.setJobAssignmentDetails(jobAssignmentDetails);
					ejb.setJobAssignmentProducts(jobAssignmentProducts);

					jobStock = new JobStock();
					jobStock.setJobAssignmentProducts(jobAssignmentProducts);
					jobStock.setGivenQty(Integer.parseInt(qtyH[l]));
					jobStock.setRemainingQty(Integer.parseInt(qtyH[l]));

					ejb.setJobStock(jobStock);

					purchaseProductDetails = ejb.getPurchaseProductDetailsById(Integer.parseInt(pProdDetIdH[l]));
					purchaseProductDetails.setRemaining_quantity(
							purchaseProductDetails.getRemaining_quantity() - Integer.parseInt(qtyH[l]));
					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					rawMaterialsStock = ejb
							.getRawMeterialStoctByProductId(purchaseProductDetails.getProductDetail().getId());
					rawMaterialsStock.setRemainingQty(rawMaterialsStock.getRemainingQty() - Integer.parseInt(qtyH[l]));
					ejb.updateRawMaterialStockDetail(rawMaterialsStock);

					rawMaterialsStock = null;
					jobStock = null;
					jobAssignmentProducts = null;
					purchaseProductDetails = null;
				}

				msg = "Job assigned succesfully.";
				break;

			case "jobAssignSearchByDate":
				page = "jobAssignSearch.jsp";
				List<JobAssignmentDetails> jobAssignList = ejb.getJobAssignmentByDate(
						DateConverter.getDate(req.getParameter("fDate")),
						DateConverter.getDate(req.getParameter("lDate")));
				req.setAttribute("jobAssignList", jobAssignList);
				break;

			case "addUOM":
				page = "setupUnitOfMeasure.jsp";
				int flag = 0;
				for (QtyUnit qut : ejb.getAllQtyUnit()) {
					if ((qut.getName().equalsIgnoreCase(req.getParameter("name"))
							|| (qut.getAbbreviation().equalsIgnoreCase(req.getParameter("abbreviation"))))) {
						flag = 1;
						break;
					}
				}
				if (flag == 0) {
					qtyUnit = new QtyUnit();
					qtyUnit.setName(req.getParameter("name"));
					qtyUnit.setAbbreviation(req.getParameter("abbreviation"));
					qtyUnit.setDescription(req.getParameter("description"));
					qtyUnit.setQtyUnitType(ejb.getQtyUnitTypeById(Integer.parseInt(req.getParameter("qtyUnitTypeId"))));
					ejb.setQtyUnit(qtyUnit);
					msg = "new UOM added successfully";
				} else {
					msg = "UOM name already exists";
				}
				break;
			case "addNewConversion":
				page = "setupUnitOfMeasure.jsp";
				qtyUnitConversion = new QtyUnitConversion();
				qtyUnitConversionPK = new QtyUnitConversionPK();
				if (Float.parseFloat(req.getParameter("convValue")) > 0) {
					if (req.getParameter("name1").equals("2")) {
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion
								.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("firstUnit"))));
						qtyUnitConversion
								.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(Float.parseFloat(req.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						qtyUnitConversion = new QtyUnitConversion();
						qtyUnitConversionPK = new QtyUnitConversionPK();

						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion
								.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("firstUnit"))));
						qtyUnitConversion
								.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(1 / Float.parseFloat(req.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						msg = "New conversion added successfully.";
					} else if (req.getParameter("name1").equals("1")) {
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion
								.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("firstUnit"))));
						qtyUnitConversion
								.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(Float.parseFloat(req.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						qtyUnitConversion = new QtyUnitConversion();
						qtyUnitConversionPK = new QtyUnitConversionPK();

						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion
								.setQtyUnitId1(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("firstUnit"))));
						qtyUnitConversion
								.setQtyUnitId2(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(1 / Float.parseFloat(req.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						msg = "New conversion added successfully.";
					} else {
						msg = "Something is wrong.";
					}
				} else {
					msg = "please enter proper conversion value";
				}

				break;

			case "updateConversion":
				page = "setupUnitOfMeasure.jsp";

				if (Float.parseFloat(req.getParameter("editValue")) > 0) {

					qtyUnitConversionPK = new QtyUnitConversionPK();

					qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("u1")));
					qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("u2")));
					qtyUnitConversion = ejb.getQtyUnitConversionById(qtyUnitConversionPK);
					qtyUnitConversion.setConversion(Float.parseFloat(req.getParameter("editValue")));

					ejb.updateQtyUnitConversion(qtyUnitConversion);

					qtyUnitConversionPK = new QtyUnitConversionPK();

					qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req.getParameter("u2")));
					qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req.getParameter("u1")));
					qtyUnitConversion = ejb.getQtyUnitConversionById(qtyUnitConversionPK);
					qtyUnitConversion.setConversion(1 / Float.parseFloat(req.getParameter("editValue")));

					ejb.updateQtyUnitConversion(qtyUnitConversion);

					msg = "Conversion updated successfully.";

				} else {
					msg = "please enter proper conversion value";
				}
				break;
			/*************** stock*************show ***************/

			case "stockDetailShow":
				page = "stockShowdetails.jsp";

				req.setAttribute("proid1", req.getParameter("proId"));

				msg = "";

				break;
			/************************
			 * Stock*MuyltiSearch*************Ami
			 ************/

			case "goStockView":
				page = "stockViewD.jsp";
				List<ProductDetail> amiProduct = ejb.getProductDetailsByCodeDescriptionCategory(
						req.getParameter("pCodeSearch").toUpperCase(), req.getParameter("pDesSearch").toUpperCase(),
						req.getParameter("pCatSearch").toUpperCase());

				req.setAttribute("ami", amiProduct);

				msg = "";

				break;

			/**************************************************************/

			case "uploadProductImage":
				page = "addNewProductImage.jsp";
				Part p1 = req.getPart("proImg");
				InputStream is = p1.getInputStream();
				byte cont1[] = new byte[is.available()];
				is.read(cont1);
				productDetail = ejb.getProductDetailById(Integer.parseInt(req.getParameter("id")));
				ProductImage proimg = new ProductImage();
				proimg.setProductDetail(productDetail);
				proimg.setImage(cont1);
				ejb.setProductImage(proimg);
				msg = "image added successfully";
				break;
			case "deleteProductImage":
				page = "addNewProductImage.jsp?id=" + req.getParameter("id");
				ejb.removeImageById(Integer.parseInt(req.getParameter("imageId")));
				msg = "Image deleted successfully";
				break;
			case "createUserGroup":
				int fl = 0;
				for (UserGroup ug : ejb.getAllUserGroup()) {
					if (ug.getGroupName().equals(req.getParameter("userGroupName").toUpperCase())) {
						fl = 1;
						break;
					}
				}
				if (fl == 0) {
					page = "setupUserGroup.jsp";
					userGroup = new UserGroup();
					userGroup.setGroupName(req.getParameter("userGroupName").toUpperCase());
					List<PageList> plist = new ArrayList<>();
					for (String str : req.getParameterValues("pageId")) {
						plist.add(ejb.getPageListById(Integer.parseInt(str)));
					}
					userGroup.setPageLists(plist);
					ejb.setUserGroup(userGroup);
					msg = "User group created successfully";
				} else {
					msg = "User group name already exist";
				}

				break;
			case "updateUserGroup":
				page = "setupUserGroup.jsp";
				userGroup = ejb.getUserGroupById(Integer.parseInt(req.getParameter("usrGpId")));
				userGroup.setGroupName(req.getParameter("userGroupName").toUpperCase());
				List<PageList> plist = new ArrayList<>();
				for (String str : req.getParameterValues("pageId")) {
					plist.add(ejb.getPageListById(Integer.parseInt(str)));
				}
				userGroup.setPageLists(plist);
				ejb.updateUserGroup(userGroup);
				msg = "User group update successfully";
				break;
			case "createNewUser":
				page = "setupUser.jsp";
				int uf = 0;
				for (Users u : ejb.getAllUsers()) {
					if (u.getPh().equals(req.getParameter("mobile"))
							|| u.getUserId().equals(req.getParameter("userId"))) {
						uf = 1;
					}
				}

				if (uf == 0) {
					usr = new Users();
					usr.setName(req.getParameter("name"));
					usr.setPassword(req.getParameter("pass"));
					usr.setPh(req.getParameter("mobile"));
					usr.setUserId(req.getParameter("userId"));
					usr.setUserGroup(ejb.getUserGroupById(Integer.parseInt(req.getParameter("ugid"))));
					ejb.setUser(usr);
					msg = "User Added Successfully";
				} else {
					msg = "User mobile/id already exists";
				}

				break;
			case "updateUser":
				page = "setupUser.jsp";
				usr = ejb.getUserById(req.getParameter("userId"));
				usr.setUserGroup(ejb.getUserGroupById(Integer.parseInt(req.getParameter("ugid"))));
				ejb.updateUser(usr);
				msg = "User updated Successfully";
				break;

			default:
				break;
			}
		} catch (

		Exception e)

		{
			msg = "error: " + e.getMessage();
			e.printStackTrace();
		} finally

		{
			tax = null;
			tax_type_group = null;
			department = null;
			subDepartment = null;
			category = null;
			vendorType = null;
			country = null;
			state = null;
			city = null;
			productDetail = null;
			vendor = null;
			accountDetails = null;
			qtyUnit = null;
			qtyUnitConversion = null;
			qtyUnitConversionPK = null;
			billSetup = null;
			companyInfo = null;
			qtyUnitType = null;
			purchaseEntry = null;
			purchaseProductDetails = null;
			rawMaterialsStock = null;
			readyGoodsStock = null;
			serialNumber = null;
			paymentStatus = null;
			paymentType = null;
			paymentDetails = null;
			try {
				finalize();
			} catch (Throwable e) {
				System.out.println("Error in garbage collection: " + e.getMessage());
				e.printStackTrace();
			}
		}

		req.setAttribute("msg", msg);
		req.getRequestDispatcher(page).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
