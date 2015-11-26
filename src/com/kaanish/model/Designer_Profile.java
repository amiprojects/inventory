package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Designer_Profile {

	
	@Id
	@GeneratedValue
	
	private int id;
	private String name;
	private String address;
    private String email;
    private int mobNo;
    

}
