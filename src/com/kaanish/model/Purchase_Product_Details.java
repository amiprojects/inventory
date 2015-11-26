package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Purchase_Product_Details {
	@Id
	@GeneratedValue
	private int id;
	
	
	private int cost;
	private int remaining_quantity;
	private String barcode;
	private int quantity;
	private int mrp;
	private int wsp;
	private String attrValue1;
	private String attrValue2;
	private String attrValue3;
	private String attrValue4;
	private String attrValue5;
	private String attrValue6;
}
