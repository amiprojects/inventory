package com.kaanish.ejb;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import com.kaanish.model.AccountDetails;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.Country;
import com.kaanish.model.Department;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;

@Stateless
public class Ejb {
	@PersistenceContext
	private EntityManager em;
	@Inject
	private HttpSession httpSession;

	/*************************** for login purpose *****************/
	public boolean getCheckLogin(String usr, String pwd) {

		TypedQuery<Users> q = em.createQuery("select c from Users c where (c.userId=:user AND c.password=:pwd)",
				Users.class);
		q.setParameter("user", usr);
		q.setParameter("pwd", pwd);
		return q.getResultList().size() > 0;
	}
	
	public boolean getCheckPassword(String pwd){
		String usr;
		TypedQuery<Users> q = em.createQuery("select c from Users c where (c.userId=:user AND c.password=:pwd)",
				Users.class);
		usr=httpSession.getAttribute("user").toString();
		q.setParameter("user", usr);
		q.setParameter("pwd", pwd);
		return q.getResultList().size() > 0;
	}

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
		TypedQuery<Tax_Type_Group> q = em.createQuery("select s from Tax_Type_Group s", Tax_Type_Group.class);
		return q.getResultList();
	}

	public void removeTax(String taxName) {
		em.remove(getTaxById(taxName));
	}

	public void removeTaxTYpeGroup(Tax_Type_Group tax_Type_Group) {
		em.remove(tax_Type_Group);
	}

	public Tax getTaxById(String nm) {
		return em.find(Tax.class, nm);
	}

	public Tax_Type_Group getTax_Type_GroupById(String name) {
		return em.find(Tax_Type_Group.class, name);
	}

	/******************** for vendor *******************************/
	public void setVendor(Vendor vendor) {
		em.persist(vendor);
	}

	public Vendor getVendorById(int id) {
		return em.find(Vendor.class, id);
	}

	public void deleteVendorById(int id) {
		em.remove(getVendorById(id));
	}

	public void updateVendor(Vendor vendor) {
		em.merge(vendor);
	}

	public List<Vendor> getAllVendors() {
		TypedQuery<Vendor> q = em.createQuery("select c from Vendor c", Vendor.class);
		return q.getResultList();
	}

	/******************** for vendor type *******************************/
	public void setVendorType(VendorType vendorType) {
		em.persist(vendorType);
	}

	public VendorType getVendorTypeById(int id) {
		return em.find(VendorType.class, id);
	}

	public void deleteVendorTypeById(int id) {
		em.remove(getVendorTypeById(id));
	}

	public void updateVendorType(VendorType vendorType) {
		em.merge(vendorType);
	}

	public List<VendorType> getAllVendorType() {
		TypedQuery<VendorType> q = em.createQuery("select c from VendorType c", VendorType.class);
		return q.getResultList();
	}
	/******************* foe account details***************************/
	public void setAccountDetails(AccountDetails accountDetails){
		em.persist(accountDetails);
	}

	/******************** for City *******************************/
	public void setCity(City city) {
		em.persist(city);
	}

	public City getCityById(int id) {
		return em.find(City.class, id);
	}

	public void deleteCityById(int id) {
		em.remove(getCityById(id));
	}

	public void updateCity(City city) {
		em.merge(city);
	}

	public List<City> getAllCity() {
		TypedQuery<City> q = em.createQuery("select c from City c", City.class);
		return q.getResultList();
	}

	public List<City> getCityByName(String name) {
		TypedQuery<City> q = em.createQuery("select c from City c where c.cityName like :nm", City.class);
		q.setParameter("nm", "%" + name + "%");
		return q.getResultList();
	}

	/******************** for State *******************************/
	public void setState(State state) {
		em.persist(state);
	}

	public State getStateById(int id) {
		return em.find(State.class, id);
	}

	public void deleteCityStateById(int id) {
		em.remove(getStateById(id));
	}

	public void updateState(State state) {
		em.merge(state);
	}

	public List<State> getAllState() {
		TypedQuery<State> q = em.createQuery("select c from State c", State.class);
		return q.getResultList();
	}

	public List<State> getStateByName(String name) {
		TypedQuery<State> q = em.createQuery("select c from State c where c.stateName like :nm", State.class);
		q.setParameter("nm", "%" + name + "%");
		return q.getResultList();

	}

	public List<State> getAllStatesByCountryId(int id) {
		TypedQuery<State> q = em.createQuery("select c from State c where c.country.id=:Id", State.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/******************** for Country *******************************/
	public void setCountry(Country country) {
		em.persist(country);
	}

	public Country getCountryById(int id) {
		return em.find(Country.class, id);
	}

	public void deleteCountryById(int id) {
		em.remove(getCountryById(id));
	}

	public void updateCountry(Country country) {
		em.merge(country);
	}

	public List<Country> getAllCountry() {
		TypedQuery<Country> q = em.createQuery("select c from Country c", Country.class);
		return q.getResultList();
	}

	public List<Country> getCountryByName(String name) {
		TypedQuery<Country> q = em.createQuery("select c from Country c where UPPER(c.countryName) like :nm",
				Country.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	/******************************
	 * for Department
	 *********************************/
	public void setDepartment(Department department) {
		em.persist(department);
	}

	public Department getDepartmentById(int id) {
		return em.find(Department.class, id);
	}

	public void deleteDepartmentById(int id) {
		em.remove(getDepartmentById(id));
	}

	public void updateDepartment(Department department) {
		em.merge(department);
	}

	public List<Department> getAllDepartments() {
		TypedQuery<Department> q = em.createQuery("select s from Department s", Department.class);
		return q.getResultList();
	}

	/******************************
	 * for Sub Department
	 *********************************/
	public void setSubDepartment(SubDepartment subDepartment) {
		em.persist(subDepartment);
	}

	public SubDepartment getSubDepartmentById(int id) {
		return em.find(SubDepartment.class, id);
	}

	public void deleteSubDepartmentById(int id) {
		em.remove(getSubDepartmentById(id));
	}

	public void updateSubDepartment(SubDepartment subDepartment) {
		em.merge(subDepartment);
	}

	public List<SubDepartment> getAllSubDepartments() {
		TypedQuery<SubDepartment> q = em.createQuery("select s from SubDepartment s", SubDepartment.class);
		return q.getResultList();
	}

	public List<SubDepartment> getAllSubDepartmentsByDepartmentId(int id) {
		TypedQuery<SubDepartment> q = em.createQuery("select s from SubDepartment s where s.department.id=:Id",
				SubDepartment.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/******************************
	 * for Category
	 *********************************/
	public void setCategory(Category category) {
		em.persist(category);
	}

	public Category getCategoryById(int id) {
		return em.find(Category.class, id);
	}

	public void deleteCategoryById(int id) {
		em.remove(getCategoryById(id));
	}

	public void updateCategory(Category category) {
		em.merge(category);
	}

	public List<Category> getAllCategory() {
		TypedQuery<Category> q = em.createQuery("select s from Category s", Category.class);
		return q.getResultList();
	}

	public List<Category> getAllCategoryBySubDepartmentId(int id) {
		TypedQuery<Category> q = em.createQuery("select s from Category s where s.subDepartment.id=:Id",
				Category.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/******************************
	 * for Product
	 *********************************/
	public void setProductDetail(ProductDetail productDetail) {
		em.persist(productDetail);
	}

	public ProductDetail getProductDetailById(int id) {
		return em.find(ProductDetail.class, id);
	}

	public void deleteProductDetailById(int id) {
		em.remove(getProductDetailById(id));
	}

	public void updateProductDetail(ProductDetail productDetail) {
		em.merge(productDetail);
	}

	public List<ProductDetail> getAllProductDetail() {
		TypedQuery<ProductDetail> q = em.createQuery("select c from ProductDetail c", ProductDetail.class);
		return q.getResultList();
	}

	public List<ProductDetail> getAllProductDetailByCategoryId(int id) {
		TypedQuery<ProductDetail> q = em.createQuery("select s from ProductDetail s where s.category.id=:Id",
				ProductDetail.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

}
