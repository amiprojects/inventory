package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class Department implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;

	@OneToMany(mappedBy = "department")
	private List<SubDepartment> subDepartments;

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

	public List<SubDepartment> getSubDepartments() {
		return subDepartments;
	}

	public void setSubDepartments(List<SubDepartment> subDepartments) {
		this.subDepartments = subDepartments;
	}
	
	@Override
	public String toString() {
		return "{\"id\":\""+id+"\", \"name\":\""+name+"\"}";
	}

}
