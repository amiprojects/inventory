package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
@Cacheable(false)
public class Tax implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private float value;
	private boolean isActive;

	@Transient
	private boolean isAvailable;

	@ManyToMany(cascade = CascadeType.ALL, targetEntity = Tax_Type_Group.class)
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

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}
