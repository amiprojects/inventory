package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class JobStock {
	@Id
	private int id;
	private int qty;
	private float cost;

	@ManyToOne
	@JoinColumn(name = "jobAsignmentProductId")
	private JobAssignmentProducts jobAssignmentProducts;

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

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public JobAssignmentProducts getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			JobAssignmentProducts jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}
}
