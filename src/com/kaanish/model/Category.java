package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Category {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private int subDepID;
	private String attrNmae1;
	private String attrNmae2;
	private String attrNmae3;
	private String attrNmae4;
	private String attrNmae5;
	private String attrNmae6;
}