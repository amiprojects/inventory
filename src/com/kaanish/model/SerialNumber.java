package com.kaanish.model;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Cacheable(false)
public class SerialNumber implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String serialNumber;
	private String barcode;
	private String lotNo;

	@ManyToOne
	@JoinColumn(name = "purchaseProductDetailsId")
	private Purchase_Product_Details purchase_Product_Details;
	
	@ManyToOne
	@JoinColumn(name = "purchaseOrderProductdetailsId")
	private PurchaseOrderProductdetails purchaseOrderProductdetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getLotNo() {
		return lotNo;
	}

	public void setLotNo(String lotNo) {
		this.lotNo = lotNo;
	}

	public PurchaseOrderProductdetails getPurchaseOrderProductdetails() {
		return purchaseOrderProductdetails;
	}

	public void setPurchaseOrderProductdetails(PurchaseOrderProductdetails purchaseOrderProductdetails) {
		this.purchaseOrderProductdetails = purchaseOrderProductdetails;
	}

}
