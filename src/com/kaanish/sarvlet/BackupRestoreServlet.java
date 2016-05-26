package com.kaanish.sarvlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.ejb.EJB;
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
	private String filePath = "backup/";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		switch (url) {

		case "backup":
			Process p = Runtime
					.getRuntime()
					.exec("cmd /C start C:/oraclexe/app/oracle/product/10.2.0/server/BIN/exp kaanish/kaanish BUFFER=10000000 FILE=d:/backup/backup/exp.DMP COMPRESS=Y GRANTS=Y CONSTRAINTS=Y");
			InputStream fis = p.getInputStream();
			Properties pro = new Properties();
			pro.load(fis);
			fis.close();

			req.setAttribute("msg", "Backup successful");
			req.setAttribute("msgdet",
					"Backup saved in d:/backup/backup/exp.DMP");
			req.getRequestDispatcher("backup-restore.jsp").forward(req, resp);
			break;

		case "restore":
			Process proc1 = Runtime.getRuntime().exec("cmd /C start cat.bat");
			InputStream fis1 = proc1.getInputStream();
			Properties pro1 = new Properties();
			pro1.load(fis1);
			/*
			 * byte[] buff=new byte[fis1.available()]; fis1.read(buff);
			 */
			fis1.close();
			req.setAttribute("msg", "Restore successful");

			req.getRequestDispatcher("backup-restore.jsp").forward(req, resp);
			break;
		case "macid":
			resp.getWriter().println(GetMacId.getMacId());
			break;

		default:
			break;
		}
	}
}
