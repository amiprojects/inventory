package com.kaanish.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class Ejb {
	@PersistenceContext
	private EntityManager em;
}
