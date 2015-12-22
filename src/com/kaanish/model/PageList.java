package com.kaanish.model;

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
public class PageList {

	@Id@GeneratedValue
	private int id;
	private String name;
	@Transient
	private boolean isContains;

	@ManyToOne
	@JoinColumn(name = "moduleId")
	private Module module;
	
	@ManyToMany(targetEntity = UserGroup.class, cascade = CascadeType.ALL)
	private List<UserGroup> userGroups;

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

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public List<UserGroup> getUserGroups() {
		return userGroups;
	}

	public void setUserGroups(List<UserGroup> userGroups) {
		this.userGroups = userGroups;
	}

	public boolean isContains() {
		return isContains;
	}

	public void setContains(boolean isContains) {
		this.isContains = isContains;
	}

}
