package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.json.stream.JsonGeneratorFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.AccountDetails;
import com.kaanish.model.Department;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Vendor;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DepartmentCotractor;

@WebServlet({ "/getcountry", "/addNewUOMtype", "/getUOMtype", "/getAllDepartments", "/getProductByDescription",
		"/getStateByCountry", "/getStateByCountryByStateName", "/getCity", "/getCityByName", "/getQtyUnit",
		"/getQtyUnitConversion", "/getVendorByVendorType", "/getQtyConversion", "/getVendorByVendorId",
		"/getAccountByVendorId", "/getTaxGroupById", "/getproductPro", "/getPurchasebyPro", "/getAccountDetails",
		"/getProductDetailById", "/getCategoryById", "/getProductImageByProductid", "/getJobberDetailsByName",
		"/getProdDetByPurchaseProdDetailsId", "/getStateByCityName", "/getAllQtyUnitByNameOrAbv", "/getAgentDetails",
		"/getCityByStateByCityName", "/getVendorTypeById", "/getProductbyProductCode",
		"/getSaleblePurchaseProductDetailsByProductCodeAndQuantity", "/getVendorsByVendorTypeJobberAndName",
		"/getProductsForSaleByCode", "/deleteUOM", "/getVendorsByVendorTypeSalesAgentAndName",
		"/getSalesAgentDetailsById", "/getPurchaseProductDetailsByIdForSale", "/getCustomerByPh", "/checkPcode","/addVendorbyjson" })
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private QtyUnitType qtyUnitType;
	private PrintWriter pw;
	private String name;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		resp.setContentType("application/json");

		try {
			switch (url) {
			case "getcountry":
				pw = resp.getWriter();
				pw.print(ejb.getCountryByName(req.getParameter("term")));
				break;

			case "addNewUOMtype":
				pw = new PrintWriter(resp.getOutputStream());
				JsonGeneratorFactory factory = Json.createGeneratorFactory(null);
				JsonGenerator gen = factory.createGenerator(pw);
				qtyUnitType = new QtyUnitType();
				name = req.getParameter("typeName");
				int flag = 0;
				for (QtyUnitType qut : ejb.getAllQtyUnitTypes()) {
					if (qut.getName().equalsIgnoreCase(name)) {
						flag = 1;
						break;
					}
				}
				if (flag == 0) {
					qtyUnitType.setName(name);
					ejb.setQtyUnitType(qtyUnitType);
					gen.writeStartObject().write("response", "success").writeEnd().close();
				} else {
					gen.writeStartObject().write("response", "already exist").writeEnd().close();
				}
				break;

			case "getUOMtype":
				pw = resp.getWriter();
				pw.print(ejb.getAllQtyUnitTypes());
				break;

			case "getAllDepartments":
				pw = resp.getWriter();
				name = req.getParameter("name");
				List<DepartmentCotractor> lst = new ArrayList<>();
				DepartmentCotractor cotractor;
				for (Department d : ejb.getAllDepartmentsByName(name)) {
					cotractor = new DepartmentCotractor();
					cotractor.setId(d.getId());
					cotractor.setName(d.getName() + "(Department)");
					cotractor.setpName("");
					cotractor.setStatus(1);
					lst.add(cotractor);
				}
				for (SubDepartment d : ejb.getAllSubDepartmentsByName(name)) {
					cotractor = new DepartmentCotractor();
					cotractor.setId(d.getId());
					cotractor.setName(d.getName() + "(Sub-Department)");
					cotractor.setpName(d.getDepartment().getName());
					cotractor.setStatus(2);
					lst.add(cotractor);
				}

				pw.print(lst);
				break;

			case "getStateByCountry":
				pw = resp.getWriter();
				pw.print(ejb.getAllStatesByCountryId(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getVendorByVendorType":
				pw = resp.getWriter();
				pw.print(ejb.getVendorsByVendorTypeIdByName(Integer.parseInt(req.getParameter("id")),
						req.getParameter("term")));
				break;

			case "getVendorTypeById":
				resp.getWriter().print(ejb.getVendorTypeById(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getVendorsByVendorTypeJobberAndName":
				resp.getWriter().print(ejb.getVendorsByVendorTypeJobberAndName(req.getParameter("name")));
				break;

			case "getVendorsByVendorTypeSalesAgentAndName":
				resp.getWriter().print(ejb.getVendorsByVendorTypeSalesAgentAndName(req.getParameter("name")));
				break;

			case "getSalesAgentDetailsById":
				resp.getWriter().print(ejb.getVendorById(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getAccountDetails":
				resp.getWriter().print(ejb.getAccountDetailsByVendorId(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getTaxGroupById":
				resp.getWriter().print(ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getProductDetailById":
				resp.getWriter().print(ejb.getProductDetailsById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getJobberDetailsByName":
				resp.getWriter().print(ejb.getVendorById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getProdDetByPurchaseProdDetailsId":
				resp.getWriter().print(ejb.getPurchaseProductDetailsById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getCategoryById":
				resp.getWriter().print(ejb.getCategoryById(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getAgentDetails":
				resp.getWriter().print(ejb.getVendorById(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getVendorByVendorId":
				resp.getWriter().print(ejb.getVendorById(Integer.parseInt(req.getParameter("id"))));

				break;

			case "getAccountByVendorId":
				resp.getWriter().print(ejb.getAccountDetailsByVendorId(Integer.parseInt(req.getParameter("id"))));
				;
				break;

			case "getStateByCountryByStateName":
				pw = resp.getWriter();
				pw.print(ejb.getStateByName(req.getParameter("name"), Integer.parseInt(req.getParameter("cid"))));
				break;

			case "getCityByStateByCityName":
				pw = resp.getWriter();
				pw.print(ejb.getCityByNameAjax(req.getParameter("name1"), Integer.parseInt(req.getParameter("cid1"))));
				break;

			case "getCity":
				pw = resp.getWriter();
				pw.print(ejb.getCityByState(Integer.parseInt(req.getParameter("id"))));
				break;

			case "getCityByName":
				pw = resp.getWriter();
				pw.print(ejb.getCityByName(req.getParameter("name")));
				break;
			case "getCustomerByPh":
				pw = resp.getWriter();
				pw.print(ejb.getCustomerByPh(req.getParameter("ph")));
				break;
			case "getProductbyProductCode":
				pw = resp.getWriter();
				pw.print(ejb.getAllProductByProductCode(req.getParameter("code")));
				break;
			case "getSaleblePurchaseProductDetailsByProductCodeAndQuantity":
				pw = resp.getWriter();
				pw.print(ejb.getSaleblePurchaseProductDetailsByProductCodeAndQuantity(req.getParameter("code"),
						DateConverter.getDate(req.getParameter("date"))));
				break;
			case "getProductByDescription":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailByCode(req.getParameter("descriptionName")));
				break;
			case "getQtyUnit":
				pw = resp.getWriter();
				pw.print(ejb.getQtyUnitById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getproductPro":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailById(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getPurchasebyPro":
				pw = resp.getWriter();
				pw.print(ejb.getPurchase_Product_DetailsByProId(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getQtyUnitConversion":
				pw = resp.getWriter();
				pw.print(ejb.getAllQtyUnitConversionByQtyUnitId(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getQtyConversion":
				pw = resp.getWriter();
				QtyUnitConversionPK qpk = new QtyUnitConversionPK();
				qpk.setQtyUnitId1(Integer.parseInt(req.getParameter("id1")));
				qpk.setQtyUnitId2(Integer.parseInt(req.getParameter("id2")));
				pw.print(ejb.getQtyUnitConversionById(qpk));
				break;

			case "getProductImageByProductid":
				resp.getWriter().print(ejb.getAllProductImageByProductId(Integer.parseInt(req.getParameter("id"))));
				break;
			case "getStateByCityName":
				resp.getWriter().print(ejb.getStateByCityName(req.getParameter("nm")));
				break;
			case "getAllQtyUnitByNameOrAbv":
				resp.getWriter().print(ejb.getAllQtyUnitByNameOrAbv(req.getParameter("name")));
				break;
			case "getProductsForSaleByCode":
				resp.getWriter().print(ejb.getSalebleProductsByQtyAndCode(req.getParameter("codeParts")));
				break;
			case "deleteUOM":
				PrintWriter pw = new PrintWriter(resp.getOutputStream());
				JsonGeneratorFactory fac = Json.createGeneratorFactory(null);
				JsonGenerator gen1 = fac.createGenerator(pw);
				try {
					ejb.deleteUOMById(Integer.parseInt(req.getParameter("id")));
					gen1.writeStartObject().write("response", "success").writeEnd().close();
				} catch (Exception e) {
					gen1.writeStartObject().write("response", "failed").writeEnd().close();
				}
				break;
			case "getPurchaseProductDetailsByIdForSale":
				resp.getWriter().print(ejb.getPurchaseProductDetailsByIdForSale(
						Integer.parseInt(req.getParameter("id")), req.getParameter("date")));
				break;
			case "checkPcode":

				resp.getWriter().print(ejb.getProductByProductCode(req.getParameter("productCode4")));
				break;
				
				
				
			case "addVendorbyjson":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg=Json.createGeneratorFactory(null);
				JsonGenerator gen2=jsg.createGenerator(resp.getOutputStream());
				HttpSession httpSession=req.getSession();
				
				

					Vendor vendor =new Vendor();				
					
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
						AccountDetails accountDetails = new AccountDetails();
						Date dt = new Date();

						vendor.setName(req.getParameter("vendorName").toUpperCase());
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

						if (!req.getParameter("bankCity").equals("")) {
							accountDetails.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("bankCity"))));
						}

						accountDetails.setCstNumber(req.getParameter("vendorCSTno"));
						if (!req.getParameter("vendorCSTregDate").equals("")) {
							accountDetails
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorCSTregDate")));
						}
						if (!req.getParameter("vendorExciseRegDate").equals("")) {
							accountDetails
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorExciseRegDate")));
						}
						if (!req.getParameter("vendorServiceTaxRegDate").equals("")) {
							accountDetails.setCstRegistrationDate(
									DateConverter.getDate(req.getParameter("vendorServiceTaxRegDate")));
						}
						if (!req.getParameter("vendorVATregDate").equals("")) {
							accountDetails
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorVATregDate")));
						}

						accountDetails.setExciseRegistrationNumber(req.getParameter("vendorExciseRegNo"));
						accountDetails.setPanNumber(req.getParameter("vendorPANno"));

						accountDetails.setServiceTaxRegistrationNumber(req.getParameter("vendorServiceTaxRegNo"));
						accountDetails.setVatNumber(req.getParameter("vendorVATno"));

						accountDetails.setTax_Type_Group(
								ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("taxTypeGroupId"))));

						accountDetails.setUsers(ejb.getUserById((String) httpSession.getAttribute("user")));
						accountDetails.setVendor(vendor);

						ejb.setVendor(vendor);
						ejb.setAccountDetails(accountDetails);

						/*msg = "vendor added successfully;";*/
						gen2.writeStartObject().write("result","vendor added successfully").writeEnd().close();

					} else {
						/*msg = "Duplicate vendor Entry";*/
						gen2.writeStartObject().write("result","Duplicate vendor Entry").writeEnd().close();
					}
				break;
				

			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
