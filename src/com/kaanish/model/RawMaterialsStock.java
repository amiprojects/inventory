package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class RawMaterialsStock {

	@Id
	private int id;
	private int remainingQty;
	@OneToOne@JoinColumn(name="productId")
	private ProductDetail productDetail;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRemainingQty() {
		return remainingQty;
	}
	public void setRemainingQty(int remainingQty) {
		this.remainingQty = remainingQty;
	}
	public ProductDetail getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}
	
	
}
