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
public class SalesProductDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue

	private int id;
	private int quantity;
	private float salesPrice;

	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;

	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/*public float getSalesPrice() {
		return SalesPrice;
	}

	public void setSalesPrice(float salesPrice) {
		SalesPrice = salesPrice;
	}*/

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public float getSalesPrice() {
		return salesPrice;
	}

	public void setSalesPrice(float salesPrice) {
		this.salesPrice = salesPrice;
	}

}
