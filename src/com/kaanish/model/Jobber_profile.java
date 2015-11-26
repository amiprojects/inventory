package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Jobber_profile {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private int mobNo;
	private String address;
	private int listOfJobCatId;
	
	
}
