package com.kaanish.model;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Cacheable(false)
public class SecurityAnswers implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String answer;
	
	@ManyToOne
	@JoinColumn(name="QueId")
	private SequrityQuestions sequrityQuestions;
	
	@ManyToOne
	@JoinColumn(name="UserId")
	private Users users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SequrityQuestions getSequrityQuestions() {
		return sequrityQuestions;
	}

	public void setSequrityQuestions(SequrityQuestions sequrityQuestions) {
		this.sequrityQuestions = sequrityQuestions;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
