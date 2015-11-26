package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class city {

	@Id
	@GeneratedValue
	private int id;
	private String cityName;
	
}
