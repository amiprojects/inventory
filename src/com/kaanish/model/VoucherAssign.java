package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class VoucherAssign implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private String voucherDetailsNumber;

	@OneToMany(mappedBy = "voucherAssign",cascade=CascadeType.ALL)
	private List<VoucherDetails> voucherDetails;

	@OneToOne
	@JoinColumn(name = "customerEntryId")
	private CustomerEntry customerEntry;

	@OneToOne
	@JoinColumn(name = "vendorId")
	private Vendor vendor;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVoucherDetailsNumber() {
		return voucherDetailsNumber;
	}

	public void setVoucherDetailsNumber(String voucherDetailsNumber) {
		this.voucherDetailsNumber = voucherDetailsNumber;
	}

	public List<VoucherDetails> getVoucherDetails() {
		return voucherDetails;
	}

	public void setVoucherDetails(List<VoucherDetails> voucherDetails) {
		this.voucherDetails = voucherDetails;
	}

	public CustomerEntry getCustomerEntry() {
		return customerEntry;
	}

	public void setCustomerEntry(CustomerEntry customerEntry) {
		this.customerEntry = customerEntry;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

}
