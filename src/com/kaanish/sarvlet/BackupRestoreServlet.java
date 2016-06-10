package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Properties;

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
import com.kaanish.util.GetMacId;

@WebServlet({ "/backup", "/restore", "/macid" })
public class BackupRestoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);

		resp.setContentType("application/json");

		switch (url) {

		case "backup":
			LocalDateTime ldt = LocalDateTime.now();
			String prefixOfName = "" + ldt.getDayOfMonth()
					+ ldt.getMonthValue() + ldt.getYear() + ldt.getHour()
					+ ldt.getMinute();

			// our machine
			if (req.getParameter("usrname").equals("admin")
					&& req.getParameter("password").equals("pass")) {
				Process p = Runtime
						.getRuntime()
						.exec("cmd /C start C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kaanish/kaanish BUFFER=10000000 FILE=d:/backup/backup/"
								+ prefixOfName
								+ "-"
								+ "exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y");
				InputStream fis = p.getInputStream();
				Properties pro = new Properties();
				pro.load(fis);
				fis.close();
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Completed")
						.write("msgdet",
								"Backup file path is- d:/backup/backup/"
										+ prefixOfName + "-" + "exp.DMP")
						.writeEnd().close();
			}
			// our machine

			// production
			else if (req.getParameter("usrname").equals("productionBR")
					&& req.getParameter("password").equals("pass")) {
				Process p = Runtime
						.getRuntime()
						.exec("cmd /C start C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kAMi/AMiKaanish1250000 BUFFER=10000000 FILE=d:/backup/backup/"
								+ prefixOfName
								+ "-"
								+ "exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y");
				InputStream fis = p.getInputStream();
				Properties pro = new Properties();
				pro.load(fis);
				fis.close();
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Completed")
						.write("msgdet",
								"Backup file path is- d:/backup/backup/"
										+ prefixOfName + "-" + "exp.DMP")
						.writeEnd().close();
			}
			// production

			// kaanish
			else if (req.getParameter("usrname").equals("kaanishBR")
					&& req.getParameter("password").equals("pass")) {
				Process p = Runtime
						.getRuntime()
						.exec("cmd /C start C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kaanish/AMiKaanish1250000 BUFFER=10000000 FILE=d:/backup/backup/"
								+ prefixOfName
								+ "-"
								+ "exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y");
				InputStream fis = p.getInputStream();
				Properties pro = new Properties();
				pro.load(fis);
				fis.close();
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Completed")
						.write("msgdet",
								"Backup file path is- d:/backup/backup/"
										+ prefixOfName + "-" + "exp.DMP")
						.writeEnd().close();
			}
			// kaanish

			// kainat
			else if (req.getParameter("usrname").equals("kainatBR")
					&& req.getParameter("password").equals("pass")) {
				Process p = Runtime
						.getRuntime()
						.exec("cmd /C start C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kaanish/AMi@Kaanish1250000 BUFFER=10000000 FILE=d:/backup/backup/"
								+ prefixOfName
								+ "-"
								+ "exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y");
				InputStream fis = p.getInputStream();
				Properties pro = new Properties();
				pro.load(fis);
				fis.close();
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Completed")
						.write("msgdet",
								"Backup file path is- d:/backup/backup/"
										+ prefixOfName + "-" + "exp.DMP")
						.writeEnd().close();
			}
			// kainat

			else {
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Invalid username/password")
						.write("msgdet", "").writeEnd().close();
			}
			break;

		case "restore":
			// our machine
			if (req.getParameter("usrname").equals("admin")
					&& req.getParameter("password").equals("pass")) {
				Process proc1 = Runtime.getRuntime().exec(
						"cmd /C start cat.bat");
				InputStream fis1 = proc1.getInputStream();
				Properties pro1 = new Properties();
				pro1.load(fis1);
				fis1.close();
				JsonGeneratorFactory factory1 = Json
						.createGeneratorFactory(null);
				JsonGenerator gena1 = factory1.createGenerator(resp
						.getOutputStream());
				gena1.writeStartObject().write("msg", "Completed")
						.write("msgdet", "").writeEnd().close();
			}
			// our machine

			// production
			if (req.getParameter("usrname").equals("productionBR")
					&& req.getParameter("password").equals("pass")) {
				Process proc1 = Runtime.getRuntime().exec(
						"cmd /C start productionCat.bat");
				InputStream fis1 = proc1.getInputStream();
				Properties pro1 = new Properties();
				pro1.load(fis1);
				fis1.close();
				JsonGeneratorFactory factory1 = Json
						.createGeneratorFactory(null);
				JsonGenerator gena1 = factory1.createGenerator(resp
						.getOutputStream());
				gena1.writeStartObject().write("msg", "Completed")
						.write("msgdet", "").writeEnd().close();
			}
			// production

			// kaanish
			if (req.getParameter("usrname").equals("kaanishBR")
					&& req.getParameter("password").equals("pass")) {
				Process proc1 = Runtime.getRuntime().exec(
						"cmd /C start kaanishCat.bat");
				InputStream fis1 = proc1.getInputStream();
				Properties pro1 = new Properties();
				pro1.load(fis1);
				fis1.close();
				JsonGeneratorFactory factory1 = Json
						.createGeneratorFactory(null);
				JsonGenerator gena1 = factory1.createGenerator(resp
						.getOutputStream());
				gena1.writeStartObject().write("msg", "Completed")
						.write("msgdet", "").writeEnd().close();
			}
			// kaanish

			// kainat
			if (req.getParameter("usrname").equals("kainatBR")
					&& req.getParameter("password").equals("pass")) {
				Process proc1 = Runtime.getRuntime().exec(
						"cmd /C start kainatCat.bat");
				InputStream fis1 = proc1.getInputStream();
				Properties pro1 = new Properties();
				pro1.load(fis1);
				fis1.close();
				JsonGeneratorFactory factory1 = Json
						.createGeneratorFactory(null);
				JsonGenerator gena1 = factory1.createGenerator(resp
						.getOutputStream());
				gena1.writeStartObject().write("msg", "Completed")
						.write("msgdet", "").writeEnd().close();
			}
			// kainat

			else {
				JsonGeneratorFactory factory = Json
						.createGeneratorFactory(null);
				JsonGenerator gena = factory.createGenerator(resp
						.getOutputStream());
				gena.writeStartObject()
						.write("msg", "Invalid username/password")
						.write("msgdet", "").writeEnd().close();
			}

			break;
		case "macid":
			resp.getWriter().println(GetMacId.getMacId());
			break;

		default:
			break;
		}
	}
}
