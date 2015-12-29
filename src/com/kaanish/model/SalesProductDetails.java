package com.kaanish.model;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Cacheable(false)
public class SalesProductDetails implements Serializable { 

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue

	private int id;
	private int quantity;
	private float salesPrice;

	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;

	@ManyToOne
	@JoinColumn(name = "purchaseProductDetailsId")
	private Purchase_Product_Details purchase_Product_Details;
	
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public float getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(float salesPrice) {
		this.salesPrice = salesPrice;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

}
