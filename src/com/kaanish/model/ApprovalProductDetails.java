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
	private float salesPrice;
	private float salesReQty;

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

	public float getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(float salesPrice) {
		this.salesPrice = salesPrice;
	}

	public float getSalesReQty() {
		return salesReQty;
	}

	public void setSalesReQty(float salesReQty) {
		this.salesReQty = salesReQty;
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
}
