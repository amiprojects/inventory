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
public class ApprovalReturnProductDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float qtyReturn;
	private String comments;

	@ManyToOne
	@JoinColumn(name = "approvalProductDetailsID")
	private ApprovalProductDetails approvalProductDetails;
	@ManyToOne
	@JoinColumn(name = "approvalReturnsID")
	private ApprovalReturn approvalReturn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getQtyReturn() {
		return qtyReturn;
	}

	public void setQtyReturn(float qtyReturn) {
		this.qtyReturn = qtyReturn;
	}

	public ApprovalProductDetails getApprovalProductDetails() {
		return approvalProductDetails;
	}

	public void setApprovalProductDetails(
			ApprovalProductDetails approvalProductDetails) {
		this.approvalProductDetails = approvalProductDetails;
	}

	public ApprovalReturn getApprovalReturn() {
		return approvalReturn;
	}

	public void setApprovalReturn(ApprovalReturn approvalReturn) {
		this.approvalReturn = approvalReturn;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
