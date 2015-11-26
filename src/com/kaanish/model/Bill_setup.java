package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Bill_setup {

	@Id
	@GeneratedValue
	private int id;

	private String challanNumber;
	private String sufix;
	private String billType;
	private String finantialYear;
	private String month;
	private String companyInitial;
	
	
}
