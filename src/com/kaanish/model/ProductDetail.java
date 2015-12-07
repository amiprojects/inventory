package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class ProductDetail {

	@Id
	@GeneratedValue
	private int id;

	private String productType;
	private String name;
	private String code;
	private String universalCode;
	private boolean isSaleble;
	private boolean isActive;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;	
	@OneToMany(mappedBy="productDetail")
	private List<Purchase_Product_Details> purchase_Product_Details;	
	@OneToOne
	private ReadyGoodsStock readyGoodsStock;
	@OneToOne
	private RawMaterialsStock rawMaterialsStock;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public boolean isSaleble() {
		return isSaleble;
	}

	public void setSaleble(boolean isSaleble) {
		this.isSaleble = isSaleble;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUniversalCode() {
		return universalCode;
	}

	public void setUniversalCode(String universalCode) {
		this.universalCode = universalCode;
	}

	public List<Purchase_Product_Details> getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(List<Purchase_Product_Details> purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	public ReadyGoodsStock getReadyGoodsStock() {
		return readyGoodsStock;
	}

	public void setReadyGoodsStock(ReadyGoodsStock readyGoodsStock) {
		this.readyGoodsStock = readyGoodsStock;
	}

	public RawMaterialsStock getRawMaterialsStock() {
		return rawMaterialsStock;
	}

	public void setRawMaterialsStock(RawMaterialsStock rawMaterialsStock) {
		this.rawMaterialsStock = rawMaterialsStock;
	}

}
