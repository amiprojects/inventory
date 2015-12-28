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
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class ProductDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;

	private String productType;
	private String name;
	private String code;
	private String universalCode;
	private boolean isSaleble;
	private boolean isActive;
	private String description;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;
	@OneToMany(mappedBy = "productDetail")
	private List<Purchase_Product_Details> purchase_Product_Details;
	@OneToMany(mappedBy = "productDetail")
	private List<SalesProductDetails> salesProductDetails;
	@OneToOne
	private ReadyGoodsStock readyGoodsStock;
	@OneToOne
	private RawMaterialsStock rawMaterialsStock;

	@ManyToOne
	@JoinColumn(name = "qtyUnitId")
	private QtyUnit qtyUnit;

	@OneToMany(mappedBy = "productDetail", cascade = CascadeType.ALL)
	private List<ProductImage> productImages;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public QtyUnit getQtyUnit() {
		return qtyUnit;
	}

	public void setQtyUnit(QtyUnit qtyUnit) {
		this.qtyUnit = qtyUnit;
	}

	/*
	 * @Override public String toString() { return
	 * "{\"aaaa\":\""+description+"\"}"; }
	 */

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\"," + "\"name\":\"" + name + "\"," + "\"code\":\"" + code + "\","
				+ "\"universalCode\":\"" + universalCode + "\"," + "\"isSaleble\":\"" + isSaleble + "\","
				+ "\"isActive\":\"" + isActive + "\"," + "\"description\":\"" + description + "\"," + "\"qtyUnit\":\""
				+ qtyUnit.getName() + "\"," + "\"category\":\"" + category.getName() + "\"," + "\"attrNmae1\":\""
				+ category.getAttrNmae1() + "\"," + "\"attrNmae2\":\"" + category.getAttrNmae2() + "\","
				+ "\"attrNmae3\":\"" + category.getAttrNmae3() + "\"," + "\"attrNmae4\":\"" + category.getAttrNmae4()
				+ "\"," + "\"attrNmae5\":\"" + category.getAttrNmae5() + "\"," + "\"attrNmae6\":\""
				+ category.getAttrNmae6() + "\",\"subDepartment\":\"" + category.getSubDepartment().getName()
				+ "\",\"categoryId\":\"" + category.getId() + "\",\"Department\":\""
				+ category.getSubDepartment().getDepartment().getName() + "\"}";
	}

	public List<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImage> productImages) {
		this.productImages = productImages;
	}
}
