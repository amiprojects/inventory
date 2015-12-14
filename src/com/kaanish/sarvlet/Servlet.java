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
import com.kaanish.model.Department;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.util.DateConverter;

@MultipartConfig
@WebServlet({ "/login", "/logout", "/addTax", "/addTaxGroup", "/editTax",
		"/deleteTax", "/editTaxGroup", "/deleteTaxGroup", "/createDept",
		"/deleteDept", "/createSubDept", "/deleteSubDept", "/createCategory",
		"/deleteCategory", "/newVendorType", "/addCountry", "/addState",
		"/createProduct", "/deleteCountry", "/addVendor", "/addUOM",
		"/editVendorType", "/deleteVendorType", "/addCity", "/deleteState",
		"/deleteCity", "/productSumary", "/addNewConversion", "/purchaseEntry",
		"/updateConversion", "/addBillSetup", "/updateCompanyInfo",
		"/addBillSetup", "/updateCompanyInfo" })
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private Ejb ejb;
	private HttpSession httpSession;
	private Date dt;
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

	@Override
	public void init() throws ServletException {

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

		if (!ejb.isCompanyInfoExist()) {
			companyInfo = new CompanyInfo();
			ejb.setCompanyInfo(companyInfo);
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();
		try {
			switch (url) {

			case "login":
				page = "index.jsp";
				String user = req.getParameter("usrName");
				if (ejb.getCheckLogin(user, req.getParameter("password"))) {
					httpSession.setAttribute("user", user);
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
				msg = "Logout Successfull.";
				break;

			case "updateCompanyInfo":
				page = "setupCompanyInfo.jsp";
				companyInfo = ejb.getCompanyInfoById(Integer.parseInt(req
						.getParameter("companyId")));

				companyInfo.setCompname(req.getParameter("name"));
				companyInfo.setEmail(req.getParameter("email"));
				companyInfo.setMobile(req.getParameter("mono"));
				companyInfo.setPhone(req.getParameter("phno"));
				companyInfo.setAddr(req.getParameter("adress"));
				companyInfo.setCity(req.getParameter("city"));
				companyInfo.setState(req.getParameter("state"));
				companyInfo.setVatno(req.getParameter("vatno"));
				companyInfo.setCstno(req.getParameter("cstno"));
				companyInfo.setTinno(req.getParameter("tinno"));
				companyInfo.setServicetaxno(req.getParameter("servicet"));
				companyInfo.setVatdate(req.getParameter("vatdate"));
				companyInfo.setCstdate(req.getParameter("cstDate"));
				companyInfo.setTindate(req.getParameter("tinDate"));
				companyInfo.setServtaxdate(req.getParameter("serviceDate"));

				Part p = req.getPart("proImg");
				InputStream is = p.getInputStream();
				byte[] content = new byte[is.available()];
				is.read(content);
				companyInfo.setImage(content);
				ejb.updateCompanyInfo(companyInfo);
				msg = "Company info updated successfully.";
				break;
			case "createProduct":
				page = "setupDepartment.jsp";
				productDetail = new ProductDetail();
				productDetail.setProductType(req.getParameter("name"));
				productDetail.setName(req.getParameter("productName"));
				productDetail.setCode(req.getParameter("productCode"));
				productDetail.setCategory(ejb.getCategoryById(Integer
						.parseInt(req.getParameter("catId"))));

				ejb.setProductDetail(productDetail);
				msg = "Product detail added successfully.";
				break;

			case "productSumary":
				page = "MaterialPartDetailsGenerals.jsp";
				productDetail = new ProductDetail();

				purchaseProductDetails = new Purchase_Product_Details();

				productDetail.setCode(req.getParameter("productCode"));
				productDetail.setDescription(req.getParameter("description"));
				productDetail.setUniversalCode(req.getParameter("upc"));
				productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
						.parseInt(req.getParameter("uom"))));
				productDetail.setSaleble(Boolean.parseBoolean(req
						.getParameter("isSalebi")));
				productDetail.setCategory(ejb.getCategoryById(Integer
						.parseInt(req.getParameter("catagoryId"))));
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
					String slno[] = req.getParameterValues("serialNumber");

					purchaseProductDetails.setMrp(Integer.parseInt(req
							.getParameter("mrp1")));
					purchaseProductDetails.setWsp(Integer.parseInt(req
							.getParameter("wsp1")));
					purchaseProductDetails.setQuantity(Integer.parseInt(req
							.getParameter("qty1")));
					purchaseProductDetails.setCost(Integer.parseInt(req
							.getParameter("ucost")));
					purchaseProductDetails.setAttrValue1(req
							.getParameter("att1"));
					purchaseProductDetails.setAttrValue2(req
							.getParameter("att2"));
					purchaseProductDetails.setAttrValue3(req
							.getParameter("att3"));
					purchaseProductDetails.setAttrValue4(req
							.getParameter("att4"));
					purchaseProductDetails.setAttrValue5(req
							.getParameter("att5"));
					purchaseProductDetails.setAttrValue6(req
							.getParameter("att6"));
					purchaseProductDetails.setRemaining_quantity(Integer
							.parseInt(req.getParameter("qty1")));
					purchaseProductDetails.setInitialInventory(true);
					purchaseProductDetails.setProductDetail(productDetail);

					ejb.setPurchaseProductDetails(purchaseProductDetails);

					for (int i = 0; i < slno.length; i++) {
						serialNumber = new SerialNumber();
						serialNumber.setSerialNumber(slno[i]);
						serialNumber
								.setPurchase_Product_Details(purchaseProductDetails);
						ejb.setSerialNumber(serialNumber);
						serialNumber = null;
					}

					if (productDetail.isSaleble()) {
						readyGoodsStock = ejb
								.getReadyGoodsStoctByProductId(productDetail
										.getId());
						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty()
								+ Integer.parseInt(req.getParameter("qty1")));
						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
					} else {
						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductId(productDetail
										.getId());
						rawMaterialsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty()
								+ Integer.parseInt(req.getParameter("qty1")));
						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
					}

				}

				msg = "Add successfully.";

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
				vendorType = ejb.getVendorTypeById(Integer.parseInt(req
						.getParameter("id")));
				vendorType.setType(req.getParameter("name"));

				ejb.updateVendorType(vendorType);
				msg = "Vendor type updated successfully.";
				break;

			case "deleteVendorType":
				page = "purchasingVendorType.jsp";
				ejb.deleteVendorTypeById(Integer.parseInt(req
						.getParameter("id")));
				msg = "Vendor type deleted successfully.";
				break;

			case "addTax":
				page = "setupTaxManagement.jsp";
				tax = new Tax();
				List<Tax> list = new ArrayList<Tax>();
				list = ejb.getAllTax();
				int f = 0;
				for (Tax t : list) {
					if (t.getName().equals(req.getParameter("name"))) {
						f = 1;
						break;
					}
				}
				if (f == 0) {
					tax.setName(req.getParameter("name"));
					tax.setValue(Float.parseFloat(req.getParameter("value")));

					ejb.setTax(tax);
					msg = "Tax added successfully.";
				} else {
					msg = "Tax already exists.";
				}

				break;

			case "addTaxGroup":
				page = "setupTaxManagement.jsp";
				tax_type_group = new Tax_Type_Group();
				tax_type_group.setName(req.getParameter("name"));

				String[] taxes = req.getParameterValues("tax");

				if (taxes != null) {

					List<Tax> taxlst = new ArrayList<Tax>();

					for (String taxName : taxes) {
						taxlst.add(ejb.getTaxById(Integer.parseInt(taxName)));
					}

					tax_type_group.setTaxes(taxlst);

					ejb.setTaxTYpeGroup(tax_type_group);
					msg = "Tax group added succesfully.";
				} else {
					msg = "please select tax.";
				}
				break;

			case "editTax":
				page = "setupTaxManagement.jsp";
				tax = ejb.getTaxById(Integer.parseInt(req.getParameter("id")));
				tax.setName(req.getParameter("name"));
				tax.setValue(Float.parseFloat(req.getParameter("value")));

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
				tax_type_group = ejb.getTax_Type_GroupById(Integer.parseInt(req
						.getParameter("id")));
				tax_type_group.setName(req.getParameter("name"));

				String[] taxes1 = req.getParameterValues("tax");

				if (taxes1 != null) {

					List<Tax> taxlst = new ArrayList<Tax>();

					for (String taxName : taxes1) {
						taxlst.add(ejb.getTaxById(Integer.parseInt(taxName)));
					}

					tax_type_group.setTaxes(taxlst);

					ejb.updateTaxTypeGroup(tax_type_group);
					msg = "Tax group updated succesfully.";
				} else {
					msg = "please select tax.";
				}
				break;

			case "deleteTaxGroup":
				page = "setupTaxManagement.jsp";
				ejb.deleteTaxTYpeGroupById(Integer.parseInt(req
						.getParameter("id")));
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
					department.setName(req.getParameter("name"));
					ejb.setDepartment(department);
					msg = "Department added.";
				} else {
					msg = "Duplicate Entry";
				}

				break;

			case "deleteDept":
				page = "setupDepartment.jsp";
				ejb.deleteDepartmentById(Integer.parseInt(req
						.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createSubDept":
				page = "setupDepartment.jsp";
				List<SubDepartment> sdept = ejb
						.getAllSubDepartmentsByDepartmentId(Integer
								.parseInt(req.getParameter("deptId")));

				int counter = 0;

				for (SubDepartment sdep : sdept) {

					if (sdep.getName().equals(req.getParameter("name"))) {
						counter = 1;
						break;

					}
				}
				if (counter == 0) {
					subDepartment = new SubDepartment();
					subDepartment.setName(req.getParameter("name"));
					subDepartment.setDepartment(ejb.getDepartmentById(Integer
							.parseInt(req.getParameter("deptId"))));
					ejb.setSubDepartment(subDepartment);
					msg = "SubDepartment added.";
				} else {
					msg = "Duplicate Entry";
				}

				break;
			case "deleteSubDept":
				page = "setupDepartment.jsp";
				ejb.deleteSubDepartmentById(Integer.parseInt(req
						.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createCategory":
				page = "setupDepartment.jsp";
				List<Category> cat = ejb
						.getAllCategoryBySubDepartmentId(Integer.parseInt(req
								.getParameter("subDeptId")));

				int counter1 = 0;
				for (Category cate : cat) {
					if (cate.getName().equals(req.getParameter("name"))) {

						counter1 = 1;
						break;
					}

				}
				if (counter1 == 0) {
					category = new Category();
					category.setName(req.getParameter("name"));
					category.setAttrNmae1(req.getParameter("attr1"));
					category.setAttrNmae2(req.getParameter("attr2"));
					category.setAttrNmae3(req.getParameter("attr3"));
					category.setAttrNmae4(req.getParameter("attr4"));
					category.setAttrNmae5(req.getParameter("attr5"));
					category.setAttrNmae6(req.getParameter("attr6"));
					category.setSubDepartment(ejb.getSubDepartmentById(Integer
							.parseInt(req.getParameter("subDeptId"))));
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
				List<State> sList = ejb.getAllStatesByCountryId(Integer
						.parseInt(req.getParameter("id")));
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
					state.setCountry(ejb.getCountryById(Integer.parseInt(req
							.getParameter("id"))));
					ejb.setState(state);
					msg = "State added successfully.";
				} else {
					msg = "Duplicate entry";
				}
				break;

			case "addCity":
				page = "setupCountryStateCity.jsp";
				List<City> cities = ejb.getCityByState(Integer.parseInt(req
						.getParameter("id")));
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
					city.setState(ejb.getStateById(Integer.parseInt(req
							.getParameter("id"))));

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
					vendor.setCity(ejb.getCityById(Integer.parseInt(req
							.getParameter("vendorCityId"))));
					vendor.setCompanyName(req.getParameter("vendorCompanyName"));
					vendor.setEmail(req.getParameter("vendorMail"));
					vendor.setPh1(req.getParameter("vendorPh1"));
					vendor.setPh2(req.getParameter("vendorPh2"));
					vendor.setPinCode(req.getParameter("vendorPin"));
					vendor.setVendorType(ejb.getVendorTypeById(Integer
							.parseInt(req.getParameter("vendorType"))));
					vendor.setUsers(ejb.getUserById((String) httpSession
							.getAttribute("user")));
					accountDetails.setBankAccountNumber(req
							.getParameter("bankAccNo"));
					accountDetails.setBankChequeLable(req
							.getParameter("bankCheckLebel"));
					accountDetails.setBankIFSCnumber(req
							.getParameter("bankIFSC"));
					accountDetails.setBankMICRnumber(req
							.getParameter("bankMICR"));

					accountDetails.setBankName(req.getParameter("bankName"));
					accountDetails.setBankRTGCnumber(req
							.getParameter("bankRTGS"));
					accountDetails.setBranch(req.getParameter("bankBranch"));
					accountDetails.setCity(ejb.getCityById(Integer.parseInt(req
							.getParameter("bankCity"))));
					accountDetails
							.setCstNumber(req.getParameter("vendorCSTno"));
					accountDetails.setCstRegistrationDate(DateConverter
							.getDate(req.getParameter("vendorCSTregDate")));
					accountDetails.setExciseRegistrationDate(DateConverter
							.getDate(req.getParameter("vendorExciseRegDate")));
					accountDetails.setExciseRegistrationNumber(req
							.getParameter("vendorExciseRegNo"));
					accountDetails
							.setPanNumber(req.getParameter("vendorPANno"));
					accountDetails.setServiceTaxRegistrationDate(DateConverter
							.getDate(req
									.getParameter("vendorServiceTaxRegDate")));
					accountDetails.setServiceTaxRegistrationNumber(req
							.getParameter("vendorServiceTaxRegNo"));
					accountDetails
							.setVatNumber(req.getParameter("vendorVATno"));
					accountDetails.setVatRegistrationDate(DateConverter
							.getDate(req.getParameter("vendorVATregDate")));
					accountDetails.setTax_Type_Group(ejb
							.getTax_Type_GroupById(Integer.parseInt(req
									.getParameter("taxTypeGroupId"))));
					accountDetails.setUsers(ejb
							.getUserById((String) httpSession
									.getAttribute("user")));
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

				dt = new Date();

				paymentDetails.setPaymentDate(DateConverter.getDate(req
						.getParameter("purchaseDate")));
				paymentDetails.setTotalAmount(Float.parseFloat(req
						.getParameter("spAmount")));
				paymentDetails.setPaidAmount(Float.parseFloat(req
						.getParameter("spPaymentAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				ejb.setPaymentDetails(paymentDetails);

				purchaseEntry.setChallan_no(Integer.parseInt(req
						.getParameter("challanNo")));
				purchaseEntry.setChallanSuffix(Integer.parseInt(req
						.getParameter("challanSuffix")));
				purchaseEntry.setVendor_bill_no(req
						.getParameter("vendorBillNo"));
				purchaseEntry.setPurchase_date(DateConverter.getDate(req
						.getParameter("purchaseDate")));
				purchaseEntry.setVendor(ejb.getVendorById(Integer.parseInt(req
						.getParameter("vId"))));
				purchaseEntry.setUsers(ejb.getUserById(httpSession
						.getAttribute("user").toString()));
				purchaseEntry.setEntry_date(dt);

				purchaseEntry.setSur_charge(Integer.parseInt(req
						.getParameter("surcharge")));
				purchaseEntry.setTransport_cost(Integer.parseInt(req
						.getParameter("transportCost")));
				purchaseEntry.setTax_Type_Group(ejb
						.getTax_Type_GroupById(Integer.parseInt(req
								.getParameter("taxGroup"))));
				purchaseEntry.setPaymentStatus(ejb
						.getPaymentStatusByStatus("pstatus"));
				purchaseEntry.setPaymentType(ejb.getPaymentTypeByType("pType"));
				purchaseEntry.setPaymentDetails(paymentDetails);
				ejb.setPurchaseEntry(purchaseEntry);

				String attr1[] = req.getParameterValues("attr1H");
				String attr2[] = req.getParameterValues("attr2H");
				String attr3[] = req.getParameterValues("attr3H");
				String attr4[] = req.getParameterValues("attr4H");
				String attr5[] = req.getParameterValues("attr5H");
				String attr6[] = req.getParameterValues("attr6H");

				String mrp[] = req.getParameterValues("mrpH");
				String wsp[] = req.getParameterValues("wspH");

				String qty[] = req.getParameterValues("qtyH");
				String remQty[] = req.getParameterValues("qtyH");
				String cost[] = req.getParameterValues("rateH");
				String productId[] = req.getParameterValues("pCodeIdH");

				for (int l = 0; l < mrp.length; l++) {
					purchaseProductDetails = new Purchase_Product_Details();

					purchaseProductDetails.setAttrValue1(attr1[l]);
					purchaseProductDetails.setAttrValue2(attr2[l]);
					purchaseProductDetails.setAttrValue3(attr3[l]);
					purchaseProductDetails.setAttrValue4(attr4[l]);
					purchaseProductDetails.setAttrValue5(attr5[l]);
					purchaseProductDetails.setAttrValue6(attr6[l]);
					purchaseProductDetails.setProductDetail(ejb
							.getProductDetailsById(Integer
									.parseInt(productId[l])));
					if (req.getParameter("isSalable").equals("yes")) {
						purchaseProductDetails.setMrp(Float.parseFloat(mrp[l]));
						purchaseProductDetails.setWsp(Float.parseFloat(wsp[l]));
					}

					purchaseProductDetails
							.setQuantity(Integer.parseInt(qty[l]));
					int lq = Integer.parseInt(qty[l]);
					int InitialSlNo = Integer.parseInt(req
							.getParameter("serialH"));

					purchaseProductDetails.setRemaining_quantity(Integer
							.parseInt(remQty[l]));
					purchaseProductDetails.setCost(Integer.parseInt(cost[l]));
					purchaseProductDetails.setPurchase_Entry(purchaseEntry);
					ejb.setPurchaseProductDetails(purchaseProductDetails);
					for (int ln = 0; ln < lq; ln++) {
						serialNumber = new SerialNumber();
						serialNumber.setSerialNumber(String
								.valueOf(InitialSlNo));
						InitialSlNo++;
						serialNumber.setLotNo(req.getParameter("lotH"));
						// serialNumber.setBarcode();
						serialNumber
								.setPurchase_Product_Details(purchaseProductDetails);
						ejb.setSerialNumber(serialNumber);

						serialNumber = null;
					}

					if (req.getParameter("isSalable").equals("yes")) {
						readyGoodsStock = new ReadyGoodsStock();
						readyGoodsStock.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productId[l])));
						readyGoodsStock.setRemainingQty(Integer.parseInt(req
								.getParameter("")));
						ejb.setReadyGoodsStockDetail(readyGoodsStock);
						readyGoodsStock = null;
					} else {
						rawMaterialsStock = new RawMaterialsStock();
						rawMaterialsStock.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productId[l])));
						rawMaterialsStock.setRemainingQty(Integer.parseInt(req
								.getParameter("")));

						ejb.setRawMaterialsStocktDetail(rawMaterialsStock);
						rawMaterialsStock = null;
					}

					purchaseProductDetails = null;
				}

				msg = "Purchase entry was successfull.";
				break;

			case "addUOM":
				page = "setupUnitOfMeasure.jsp";
				int flag = 0;
				for (QtyUnit qut : ejb.getAllQtyUnit()) {
					if ((qut.getName().equalsIgnoreCase(
							req.getParameter("name")) || (qut.getAbbreviation()
							.equalsIgnoreCase(req.getParameter("abbreviation"))))) {
						flag = 1;
						break;
					}
				}
				if (flag == 0) {
					qtyUnit = new QtyUnit();
					qtyUnit.setName(req.getParameter("name"));
					qtyUnit.setAbbreviation(req.getParameter("abbreviation"));
					qtyUnit.setDescription(req.getParameter("description"));
					qtyUnit.setQtyUnitType(ejb.getQtyUnitTypeById(Integer
							.parseInt(req.getParameter("qtyUnitTypeId"))));
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
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
								.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
								.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion.setQtyUnitId1(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("firstUnit"))));
						qtyUnitConversion.setQtyUnitId2(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(Float.parseFloat(req
								.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						qtyUnitConversion = new QtyUnitConversion();
						qtyUnitConversionPK = new QtyUnitConversionPK();

						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
								.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
								.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion.setQtyUnitId2(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("firstUnit"))));
						qtyUnitConversion.setQtyUnitId1(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(1 / Float
								.parseFloat(req.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						msg = "New conversion added successfully.";
					} else if (req.getParameter("name1").equals("1")) {
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
								.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
								.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion.setQtyUnitId2(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("firstUnit"))));
						qtyUnitConversion.setQtyUnitId1(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(Float.parseFloat(req
								.getParameter("convValue")));

						ejb.setQtyUnitConversion(qtyUnitConversion);

						qtyUnitConversion = new QtyUnitConversion();
						qtyUnitConversionPK = new QtyUnitConversionPK();

						qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
								.getParameter("firstUnit")));
						qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
								.getParameter("selectedUnit")));

						qtyUnitConversion.setConversionPK(qtyUnitConversionPK);
						qtyUnitConversion.setQtyUnitId1(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("firstUnit"))));
						qtyUnitConversion.setQtyUnitId2(ejb
								.getQtyUnitById(Integer.parseInt(req
										.getParameter("selectedUnit"))));
						qtyUnitConversion.setConversion(1 / Float
								.parseFloat(req.getParameter("convValue")));

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

					qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
							.getParameter("u1")));
					qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
							.getParameter("u2")));
					qtyUnitConversion = ejb
							.getQtyUnitConversionById(qtyUnitConversionPK);
					qtyUnitConversion.setConversion(Float.parseFloat(req
							.getParameter("editValue")));

					ejb.updateQtyUnitConversion(qtyUnitConversion);

					qtyUnitConversionPK = new QtyUnitConversionPK();

					qtyUnitConversionPK.setQtyUnitId1(Integer.parseInt(req
							.getParameter("u2")));
					qtyUnitConversionPK.setQtyUnitId2(Integer.parseInt(req
							.getParameter("u1")));
					qtyUnitConversion = ejb
							.getQtyUnitConversionById(qtyUnitConversionPK);
					qtyUnitConversion.setConversion(1 / Float.parseFloat(req
							.getParameter("editValue")));

					ejb.updateQtyUnitConversion(qtyUnitConversion);

					msg = "Conversion updated successfully.";

				} else {
					msg = "please enter proper conversion value";
				}
				break;

			default:
				break;
			}
		} catch (Exception e) {
			msg = "error: " + e.getMessage();
			e.printStackTrace();
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
