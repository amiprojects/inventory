package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Tax {
	@Id
	private String name;
	private float value;

	@ManyToMany(targetEntity = Tax_Type_Group.class)
	private List<Tax_Type_Group> tax_type_groups;

	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value = value;
	}

	public List<Tax_Type_Group> getTax_type_groups() {
		return tax_type_groups;
	}

	public void setTax_type_groups(List<Tax_Type_Group> tax_type_groups) {
		this.tax_type_groups = tax_type_groups;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

}
