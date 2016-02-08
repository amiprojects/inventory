package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
@Cacheable(false)
public class JobAssignmentJobDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	private int qty;
	private float rate;
	private float ammount;

	@ManyToOne
	@JoinColumn(name = "UOMid")
	private QtyUnit qtyUnit;

	@ManyToOne
	@JoinColumn(name = "jobAsignmentDetailsId")
	private JobAssignmentDetails jobAssignmentDetails;

	@ManyToOne
	@JoinColumn(name = "jobAssignProductId")
	private JobAssignmentProducts assignmentProducts;

	@ManyToMany(mappedBy = "jobAssignmentJobDetails")
	private List<JobTypes> jobTypes;

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

	public float getAmmount() {
		return ammount;
	}

	public void setAmmount(float ammount) {
		this.ammount = ammount;
	}

	public QtyUnit getQtyUnit() {
		return qtyUnit;
	}

	public void setQtyUnit(QtyUnit qtyUnit) {
		this.qtyUnit = qtyUnit;
	}

	public JobAssignmentDetails getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public JobAssignmentProducts getAssignmentProducts() {
		return assignmentProducts;
	}

	public void setAssignmentProducts(JobAssignmentProducts assignmentProducts) {
		this.assignmentProducts = assignmentProducts;
	}

	public List<JobTypes> getJobTypes() {
		return jobTypes;
	}

	public void setJobTypes(List<JobTypes> jobTypes) {
		this.jobTypes = jobTypes;
	}

}
