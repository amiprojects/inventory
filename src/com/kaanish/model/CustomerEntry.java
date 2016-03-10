package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class CustomerEntry implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String mobile;
	private String vat_cst_no;
	@Column(length = 800)
	private String address;
	private String city;

	@OneToMany(mappedBy = "customer")
	private List<SalesEntry> salesEntries;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "customerEntry")
	private VoucherAssign voucherAssign;

	public float getTotSale() {
		float totSale = 0F;
		float totPur = 0F;
		float totRet = 0F;
		for (SalesEntry salesEntry : salesEntries) {
			for (SalesProductDetails spd : salesEntry.getSalesProductDetails()) {
				totPur = totPur + spd.getQuantity() * spd.getSalesPrice();
				totRet = totRet + spd.getSalesReQty() * spd.getSalesPrice();
			}
		}
		totSale = totSale + totPur - totRet;
		return totSale;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<SalesEntry> getSalesEntries() {
		return salesEntries;
	}

	public void setSalesEntries(List<SalesEntry> salesEntries) {
		this.salesEntries = salesEntries;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVat_cst_no() {
		return vat_cst_no;
	}

	public void setVat_cst_no(String vat_cst_no) {
		this.vat_cst_no = vat_cst_no;
	}

	public VoucherAssign getVoucherAssign() {
		return voucherAssign;
	}

	public void setVoucherAssign(VoucherAssign voucherAssign) {
		this.voucherAssign = voucherAssign;
	}

	@Override
	public String toString() {
		if (voucherAssign != null) {
			if (voucherAssign.getVoucherDetails().size() != 0) {
				return "{\"id\":\""
						+ id
						+ "\", "
						+ "\"currentDebitNote\":\""
						+ voucherAssign
								.getVoucherDetails()
								.get(voucherAssign.getVoucherDetails().size() - 1)
								.getTotalDebitNote() + "\","
						+ "\"vat_cst_no\":\"" + vat_cst_no + "\","
						+ "\"address\":\"" + address + "\"," + "\"city\":\""
						+ city + "\"," + "\"mobile\":\"" + mobile
						+ "\", \"name\":\"" + name + "\"}";
			} else {
				return "{\"id\":\"" + id + "\"," + "\"vat_cst_no\":\""
						+ vat_cst_no + "\"," + "\"address\":\"" + address
						+ "\"," + "\"city\":\"" + city + "\","
						+ "\"mobile\":\"" + mobile + "\", \"name\":\"" + name
						+ "\"}";
			}
		} else {
			return "{\"id\":\"" + id + "\"," + "\"vat_cst_no\":\"" + vat_cst_no
					+ "\"," + "\"address\":\"" + address + "\","
					+ "\"city\":\"" + city + "\"," + "\"mobile\":\"" + mobile
					+ "\", \"name\":\"" + name + "\"}";
		}
	}
}
