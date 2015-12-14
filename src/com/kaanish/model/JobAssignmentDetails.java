package com.kaanish.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class JobAssignmentDetails {
	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.TIMESTAMP)
	private Date assignDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date estimatedCompletionDate;

	@ManyToOne
	@JoinColumn(name = "vendorId")
	private Vendor vendor;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}

	public Date getEstimatedCompletionDate() {
		return estimatedCompletionDate;
	}

	public void setEstimatedCompletionDate(Date estimatedCompletionDate) {
		this.estimatedCompletionDate = estimatedCompletionDate;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	@OneToMany(mappedBy = "jobAssignmentDetails")
	private List<JobAssignmentProducts> jobAssignmentProducts;
}
