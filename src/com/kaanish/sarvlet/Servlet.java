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
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.PurchaseReturnProductDetails;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SecurityAnswers;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.Base64;
import com.kaanish.util.DateConverter;

@MultipartConfig
@WebServlet({ "/logout", "/addTax", "/addTaxGroup", "/editTax", "/deleteTax",
		"/editTaxGroup", "/deleteTaxGroup", "/stockDetailShow", "/createDept",
		"/deleteDept", "/createSubDept", "/deleteSubDept",
		"/editproductSummary", "/createCategory", "/deleteCategory",
		"/newVendorType", "/addCountry", "/addState", "/createProduct",
		"/deleteCountry", "/addVendor", "/addUOM", "/editVendorType",
		"/deleteVendorType", "/addCity", "/deleteState", "/deleteCity",
		"/productSumary", "/addNewConversion", "/purchaseEntry",
		"/updateConversion", "/addBillSetup", "/updateCompanyInfo",
		"/updateVendor", "/purchaseSearchByDate", "/uploadProductImage",
		"/deleteProductImage", "/jobAssignment", "/jobAssignSearchByDate",
		"/salesEntry", "/createUserGroup", "/updateUserGroup", "/updateUser",
		"/goStockView", "/jChallanSearch", "/jobRecieve", "/createNewUser",
		"/goJobDetailShow", "/goProView", "/purchaseView", "/changePass",
		"/goSearchVendor", "/purchaseSearchByPurchaseChallanNo",
		"/purchaseSearchByVendorName", "/purchaseSearchByAgentName",
		"/purchaseSearchByProductCode", "/jobSearchByJobChallanNo",
		"/jobSearchByProductCode", "/jobSearchByJobberName", "/goSalesReturn",
		"/salesSearchByDate", "/salesSearchBySalesChallanNo",
		"/salesSearchByAgentName", "/salesSearchByCustomerName",
		"/salesSearchByProductCode", "/salesView", "/purchaseBarCode",
		"/salesReturnServlet", "/purchaseSearchAll", "/salesSearchAll",
		"/jobSearchAll", "/forgotPassUserCheck", "/forgotPassVarify",
		"/resetPass", "/purchaseSearchForReturn", "/purchaseReturn" })
public class Servlet extends HttpServlet {
	static final long serialVersionUID = 1L;

	@EJB
	private Ejb ejb;
	private HttpSession httpSession;
	private Date dt;
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
	private Purchase_Entry purchaseEntry;
	private Purchase_Product_Details purchaseProductDetails;
	private RawMaterialsStock rawMaterialsStock;
	private ReadyGoodsStock readyGoodsStock;
	private SerialNumber serialNumber;
	private PaymentDetails paymentDetails;
	private JobAssignmentDetails jobAssignmentDetails;
	private JobAssignmentProducts jobAssignmentProducts;
	private JobRecievedDetails jobRecievedDetails;
	private JobStock jobStock;
	private CustomerEntry customerEntry;
	private SalesEntry salesEntry;
	private UserGroup userGroup;
	private Users usr;
	private SalesProductDetails salesProductDetails;
	private SalesReturn salesReturn;
	private SalesProductReturnDetail salesProductReturnDetail;
	private SecurityAnswers securityAnswers;
	private VoucherAssign voucherAssign;
	private VoucherDetails voucherDetails;
	private PurchaseReturn purchaseReturn;
	private PurchaseReturnProductDetails purchaseReturnProductDetails;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * if(httpSession.getAttribute("user").equals("")){ System.exit(0); }
		 */

		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		httpSession = req.getSession();

		if (httpSession.getAttribute("user") == null) {
			if (!(url.equals("forgotPassUserCheck")
					|| url.equals("forgotPassVarify") || url
						.equals("resetPass"))) {
				System.exit(0);
			}
		}

		try {
			switch (url) {

			case "logout":
				page = "index.jsp";
				httpSession.removeAttribute("user");
				httpSession.removeAttribute("sip");
				httpSession.removeAttribute("port");
				msg = "Logout Successfull.";
				break;

			case "changePass":
				String user = (String) httpSession.getAttribute("user");
				if (ejb.getCheckLogin(user, req.getParameter("curPassword"))) {
					users = ejb.getUserById(user);
					users.setPassword(req.getParameter("newPassword"));
					ejb.updateUser(users);
					msg = "Password changed successfully.";
					page = "index.jsp";
				} else {
					msg = "Invalid current Password.";
					page = "changePassword.jsp";
					// httpSession.removeAttribute("user");
				}
				break;
			case "forgotPassUserCheck":
				int uChk = 0;
				for (Users u : ejb.getAllUsers()) {
					if (u.getUserId().equals(req.getParameter("userName"))) {
						uChk = 1;
					}
				}
				if (uChk == 1) {
					page = "forgotPasswordVarification.jsp";
					req.setAttribute("userName", req.getParameter("userName"));
					msg = "";
				} else {
					page = "forgotPassword.jsp";
					msg = "UserId does not exist...";
				}
				break;
			case "forgotPassVarify":
				page = "forgotPasswordReset.jsp";
				msg = "";
				req.setAttribute("uId", req.getParameter("uId"));
				break;
			case "resetPass":
				page = "index.jsp";
				usr = ejb.getUserById(req.getParameter("uId"));
				usr.setPassword(req.getParameter("newPassword"));
				ejb.updateUser(usr);
				msg = "Password reset is successfull...";
				break;

			case "updateCompanyInfo":
				page = "setupCompanyInfo.jsp";
				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();

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
					companyInfo
							.setChangeCount(companyInfo.getChangeCount() + 1);

					Part p = req.getPart("proImg");
					InputStream is = p.getInputStream();
					byte[] content = new byte[is.available()];
					is.read(content);
					if (!(content.length == 0)) {
						companyInfo.setImage(content);
					}

					ejb.updateCompanyInfo(companyInfo);
					msg = "Company info updated successfully.";
				} else {
					msg = "You have already change companyinfo maximum limit.";
				}

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
				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();

				int flagg = 0;
				List<ProductDetail> pro1 = ejb.getAllProductDetail();
				for (ProductDetail pqu : pro1) {
					if (pqu.getCode().equals(
							req.getParameter("productCode").toUpperCase())) {
						flagg = 1;
						break;
					}

				}
				if (flagg == 0) {
					productDetail = new ProductDetail();
					purchaseProductDetails = new Purchase_Product_Details();
					productDetail.setCode(req.getParameter("productCode")
							.toUpperCase());
					productDetail.setDescription(req
							.getParameter("description").toUpperCase());
					productDetail.setUniversalCode(req.getParameter("upc")
							.toUpperCase());
					productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
							.parseInt(req.getParameter("uom"))));
					System.out.println(req.getParameter("isRaw"));
					productDetail.setRaw(Boolean.parseBoolean(req
							.getParameter("isRaw")));
					productDetail.setSaleble(Boolean.parseBoolean(req
							.getParameter("isSalebi")));
					productDetail.setCategory(ejb.getCategoryById(Integer
							.parseInt(req.getParameter("catagoryId"))));
					productDetail.setActive(true);
					ejb.setProductDetail(productDetail);

					/*
					 * if (Boolean.parseBoolean(req.getParameter("isSalebi"))) {
					 * readyGoodsStock = new ReadyGoodsStock();
					 * readyGoodsStock.setProductDetail(productDetail);
					 * readyGoodsStock.setRemainingQty(0);
					 * ejb.setReadyGoodsStockDetail(readyGoodsStock); } else {
					 * rawMaterialsStock = new RawMaterialsStock();
					 * rawMaterialsStock.setProductDetail(productDetail);
					 * rawMaterialsStock.setRemainingQty(0);
					 * ejb.setRawMaterialsStocktDetail(rawMaterialsStock); }
					 */
					if (Boolean.parseBoolean(req.getParameter("isRaw"))) {
						rawMaterialsStock = new RawMaterialsStock();
						rawMaterialsStock.setProductDetail(productDetail);
						rawMaterialsStock.setRemainingQty(0);
						rawMaterialsStock.setCompanyInfo(ejb
								.getAllCompanyInfo().get(0));
						ejb.setRawMaterialsStocktDetail(rawMaterialsStock);

						rawMaterialsStock = null;

						rawMaterialsStock = new RawMaterialsStock();
						rawMaterialsStock.setProductDetail(productDetail);
						rawMaterialsStock.setRemainingQty(0);
						rawMaterialsStock.setCompanyInfo(ejb
								.getAllCompanyInfo().get(1));
						ejb.setRawMaterialsStocktDetail(rawMaterialsStock);
					} else {
						readyGoodsStock = new ReadyGoodsStock();
						readyGoodsStock.setProductDetail(productDetail);
						readyGoodsStock.setRemainingQty(0);
						readyGoodsStock.setCompanyInfo(ejb.getAllCompanyInfo()
								.get(0));
						ejb.setReadyGoodsStockDetail(readyGoodsStock);

						readyGoodsStock = null;

						readyGoodsStock = new ReadyGoodsStock();
						readyGoodsStock.setProductDetail(productDetail);
						readyGoodsStock.setRemainingQty(0);
						readyGoodsStock.setCompanyInfo(ejb.getAllCompanyInfo()
								.get(1));
						ejb.setReadyGoodsStockDetail(readyGoodsStock);
					}

					if (req.getParameter("addini").equals("add")) {

						purchaseProductDetails.setMrp(Float.parseFloat(req
								.getParameter("mrp1")));
						purchaseProductDetails.setWsp(Float.parseFloat(req
								.getParameter("wsp1")));
						purchaseProductDetails.setQuantity(Integer.parseInt(req
								.getParameter("qty1")));
						purchaseProductDetails.setCost(Float.parseFloat(req
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
						purchaseProductDetails.setLotNumber(req
								.getParameter("lotnumberS"));
						purchaseProductDetails.setCompanyInfo(ejb.getUserById(
								(String) httpSession.getAttribute("user"))
								.getCompanyInfo());
						ejb.setPurchaseProductDetails(purchaseProductDetails);
						serialNumber = new SerialNumber();
						serialNumber.setLotNo(req.getParameter("lotnumberS")
								.toUpperCase());
						serialNumber
								.setPurchase_Product_Details(purchaseProductDetails);

						ejb.setSerialNumber(serialNumber);

						/*
						 * if (productDetail.isSaleble()) { readyGoodsStock =
						 * ejb .getReadyGoodsStoctByProductId(productDetail
						 * .getId()); readyGoodsStock
						 * .setRemainingQty(readyGoodsStock .getRemainingQty() +
						 * Integer.parseInt(req .getParameter("qty1")));
						 * ejb.updateReadyGoodsStockDetail(readyGoodsStock); }
						 * else { rawMaterialsStock = ejb
						 * .getRawMeterialStoctByProductId(productDetail
						 * .getId()); rawMaterialsStock
						 * .setRemainingQty(rawMaterialsStock .getRemainingQty()
						 * + Integer.parseInt(req .getParameter("qty1")));
						 * ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						 * }
						 */
						if (productDetail.isRaw()) {
							rawMaterialsStock = ejb
									.getRawMeterialStoctByProductAndCompanyId(
											productDetail.getId(),
											companyInfo.getId());
							rawMaterialsStock
									.setRemainingQty(rawMaterialsStock
											.getRemainingQty()
											+ Integer.parseInt(req
													.getParameter("qty1")));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						} else {
							readyGoodsStock = ejb
									.getReadyGoodStoctByProductAndCompanyId(
											productDetail.getId(),
											companyInfo.getId());
							readyGoodsStock
									.setRemainingQty(readyGoodsStock
											.getRemainingQty()
											+ Integer.parseInt(req
													.getParameter("qty1")));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
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
				billSetup.setCompanyInfo(ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo());
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

			case "updateVendor":
				page = "purchasingVendor.jsp";
				vendor = ejb.getVendorById(Integer.parseInt(req
						.getParameter("vendoeId")));// vendorid

				vendor.setName(req.getParameter("vendorName"));
				vendor.setCompanyName(req.getParameter("vendorCompanyName"));
				vendor.setPh1(req.getParameter("vendorPh1"));
				vendor.setPh2(req.getParameter("vendorPh2"));
				vendor.setEmail(req.getParameter("vendorMail"));
				vendor.setAliseName(req.getParameter("vendorAlias"));
				vendor.setAddress(req.getParameter("vendorAddress"));
				vendor.setPinCode(req.getParameter("vendorPin"));
				vendor.setVendorType(ejb.getVendorTypeById(Integer.parseInt(req
						.getParameter("vendorType"))));
				vendor.setCity(ejb.getCityById(Integer.parseInt(req
						.getParameter("vendorCityId"))));

				accountDetails = ejb.getAccountDetailsByVendorId(Integer
						.parseInt(req.getParameter("vendoeId")));// vender
																	// id

				accountDetails.setVatNumber(req.getParameter("vendorVATno"));
				accountDetails.setVatRegistrationDate(DateConverter.getDate(req
						.getParameter("vendorVATregDate")));
				accountDetails.setCstNumber(req.getParameter("vendorCSTno"));
				accountDetails.setCstRegistrationDate(DateConverter.getDate(req
						.getParameter("vendorVATregDate")));
				accountDetails.setPanNumber(req.getParameter("vendorPANno"));
				accountDetails.setExciseRegistrationNumber(req
						.getParameter("vendorExciseRegNo"));
				accountDetails.setExciseRegistrationDate(DateConverter
						.getDate(req.getParameter("vendorExciseRegDate")));
				accountDetails.setServiceTaxRegistrationNumber(req
						.getParameter("vendorServiceTaxRegNo"));
				accountDetails.setServiceTaxRegistrationDate(DateConverter
						.getDate(req.getParameter("vendorServiceTaxRegDate")));
				accountDetails.setBankName(req.getParameter("bankName"));
				accountDetails.setBankAccountNumber(req
						.getParameter("bankAccNo"));
				accountDetails.setBranch(req.getParameter("bankBranch"));
				accountDetails.setCity(ejb.getCityById(Integer.parseInt(req
						.getParameter("bankCity"))));
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

				productDetail = ejb.getProductDetailsById(Integer.parseInt(req
						.getParameter("productid")));
				productDetail.setCode(req.getParameter("productCode123"));

				productDetail
						.setDescription(req.getParameter("description123"));
				productDetail.setQtyUnit(ejb.getQtyUnitById(Integer
						.parseInt(req.getParameter("uom123"))));

				productDetail.setUniversalCode(req.getParameter("upc123"));
				ejb.updateProductDetail(productDetail);

				msg = "update successfully.";

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
					if (t.getName().equals(
							req.getParameter("name").toUpperCase())
							&& t.isActive()) {
						f = 1;
						break;
					}
				}
				if (f == 0) {
					tax.setName(req.getParameter("name").toUpperCase());
					tax.setValue(Float.parseFloat(req.getParameter("value")));
					tax.setActive(true);
					tax.setUsers(ejb.getUserById((String) httpSession
							.getAttribute("user")));

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
					if (t.getName().equals(
							req.getParameter("name").toUpperCase())
							&& t.isActive()) {
						f1 = 1;
						break;
					}
				}

				if (f1 == 0) {
					tax_type_group.setName(req.getParameter("name")
							.toUpperCase());

					String[] taxes = req.getParameterValues("tax");

					if (taxes != null) {

						List<Tax> taxlst = new ArrayList<Tax>();

						for (String taxName : taxes) {
							taxlst.add(ejb.getTaxById(Integer.parseInt(taxName)));
						}

						tax_type_group.setTaxes(taxlst);
						tax_type_group.setActive(true);
						tax_type_group.setUsers(ejb
								.getUserById((String) httpSession
										.getAttribute("user")));

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
				tax_type_group = ejb.getTax_Type_GroupById(Integer.parseInt(req
						.getParameter("id")));
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
				tax_type_group.setActive(Boolean.parseBoolean(req
						.getParameter("isActiveG")));
				ejb.updateTaxTypeGroup(tax_type_group);
				msg = "Tax group updated succesfully.";
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
					department.setName(req.getParameter("name").toUpperCase());
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
					subDepartment.setName(req.getParameter("name")
							.toUpperCase());
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
					category.setName(req.getParameter("name").toUpperCase());
					category.setAttrNmae1(req.getParameter("attr1")
							.toUpperCase());
					category.setAttrNmae2(req.getParameter("attr2")
							.toUpperCase());
					category.setAttrNmae3(req.getParameter("attr3")
							.toUpperCase());
					category.setAttrNmae4(req.getParameter("attr4")
							.toUpperCase());
					category.setAttrNmae5(req.getParameter("attr5")
							.toUpperCase());
					category.setAttrNmae6(req.getParameter("attr6")
							.toUpperCase());
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
					if (coty.getCountryName().equals(
							req.getParameter("name").toUpperCase())) {
						flagg1 = 1;
						break;
					}

				}
				if (flagg1 == 0) {
					country = new Country();
					country.setCountryName(req.getParameter("name")
							.toUpperCase());
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
					if (st.getStateName().equals(
							req.getParameter("name").toUpperCase())) {
						flag1 = 1;
						break;
					}
				}
				if (flag1 == 0) {
					state = new State();
					state.setStateName(req.getParameter("name").toUpperCase());
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
					if (c.getCityName().equals(
							req.getParameter("name").toUpperCase())) {
						flag2 = 1;
						break;
					}
				}
				if (flag2 == 0) {
					city = new City();
					city.setCityName(req.getParameter("name").toUpperCase());
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

					vendor.setName(req.getParameter("vendorName").toUpperCase());
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

					if (!req.getParameter("bankCity").equals("")) {
						accountDetails.setCity(ejb.getCityById(Integer
								.parseInt(req.getParameter("bankCity"))));
					}

					accountDetails
							.setCstNumber(req.getParameter("vendorCSTno"));
					if (!req.getParameter("vendorCSTregDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req.getParameter("vendorCSTregDate")));
					}
					if (!req.getParameter("vendorExciseRegDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req
										.getParameter("vendorExciseRegDate")));
					}
					if (!req.getParameter("vendorServiceTaxRegDate").equals("")) {
						accountDetails
								.setCstRegistrationDate(DateConverter.getDate(req
										.getParameter("vendorServiceTaxRegDate")));
					}
					if (!req.getParameter("vendorVATregDate").equals("")) {
						accountDetails.setCstRegistrationDate(DateConverter
								.getDate(req.getParameter("vendorVATregDate")));
					}

					accountDetails.setExciseRegistrationNumber(req
							.getParameter("vendorExciseRegNo"));
					accountDetails
							.setPanNumber(req.getParameter("vendorPANno"));

					accountDetails.setServiceTaxRegistrationNumber(req
							.getParameter("vendorServiceTaxRegNo"));
					accountDetails
							.setVatNumber(req.getParameter("vendorVATno"));

					if (!req.getParameter("taxTypeGroupId").equals("0")) {
						accountDetails.setTax_Type_Group(ejb
								.getTax_Type_GroupById(Integer.parseInt(req
										.getParameter("taxTypeGroupId"))));
					}

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
				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				purchaseEntry = new Purchase_Entry();
				paymentDetails = new PaymentDetails();

				List<Purchase_Entry> purEntry = ejb.getAllPurchaseEntry();
				int fm = 0;
				for (Purchase_Entry pe : purEntry) {
					if (pe.getVendor_bill_no().equals(
							req.getParameter("vendorBillNo"))) {
						fm = 1;
						break;
					}
				}
				if (fm == 0) {
					purchaseEntry.setVendor_bill_no(req.getParameter(
							"vendorBillNo").toUpperCase());

					dt = new Date();
					purchaseEntry.setChallan_no(Integer.parseInt(req
							.getParameter("challanNo")));
					purchaseEntry.setChallanSuffix(Integer.parseInt(req
							.getParameter("challanSuffix")));
					purchaseEntry.setChallanNumber(req
							.getParameter("challanNumber"));

					purchaseEntry.setPurchase_date(DateConverter.getDate(req
							.getParameter("purchaseDate")));
					purchaseEntry.setVendor(ejb.getVendorById(Integer
							.parseInt(req.getParameter("vId"))));
					purchaseEntry.setUsers(ejb.getUserById(httpSession
							.getAttribute("user").toString()));
					purchaseEntry.setEntry_date(dt);

					purchaseEntry.setSur_charge(Float.parseFloat(req
							.getParameter("surcharge")));
					purchaseEntry.setTransport_cost(Float.parseFloat(req
							.getParameter("transportCost")));
					purchaseEntry.setTotalCost(Float.parseFloat(req
							.getParameter("spAmount")));
					purchaseEntry.setTax_Type_Group(ejb
							.getTax_Type_GroupById(Integer.parseInt(req
									.getParameter("taxGroup"))));
					purchaseEntry.setSubTotal(Float.parseFloat(req
							.getParameter("subTotal")));
					purchaseEntry.setTaxAmount(Float.parseFloat(req
							.getParameter("taxAmount")));
					/*
					 * purchaseEntry.setDueAmount(Float.parseFloat(req
					 * .getParameter("spDueAmount")));
					 */
					purchaseEntry.setCompanyInfo(ejb.getUserById(
							(String) httpSession.getAttribute("user"))
							.getCompanyInfo());
					purchaseEntry.setRoundOf(Float.parseFloat(req
							.getParameter("roundvalue")));
					if (req.getParameter("isAgent").equals("yes")) {
						purchaseEntry.setAgentId(Integer.parseInt(req
								.getParameter("agentName")));
					}
					ejb.setPurchaseEntry(purchaseEntry);

					if (ejb.getVoucherAssignByVendorId(
							Integer.parseInt(req.getParameter("vId"))).size() == 0) {
						voucherAssign = new VoucherAssign();
						vendor = ejb.getVendorById(Integer.parseInt(req
								.getParameter("vId")));
						voucherAssign.setVendor(vendor);
						voucherAssign.setVoucherDetailsNumber(vendor.getPh1());
						ejb.setVoucherAssign(voucherAssign);
					} else {
						voucherAssign = ejb.getVoucherAssignByVendorId(
								Integer.parseInt(req.getParameter("vId"))).get(
								0);
					}

					voucherDetails = new VoucherDetails();
					voucherDetails.setVoucherAssign(voucherAssign);
					voucherDetails.setCredit(true);
					voucherDetails.setValue(Float.parseFloat(req
							.getParameter("spDueAmount")));
					voucherDetails.setTotalCreditNote(Float.parseFloat(req
							.getParameter("spDueAmount")));
					voucherDetails.setVoucherDate(DateConverter.getDate(req
							.getParameter("payDate")));
					voucherDetails.setUsers(ejb
							.getUserById((String) httpSession
									.getAttribute("user")));
					voucherDetails.setPurchase_Entry(purchaseEntry);
					ejb.setVoucherDetails(voucherDetails);

					paymentDetails.setPaymentDate(DateConverter.getDate(req
							.getParameter("payDate")));
					paymentDetails.setTotalAmount(Float.parseFloat(req
							.getParameter("spAmount")));
					paymentDetails.setPaidAmount(Float.parseFloat(req
							.getParameter("spPaymentAmount")));
					paymentDetails.setDescription(req.getParameter("desc"));
					paymentDetails.setPurchase_Entry(purchaseEntry);
					paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
							.getParameter("pType")));
					paymentDetails.setPaymentStatus(ejb
							.getPaymentStatusByStatus(req
									.getParameter("pstatus")));
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
						purchaseProductDetails.setProductDetail(ejb
								.getProductDetailsById(Integer
										.parseInt(productId[l])));
						if (req.getParameter("isSalable").equals("yes")) {
							purchaseProductDetails.setMrp(Float
									.parseFloat(mrp[l]));
							purchaseProductDetails.setWsp(Float
									.parseFloat(wsp[l]));
						}

						purchaseProductDetails.setQuantity(Integer
								.parseInt(qty[l]));

						purchaseProductDetails.setRemaining_quantity(Integer
								.parseInt(qty[l]));
						purchaseProductDetails.setCost(Float
								.parseFloat(cost[l]));
						purchaseProductDetails.setPurchase_Entry(purchaseEntry);
						purchaseProductDetails.setLotNumber(lot[l]);
						purchaseProductDetails.setCompanyInfo(companyInfo);
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
						if (purchaseProductDetails.getProductDetail().isRaw()) {
							rawMaterialsStock = ejb
									.getRawMeterialStoctByProductAndCompanyId(
											purchaseProductDetails
													.getProductDetail().getId(),
											companyInfo.getId());
							rawMaterialsStock.setProductDetail(ejb
									.getProductDetailsById(Integer
											.parseInt(productId[l])));
							rawMaterialsStock.setRemainingQty(rawMaterialsStock
									.getRemainingQty()
									+ Integer.parseInt(qty[l]));
							ejb.updateRawMaterialStockDetail(rawMaterialsStock);
							rawMaterialsStock = null;
						} else {
							readyGoodsStock = ejb
									.getReadyGoodStoctByProductAndCompanyId(
											purchaseProductDetails
													.getProductDetail().getId(),
											companyInfo.getId());
							readyGoodsStock.setProductDetail(ejb
									.getProductDetailsById(Integer
											.parseInt(productId[l])));
							readyGoodsStock.setRemainingQty(readyGoodsStock
									.getRemainingQty()
									+ Integer.parseInt(qty[l]));
							ejb.updateReadyGoodsStockDetail(readyGoodsStock);
							readyGoodsStock = null;
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

			case "purchaseSearchForReturn":
				page = "purchaseReturn.jsp";

				List<Purchase_Entry> purEntryListR = ejb
						.getPurchaseEntryByChallanNo(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));

				if (purEntryListR.size() > 0) {
					req.setAttribute("pId", purEntryListR.get(0).getId());

					msg = "Your search for Purchase challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Purchase challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix") + "...";
				}
				break;

			case "purchaseReturn":
				page = "purchaseReturn.jsp";

				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				purchaseEntry = ejb.getPurchaseEntryById(Integer.parseInt(req
						.getParameter("peId")));
				voucherAssign = ejb.getVoucherAssignByVendorId(
						Integer.parseInt(req.getParameter("vId"))).get(0);

				purchaseReturn = new PurchaseReturn();
				purchaseReturn.setChallanNumber(req
						.getParameter("challanNumber"));
				purchaseReturn.setPurchaseEntry(purchaseEntry);
				purchaseReturn.setRoundOff(Float.parseFloat(req
						.getParameter("roundvalue")));
				purchaseReturn.setReturnDate(DateConverter.getDate(req
						.getParameter("returnDate")));
				purchaseReturn.setChallanNo(Integer.parseInt(req
						.getParameter("challanNo")));
				purchaseReturn.setChallanSuffix(Integer.parseInt(req
						.getParameter("challanSuffix")));
				purchaseReturn.setTotalReCost(Float.parseFloat(req
						.getParameter("gTotal")));
				purchaseReturn.setReferencePurchaseChallan(req
						.getParameter("REFchallanNumber"));
				purchaseReturn.setPurchaseEntry(purchaseEntry);
				ejb.setPurchaseReturn(purchaseReturn);

				if (req.getParameter("pType").equals("Credit Note")) {
					voucherDetails = new VoucherDetails();
					voucherDetails.setVoucherAssign(voucherAssign);
					voucherDetails.setCredit(false);
					voucherDetails.setValue(Float.parseFloat(req
							.getParameter("spAmount")));
					voucherDetails.setTotalCreditNote(Float.parseFloat(req
							.getParameter("totalCredit"))
							- Float.parseFloat(req.getParameter("spAmount")));
					voucherDetails.setVoucherDate(DateConverter.getDate(req
							.getParameter("payDate")));
					voucherDetails.setUsers(ejb
							.getUserById((String) httpSession
									.getAttribute("user")));
					voucherDetails.setPurchaseReturn(purchaseReturn);
					ejb.setVoucherDetails(voucherDetails);
				}

				paymentDetails = new PaymentDetails();
				paymentDetails.setPaymentDate(DateConverter.getDate(req
						.getParameter("payDate")));
				paymentDetails.setPaidAmount(Float.parseFloat(req
						.getParameter("spAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				paymentDetails.setPurchaseReturn(purchaseReturn);
				paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
						.getParameter("pType")));

				ejb.setPaymentDetails(paymentDetails);

				String db[] = req.getParameterValues("drawBack");
				String rQty[] = req.getParameterValues("rQty");
				String purProductDetailsID[] = req
						.getParameterValues("purProductDetailsID");

				for (int l = 0; l < db.length; l++) {

					System.out.println("Return qty: "
							+ Integer.parseInt(rQty[l]));

					purchaseProductDetails = ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(purProductDetailsID[l]));
					purchaseProductDetails
							.setTotalReturningQty(purchaseProductDetails
									.getTotalReturningQty()
									+ Integer.parseInt(rQty[l]));
					purchaseProductDetails
							.setRemaining_quantity(purchaseProductDetails
									.getRemaining_quantity()
									- Integer.parseInt(rQty[l]));
					purchaseProductDetails.setPurchaseReturn(purchaseReturn);
					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					purchaseReturnProductDetails = new PurchaseReturnProductDetails();
					purchaseReturnProductDetails.setFault(db[l]);
					purchaseReturnProductDetails.setQtyReturn(Integer
							.parseInt(rQty[l]));
					purchaseReturnProductDetails
							.setPurchaseProductDetails(purchaseProductDetails);
					purchaseReturnProductDetails
							.setPurchaseReturn(purchaseReturn);
					ejb.setPurchaseProdReturnDetails(purchaseReturnProductDetails);

					if (purchaseProductDetails.getProductDetail().isRaw()) {
						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());
						rawMaterialsStock.setRemainingQty(rawMaterialsStock
								.getRemainingQty() - Integer.parseInt(rQty[l]));
						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
						rawMaterialsStock = null;
					} else {
						readyGoodsStock = ejb
								.getReadyGoodStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());
						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty() - Integer.parseInt(rQty[l]));
						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
						readyGoodsStock = null;
					}

				}
				req.setAttribute("purRetIdforPC", purchaseReturn.getId());
				msg = "Purchase Return Succeessful";

				break;

			case "salesEntry":
				page = "salesSalesEntry.jsp";
				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();

				if (req.getParameter("isExistingCust").equals("0")) {
					customerEntry = new CustomerEntry();
					customerEntry.setName(req.getParameter("custName"));
					customerEntry.setAddress(req.getParameter("addr"));
					customerEntry.setCity(req.getParameter("city"));
					customerEntry.setMobile(req.getParameter("phone"));
					customerEntry.setVat_cst_no(req.getParameter("vatcst"));
					ejb.setCustomerEntry(customerEntry);

					voucherAssign = new VoucherAssign();
					voucherAssign.setCustomerEntry(customerEntry);

					voucherAssign.setVoucherDetailsNumber(customerEntry
							.getMobile());
					ejb.setVoucherAssign(voucherAssign);

				}

				salesEntry = new SalesEntry();
				dt = new Date();
				salesEntry.setChallanNumber(req.getParameter("challanNumber"));
				salesEntry.setChallanNo(Integer.parseInt(req
						.getParameter("challanNo")));
				salesEntry.setChallanSuffix(Integer.parseInt(req
						.getParameter("challanSuffix")));
				salesEntry.setEntry_Date(dt);
				salesEntry.setSales_date(DateConverter.getDate(req
						.getParameter("salesDate")));
				salesEntry.setTax_Type_Group(ejb.getTax_Type_GroupById(Integer
						.parseInt(req.getParameter("taxGroup"))));
				salesEntry.setSubTotal(Float.parseFloat(req
						.getParameter("subtotalvalue")));
				salesEntry.setTaxAmount(Float.parseFloat(req
						.getParameter("taxAmount")));
				salesEntry.setTransportcCharge(Float.parseFloat(req
						.getParameter("transcharge")));
				salesEntry.setSurcharge(Float.parseFloat(req
						.getParameter("surcharge")));
				salesEntry.setRoundOf(Float.parseFloat(req
						.getParameter("roundvalue")));
				salesEntry.setTotalCost(Float.parseFloat(req
						.getParameter("grandtotal")));
				/*
				 * salesEntry.setDueAmount(Float.parseFloat(req
				 * .getParameter("spDueAmount")));
				 */
				salesEntry.setCompanyInfo(companyInfo);

				if (!req.getParameter("aId").equals("")) {
					salesEntry.setVendor(ejb.getVendorById(Integer.parseInt(req
							.getParameter("aId"))));
				}

				if (req.getParameter("wspORmrp").equals("mrpVal")) {
					salesEntry.setMRP(true);
				} else {
					salesEntry.setMRP(false);
				}
				if (req.getParameter("disType").equals("disFlat")) {
					salesEntry.setFlatDiscount(true);
				} else {
					salesEntry.setFlatDiscount(false);
				}

				if (req.getParameter("isExistingCust").equals("0")) {
					salesEntry.setCustomer(customerEntry);
				} else {
					salesEntry.setCustomer(ejb.getCustomerEntryById(Integer
							.parseInt(req.getParameter("existingCustId"))));
				}

				salesEntry.setDiscountValue(Float.parseFloat(req
						.getParameter("disValue")));

				ejb.setSalesEntry(salesEntry);

				voucherDetails = new VoucherDetails();

				voucherDetails.setSalesEntry(salesEntry);

				voucherDetails.setCredit(false);

				voucherDetails.setValue(Float.parseFloat(req
						.getParameter("spDueAmount")));
				voucherDetails.setVoucherDate(DateConverter.getDate(req
						.getParameter("payDate")));
				voucherDetails.setUsers(ejb.getUserById(httpSession
						.getAttribute("user").toString()));
				voucherDetails.setVoucherAssign(voucherAssign);

				ejb.setVoucherDetails(voucherDetails);

				paymentDetails = new PaymentDetails();
				paymentDetails.setPaymentDate(DateConverter.getDate(req
						.getParameter("payDate")));
				paymentDetails.setTotalAmount(Float.parseFloat(req
						.getParameter("spAmount")));
				paymentDetails.setPaidAmount(Float.parseFloat(req
						.getParameter("spPaymentAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				paymentDetails.setSalesEntry(salesEntry);
				paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
						.getParameter("pType")));
				paymentDetails.setPaymentStatus(ejb
						.getPaymentStatusByStatus(req.getParameter("pstatus")));
				ejb.setPaymentDetails(paymentDetails);

				String productId[] = req.getParameterValues("productId");
				String qtyvalue[] = req.getParameterValues("qtyvalue");
				String mrpQty[] = req.getParameterValues("mrpQty");
				String purchaseProductDetId[] = req
						.getParameterValues("purchaseProductDetId");

				for (int l = 0; l < productId.length; l++) {
					salesProductDetails = new SalesProductDetails();

					salesProductDetails.setSalesEntry(salesEntry);

					salesProductDetails.setSalesPrice(Float
							.parseFloat(mrpQty[l]));

					salesProductDetails.setQuantity(Integer
							.parseInt(qtyvalue[l]));

					salesProductDetails.setPurchase_Product_Details(ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(purchaseProductDetId[l])));

					ejb.setSalesProductDetails(salesProductDetails);

					purchaseProductDetails = ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(purchaseProductDetId[l]));

					purchaseProductDetails
							.setRemaining_quantity(purchaseProductDetails
									.getRemaining_quantity()
									- Integer.parseInt(qtyvalue[l]));

					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					if (purchaseProductDetails.getProductDetail().isRaw()) {
						rawMaterialsStock = ejb
								.getRawMeterialStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());

						rawMaterialsStock.setRemainingQty(rawMaterialsStock
								.getRemainingQty()
								- Integer.parseInt(qtyvalue[l]));

						ejb.updateRawMaterialStockDetail(rawMaterialsStock);
					} else {
						readyGoodsStock = ejb
								.getReadyGoodStoctByProductAndCompanyId(
										purchaseProductDetails
												.getProductDetail().getId(),
										companyInfo.getId());

						readyGoodsStock.setRemainingQty(readyGoodsStock
								.getRemainingQty()
								- Integer.parseInt(qtyvalue[l]));

						ejb.updateReadyGoodsStockDetail(readyGoodsStock);
					}

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
				List<Purchase_Entry> purEntryList = ejb
						.getPurchaseEntryByDateAndCompany(
								DateConverter
										.getDate(req.getParameter("fDate")),
								DateConverter.getDate(req.getParameter("lDate")),
								ejb.getUserById(
										(String) httpSession
												.getAttribute("user"))
										.getCompanyInfo().getId());
				req.setAttribute("purEntryList", purEntryList);
				if (purEntryList.size() > 0) {
					msg = "Your search for dated " + req.getParameter("fDate")
							+ " to " + req.getParameter("lDate");
				} else {
					msg = "No result found for dated "
							+ req.getParameter("fDate") + " to "
							+ req.getParameter("lDate") + "...";
				}
				break;

			case "purchaseSearchByPurchaseChallanNo":
				page = "purchasingPurchaseSearch.jsp";

				/*
				 * List<Purchase_Entry> purEntryList1 = ejb
				 * .getPurchaseEntryByChallanNo(req
				 * .getParameter("purChallanNo"));
				 */

				List<Purchase_Entry> purEntryList1 = ejb
						.getPurchaseEntryByChallanNo(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));

				req.setAttribute("purEntryList", purEntryList1);

				if (purEntryList1.size() > 0) {
					msg = "Your search for Purchase challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Purchase challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix") + "...";
				}

				/*
				 * if (purEntryList1.size() > 0) { msg =
				 * "Your search for Purchase challan number : " +
				 * req.getParameter("purChallanNo").toUpperCase(); } else { msg
				 * = "No result found for Purchase challan number : " +
				 * req.getParameter("purChallanNo").toUpperCase() + "..."; }
				 */
				break;

			case "purchaseSearchByVendorName":
				page = "purchasingPurchaseSearch.jsp";
				List<Purchase_Entry> purEntryList2 = ejb
						.getPurchaseEntryByVendorNameAndCompany(req
								.getParameter("vendorName"));
				req.setAttribute("purEntryList", purEntryList2);
				if (purEntryList2.size() > 0) {
					msg = "Your search for Vendor name : "
							+ req.getParameter("vendorName").toUpperCase();
				} else {
					msg = "No result found for Vendor name : "
							+ req.getParameter("vendorName").toUpperCase()
							+ "...";
				}
				break;

			case "purchaseSearchByAgentName":
				page = "purchasingPurchaseSearch.jsp";
				List<Purchase_Entry> purEntryList3 = ejb
						.getPurchaseEntryByAgentNameAndCompany(req
								.getParameter("agentName"));
				req.setAttribute("purEntryList", purEntryList3);
				if (purEntryList3.size() > 0) {
					msg = "Your search for Agent name : "
							+ req.getParameter("agentName").toUpperCase();
				} else {
					msg = "No result found for Agent name : "
							+ req.getParameter("agentName").toUpperCase()
							+ "...";
				}
				break;

			case "purchaseSearchByProductCode":
				page = "purchasingPurchaseSearch.jsp";
				List<Purchase_Entry> purEntryList4 = ejb
						.getPurchaseEntryByProductCodeAndCompany(req
								.getParameter("prodCode"));
				req.setAttribute("purEntryList", purEntryList4);
				if (purEntryList4.size() > 0) {
					msg = "Your search for Product code : "
							+ req.getParameter("prodCode").toUpperCase();
				} else {
					msg = "No result found for product code : "
							+ req.getParameter("prodCode").toUpperCase()
							+ "...";
				}
				break;

			case "purchaseSearchAll":
				page = "purchasingPurchaseSearch.jsp";
				List<Purchase_Entry> purEntryListA = ejb
						.getAllPurchaseEntryByCompany();
				req.setAttribute("purEntryList", purEntryListA);
				if (purEntryListA.size() > 0) {
					msg = "All Purchase List";
				} else {
					msg = "No result found...";
				}
				break;

			case "purchaseBarCode":
				page = "purchaseBarcode.jsp";
				String purProdDetIdLst[] = req.getParameterValues("prodCheck");
				String qtyLst[] = req.getParameterValues("qtyProd");
				List<Purchase_Product_Details> purProdDetLst = new ArrayList<Purchase_Product_Details>();
				for (int q = 0; q < qtyLst.length; q++) {
					if (qtyLst[q] != null || qtyLst[q] != "") {
						Purchase_Product_Details ppd = ejb
								.getPurchaseProductDetailsById(Integer
										.parseInt(purProdDetIdLst[q]));
						ppd.setNumberForBarcodePrint(Integer
								.parseInt(qtyLst[q]));
						purProdDetLst.add(ppd);
						ppd = null;
					}
				}
				req.setAttribute("purProdDetLst", purProdDetLst);
				break;

			case "purchaseView":
				page = "purchaseView.jsp";

				req.setAttribute("pId", req.getParameter("pId"));

				msg = "";

				break;

			case "jobAssignment":
				page = "jobAssign.jsp";
				jobAssignmentDetails = new JobAssignmentDetails();
				dt = new Date();
				companyInfo = ejb.getUserById(
						(String) httpSession.getAttribute("user"))
						.getCompanyInfo();
				jobAssignmentDetails.setAssignDate(DateConverter.getDate(req
						.getParameter("assignedDate")));
				jobAssignmentDetails.setEstimatedCompletionDate(DateConverter
						.getDate(req.getParameter("estSubmissionDate")));
				jobAssignmentDetails.setChallanNumber(req
						.getParameter("jobChallanNo"));
				jobAssignmentDetails.setChallan_no(Integer.parseInt(req
						.getParameter("challanNo")));
				jobAssignmentDetails.setChallanSuffix(Integer.parseInt(req
						.getParameter("challanSuffix")));
				jobAssignmentDetails.setEntryDate(dt);
				jobAssignmentDetails.setVendor(ejb.getVendorById(Integer
						.parseInt(req.getParameter("jName"))));
				jobAssignmentDetails.setCompanyInfo(companyInfo);

				ejb.setJobAssignment(jobAssignmentDetails);

				String pProdDetIdH[] = req.getParameterValues("pProdDetIdH");
				String qtyH[] = req.getParameterValues("qtyH");
				String workH[] = req.getParameterValues("workH");

				for (int l = 0; l < pProdDetIdH.length; l++) {
					jobAssignmentProducts = new JobAssignmentProducts();

					jobAssignmentProducts.setPurchase_Product_Details(ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(pProdDetIdH[l])));
					jobAssignmentProducts.setQty(Integer.parseInt(qtyH[l]));
					jobAssignmentProducts.setRemaninQty(Integer
							.parseInt(qtyH[l]));
					jobAssignmentProducts.setWorkDescription(workH[l]);
					jobAssignmentProducts
							.setJobAssignmentDetails(jobAssignmentDetails);
					ejb.setJobAssignmentProducts(jobAssignmentProducts);

					jobStock = new JobStock();
					jobStock.setJobAssignmentProducts(jobAssignmentProducts);
					jobStock.setGivenQty(Integer.parseInt(qtyH[l]));
					jobStock.setRemainingQty(Integer.parseInt(qtyH[l]));

					ejb.setJobStock(jobStock);

					purchaseProductDetails = ejb
							.getPurchaseProductDetailsById(Integer
									.parseInt(pProdDetIdH[l]));
					purchaseProductDetails
							.setRemaining_quantity(purchaseProductDetails
									.getRemaining_quantity()
									- Integer.parseInt(qtyH[l]));
					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					rawMaterialsStock = ejb
							.getRawMeterialStoctByProductAndCompanyId(
									purchaseProductDetails.getProductDetail()
											.getId(), companyInfo.getId());
					rawMaterialsStock.setRemainingQty(rawMaterialsStock
							.getRemainingQty() - Integer.parseInt(qtyH[l]));
					ejb.updateRawMaterialStockDetail(rawMaterialsStock);

					rawMaterialsStock = null;
					jobStock = null;
					jobAssignmentProducts = null;
					purchaseProductDetails = null;
				}

				msg = "Job assigned succesfully.";
				break;

			case "jChallanSearch":
				page = "jobReceive.jsp";

				JobAssignmentDetails jobAssignListr = ejb
						.getJobAssignmentDetailsbyChallanNumber(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));

				req.setAttribute("amj", jobAssignListr);

				if (!jobAssignListr.equals(null)) {
					msg = "Your search for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix") + "...";
				}

				/*
				 * jobAssignmentDetails = ejb
				 * .getJobAssignmentDetailsbyChallanNumberAndCompany(req
				 * .getParameter("jChallan"));
				 * 
				 * req.setAttribute("amj", jobAssignmentDetails); msg = "";
				 */

				break;

			case "jobAssignSearchByDate":
				page = "jobAssignSearch.jsp";
				List<JobAssignmentDetails> jobAssignList = ejb
						.getJobAssignmentByDate(DateConverter.getDate(req
								.getParameter("fDate")), DateConverter
								.getDate(req.getParameter("lDate")));
				req.setAttribute("jobAssignList", jobAssignList);
				if (jobAssignList.size() > 0) {
					msg = "Your search for dated " + req.getParameter("fDate")
							+ " to " + req.getParameter("lDate");
				} else {
					msg = "No result found for dated "
							+ req.getParameter("fDate") + " to "
							+ req.getParameter("lDate") + "...";
				}
				break;

			case "jobSearchByJobChallanNo":
				page = "jobAssignSearch.jsp";

				/*
				 * List<JobAssignmentDetails> jobAssignList1 = ejb
				 * .getJobAssignByChallanNo(req .getParameter("jobChallanNo"));
				 */

				List<JobAssignmentDetails> jobAssignList1 = ejb
						.getJobAssignByChallanNo(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));
				req.setAttribute("jobAssignList", jobAssignList1);

				if (jobAssignList1.size() > 0) {
					msg = "Your search for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix") + "...";
				}

				/*
				 * if (jobAssignList1.size() > 0) { msg =
				 * "Your search for Job challan number : " +
				 * req.getParameter("jobChallanNo").toUpperCase(); } else { msg
				 * = "No result found for Job challan number : " +
				 * req.getParameter("jobChallanNo").toUpperCase() + "..."; }
				 */
				break;

			case "jobSearchByJobberName":
				page = "jobAssignSearchByJobber.jsp";
				List<JobAssignmentDetails> jobAssignList2 = ejb
						.getJobAssignByJobberName(req
								.getParameter("jobberName"));
				req.setAttribute("jobAssignList", jobAssignList2);
				if (jobAssignList2.size() > 0) {
					msg = "Your search for Jobber name : "
							+ req.getParameter("jobberName").toUpperCase();
				} else {
					msg = "No result found for jobber name : "
							+ req.getParameter("jobberName").toUpperCase()
							+ "...";
				}
				break;

			case "jobSearchByProductCode":
				page = "jobAssignSearch.jsp";
				List<JobAssignmentDetails> jobAssignList3 = ejb
						.getJobAssignByProductCode(req.getParameter("prodCode"));
				req.setAttribute("jobAssignList", jobAssignList3);
				if (jobAssignList3.size() > 0) {
					msg = "Your search for Product code : "
							+ req.getParameter("prodCode").toUpperCase();
				} else {
					msg = "No result found for product code : "
							+ req.getParameter("prodCode").toUpperCase()
							+ "...";
				}
				break;

			case "jobSearchAll":
				page = "jobAssignSearch.jsp";
				List<JobAssignmentDetails> jobAssignListA = ejb
						.getAllJobassignmentDetailsByCompany();
				req.setAttribute("jobAssignList", jobAssignListA);
				if (jobAssignListA.size() > 0) {
					msg = "All Job Assign List";
				} else {
					msg = "No result found...";
				}
				break;

			case "salesSearchByDate":
				page = "salesSearch.jsp";

				List<SalesEntry> salesEntryLst = ejb.getSalesEntryByDate(
						DateConverter.getDate(req.getParameter("fDate")),
						DateConverter.getDate(req.getParameter("lDate")));
				req.setAttribute("salesEntryLst", salesEntryLst);

				if (salesEntryLst.size() > 0) {
					msg = "Your search for dated " + req.getParameter("fDate")
							+ " to " + req.getParameter("lDate");
				} else {
					msg = "No result found for dated "
							+ req.getParameter("fDate") + " to "
							+ req.getParameter("lDate") + "...";
				}

				break;

			case "salesSearchBySalesChallanNo":
				page = "salesSearch.jsp";

				List<SalesEntry> salesEntryLst1 = ejb
						.getSalesEntryByChallanNo(req
								.getParameter("companyInitial")
								+ "/"
								+ req.getParameter("fynYear")
								+ "/"
								+ req.getParameter("month")
								+ "/"
								+ req.getParameter("billType")
								+ "/"
								+ req.getParameter("autoNum")
								+ "/"
								+ req.getParameter("suffix"));
				req.setAttribute("salesEntryLst", salesEntryLst1);

				if (salesEntryLst1.size() > 0) {
					msg = "Your search for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix");
				} else {
					msg = "No result found for Job challan number : "
							+ req.getParameter("companyInitial") + "/"
							+ req.getParameter("fynYear") + "/"
							+ req.getParameter("month") + "/"
							+ req.getParameter("billType") + "/"
							+ req.getParameter("autoNum") + "/"
							+ req.getParameter("suffix") + "...";
				}
				break;

			case "salesSearchByAgentName":
				page = "salesSearch.jsp";
				List<SalesEntry> salesEntryLst2 = ejb
						.getSalesEntryByAgentName(req.getParameter("agentName"));
				req.setAttribute("salesEntryLst", salesEntryLst2);
				if (salesEntryLst2.size() > 0) {
					msg = "Your search for Agent name : "
							+ req.getParameter("agentName").toUpperCase();
				} else {
					msg = "No result found for Agent name : "
							+ req.getParameter("agentName").toUpperCase()
							+ "...";
				}
				break;

			case "salesSearchByCustomerName":
				page = "salesSearch.jsp";
				List<SalesEntry> salesEntryLst3 = ejb
						.getSalesEntryByCustomerName(req
								.getParameter("custoName"));
				req.setAttribute("salesEntryLst", salesEntryLst3);
				if (salesEntryLst3.size() > 0) {
					msg = "Your search for Customer name : "
							+ req.getParameter("custoName").toUpperCase();
				} else {
					msg = "No result found for Customer name : "
							+ req.getParameter("custoName").toUpperCase()
							+ "...";
				}
				break;

			case "salesSearchByProductCode":
				page = "salesSearch.jsp";
				List<SalesEntry> salesEntryLst4 = ejb
						.getSalesEntriesByProductCode(req
								.getParameter("prodCode"));
				req.setAttribute("salesEntryLst", salesEntryLst4);
				if (salesEntryLst4.size() > 0) {
					msg = "Your search for Product code : "
							+ req.getParameter("prodCode").toUpperCase();
				} else {
					msg = "No result found for product code : "
							+ req.getParameter("prodCode").toUpperCase()
							+ "...";
				}
				break;

			case "salesSearchAll":
				page = "salesSearch.jsp";
				List<SalesEntry> salesEntryLstA = ejb
						.getAllSalesEntriesByCompany();
				req.setAttribute("salesEntryLst", salesEntryLstA);
				if (salesEntryLstA.size() > 0) {
					msg = "All Sales List";
				} else {
					msg = "No result found...";
				}
				break;

			case "salesView":
				page = "salesView.jsp";

				req.setAttribute("sId", req.getParameter("sId"));

				msg = "";

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
					qtyUnit.setName(req.getParameter("name").toUpperCase());
					qtyUnit.setAbbreviation(req.getParameter("abbreviation")
							.toUpperCase());
					qtyUnit.setDescription(req.getParameter("description")
							.toUpperCase());
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
			/*************** stock*************show ***************/

			case "stockDetailShow":
				page = "stockShowdetails.jsp";

				req.setAttribute("proid1", req.getParameter("proId"));

				msg = "";

				break;
			/*************** job*************show ***************/

			case "goJobDetailShow":
				page = "jobAssignView.jsp";

				req.setAttribute("joId", req.getParameter("joId"));

				msg = "";

				break;

			/************************
			 * *Stock*MuyltiSearch*************Ami
			 ************/

			case "goStockView":
				page = "stockViewD.jsp";
				List<ProductDetail> amiProduct = ejb
						.getProductDetailsByCodeDescriptionCategory(req
								.getParameter("pCodeSearch").toUpperCase(), req
								.getParameter("pDesSearch").toUpperCase(), req
								.getParameter("pCatSearch").toUpperCase());

				req.setAttribute("ami", amiProduct);

				msg = "";

				break;

			case "goSearchVendor":
				page = "purchasingVendorDupli.jsp";
				// List<Vendor>
				// vendorsBig=ejb.getAllVendorsByNameCity(req.getParameter("nameVendor"),req.getParameter("cityVendor"));

				// req.setAttribute("vBig", vendorsBig);
				msg = "";
				break;

			/********************* ProductMultiSearch *****************************************/
			case "goProView":
				page = "materialSearch.jsp";
				List<ProductDetail> amiProduct1 = ejb
						.getProductDetailsByCodeDescriptionCategory(req
								.getParameter("pCodeSearch").toUpperCase(), req
								.getParameter("pDesSearch").toUpperCase(), req
								.getParameter("pCatSearch").toUpperCase());

				req.setAttribute("amii", amiProduct1);

				msg = "";
				break;

			case "uploadProductImage":
				page = "addNewProductImage.jsp";
				/*
				 * Part p1 = req.getPart("proImg"); InputStream is =
				 * p1.getInputStream(); byte cont1[] = new byte[is.available()];
				 * is.read(cont1); productDetail =
				 * ejb.getProductDetailById(Integer.parseInt(req
				 * .getParameter("id"))); ProductImage proimg = new
				 * ProductImage(); proimg.setProductDetail(productDetail);
				 * proimg.setImage(cont1); ejb.setProductImage(proimg);
				 */

				String imgstr = req.getParameter("proImage1");
				if ((!imgstr.equals(""))) {
					productDetail = ejb.getProductDetailById(Integer
							.parseInt(req.getParameter("id")));
					ProductImage proimg = new ProductImage();
					proimg.setProductDetail(productDetail);
					proimg.setImage(Base64.decode(imgstr));
					ejb.setProductImage(proimg);
				}

				msg = "image added successfully";
				break;
			case "deleteProductImage":
				page = "addNewProductImage.jsp?id=" + req.getParameter("id");
				ejb.removeImageById(Integer.parseInt(req
						.getParameter("imageId")));
				msg = "Image deleted successfully";
				break;
			case "createUserGroup":
				int fl = 0;
				for (UserGroup ug : ejb.getAllUserGroup()) {
					if (ug.getGroupName().equals(
							req.getParameter("userGroupName").toUpperCase())) {
						fl = 1;
						break;
					}
				}
				if (fl == 0) {
					page = "setupUserGroup.jsp";
					userGroup = new UserGroup();
					userGroup.setGroupName(req.getParameter("userGroupName")
							.toUpperCase());
					List<PageList> plist = new ArrayList<>();
					for (String str : req.getParameterValues("pageId")) {
						plist.add(ejb.getPageListById(Integer.parseInt(str)));
					}
					userGroup.setPageLists(plist);
					userGroup.setCompanyInfo(ejb.getUserById(
							(String) httpSession.getAttribute("user"))
							.getCompanyInfo());
					ejb.setUserGroup(userGroup);
					msg = "User group created successfully";
				} else {
					msg = "User group name already exist";
				}

				break;
			case "updateUserGroup":
				page = "setupUserGroup.jsp";
				userGroup = ejb.getUserGroupById(Integer.parseInt(req
						.getParameter("usrGpId")));
				userGroup.setGroupName(req.getParameter("userGroupName")
						.toUpperCase());
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
					usr.setUserGroup(ejb.getUserGroupById(Integer.parseInt(req
							.getParameter("ugid"))));
					usr.setCompanyInfo(ejb.getUserById(
							(String) httpSession.getAttribute("user"))
							.getCompanyInfo());
					ejb.setUser(usr);

					securityAnswers = new SecurityAnswers();
					securityAnswers.setUsers(usr);
					securityAnswers.setSequrityQuestions(ejb
							.getSecurityQuestionById(Integer.parseInt(req
									.getParameter("sqId1"))));
					securityAnswers.setAnswer(req.getParameter("ans1")
							.toUpperCase());
					ejb.setSecurityAns(securityAnswers);
					securityAnswers = null;

					securityAnswers = new SecurityAnswers();
					securityAnswers.setUsers(usr);
					securityAnswers.setSequrityQuestions(ejb
							.getSecurityQuestionById(Integer.parseInt(req
									.getParameter("sqId2"))));
					securityAnswers.setAnswer(req.getParameter("ans2")
							.toUpperCase());
					ejb.setSecurityAns(securityAnswers);
					securityAnswers = null;

					msg = "User Added Successfully";
				} else {
					msg = "User mobile/id already exists";
				}

				break;
			case "updateUser":
				page = "setupUser.jsp";
				usr = ejb.getUserById(req.getParameter("userId"));
				usr.setUserGroup(ejb.getUserGroupById(Integer.parseInt(req
						.getParameter("ugid"))));
				ejb.updateUser(usr);
				msg = "User updated Successfully";
				break;
			case "jobRecieve":
				page = "jobReceive.jsp";
				jobAssignmentDetails = ejb.getJobAssignmentDetailsByID(Integer
						.parseInt(req.getParameter("jobAssignID")));
				dt = new Date();

				for (JobAssignmentProducts jp : jobAssignmentDetails
						.getJobAssignmentProducts()) {
					jobRecievedDetails = new JobRecievedDetails();
					jp.setRemaninQty(jp.getRemaninQty()
							- Integer.parseInt(req.getParameter("qtyRe"
									+ jp.getId())));
					ejb.updateJobAssignmentProductDetails(jp);

					jobRecievedDetails.setJobAssignmentProducts(jp);
					jobRecievedDetails.setQtyRecieved(Integer.parseInt(req
							.getParameter("qtyRe" + jp.getId())));
					jobRecievedDetails.setRecievingDate(dt);

					ejb.setJobRecieve(jobRecievedDetails);
					jobRecievedDetails = null;

				}
				msg = "Job recieve saved successfully";

				break;

			case "goSalesReturn":
				page = "salesReturn.jsp";

				salesEntry = ejb.getSalestDetailsbyChallanNumber(req
						.getParameter("challanNumber").trim());

				req.setAttribute("amS", salesEntry);
				msg = "";

				break;

			case "salesReturnServlet":
				page = "salesReturn.jsp";
				salesReturn = new SalesReturn();

				salesReturn.setChallanNumber(req.getParameter("challanNumber"));

				salesReturn.setRoundOff(Float.parseFloat(req
						.getParameter("roundvalue")));
				salesReturn.setReturnDate(DateConverter.getDate(req
						.getParameter("salesReturnDate")));

				salesReturn.setTotalReCost(Float.parseFloat(req
						.getParameter("grandtotal")));
				salesReturn.setReferenceSalesChallan(req
						.getParameter("saslesRChallanRId"));

				ejb.setSalesReturn(salesReturn);

				paymentDetails = new PaymentDetails();
				paymentDetails.setPaymentDate(DateConverter.getDate(req
						.getParameter("payDate")));

				paymentDetails.setPaidAmount(Float.parseFloat(req
						.getParameter("spAmount")));
				paymentDetails.setDescription(req.getParameter("desc"));
				paymentDetails.setSalesReturn(salesReturn);
				paymentDetails.setPaymentType(ejb.getPaymentTypeByType(req
						.getParameter("pType")));

				ejb.setPaymentDetails(paymentDetails);

				String p3[] = req.getParameterValues("rQtyDe");
				String qty4[] = req.getParameterValues("rQtySa");
				String salesProductDetailId[] = req
						.getParameterValues("salesProductDetailsID");

				for (int l = 0; l < p3.length; l++) {

					System.out.println("Return qty: "
							+ Integer.parseInt(qty4[l]));

					salesProductDetails = ejb
							.getSalesProductDetailsById(Integer
									.parseInt(salesProductDetailId[l]));

					salesProductReturnDetail = new SalesProductReturnDetail();

					salesProductReturnDetail.setFault(p3[l]);

					salesProductReturnDetail.setQtyReturn(Integer
							.parseInt(qty4[l]));
					// salesProductDetails.setSalesReQty(Integer.parseInt(qty4[l]));
					salesProductReturnDetail
							.setSalesProductDetails(salesProductDetails);
					salesProductDetails.setSalesReQty(salesProductDetails
							.getSalesReQty() + Integer.parseInt(qty4[l]));

					ejb.updateSalesProductDetails(salesProductDetails);

					purchaseProductDetails = salesProductDetails
							.getPurchase_Product_Details();
					purchaseProductDetails
							.setRemaining_quantity(purchaseProductDetails
									.getRemaining_quantity()
									+ Integer.parseInt(qty4[l]));

					ejb.updatePurchaseProductDetails(purchaseProductDetails);

					readyGoodsStock = ejb
							.getReadyGoodsStoctByProductId(purchaseProductDetails
									.getProductDetail().getId());

					readyGoodsStock.setRemainingQty(readyGoodsStock
							.getRemainingQty() + Integer.parseInt(qty4[l]));

					ejb.updateReadyGoodsStockDetail(readyGoodsStock);
					ejb.setSalesProductReturnDetails(salesProductReturnDetail);
					readyGoodsStock = null;
					purchaseProductDetails = null;

				}

				salesReturn.setSalesEntry(salesEntry);
				req.setAttribute("purDetIdforPC", salesReturn.getId());

				msg = "sales Return Succeessful";

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
			purchaseEntry = null;
			purchaseProductDetails = null;
			rawMaterialsStock = null;
			readyGoodsStock = null;
			serialNumber = null;
			paymentDetails = null;
			try {
				finalize();
			} catch (Throwable e) {
				System.out.println("Error in garbage collection: "
						+ e.getMessage());
				e.printStackTrace();
			}
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
