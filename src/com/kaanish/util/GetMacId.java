package com.kaanish.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
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
	// public static String getMacId(){
	// InetAddress ip;
	// String macid="";
	// try {
	// ip = InetAddress.getLocalHost();
	// //System.out.println("Current IP address : " + ip.getHostAddress());
	// NetworkInterface network = NetworkInterface.getByInetAddress(ip);
	// byte[] mac = network.getHardwareAddress();
	// System.out.print("Current MAC address : ");
	// StringBuilder sb = new StringBuilder();
	// for (int i = 0; i < mac.length; i++) {
	// sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" :
	// ""));
	// }
	// //System.out.println(sb.toString());
	// //System.out.println(new String(mac));
	// macid=sb.toString();
	// } catch (UnknownHostException e) {
	// e.printStackTrace();
	// } catch (SocketException e){
	// e.printStackTrace();
	// }
	// return macid;
	// }

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

	public static boolean getSerialNumberOfKaanishExternalHDD(String slno,
			String userName) throws IOException {
		if (userName.equals("adminProduction")) {
			Process p1 = Runtime.getRuntime()
					.exec("cmd /C wmic diskdrive list");
			InputStream fis = p1.getInputStream();
			Properties pro = new Properties();
			pro.load(fis);
			fis.close();
			int f = 0;
			for (Object key : pro.keySet()) {
				if (pro.getProperty(key.toString()).contains(slno)) {
					f = 1;
					// System.out.println("///////////////////"
					// + pro.getProperty(key.toString()));
					break;
				}
			}
			return f == 1;
		} else {
			return true;
		}
	}

}
