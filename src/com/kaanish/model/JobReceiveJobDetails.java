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
public class JobReceiveJobDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float qtyDone;
	
	@ManyToOne
	@JoinColumn(name = "jobRecieveProductsDetailsId")
	private JobRecieveProductsDetails jobRecieveProductsDetails;

	@ManyToOne
	@JoinColumn(name = "jobPlanJobStockId")
	private JobPlanJobStock jobPlanJobStock;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public float getQtyDone() {
		return qtyDone;
	}

	public void setQtyDone(float qtyDone) {
		this.qtyDone = qtyDone;
	}

	public JobRecieveProductsDetails getJobRecieveProductsDetails() {
		return jobRecieveProductsDetails;
	}

	public void setJobRecieveProductsDetails(JobRecieveProductsDetails jobRecieveProductsDetails) {
		this.jobRecieveProductsDetails = jobRecieveProductsDetails;
	}

	public JobPlanJobStock getJobPlanJobStock() {
		return jobPlanJobStock;
	}

	public void setJobPlanJobStock(JobPlanJobStock jobPlanJobStock) {
		this.jobPlanJobStock = jobPlanJobStock;
	}

}
