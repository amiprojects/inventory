package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Tax_Type_Group {
	@Id
	private String name;

	@ManyToMany(mappedBy = "tax_type_groups")
	private List<Tax> taxes;
	@ManyToOne@JoinColumn(name="userId")
	private Users users;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public List<Tax> getTaxes() {
		return taxes;
	}

	public void setTaxes(List<Tax> taxes) {
		this.taxes = taxes;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

}
