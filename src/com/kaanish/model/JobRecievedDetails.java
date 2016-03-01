package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class JobRecievedDetails implements Serializable {
	// job assignment product
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.TIMESTAMP)
	private Date recievingDate;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	private String referenceJobAssignChallan;
	private float qtyRecieved;// old concept
	private boolean isComplete;// old concept

	@ManyToOne
	@JoinColumn(name = "jobAssignmentId")
	private JobAssignmentDetails jobAssignmentDetails;
	
	@OneToMany(mappedBy = "jobRecievedDetails")
	private List<JobRecieveProductsDetails> jobRecieveProductsDetails;

	@ManyToOne
	@JoinColumn(name = "jobAssignmentProductsId")
	private JobAssignmentProducts jobAssignmentProducts;// old concept

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getQtyRecieved() {
		return qtyRecieved;
	}

	public void setQtyRecieved(float qtyRecieved) {
		this.qtyRecieved = qtyRecieved;
	}

	public Date getRecievingDate() {
		return recievingDate;
	}

	public void setRecievingDate(Date recievingDate) {
		this.recievingDate = recievingDate;
	}

	public JobAssignmentProducts getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			JobAssignmentProducts jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public int getChallanNo() {
		return challanNo;
	}

	public void setChallanNo(int challanNo) {
		this.challanNo = challanNo;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public int getChallanSuffix() {
		return challanSuffix;
	}

	public void setChallanSuffix(int challanSuffix) {
		this.challanSuffix = challanSuffix;
	}

	public String getReferenceJobAssignChallan() {
		return referenceJobAssignChallan;
	}

	public void setReferenceJobAssignChallan(String referenceJobAssignChallan) {
		this.referenceJobAssignChallan = referenceJobAssignChallan;
	}

	public JobAssignmentDetails getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public List<JobRecieveProductsDetails> getJobRecieveProductsDetails() {
		return jobRecieveProductsDetails;
	}

	public void setJobRecieveProductsDetails(
			List<JobRecieveProductsDetails> jobRecieveProductsDetails) {
		this.jobRecieveProductsDetails = jobRecieveProductsDetails;
	}

}
