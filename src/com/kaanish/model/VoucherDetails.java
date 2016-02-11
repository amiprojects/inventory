package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class VoucherDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private float value;
	private float totalDebitNote;
	private float totalCreditNote;

	@Temporal(TemporalType.TIMESTAMP)
	private Date voucherDate;

	private boolean isCredit;

	@OneToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;

	@OneToOne
	@JoinColumn(name = "salesReturnId")
	private SalesReturn salesReturn;

	@OneToOne
	@JoinColumn(name = "purchase_EntryId")
	private Purchase_Entry purchase_Entry;
	
	@OneToOne
	@JoinColumn(name = "purchaseOrderEntryId")
	private PurchaseOrderEntry purchaseOrderEntry;

	@OneToOne
	@JoinColumn(name = "purchaseReturnId")
	private PurchaseReturn purchaseReturn;

	@ManyToOne
	@JoinColumn(name = "voucherAssignId")
	private VoucherAssign voucherAssign;

	@ManyToOne
	@JoinColumn(name = "usersId")
	private Users users;

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

	public boolean isCredit() {
		return isCredit;
	}

	public void setCredit(boolean isCredit) {
		this.isCredit = isCredit;
	}

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public SalesReturn getSalesReturn() {
		return salesReturn;
	}

	public void setSalesReturn(SalesReturn salesReturn) {
		this.salesReturn = salesReturn;
	}

	public Purchase_Entry getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(Purchase_Entry purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

	public PurchaseReturn getPurchaseReturn() {
		return purchaseReturn;
	}

	public void setPurchaseReturn(PurchaseReturn purchaseReturn) {
		this.purchaseReturn = purchaseReturn;
	}

	public VoucherAssign getVoucherAssign() {
		return voucherAssign;
	}

	public void setVoucherAssign(VoucherAssign voucherAssign) {
		this.voucherAssign = voucherAssign;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public float getTotalDebitNote() {
		return totalDebitNote;
	}

	public void setTotalDebitNote(float totalDebitNote) {
		this.totalDebitNote = totalDebitNote;
	}

	public float getTotalCreditNote() {
		return totalCreditNote;
	}

	public void setTotalCreditNote(float totalCreditNote) {
		this.totalCreditNote = totalCreditNote;
	}

	public PurchaseOrderEntry getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(PurchaseOrderEntry purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

}
