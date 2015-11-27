package com.kaanish.sarvlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.Country;
import com.kaanish.model.Department;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.VendorType;
import com.sun.mail.handlers.text_html;

@WebServlet({ "/addTax", "/addTaxGroup", "/createDept", "/deleteDept",
		"/createSubDept", "/deleteSubDept", "/createCategory",
		"/deleteCategory", "/newVendorType", "/addCountry","/addState" })
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	Ejb ejb;
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

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);

		try {
			switch (url) {

			case "newVendorType":
				page = "setupVendorType.jsp";
				vendorType = new VendorType();
				List<VendorType> lst=new ArrayList<VendorType>();
				lst=ejb.getAllVendorType();
				int i=0;
				for(VendorType vt:lst){
					if(vt.getType().equals(req.getParameter("name"))){
						i=1;
						break;
					}
				}
				if (i==0) {
					vendorType.setType(req.getParameter("name"));

					ejb.setVendorType(vendorType);
					msg = "Vendor type added successfully.";
				}
				else
					msg = "Vendor type already exist.";
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
				List<Tax> taxlst = new ArrayList<Tax>();

				for (String taxName : taxes) {
					taxlst.add(ejb.getTaxById(taxName));

				}
				tax_type_group.setTaxes(taxlst);

				ejb.setTaxTYpeGroup(tax_type_group);
				msg = "Tax group added succesfully.";
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
				page="setupCity.jsp";
				country =new Country();
				country.setCountryName(req.getParameter("name"));
				ejb.setCountry(country);
				msg="country added successfully.";
				break;
			case "addState":
				page="setupCity.jsp";
				state=new State();
				state.setStateName(req.getParameter("name"));
				state.setCountry(ejb.getCountryById(Integer.parseInt(req.getParameter("id"))));
				
				msg="State added successfully.";
				break;

			default:
				break;
			}
		} catch (NumberFormatException e) {
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
