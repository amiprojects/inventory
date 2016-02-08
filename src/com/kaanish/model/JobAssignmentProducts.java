package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class JobAssignmentProducts implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private int qty;
	private int remaninQty;
	private float estimatedCost;
	@Column(length = 800)
	private String workDescription;

	@OneToMany(mappedBy = "jobAssignmentProducts")
	private List<JobRecievedDetails> jobRecievedDetails;

	@ManyToOne
	@JoinColumn(name = "designerID")
	private Vendor vendor;

	@ManyToOne
	@JoinColumn(name = "jobAsignmentDetailsId")
	private JobAssignmentDetails jobAssignmentDetails;

	@OneToOne
	@JoinColumn(name = "jobStockId")
	private JobStock jobStock;

	@ManyToOne
	@JoinColumn(name = "jobPlanProStockId")
	private JobPlanProductStock jobPlanProductStock;
	
	@OneToMany(mappedBy="assignmentProducts")
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;
	

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

	public int getRemaninQty() {
		return remaninQty;
	}

	public void setRemaninQty(int remaninQty) {
		this.remaninQty = remaninQty;
	}

	public float getEstimatedCost() {
		return estimatedCost;
	}

	public void setEstimatedCost(float estimatedCost) {
		this.estimatedCost = estimatedCost;
	}

	public JobAssignmentDetails getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<JobRecievedDetails> getJobRecievedDetails() {
		return jobRecievedDetails;
	}

	public void setJobRecievedDetails(List<JobRecievedDetails> jobRecievedDetails) {
		this.jobRecievedDetails = jobRecievedDetails;
	}

	public JobStock getJobStock() {
		return jobStock;
	}

	public void setJobStock(JobStock jobStock) {
		this.jobStock = jobStock;
	}

	public String getWorkDescription() {
		return workDescription;
	}

	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

	public JobPlanProductStock getJobPlanProductStock() {
		return jobPlanProductStock;
	}

	public void setJobPlanProductStock(JobPlanProductStock jobPlanProductStock) {
		this.jobPlanProductStock = jobPlanProductStock;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

}
