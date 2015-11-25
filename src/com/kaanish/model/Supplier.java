package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Supplier {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String ph;
	private String address;
	private String email;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_date;
	private int account_no;
}
