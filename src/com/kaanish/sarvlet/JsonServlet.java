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
import com.kaanish.model.QtyUnit;
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
		"/getSalesAgentDetailsById", "/getPurchaseProductDetailsByIdForSale", "/getCustomerByPh", "/checkPcode","/addVendorbyjson","/addAgen","/getVendorByType","/addUOMjson","/getuomByType" })
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
				/****************************AgentShorcut**************/
			case "addAgen":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg2=Json.createGeneratorFactory(null);
				JsonGenerator gen22=jsg2.createGenerator(resp.getOutputStream());
				HttpSession httpSession2=req.getSession();
				
				

					Vendor vendor2 =new Vendor();				
					
					List<Vendor> vend2 = ejb.getAllVendors();
					int counter22 = 0;
					for (Vendor ven2 : vend2) {

						if (ven2.getEmail().equals(req.getParameter("vendorMail2"))

								|| ven2.getPh1().equals(req.getParameter("vendorPh12"))) {

							counter22 = 1;
							break;
						}
					}
					if (counter22 == 0) {
						
						
						vendor2 = new Vendor();
						AccountDetails accountDetails2 = new AccountDetails();
						Date dt2 = new Date();

						vendor2.setName(req.getParameter("vendorName2").toUpperCase());
						vendor2.setLastModifiedDate(dt2);
						vendor2.setAddress(req.getParameter("vendorAddress2"));
						vendor2.setAliseName(req.getParameter("vendorAlias2"));
						vendor2.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("vendorCityId2"))));
						vendor2.setCompanyName(req.getParameter("vendorCompanyName2"));
						vendor2.setEmail(req.getParameter("vendorMail2"));
						vendor2.setPh1(req.getParameter("vendorPh12"));
						vendor2.setPh2(req.getParameter("vendorPh22"));
						vendor2.setPinCode(req.getParameter("vendorPin2"));
						vendor2.setVendorType(ejb.getVendorTypeById(Integer.parseInt(req.getParameter("vendorType2"))));
						vendor2.setUsers(ejb.getUserById((String) httpSession2.getAttribute("user")));

						accountDetails2.setBankAccountNumber(req.getParameter("bankAccNo2"));
						accountDetails2.setBankChequeLable(req.getParameter("bankCheckLebel2"));
						accountDetails2.setBankIFSCnumber(req.getParameter("bankIFSC2"));
						accountDetails2.setBankMICRnumber(req.getParameter("bankMICR2"));
						accountDetails2.setBankName(req.getParameter("bankName2"));
						accountDetails2.setBankRTGCnumber(req.getParameter("bankRTGS2"));
						accountDetails2.setBranch(req.getParameter("bankBranch2"));

						if (!req.getParameter("bankCity6").equals("")) {
							accountDetails2.setCity(ejb.getCityById(Integer.parseInt(req.getParameter("bankCity6"))));
						}

						accountDetails2.setCstNumber(req.getParameter("vendorCSTno2"));
						if (!req.getParameter("vendorCSTregDate2").equals("")) {
							accountDetails2
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorCSTregDate2")));
						}
						if (!req.getParameter("vendorExciseRegDate2").equals("")) {
							accountDetails2
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorExciseRegDate2")));
						}
						if (!req.getParameter("vendorServiceTaxRegDate2").equals("")) {
							accountDetails2.setCstRegistrationDate(
									DateConverter.getDate(req.getParameter("vendorServiceTaxRegDate2")));
						}
						if (!req.getParameter("vendorVATregDate2").equals("")) {
							accountDetails2
									.setCstRegistrationDate(DateConverter.getDate(req.getParameter("vendorVATregDate2")));
						}

						accountDetails2.setExciseRegistrationNumber(req.getParameter("vendorExciseRegNo2"));
						accountDetails2.setPanNumber(req.getParameter("vendorPANno2"));

						accountDetails2.setServiceTaxRegistrationNumber(req.getParameter("vendorServiceTaxRegNo2"));
						accountDetails2.setVatNumber(req.getParameter("vendorVATno2"));

						accountDetails2.setTax_Type_Group(
								ejb.getTax_Type_GroupById(Integer.parseInt(req.getParameter("taxTypeGroupId2"))));

						accountDetails2.setUsers(ejb.getUserById((String) httpSession2.getAttribute("user")));
						accountDetails2.setVendor(vendor2);

						ejb.setVendor(vendor2);
						ejb.setAccountDetails(accountDetails2);

						/*msg = "vendor added successfully;";*/
						gen22.writeStartObject().write("result","Agent added successfully").writeEnd().close();

					} else {
						/*msg = "Duplicate vendor Entry";*/
						gen22.writeStartObject().write("result","Duplicate Agent Entry").writeEnd().close();
					}
				break;
				/*************Ajax form drop down**********************/
			case "getVendorByType":
				resp.getWriter().print(ejb.getVendorsByVendorTypeId(Integer.parseInt(req.getParameter("id"))));
				break;
				
				
			case "getuomByType":
				resp.getWriter().print(ejb.getUOMByUOMTypeId(Integer.parseInt(req.getParameter("id"))));
				break;
				/**********************************************/
			case "addUOMjson":
				resp.setContentType("application/json");
				JsonGeneratorFactory jsg22=Json.createGeneratorFactory(null);
				JsonGenerator gen222=jsg22.createGenerator(resp.getOutputStream());
				
				QtyUnit qtyUnit = new QtyUnit();
				int flagg = 0;
				for (QtyUnit qut : ejb.getAllQtyUnit()) {
					if ((qut.getName().equalsIgnoreCase(
							req.getParameter("nameuom")) || (qut.getAbbreviation()
							.equalsIgnoreCase(req.getParameter("abbreviationuom"))))) {
						flagg = 1;
						break;
					}
				}
				if (flagg == 0) {
					qtyUnit = new QtyUnit();
					qtyUnit.setName(req.getParameter("nameuom").toUpperCase());
					qtyUnit.setAbbreviation(req.getParameter("abbreviationuom")
							.toUpperCase());
					qtyUnit.setDescription(req.getParameter("descriptionuom")
							.toUpperCase());
					qtyUnit.setQtyUnitType(ejb.getQtyUnitTypeById(Integer
							.parseInt(req.getParameter("qtyUnitTypeIduom"))));
					ejb.setQtyUnit(qtyUnit);
					gen222.writeStartObject().write("result","UOM added successfully").writeEnd().close();
				} else {
					gen222.writeStartObject().write("result","Duplicate UOM Entry").writeEnd().close();
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
