package com.kaanish.model;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
@Cacheable(false)
public class DesignImage implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id@GeneratedValue
	private int id;
	@Lob
	private byte[] image;

	@ManyToOne
	@JoinColumn(name = "sampleDeasignId")
	private SampleDesignCostSheet designCostSheet;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public SampleDesignCostSheet getDesignCostSheet() {
		return designCostSheet;
	}

	public void setDesignCostSheet(SampleDesignCostSheet designCostSheet) {
		this.designCostSheet = designCostSheet;
	}

}
