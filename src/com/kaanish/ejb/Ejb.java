package com.kaanish.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;

@Stateless
public class Ejb {
	@PersistenceContext
	private EntityManager em;

	/************************ For Tax ****************************/
	public void setTax(Tax tax) {
		em.persist(tax);
	}

	public void setTaxTYpeGroup(Tax_Type_Group tax_Type_Group) {
		em.persist(tax_Type_Group);
	}

	public List<Tax> getAllTax() {
		TypedQuery<Tax> q = em.createQuery("select c from Tax c", Tax.class);
		return q.getResultList();
	}

	public List<Tax_Type_Group> getAllTax_Type_Groups() {
		TypedQuery<Tax_Type_Group> q = em.createQuery(
				"select s from Tax_Type_Group s", Tax_Type_Group.class);
		return q.getResultList();
	}

	public void removeTax(Tax tax) {
		em.remove(tax);
	}

	public void removeTaxTYpeGroup(Tax_Type_Group tax_Type_Group) {
		em.remove(tax_Type_Group);
	}
}
