package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
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
	
	@OneToMany(mappedBy = "voucherAssign")
	private List<VoucherDetails> voucherDetails;
	
	@OneToOne
	@JoinColumn(name = "customerEntryId")
	private CustomerEntry customerEntry;
	
	@OneToOne
	@JoinColumn(name = "vendorId")
	private Vendor vendor;
}
