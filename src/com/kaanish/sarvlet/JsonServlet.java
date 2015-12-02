package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.json.stream.JsonGeneratorFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kaanish.ejb.Ejb;
import com.kaanish.model.QtyUnitType;

@WebServlet({ "/getcountry", "/addNewUOMtype","/getUOMtype" })
public class JsonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;
	private String msg;
	private QtyUnitType qtyUnitType;
	private String jsonString;
	private PrintWriter pw;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		resp.setContentType("application/json");
		

		try {
			switch (url) {
			case "getcountry":
				pw = resp.getWriter();
				
				jsonString = new Gson().toJson(ejb.getCountryByName(req.getParameter("term")));
				pw.print(jsonString);
				break;

			case "addNewUOMtype":
				pw= new PrintWriter(resp.getOutputStream());
				JsonGeneratorFactory factory = Json.createGeneratorFactory(null);
				JsonGenerator gen = factory.createGenerator(pw);
				qtyUnitType = new QtyUnitType();
				String name=req.getParameter("typeName");
				int flag=0;
				for(QtyUnitType qut:ejb.getAllQtyUnitTypes()){
					if(qut.getName().equalsIgnoreCase(name)){
						flag=1;
						break;
					}
				}
				if(flag==0){
					qtyUnitType.setName(name);
					ejb.setQtyUnitType(qtyUnitType);
					gen.writeStartObject().write("response", "success").writeEnd().close();
				}else{
					gen.writeStartObject().write("response", "already exist").writeEnd().close();
				}
				
				

				break;
			case "getUOMtype":
				pw = resp.getWriter();
				//jsonString = new Gson().toJson(ejb.getAllQtyUnitTypes());
				pw.print(ejb.getAllQtyUnitTypes());
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", msg);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
