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
public class SalesProductReturnDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float qtyReturn;
	private String fault;

	@ManyToOne
	@JoinColumn(name = "salesProductDetailsID")
	private SalesProductDetails salesProductDetails;

	@ManyToOne
	@JoinColumn(name = "salesReturnsID")
	private SalesReturn salesReturn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	public SalesProductDetails getSalesProductDetails() {
		return salesProductDetails;
	}

	public void setSalesProductDetails(SalesProductDetails salesProductDetails) {
		this.salesProductDetails = salesProductDetails;
	}

	public SalesReturn getSalesReturn() {
		return salesReturn;
	}

	public void setSalesReturn(SalesReturn salesReturn) {
		this.salesReturn = salesReturn;
	}

	public float getQtyReturn() {
		return qtyReturn;
	}

	public void setQtyReturn(float qtyReturn) {
		this.qtyReturn = qtyReturn;
	}

	
	
}
