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
public class JobPlanJobStock implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private float qty;
	//private float remQty;
	private boolean isComplete;

	@OneToMany(mappedBy = "jobPlanJobStock")
	private List<JobReceiveJobDetails> JobReceiveJobDetails;

	@ManyToOne
	@JoinColumn(name = "JobPlanProductsId")
	private JobPlanProducts jobPlanProducts;

	@OneToMany(mappedBy = "jobPlanJobStock")
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;

	@ManyToOne
	@JoinColumn(name = "jobsForDesignCostSheetId")
	private JobsForDesignCostSheet jobsForDesignCostSheet;

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

	public JobsForDesignCostSheet getJobsForDesignCostSheet() {
		return jobsForDesignCostSheet;
	}

	public void setJobsForDesignCostSheet(
			JobsForDesignCostSheet jobsForDesignCostSheet) {
		this.jobsForDesignCostSheet = jobsForDesignCostSheet;
	}

	public JobPlanProducts getJobPlanProducts() {
		return jobPlanProducts;
	}

	public void setJobPlanProducts(JobPlanProducts jobPlanProducts) {
		this.jobPlanProducts = jobPlanProducts;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(
			List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public List<JobReceiveJobDetails> getJobReceiveJobDetails() {
		return JobReceiveJobDetails;
	}

	public void setJobReceiveJobDetails(
			List<JobReceiveJobDetails> jobReceiveJobDetails) {
		JobReceiveJobDetails = jobReceiveJobDetails;
	}
}
