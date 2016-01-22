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
public class PurchaseReturnProductDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private int qtyReturn;
	private String fault;

	@ManyToOne
	@JoinColumn(name = "purchaseProductDetailsID")
	private Purchase_Product_Details purchaseProductDetails;

	@ManyToOne
	@JoinColumn(name = "purchaseReturnsID")
	private PurchaseReturn purchaseReturn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQtyReturn() {
		return qtyReturn;
	}

	public void setQtyReturn(int qtyReturn) {
		this.qtyReturn = qtyReturn;
	}

	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	public Purchase_Product_Details getPurchaseProductDetails() {
		return purchaseProductDetails;
	}

	public void setPurchaseProductDetails(
			Purchase_Product_Details purchaseProductDetails) {
		this.purchaseProductDetails = purchaseProductDetails;
	}

	public PurchaseReturn getPurchaseReturn() {
		return purchaseReturn;
	}

	public void setPurchaseReturn(PurchaseReturn purchaseReturn) {
		this.purchaseReturn = purchaseReturn;
	}

}
