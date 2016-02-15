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
public class JobsForDesignCostSheet implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	
	private float qty;
	private float rate;
	private float ammount;
	
	@ManyToOne@JoinColumn(name="sampleDesignCostSheetId")
	private SampleDesignCostSheet sampleDesignCostSheet;
	@ManyToOne@JoinColumn(name="designerId")
	private Vendor vendor;
	
	@ManyToOne@JoinColumn(name="UOMid")
	private QtyUnit qtyUnit;
	
	@ManyToOne@JoinColumn(name="jobType")
	private JobTypes jobTypes;
	
	@ManyToOne@JoinColumn(name="productforsampleid")
	private ProductsForDesignCostSheet productsForDesignCostSheet;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public float getQty() {
		return qty;
	}
	public void setQty(float qty) {
		this.qty = qty;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public float getAmmount() {
		return ammount;
	}
	public void setAmmount(float ammount) {
		this.ammount = ammount;
	}
	public SampleDesignCostSheet getSampleDesignCostSheet() {
		return sampleDesignCostSheet;
	}
	public void setSampleDesignCostSheet(SampleDesignCostSheet sampleDesignCostSheet) {
		this.sampleDesignCostSheet = sampleDesignCostSheet;
	}
	public Vendor getVendor() {
		return vendor;
	}
	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}
	public QtyUnit getQtyUnit() {
		return qtyUnit;
	}
	public void setQtyUnit(QtyUnit qtyUnit) {
		this.qtyUnit = qtyUnit;
	}
	public JobTypes getJobTypes() {
		return jobTypes;
	}
	public void setJobTypes(JobTypes jobTypes) {
		this.jobTypes = jobTypes;
	}
	public ProductsForDesignCostSheet getProductsForDesignCostSheet() {
		return productsForDesignCostSheet;
	}
	public void setProductsForDesignCostSheet(ProductsForDesignCostSheet productsForDesignCostSheet) {
		this.productsForDesignCostSheet = productsForDesignCostSheet;
	}
}
