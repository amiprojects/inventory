package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Purchase_Product_Details {
	@Id
	@GeneratedValue
	private int id;
	private float cost;
	private int remaining_quantity;
	private int quantity;
	private int mrp;
	private int wsp;
	private String attrValue1;
	private String attrValue2;
	private String attrValue3;
	private String attrValue4;
	private String attrValue5;
	private String attrValue6;
	private boolean initialInventory;

	@OneToMany(mappedBy = "purchase_Product_Details")
	private List<SerialNumber> serialNumbers;

	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;

	@ManyToOne
	@JoinColumn(name = "purchaseEntryId")
	private Purchase_Entry purchase_Entry;

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

	public int getMrp() {
		return mrp;
	}

	public void setMrp(int mrp) {
		this.mrp = mrp;
	}

	public int getWsp() {
		return wsp;
	}

	public void setWsp(int wsp) {
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

	public boolean isInitialInventory() {
		return initialInventory;
	}

	public void setInitialInventory(boolean initialInventory) {
		this.initialInventory = initialInventory;
	}

	public List<SerialNumber> getSerialNumbers() {
		return serialNumbers;
	}

	public void setSerialNumbers(List<SerialNumber> serialNumbers) {
		this.serialNumbers = serialNumbers;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public Purchase_Entry getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(Purchase_Entry purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

}
