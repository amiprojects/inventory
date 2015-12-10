package com.kaanish.util;

import java.time.Year;
import java.util.Calendar;
import java.util.Date;


public class DateConverter {
	
	public static Date getDate(String str) {
		String[] DateParts=str.split("-");
		Calendar cal=Calendar.getInstance();
		cal.set(cal.DAY_OF_MONTH,Integer.parseInt(DateParts[0]));
		cal.set(cal.MONTH, Integer.parseInt(DateParts[1])-1);
		cal.set(cal.YEAR, Integer.parseInt(DateParts[2]));
		
		return cal.getTime();
	}
}
