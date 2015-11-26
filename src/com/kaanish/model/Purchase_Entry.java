package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Purchase_Entry {
	@Id
	@GeneratedValue
	private int id;

	private int challan_no;
	private int vendor_bill_no;

	@Temporal(TemporalType.TIMESTAMP)
	private Date purchase_date;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_date;

	
	private int transport_cost;
	private int sur_charge;
}
