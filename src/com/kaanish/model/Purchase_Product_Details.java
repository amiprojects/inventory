package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Purchase_Product_Details {
	@Id
	@GeneratedValue
	private int id;
	private int purchase_details_id;
	private int product_id;
	private int quantity_unit_id;
	private int cost;
	private int remaining_quantity;
	private String barcode;
	private int quantity;
}
