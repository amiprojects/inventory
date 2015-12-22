package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.kaanish.ejb.Ejb;
import com.kaanish.model.Department;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.SubDepartment;
import com.kaanish.util.DepartmentCotractor;

@WebServlet({ "/getcountry", "/addNewUOMtype", "/getUOMtype",
		"/getAllDepartments", "/getProductByDescription", "/getStateByCountry",
		"/getStateByCountryByStateName", "/getCity", "/getCityByName",
		"/getQtyUnit", "/getQtyUnitConversion", "/getVendorByVendorType",
		"/getQtyConversion", "/getVendorByVendorId", "/getAccountByVendorId",
		"/getTaxGroupById", "/getproductPro", "/getPurchasebyPro",
		"/getAccountDetails", "/getProductDetailById", "/getCategoryById",
		"/getProductImageByProductid", "/getJobberDetailsByName",
		"/getProdDetByPurchaseProdDetailsId", "/getStateByCityName",
		"/getAllQtyUnitByNameOrAbv", "/getAgentDetails" })
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private QtyUnitType qtyUnitType;
	private PrintWriter pw;
	private String name;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
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
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
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
					gen.writeStartObject().write("response", "success")
							.writeEnd().close();
				} else {
					gen.writeStartObject().write("response", "already exist")
							.writeEnd().close();
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
				pw.print(ejb.getAllStatesByCountryId(Integer.parseInt(req
						.getParameter("id"))));
				break;

			case "getVendorByVendorType":
				pw = resp.getWriter();
				pw.print(ejb.getVendorsByVendorTypeIdByName(
						Integer.parseInt(req.getParameter("id")),
						req.getParameter("term")));
				break;
			case "getAccountDetails":
				resp.getWriter().print(
						ejb.getAccountDetailsByVendorId(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getTaxGroupById":
				resp.getWriter().print(
						ejb.getTax_Type_GroupById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getProductDetailById":
				resp.getWriter().print(
						ejb.getProductDetailsById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getJobberDetailsByName":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getProdDetByPurchaseProdDetailsId":
				resp.getWriter().print(
						ejb.getPurchaseProductDetailsById(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getCategoryById":
				resp.getWriter().print(
						ejb.getCategoryById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getAgentDetails":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));
				break;

			case "getVendorByVendorId":
				resp.getWriter().print(
						ejb.getVendorById(Integer.parseInt(req
								.getParameter("id"))));

				break;

			case "getAccountByVendorId":
				resp.getWriter().print(
						ejb.getAccountDetailsByVendorId(Integer.parseInt(req
								.getParameter("id"))));
				;
				break;

			case "getStateByCountryByStateName":
				pw = resp.getWriter();
				pw.print(ejb.getStateByName(req.getParameter("name"),
						Integer.parseInt(req.getParameter("cid"))));
				break;

			case "getCity":
				pw = resp.getWriter();
				pw.print(ejb.getCityByState(Integer.parseInt(req
						.getParameter("id"))));
				break;

			case "getCityByName":
				pw = resp.getWriter();
				pw.print(ejb.getCityByName(req.getParameter("name")));
				break;
			case "getProductByDescription":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailByCode(req
						.getParameter("descriptionName")));
				break;
			case "getQtyUnit":
				pw = resp.getWriter();
				pw.print(ejb.getQtyUnitById(Integer.parseInt(req
						.getParameter("id"))));
				break;
			case "getproductPro":
				pw = resp.getWriter();
				pw.print(ejb.getProductDetailById(Integer.parseInt(req
						.getParameter("id"))));
				break;
			case "getPurchasebyPro":
				pw = resp.getWriter();
				pw.print(ejb.getPurchase_Product_DetailsByProId(Integer
						.parseInt(req.getParameter("id"))));
				break;
			case "getQtyUnitConversion":
				pw = resp.getWriter();
				pw.print(ejb.getAllQtyUnitConversionByQtyUnitId(Integer
						.parseInt(req.getParameter("id"))));
				break;
			case "getQtyConversion":
				pw = resp.getWriter();
				QtyUnitConversionPK qpk = new QtyUnitConversionPK();
				qpk.setQtyUnitId1(Integer.parseInt(req.getParameter("id1")));
				qpk.setQtyUnitId2(Integer.parseInt(req.getParameter("id2")));
				pw.print(ejb.getQtyUnitConversionById(qpk));
				break;

			case "getProductImageByProductid":
				resp.getWriter().print(
						ejb.getAllProductImageByProductId(Integer.parseInt(req
								.getParameter("id"))));
				break;
			case "getStateByCityName":
				resp.getWriter().print(
						ejb.getStateByCityName(req.getParameter("nm")));
				break;
			case "getAllQtyUnitByNameOrAbv":
				resp.getWriter().print(
						ejb.getAllQtyUnitByNameOrAbv(req.getParameter("name")));
				break;

			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}
}
