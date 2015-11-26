package com.kaanish.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Job_cat {

	

	@Id
	@GeneratedValue
	
	private int id;
	private String jobType;
	private String jobName;
}
