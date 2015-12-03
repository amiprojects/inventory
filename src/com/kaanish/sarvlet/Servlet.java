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
import com.kaanish.model.AccountDetails;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.Country;
import com.kaanish.model.Department;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.util.DateConverter;

@WebServlet({ "/login", "/logout", "/addTax", "/addTaxGroup", "/editTax",
		"/deleteTax", "/editTaxGroup", "/createDept", "/deleteDept",
		"/createSubDept", "/deleteSubDept", "/createCategory",
		"/deleteCategory", "/newVendorType", "/addCountry", "/addState",
		"/createProduct", "/deleteCountry", "/addVendor", "/addUOM",
		"/editVendorType", "/deleteVendorType" })
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
				tax.setName(req.getParameter("name"));
				tax.setValue(Float.parseFloat(req.getParameter("value")));

				ejb.setTax(tax);
				msg = "Tax added successfully.";
				break;

			case "addTaxGroup":
				page = "setupTaxManagement.jsp";
				tax_type_group = new Tax_Type_Group();
				tax_type_group.setName(req.getParameter("name"));

				String[] taxes = req.getParameterValues("tax");

				if (taxes != null) {

					List<Tax> taxlst = new ArrayList<Tax>();

					for (String taxName : taxes) {
						taxlst.add(ejb.getTaxById(taxName));
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
				tax = ejb.getTaxById(req.getParameter("id"));
				tax.setName(req.getParameter("name"));
				tax.setValue(Float.parseFloat(req.getParameter("value")));

				ejb.updateTax(tax);
				msg = "Tax updated successfully.";
				break;

			case "deleteTax":
				page = "setupTaxManagement.jsp";
				ejb.deleteTax(req.getParameter("id"));
				msg = "Tax deleted successfully.";
				break;

			case "editTaxGroup":
				page = "setupTaxManagement.jsp";
				tax_type_group = ejb.getTax_Type_GroupById(req
						.getParameter("id"));
				tax_type_group.setName(req.getParameter("name"));

				String[] taxes1 = req.getParameterValues("tax");

				if (taxes1 != null) {

					List<Tax> taxlst = new ArrayList<Tax>();

					for (String taxName : taxes1) {
						taxlst.add(ejb.getTaxById(taxName));
					}

					tax_type_group.setTaxes(taxlst);

					ejb.updateTaxTypeGroup(tax_type_group);
					msg = "Tax group updated succesfully.";
				} else {
					msg = "please select tax.";
				}
				break;

			case "createDept":
				page = "setupDepartment.jsp";
				department = new Department();
				department.setName(req.getParameter("name"));
				ejb.setDepartment(department);
				msg = "Department added.";
				break;
			case "deleteDept":
				page = "setupDepartment.jsp";
				ejb.deleteDepartmentById(Integer.parseInt(req
						.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createSubDept":
				page = "setupDepartment.jsp";
				subDepartment = new SubDepartment();
				subDepartment.setName(req.getParameter("name"));
				subDepartment.setDepartment(ejb.getDepartmentById(Integer
						.parseInt(req.getParameter("deptId"))));
				ejb.setSubDepartment(subDepartment);
				msg = "SubDepartment added.";
				break;
			case "deleteSubDept":
				page = "setupDepartment.jsp";
				ejb.deleteSubDepartmentById(Integer.parseInt(req
						.getParameter("id")));
				msg = "Department deleted.";
				break;
			case "createCategory":
				page = "setupDepartment.jsp";
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
				break;
			case "deleteCategory":
				page = "setupDepartment.jsp";
				ejb.deleteCategoryById(Integer.parseInt(req.getParameter("id")));
				msg = "Category deleted.";
				break;
			case "addCountry":
				page = "countryStateCity.jsp";
				
				
				int flagg1 = 0;
				List<Country> cuty = ejb
						.getAllCountry();
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
				page = "countryStateCity.jsp";
				ejb.deleteCountryById(Integer.parseInt(req.getParameter("id")));
				msg = "country deleted successfully.";
				break;
			case "addState":
				page = "countryStateCity.jsp";
				state = new State();
				state.setStateName(req.getParameter("name"));
				state.setCountry(ejb.getCountryById(Integer.parseInt(req
						.getParameter("id"))));
				ejb.setState(state);
				msg = "State added successfully.";
				break;
			case "addVendor":
				page = "purchasingVendor.jsp";
				vendor = new Vendor();
				accountDetails = new AccountDetails();
				dt = new Date();

				vendor.setName(req.getParameter("vendorName"));

				vendor.setLastModifiedDate(dt);

				vendor.setAddress(req.getParameter("vendorAddress"));
				vendor.setAliseName(req.getParameter("vendorAlias"));
				/*
				 * vendor.setCity(ejb.getCityById(Integer.parseInt(req
				 * .getParameter("vendorCity"))));
				 */
				vendor.setCompanyName(req.getParameter("vendorCompanyName"));
				vendor.setEmail(req.getParameter("vendorMail"));
				vendor.setPh1(req.getParameter("vendorPh1"));
				vendor.setPh2(req.getParameter("vendorPh2"));
				vendor.setPinCode(req.getParameter("vendorPin"));
				vendor.setVendorType(ejb.getVendorTypeById(Integer.parseInt(req
						.getParameter("vendorType"))));
				// vendor.setUsers();

				accountDetails.setBankAccountNumber(req
						.getParameter("bankAccNo"));
				accountDetails.setBankChequeLable(req
						.getParameter("bankCheckLebel"));
				accountDetails.setBankIFSCnumber(req.getParameter("bankIFSC"));
				accountDetails.setBankMICRnumber(req.getParameter("bankMICR"));
				accountDetails.setBankName(req.getParameter("bankName"));
				accountDetails.setBankRTGCnumber(req.getParameter("bankRTGS"));
				accountDetails.setBranch(req.getParameter("bankBranch"));
				/*
				 * accountDetails.setCity(ejb.getCityById(Integer.parseInt(req
				 * .getParameter("bankCity"))));
				 */
				accountDetails.setCstNumber(req.getParameter("vendorCSTno"));
				accountDetails.setCstRegistrationDate(DateConverter.getDate(req
						.getParameter("vendorCSTregDate")));
				accountDetails.setExciseRegistrationDate(DateConverter
						.getDate(req.getParameter("vendorExciseRegDate")));
				accountDetails.setExciseRegistrationNumber(req
						.getParameter("vendorExciseRegNo"));
				accountDetails.setPanNumber(req.getParameter("vendorPANno"));
				accountDetails.setServiceTaxRegistrationDate(DateConverter
						.getDate(req.getParameter("vendorServiceTaxRegDate")));
				accountDetails.setServiceTaxRegistrationNumber(req
						.getParameter("vendorServiceTaxRegNo"));
				accountDetails.setVatNumber(req.getParameter("vendorVATno"));
				accountDetails.setVatRegistrationDate(DateConverter.getDate(req
						.getParameter("vendorVATregDate")));
				accountDetails.setTax_Type_Group(ejb.getTax_Type_GroupById(req
						.getParameter("taxTypeGroupId")));

				accountDetails.setVendor(vendor);

				ejb.setVendor(vendor);
				ejb.setAccountDetails(accountDetails);

				msg = "vendor added successfully;";
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
