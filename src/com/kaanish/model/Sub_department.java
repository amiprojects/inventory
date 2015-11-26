package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Sub_department {
	@Id
	@GeneratedValue
	private int id;
	private String name;
}
