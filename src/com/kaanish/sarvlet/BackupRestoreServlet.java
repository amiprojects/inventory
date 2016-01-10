package com.kaanish.sarvlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaanish.ejb.Ejb;
import com.kaanish.model.City;
import com.kaanish.model.Country;
import com.kaanish.util.GetMacId;

@WebServlet({ "/backup", "/restore", "/macid" })
public class BackupRestoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
	private Ejb ejb;

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/') + 1);
		switch (url) {
		case "backup":
			List<Country> countries = ejb.getAllCountry();
			FileOutputStream fos = new FileOutputStream("d:/Country.txt");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(countries);
			oos.close();
			fos.close();

			List<City> cities = ejb.getAllCity();
			FileOutputStream fos1 = new FileOutputStream("d:/City.txt");
			ObjectOutputStream oos1 = new ObjectOutputStream(fos1);
			oos1.writeObject(cities);
			oos1.close();
			fos1.close();
			break;
		case "restore":
			FileInputStream fis = new FileInputStream(new File("d:/Country.txt"));
			ObjectInputStream ois = new ObjectInputStream(fis);
			List<Country> cont = new ArrayList<>();

			try {
				cont = (List<Country>) ois.readObject();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			for (Country c : cont) {
				for (Country c1 : ejb.getAllCountry()) {
					if (c1.getId()!=c.getId()) {
						ejb.setCountry(c);
					}
				}
			}
			
			fis.close();
			ois.close();
			break;
		case "macid":
			resp.getWriter().println(GetMacId.getMacId());
			break;

		default:
			break;
		}
	}
}
