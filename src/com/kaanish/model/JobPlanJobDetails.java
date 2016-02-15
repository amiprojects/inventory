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
public class JobPlanJobDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	
	private float qty;
	
	@ManyToOne@JoinColumn(name="jobType")
	private JobTypes jobTypes;
	
	@ManyToOne
	@JoinColumn(name = "jobPlanProductStockId")
	private JobPlanProductStock jobPlanProductStock;	
	
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
	
	public JobTypes getJobTypes() {
		return jobTypes;
	}
	public void setJobTypes(JobTypes jobTypes) {
		this.jobTypes = jobTypes;
	}
	public JobPlanProductStock getJobPlanProductStock() {
		return jobPlanProductStock;
	}
	public void setJobPlanProductStock(JobPlanProductStock jobPlanProductStock) {
		this.jobPlanProductStock = jobPlanProductStock;
	}
}
