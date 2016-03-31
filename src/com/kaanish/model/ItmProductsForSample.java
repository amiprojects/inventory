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
public class ItmProductsForSample implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private int productId;
	private int productForDesignCostSheetId;
	private int sampleId;

	@ManyToOne
	@JoinColumn(name = "itemId")
	private ItemDetails itemDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductForDesignCostSheetId() {
		return productForDesignCostSheetId;
	}

	public void setProductForDesignCostSheetId(int productForDesignCostSheetId) {
		this.productForDesignCostSheetId = productForDesignCostSheetId;
	}

	public int getSampleId() {
		return sampleId;
	}

	public void setSampleId(int sampleId) {
		this.sampleId = sampleId;
	}

	public ItemDetails getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(ItemDetails itemDetails) {
		this.itemDetails = itemDetails;
	}
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"itemName\":\"" + itemDetails.getName() + "\"}";
	}

}
