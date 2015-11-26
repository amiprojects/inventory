package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Qty_unit_type {
	@Id
	@GeneratedValue
	private int id;
	private String name;
}
