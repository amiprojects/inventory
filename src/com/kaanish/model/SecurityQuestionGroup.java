package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class SecurityQuestionGroup implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;

	@OneToMany(mappedBy = "securityQuestionGroup")
	private
	List<SequrityQuestions> sequrityQuestions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SequrityQuestions> getSequrityQuestions() {
		return sequrityQuestions;
	}

	public void setSequrityQuestions(List<SequrityQuestions> sequrityQuestions) {
		this.sequrityQuestions = sequrityQuestions;
	}
}
