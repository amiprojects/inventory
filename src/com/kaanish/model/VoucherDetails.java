package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class VoucherDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private int id;
	private String name;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date voucherDate;
	
	private boolean isCredit;
	
	@OneToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;
	
	@OneToOne
	@JoinColumn(name = "salesReturnId")
	private SalesReturn salesReturn;
	
	@OneToOne
	@JoinColumn(name = "purchase_EntryId")
	private Purchase_Entry purchase_Entry;
	
	
	
	
}
