package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class SalesReturn implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id@GeneratedValue
	private int id;
	private int qtyReturn;
	@Temporal(TemporalType.TIMESTAMP)
	private Date returnDate;
	private String fault;
	private float totalReCost;
	private float roundOff;
	
	@ManyToOne
	@JoinColumn(name = "salesProductsId")
	private SalesProductDetails salesProductDetails;

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

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
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

	
	public float getRoundOff() {
		return roundOff;
	}

	public void setRoundOff(float roundOff) {
		this.roundOff = roundOff;
	}

	public float getTotalReCost() {
		return totalReCost;
	}

	public void setTotalReCost(float totalReCost) {
		this.totalReCost = totalReCost;
	}
	
	
	
}
