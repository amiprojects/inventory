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
public class ProductsForDesignCostSheet implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	
	private int qty;
	private float rate;
	private float ammount;
	
	@ManyToOne@JoinColumn(name="sampleDesignCostSheetId")
	private SampleDesignCostSheet sampleDesignCostSheet;
	
	@ManyToOne@JoinColumn(name="productId")
	private ProductDetail productDetail;
	
	@ManyToOne@JoinColumn(name="uomID")
	private QtyUnit qtyUnit;
	
	@OneToMany(mappedBy="productsForDesignCostSheet")
	private List<JobsForDesignCostSheet> jobsForDesignCostSheets;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public SampleDesignCostSheet getSampleDesignCostSheet() {
		return sampleDesignCostSheet;
	}

	public void setSampleDesignCostSheet(SampleDesignCostSheet sampleDesignCostSheet) {
		this.sampleDesignCostSheet = sampleDesignCostSheet;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public QtyUnit getQtyUnit() {
		return qtyUnit;
	}

	public void setQtyUnit(QtyUnit qtyUnit) {
		this.qtyUnit = qtyUnit;
	}

	public float getAmmount() {
		return ammount;
	}

	public void setAmmount(float ammount) {
		this.ammount = ammount;
	}

	public List<JobsForDesignCostSheet> getJobsForDesignCostSheets() {
		return jobsForDesignCostSheets;
	}

	public void setJobsForDesignCostSheets(List<JobsForDesignCostSheet> jobsForDesignCostSheets) {
		this.jobsForDesignCostSheets = jobsForDesignCostSheets;
	}

}
