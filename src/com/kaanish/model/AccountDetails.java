package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class AccountDetails {
	@Id
	@GeneratedValue
	private int id;
	private String bankName;
	private String bankAccountNumber;
	private int cityID;
	private String branch;
	private String vatNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date vatRegistrationDate;
	private String cstNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date cstRegistrationDate;
	private String panNumber;
	private String exciseRegistrationNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date exciseRegistrationDate;
	private String serviceTaxRegistrationNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date serviceTaxRegistrationDate;
	private String bankIFSCnumber;
	private String bankMICRnumber;
	private String bankRTGCnumber;
	private String bankChequeLable;
}
