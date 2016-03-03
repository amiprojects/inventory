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
public class JobRecieveProductsDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float qtyReturn;
	private String reason;
	
	@OneToMany(mappedBy = "jobRecieveProductsDetails")
	private List<JobReceiveJobDetails> JobReceiveJobDetails;
	
	@ManyToOne
	@JoinColumn(name = "jobRecievedDetailsId")
	private JobRecievedDetails jobRecievedDetails;
	
	@ManyToOne
	@JoinColumn(name = "jobPlanProductsId")
	private JobPlanProducts jobPlanProducts;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public JobRecievedDetails getJobRecievedDetails() {
		return jobRecievedDetails;
	}


	public void setJobRecievedDetails(JobRecievedDetails jobRecievedDetails) {
		this.jobRecievedDetails = jobRecievedDetails;
	}


	public float getQtyReturn() {
		return qtyReturn;
	}


	public void setQtyReturn(float qtyReturn) {
		this.qtyReturn = qtyReturn;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public JobPlanProducts getJobPlanProducts() {
		return jobPlanProducts;
	}


	public void setJobPlanProducts(JobPlanProducts jobPlanProducts) {
		this.jobPlanProducts = jobPlanProducts;
	}


	public List<JobReceiveJobDetails> getJobReceiveJobDetails() {
		return JobReceiveJobDetails;
	}


	public void setJobReceiveJobDetails(List<JobReceiveJobDetails> jobReceiveJobDetails) {
		JobReceiveJobDetails = jobReceiveJobDetails;
	}

}
