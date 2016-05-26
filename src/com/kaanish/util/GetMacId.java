package com.kaanish.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class GetMacId {

	// java doc (/**enter)
	/**
	 * getting the hdd serial number instead of machine mac id
	 * 
	 * @return String hdd serial number
	 * @param no
	 *            param needed
	 * 
	 * @throws IOException
	 */
	public static String getMacId() throws IOException {
		Process p = Runtime.getRuntime().exec("cmd /C vol c:");
		InputStream fis = p.getInputStream();
		Properties pro = new Properties();
		pro.load(fis);
		fis.close();
		String str = "";
		for (Object key : pro.keySet()) {
			if (!key.toString().equals("Caption")) {
				String temp = pro.getProperty(key.toString());
				str = str + temp.substring(temp.lastIndexOf(" ") + 1);
			}
		}
		return str;
	}

	public static boolean getSerialNumberOfKaanishExternalHDD(String slno)
			throws IOException {
		// Process p1 = Runtime.getRuntime().exec("cmd /C wmic diskdrive list");
		// InputStream fis = p1.getInputStream();
		// Properties pro = new Properties();
		// pro.load(fis);
		// fis.close();
		// int f = 0;
		// for (Object key : pro.keySet()) {
		// if (pro.getProperty(key.toString()).contains(slno)) {
		// f = 1;
		// // System.out.println("///////////////////"
		// // + pro.getProperty(key.toString()));
		// break;
		// }
		// }
		// return f == 1;
		return true;
	}

}
