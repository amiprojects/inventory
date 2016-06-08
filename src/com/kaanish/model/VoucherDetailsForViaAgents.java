package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class VoucherDetailsForViaAgents implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float value;
	@Temporal(TemporalType.DATE)
	private Date voucherDate;
	@Temporal(TemporalType.DATE)
	private Date entryDate;
	private boolean isCredit;

	private int purchaseEntryId;
	private int salesEntryId;

	private int voucherAssignId;
	private int agentId;

	private String userId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getValue() {
		return value;
	}

	public void setValue(float value) {
		this.value = value;
	}

	public Date getVoucherDate() {
		return voucherDate;
	}

	public void setVoucherDate(Date voucherDate) {
		this.voucherDate = voucherDate;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public boolean isCredit() {
		return isCredit;
	}

	public void setCredit(boolean isCredit) {
		this.isCredit = isCredit;
	}

	public int getPurchaseEntryId() {
		return purchaseEntryId;
	}

	public void setPurchaseEntryId(int purchaseEntryId) {
		this.purchaseEntryId = purchaseEntryId;
	}

	public int getSalesEntryId() {
		return salesEntryId;
	}

	public void setSalesEntryId(int salesEntryId) {
		this.salesEntryId = salesEntryId;
	}

	public int getVoucherAssignId() {
		return voucherAssignId;
	}

	public void setVoucherAssignId(int voucherAssignId) {
		this.voucherAssignId = voucherAssignId;
	}

	public int getAgentId() {
		return agentId;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
