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
public class JobAssignmentDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private int challan_no;
	private String challanNumber;
	private int challanSuffix;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entryDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date assignDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date estimatedCompletionDate;//old concept
	private float surcharge;
	private float grandTotal;
	private float profit;
	private boolean isFlatProfit;

	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;//old concept

	@ManyToOne
	@JoinColumn(name = "jobberId")
	private Vendor vendor;

	@OneToMany(mappedBy = "jobAssignmentDetails")
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@OneToMany(mappedBy = "jobAssignmentDetails")
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;

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

	public void setJobAssignmentProducts(List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public int getChallan_no() {
		return challan_no;
	}

	public void setChallan_no(int challan_no) {
		this.challan_no = challan_no;
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

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

	public float getSurcharge() {
		return surcharge;
	}

	public void setSurcharge(float surcharge) {
		this.surcharge = surcharge;
	}

	public float getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}

	public float getProfit() {
		return profit;
	}

	public void setProfit(float profit) {
		this.profit = profit;
	}

	public boolean isFlatProfit() {
		return isFlatProfit;
	}

	public void setFlatProfit(boolean isFlatProfit) {
		this.isFlatProfit = isFlatProfit;
	}

}
