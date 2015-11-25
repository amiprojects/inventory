package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Tax {
	@Id
	private String name;
	private int value;
}
