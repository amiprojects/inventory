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
	private int supplier_bill_no;

	@Temporal(TemporalType.TIMESTAMP)
	private Date purchase_date;
	@Temporal(TemporalType.TIMESTAMP)
	private Date purchase_entry_date;

	private String tax_group;
	private int transport_cost;
	private int payment_status_id;
}
