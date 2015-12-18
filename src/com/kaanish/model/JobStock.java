package com.kaanish.model;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class JobStock {
	@Id
	@GeneratedValue
	private int id;
	private float givenQty;
	private float remainingQty;
	private float cost;

	@OneToOne
	private JobAssignmentProducts jobAssignmentProducts;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public float getGivenQty() {
		return givenQty;
	}

	public void setGivenQty(float givenQty) {
		this.givenQty = givenQty;
	}

	public float getRemainingQty() {
		return remainingQty;
	}

	public void setRemainingQty(float remainingQty) {
		this.remainingQty = remainingQty;
	}
}
