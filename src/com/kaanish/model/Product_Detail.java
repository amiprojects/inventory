package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Product_Detail {

	@Id
	@GeneratedValue
	private int id;

	private String productType;
	private String Name;
	private String Code;
	private boolean isSaleble;
	private boolean isActive;

}
