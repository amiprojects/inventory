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
public class ApprovalProductDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float quantity;
	private float price;
	private float approvalRetQty;

	@ManyToOne
	@JoinColumn(name = "approvalEntryId")
	private ApprovalEntry approvalEntry;
	private int purchaseProductDetailsId;
	@OneToMany(mappedBy = "approvalProductDetails")
	private List<ApprovalReturnProductDetails> approvalReturnProductDetail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public ApprovalEntry getApprovalEntry() {
		return approvalEntry;
	}

	public void setApprovalEntry(ApprovalEntry approvalEntry) {
		this.approvalEntry = approvalEntry;
	}

	public int getPurchaseProductDetailsId() {
		return purchaseProductDetailsId;
	}

	public void setPurchaseProductDetailsId(int purchaseProductDetailsId) {
		this.purchaseProductDetailsId = purchaseProductDetailsId;
	}

	public List<ApprovalReturnProductDetails> getApprovalReturnProductDetail() {
		return approvalReturnProductDetail;
	}

	public void setApprovalReturnProductDetail(
			List<ApprovalReturnProductDetails> approvalReturnProductDetail) {
		this.approvalReturnProductDetail = approvalReturnProductDetail;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getApprovalRetQty() {
		return approvalRetQty;
	}

	public void setApprovalRetQty(float approvalRetQty) {
		this.approvalRetQty = approvalRetQty;
	}
}
