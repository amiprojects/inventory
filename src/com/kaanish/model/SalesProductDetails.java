package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class SalesProductDetails {

	@Id@GeneratedValue
	
	private int id;
	private int quantity;
	private float SalesPrice;
	
	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;

	
	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;


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


	public float getSalesPrice() {
		return SalesPrice;
	}


	public void setSalesPrice(float salesPrice) {
		SalesPrice = salesPrice;
	}


	public SalesEntry getSalesEntry() {
		return salesEntry;
	}


	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}


	public ProductDetail getProductDetail() {
		return productDetail;
	}


	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	
	
}
