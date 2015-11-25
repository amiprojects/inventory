package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Users {
	@Id
	@GeneratedValue
	private int user_id;

	private String name;
	private String ph;
	
	
	
	@OneToMany(mappedBy="users")
	List<Tax> taxes;
	@OneToMany(mappedBy="users")
	List<Tax_Type_Group> tax_Type_Groups;
}
