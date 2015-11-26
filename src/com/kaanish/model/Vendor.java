package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Vendor {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String companyName;
	private String ph1;
	private String ph2;
	private String address;
	private String pinCode;
	private String email;
	
	private String aliseName;
	 
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;
	
}
