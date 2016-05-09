package com.kaanish.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;

@Cacheable(false)
@Entity
public class JobClass {

	@Id
	@GeneratedValue
	private int id;
	private String jobTitle;
	@Temporal(TemporalType.TIMESTAMP)
	private Date assignDate;
	private String macId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getMacId() {
		return macId;
	}

	public void setMacId(String macId) {
		this.macId = macId;
	}

	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}

	@Override
	public String toString() {

		List<City> lst = new ArrayList<City>();
		for (int i = 0; i < 5; i++) {
			City c = new City();
			c.setId(i);
			c.setCityName("City" + i);
			lst.add(c);
		}

		String str = new String();
		str = "{\"cityDet\":[{\"city\":[";

		for (int c = 0; c < lst.size(); c++) {
			City cty = lst.get(c);
			if (c != lst.size() - 1) {
				str = str + "{\"cityName\":\"" + cty.getCityName() + "\"},";
			} else {
				str = str + "{\"cityName\":\"" + cty.getCityName() + "\"}";
			}
		}

		str = str + "]}]}";

		return str;
	}
}
