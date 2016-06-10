package com.kaanish.model;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Cacheable(false)
public class UniqueName {
	@Id
	@GeneratedValue
	private int id;
	private String uniqueNm;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUniqueNm() {
		return uniqueNm;
	}

	public void setUniqueNm(String uniqueNm) {
		this.uniqueNm = uniqueNm;
	}

}
