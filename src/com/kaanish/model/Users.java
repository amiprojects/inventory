package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Users {
	@Id
	@GeneratedValue
	private int user_id;

	private String name;
	private String ph;
}
