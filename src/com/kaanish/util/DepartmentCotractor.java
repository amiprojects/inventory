package com.kaanish.util;

public class DepartmentCotractor {

	private int id;
	private String name;
	private String pName;
	private int status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
	
	@Override
	public String toString() {
		return "{\"id\":\""+id+"\", \"name\":\""+name+"\", \"status\":\""+status+"\", \"pName\":\""+pName+"\"}";
	}
}
