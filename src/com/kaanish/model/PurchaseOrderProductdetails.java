package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class PurchaseOrderProductdetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	private float cost;
	private int remaining_quantity;
	private int quantity;
	private int totalReturningQty;
	private float mrp;
	private float wsp;
	private String attrValue1;
	private String attrValue2;
	private String attrValue3;
	private String attrValue4;
	private String attrValue5;
	private String attrValue6;
	private String lotNumber;

	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;

	@OneToMany(mappedBy = "purchaseOrderProductdetails", cascade = CascadeType.ALL)
	private List<SerialNumber> serialNumbers;

	@ManyToOne
	@JoinColumn(name = "purchase_Product_DetailsId")
	private Purchase_Product_Details purchase_Product_Details;

	@ManyToOne
	@JoinColumn(name = "purchaseOrderEntryId")
	private PurchaseOrderEntry purchaseOrderEntry;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public int getRemaining_quantity() {
		return remaining_quantity;
	}

	public void setRemaining_quantity(int remaining_quantity) {
		this.remaining_quantity = remaining_quantity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalReturningQty() {
		return totalReturningQty;
	}

	public void setTotalReturningQty(int totalReturningQty) {
		this.totalReturningQty = totalReturningQty;
	}

	public float getMrp() {
		return mrp;
	}

	public void setMrp(float mrp) {
		this.mrp = mrp;
	}

	public float getWsp() {
		return wsp;
	}

	public void setWsp(float wsp) {
		this.wsp = wsp;
	}

	public String getAttrValue1() {
		return attrValue1;
	}

	public void setAttrValue1(String attrValue1) {
		this.attrValue1 = attrValue1;
	}

	public String getAttrValue2() {
		return attrValue2;
	}

	public void setAttrValue2(String attrValue2) {
		this.attrValue2 = attrValue2;
	}

	public String getAttrValue3() {
		return attrValue3;
	}

	public void setAttrValue3(String attrValue3) {
		this.attrValue3 = attrValue3;
	}

	public String getAttrValue4() {
		return attrValue4;
	}

	public void setAttrValue4(String attrValue4) {
		this.attrValue4 = attrValue4;
	}

	public String getAttrValue5() {
		return attrValue5;
	}

	public void setAttrValue5(String attrValue5) {
		this.attrValue5 = attrValue5;
	}

	public String getAttrValue6() {
		return attrValue6;
	}

	public void setAttrValue6(String attrValue6) {
		this.attrValue6 = attrValue6;
	}

	public String getLotNumber() {
		return lotNumber;
	}

	public void setLotNumber(String lotNumber) {
		this.lotNumber = lotNumber;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public List<SerialNumber> getSerialNumbers() {
		return serialNumbers;
	}

	public void setSerialNumbers(List<SerialNumber> serialNumbers) {
		this.serialNumbers = serialNumbers;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	public PurchaseOrderEntry getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(PurchaseOrderEntry purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

	
	
	
	
}
