public static String getMacId() throws IOException {
		// InetAddress ip;
		// String macid=new String();
		// try {
		//
		// ip = InetAddress.getLocalHost();
		// System.out.println("Current IP address : " + ip.getHostAddress());
		//
		// NetworkInterface network = NetworkInterface.getByInetAddress(ip);
		//
		// byte[] mac = network.getHardwareAddress();
		//
		//
		//
		// StringBuilder sb = new StringBuilder();
		// for (int i = 0; i < mac.length; i++) {
		// sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-"
		// : ""));
		// }
		// //System.out.println(sb.toString());
		// //System.out.println(new String(mac));
		// macid=sb.toString();
		//
		// } catch (UnknownHostException e) {
		//
		// e.printStackTrace();
		//
		// } catch (SocketException e){
		//
		// e.printStackTrace();
		//
		// }
		// //System.out.print("Current MAC address : "+macid);
		// return macid;

		<!-- Process p = Runtime.getRuntime().exec(
				"cmd /C wmic diskdrive get serialnumber");
		InputStream fis = p.getInputStream();
		Properties pro = new Properties();
		pro.load(fis);
		fis.close();
		Enumeration<?> e = pro.propertyNames();
		e.nextElement();
		return (String) e.nextElement();
	} -->