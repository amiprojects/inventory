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
public class ItmProductsForSampleDesignCostSheet implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private int productId;
	private int productForDesignCostSheetId;

	@ManyToOne
	@JoinColumn(name = "itemsForSampleDesignCoseSheetId")
	private ItemsForSampleDesignCoseSheet itemsForSampleDesignCoseSheet;

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

	public ItemsForSampleDesignCoseSheet getItemsForSampleDesignCoseSheet() {
		return itemsForSampleDesignCoseSheet;
	}

	public void setItemsForSampleDesignCoseSheet(
			ItemsForSampleDesignCoseSheet itemsForSampleDesignCoseSheet) {
		this.itemsForSampleDesignCoseSheet = itemsForSampleDesignCoseSheet;
	}	

}
