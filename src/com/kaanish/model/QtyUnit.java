package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class QtyUnit {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String abbreviation;
	private String description;

	@ManyToOne
	@JoinColumn(name = "qtyUnitTypeId")
	private QtyUnitType qtyUnitType;

	@OneToMany(mappedBy = "qtyUnitId2")
	private List<QtyUnitConversion> qtyUnitConversions2;
	@OneToMany(mappedBy = "qtyUnitId1")
	private List<QtyUnitConversion> qtyUnitConversions1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public QtyUnitType getQtyUnitType() {
		return qtyUnitType;
	}

	public void setQtyUnitType(QtyUnitType qtyUnitType) {
		this.qtyUnitType = qtyUnitType;
	}

	public List<QtyUnitConversion> getQtyUnitConversions2() {
		return qtyUnitConversions2;
	}

	public void setQtyUnitConversions2(List<QtyUnitConversion> qtyUnitConversions2) {
		this.qtyUnitConversions2 = qtyUnitConversions2;
	}

	public List<QtyUnitConversion> getQtyUnitConversions1() {
		return qtyUnitConversions1;
	}

	public void setQtyUnitConversions1(List<QtyUnitConversion> qtyUnitConversions1) {
		this.qtyUnitConversions1 = qtyUnitConversions1;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
