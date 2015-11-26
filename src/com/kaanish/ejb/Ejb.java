package com.kaanish.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.kaanish.model.Category;
import com.kaanish.model.Department;
import com.kaanish.model.SubDepartment;
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

	public void removeTax(String taxName) {
		em.remove(getTaxById(taxName));
	}

	public void removeTaxTYpeGroup(Tax_Type_Group tax_Type_Group) {
		em.remove(tax_Type_Group);
	}
	public Tax getTaxById(String nm){
		return em.find(Tax.class, nm);
	}
	public Tax_Type_Group getTax_Type_GroupById(String name){
		return em.find(Tax_Type_Group.class, name);
	}
	
	/******************************for Department*********************************/
	public void setDepartment(Department department){
		em.persist(department);
	}
	public Department getDepartmentById(int id){
		return em.find(Department.class, id);
	}
	public void deleteDepartmentById(int id){
		em.remove(getDepartmentById(id));
	}
	public void updateDepartment(Department department){
		em.merge(department);
	}
	public List<Department> getAllDepartment() {
		TypedQuery<Department> q=em.createQuery("select s from Department s", Department.class);
		return q.getResultList();
	}
	/******************************for Department*********************************/
	public void setSubDepartment(SubDepartment subDepartment){
		em.persist(subDepartment);
	}
	public SubDepartment getSubDepartmentById(int id){
		return em.find(SubDepartment.class, id);
	}
	public void deleteSubDepartmentById(int id){
		em.remove(getSubDepartmentById(id));
	}
	public void updateSubDepartment(SubDepartment subDepartment){
		em.merge(subDepartment);
	}
	public List<SubDepartment> getAllSubDepartment() {
		TypedQuery<SubDepartment> q=em.createQuery("select s from SubDepartment s", SubDepartment.class);
		return q.getResultList();
	}
	/******************************for Department*********************************/
	public void setCategory(Category category){
		em.persist(category);
	}
	public Category getCategoryById(int id){
		return em.find(Category.class, id);
	}
	public void deleteCategoryById(int id){
		em.remove(getCategoryById(id));
	}
	public void updateCategory(Category category){
		em.merge(category);
	}
	public List<Category> getAllCategory() {
		TypedQuery<Category> q=em.createQuery("select s from Category s", Category.class);
		return q.getResultList();
	}
	
}
