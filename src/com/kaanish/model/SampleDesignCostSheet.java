package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class SampleDesignCostSheet implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private String designNumber;
	private String designDetails;
	@Column(length = 800)
	private String designDescription;
	private int qty;
	private float totalProductcost;
	private float totalJobcost;
	private float surcharge;
	private float grandTotal;
	private float profit;
	private boolean isFlatProfit;

	@ManyToOne
	@JoinColumn(name = "designerId")
	private Vendor vendor;

	@OneToMany(mappedBy = "designCostSheet", cascade = CascadeType.ALL)
	private List<DesignImage> designImages;

	@OneToMany(mappedBy = "sampleDesignCostSheet", cascade = CascadeType.ALL)
	private List<ProductsForDesignCostSheet> productsForDesignCostSheets;

	@OneToMany(mappedBy = "sampleDesignCostSheet", cascade = CascadeType.ALL)
	private List<JobsForDesignCostSheet> jobsForDesignCostSheets;

	@OneToMany(mappedBy = "designCostSheet", cascade = CascadeType.ALL)
	private List<JobPlan> jobPlans;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDesignNumber() {
		return designNumber;
	}

	public void setDesignNumber(String designNumber) {
		this.designNumber = designNumber;
	}

	public String getDesignDetails() {
		return designDetails;
	}

	public void setDesignDetails(String designDetails) {
		this.designDetails = designDetails;
	}

	public String getDesignDescription() {
		return designDescription;
	}

	public void setDesignDescription(String designDescription) {
		this.designDescription = designDescription;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public List<DesignImage> getDesignImages() {
		return designImages;
	}

	public void setDesignImages(List<DesignImage> designImages) {
		this.designImages = designImages;
	}

	public List<ProductsForDesignCostSheet> getProductsForDesignCostSheets() {
		return productsForDesignCostSheets;
	}

	public void setProductsForDesignCostSheets(
			List<ProductsForDesignCostSheet> productsForDesignCostSheets) {
		this.productsForDesignCostSheets = productsForDesignCostSheets;
	}

	public float getTotalProductcost() {
		return totalProductcost;
	}

	public void setTotalProductcost(float totalProductcost) {
		this.totalProductcost = totalProductcost;
	}

	public float getTotalJobcost() {
		return totalJobcost;
	}

	public void setTotalJobcost(float totalJobcost) {
		this.totalJobcost = totalJobcost;
	}

	public float getSurcharge() {
		return surcharge;
	}

	public void setSurcharge(float surcharge) {
		this.surcharge = surcharge;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<JobsForDesignCostSheet> getJobsForDesignCostSheets() {
		return jobsForDesignCostSheets;
	}

	public void setJobsForDesignCostSheets(
			List<JobsForDesignCostSheet> jobsForDesignCostSheets) {
		this.jobsForDesignCostSheets = jobsForDesignCostSheets;
	}

	public List<JobPlan> getJobPlans() {
		return jobPlans;
	}

	public void setJobPlans(List<JobPlan> jobPlans) {
		this.jobPlans = jobPlans;
	}

	public float getProfit() {
		return profit;
	}

	public void setProfit(float profit) {
		this.profit = profit;
	}

	public boolean isFlatProfit() {
		return isFlatProfit;
	}

	public void setFlatProfit(boolean isFlatProfit) {
		this.isFlatProfit = isFlatProfit;
	}

}
