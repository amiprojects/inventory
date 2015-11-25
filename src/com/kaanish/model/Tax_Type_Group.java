package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Tax_Type_Group {
	@Id
	private String name;
	private String list_of_tax;
}
