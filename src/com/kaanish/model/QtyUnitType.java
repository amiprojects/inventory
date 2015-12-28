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
public class QtyUnitType implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;
	@OneToMany(mappedBy="qtyUnitType")
	private List<QtyUnit> qtyUnits;
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
	public List<QtyUnit> getQtyUnits() {
		return qtyUnits;
	}
	public void setQtyUnits(List<QtyUnit> qtyUnits) {
		this.qtyUnits = qtyUnits;
	}
	@Override
	public String toString() {
		String json;
		json="{\"name\":\""+name+"\",\"id\":\""+id+"\"}";
		return json;
	}
	
}
