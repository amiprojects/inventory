package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class SequrityQuestions implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String question;
	
	@ManyToOne
	@JoinColumn(name="GroupId")
	private SecurityQuestionGroup securityQuestionGroup;
	
	@OneToMany(mappedBy="sequrityQuestions")
	private
	List<SecurityAnswers> securityAnswers;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public SecurityQuestionGroup getSecurityQuestionGroup() {
		return securityQuestionGroup;
	}

	public void setSecurityQuestionGroup(SecurityQuestionGroup securityQuestionGroup) {
		this.securityQuestionGroup = securityQuestionGroup;
	}

	public List<SecurityAnswers> getSecurityAnswers() {
		return securityAnswers;
	}

	public void setSecurityAnswers(List<SecurityAnswers> securityAnswers) {
		this.securityAnswers = securityAnswers;
	}
	
	
}
