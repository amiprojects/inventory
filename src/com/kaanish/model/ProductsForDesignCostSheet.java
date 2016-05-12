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

	private float qty;
	private float rate;
	private float ammount;

	@ManyToOne
	@JoinColumn(name = "sampleDesignCostSheetId")
	private SampleDesignCostSheet sampleDesignCostSheet;

	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;

	@ManyToOne
	@JoinColumn(name = "uomID")
	private QtyUnit qtyUnit;

	@OneToMany(mappedBy = "productsForDesignCostSheet")
	private List<JobsForDesignCostSheet> jobsForDesignCostSheets;

	@OneToMany(mappedBy = "productsForDesignCostSheet")
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@OneToMany(mappedBy = "productsForDesignCostSheet")
	private List<JobPlanProductStock> jobPlanProductStock;

	@OneToMany(mappedBy = "productsForDesignCostSheet")
	private List<JobPlanProducts> jobPlanProducts;

	@OneToMany(mappedBy = "productsForDesignCostSheet")
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;

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

	public SampleDesignCostSheet getSampleDesignCostSheet() {
		return sampleDesignCostSheet;
	}

	public void setSampleDesignCostSheet(
			SampleDesignCostSheet sampleDesignCostSheet) {
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

	public void setJobsForDesignCostSheets(
			List<JobsForDesignCostSheet> jobsForDesignCostSheets) {
		this.jobsForDesignCostSheets = jobsForDesignCostSheets;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public List<JobPlanProductStock> getJobPlanProductStock() {
		return jobPlanProductStock;
	}

	public void setJobPlanProductStock(
			List<JobPlanProductStock> jobPlanProductStock) {
		this.jobPlanProductStock = jobPlanProductStock;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(
			List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

	public List<JobPlanProducts> getJobPlanProducts() {
		return jobPlanProducts;
	}

	public void setJobPlanProducts(List<JobPlanProducts> jobPlanProducts) {
		this.jobPlanProducts = jobPlanProducts;
	}

}
