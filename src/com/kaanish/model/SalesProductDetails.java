package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class SalesProductDetails implements Serializable { 

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue

	private int id;
	private int quantity;
	private float salesPrice;	
	private int salesReQty;

	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;

	@ManyToOne
	@JoinColumn(name = "purchaseProductDetailsId")
	private Purchase_Product_Details purchase_Product_Details;
	
	
	@OneToMany(mappedBy = "salesProductDetails")
	private List<SalesProductReturnDetail> SalesProductReturnDetail;
	
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

	public int getSalesReQty() {
		return salesReQty;
	}

	public void setSalesReQty(int salesReQty) {
		this.salesReQty = salesReQty;
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

	public List<SalesProductReturnDetail> getSalesProductReturnDetail() {
		return SalesProductReturnDetail;
	}

	public void setSalesProductReturnDetail(List<SalesProductReturnDetail> salesProductReturnDetail) {
		SalesProductReturnDetail = salesProductReturnDetail;
	}


}
