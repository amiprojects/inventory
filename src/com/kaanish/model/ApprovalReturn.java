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
public class ApprovalReturn implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.DATE)
	private Date returnDate;
	private float totalReCost; // grandtotal
	private float roundOff;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	private String referenceApprovalChallan;
	
	// xxxxxxxxxxxxxxxx
	private float retAgentProfitTotal;
	// xxxxxxxxxxxxxxxx

	@OneToMany(mappedBy = "approvalReturn")
	private List<ApprovalReturnProductDetails> approvalReturnProductDetail;
	@ManyToOne
	@JoinColumn(name = "approvalEntryID")
	private ApprovalEntry approvalEntry;
	private String usersId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public float getTotalReCost() {
		return totalReCost;
	}

	public void setTotalReCost(float totalReCost) {
		this.totalReCost = totalReCost;
	}

	public float getRoundOff() {
		return roundOff;
	}

	public void setRoundOff(float roundOff) {
		this.roundOff = roundOff;
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

	public String getReferenceApprovalChallan() {
		return referenceApprovalChallan;
	}

	public void setReferenceApprovalChallan(String referenceApprovalChallan) {
		this.referenceApprovalChallan = referenceApprovalChallan;
	}

	public float getRetAgentProfitTotal() {
		return retAgentProfitTotal;
	}

	public void setRetAgentProfitTotal(float retAgentProfitTotal) {
		this.retAgentProfitTotal = retAgentProfitTotal;
	}

	public List<ApprovalReturnProductDetails> getApprovalReturnProductDetail() {
		return approvalReturnProductDetail;
	}

	public void setApprovalReturnProductDetail(
			List<ApprovalReturnProductDetails> approvalReturnProductDetail) {
		this.approvalReturnProductDetail = approvalReturnProductDetail;
	}

	public ApprovalEntry getApprovalEntry() {
		return approvalEntry;
	}

	public void setApprovalEntry(ApprovalEntry approvalEntry) {
		this.approvalEntry = approvalEntry;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
}
