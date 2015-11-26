package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Vendor_Type {

	@Id
	@GeneratedValue
	private int id;
	private String type;
}
