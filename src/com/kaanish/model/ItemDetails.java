package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class ItemDetails implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;
	// private int sampleId;
	// private String productIdList;

	@OneToMany(mappedBy = "itemDetails")
	private List<ItemsForSampleDesignCoseSheet> itemsForSampleDesignCoseSheet;

	// public int getSampleId() {
	// return sampleId;
	// }
	//
	// public void setSampleId(int sampleId) {
	// this.sampleId = sampleId;
	// }
	//
	// public String getProductIdList() {
	// return productIdList;
	// }
	//
	// public void setProductIdList(String productIdList) {
	// this.productIdList = productIdList;
	// }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<ItemsForSampleDesignCoseSheet> getItemsForSampleDesignCoseSheet() {
		return itemsForSampleDesignCoseSheet;
	}

	public void setItemsForSampleDesignCoseSheet(List<ItemsForSampleDesignCoseSheet> itemsForSampleDesignCoseSheet) {
		this.itemsForSampleDesignCoseSheet = itemsForSampleDesignCoseSheet;
	}
}
