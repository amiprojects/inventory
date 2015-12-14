package com.kaanish.ejb;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import com.kaanish.model.AccountDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.Country;
import com.kaanish.model.Department;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SerialNumber;
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

	public Date getCurrentDateTime() {
		return new Date();
	}

	public String getCurrentFinancialYear() {
		LocalDateTime dt = LocalDateTime.now();
		if (dt.getMonthValue() < 4) {
			return (dt.getYear() - 1) + "-" + dt.getYear();
		} else {
			return dt.getYear() + "-" + (dt.getYear() + 1);
		}
	}

	/***************** for user **********************/
	public void setUser(Users users) {
		em.merge(users);
	}

	public Users getUserById(String id) {
		return em.find(Users.class, id);
	}

	/************** for qty unit type ***************/
	public void setQtyUnitType(QtyUnitType qtyUnitType) {
		em.persist(qtyUnitType);
	}

	public QtyUnitType getQtyUnitTypeById(int id) {
		return em.find(QtyUnitType.class, id);
	}

	public List<QtyUnitType> getAllQtyUnitTypes() {
		TypedQuery<QtyUnitType> q = em.createQuery(
				"select c from QtyUnitType c", QtyUnitType.class);
		return q.getResultList();
	}

	/************** for payment status ***************/
	public void setPaymentStatus(PaymentStatus paymentStatus) {
		em.persist(paymentStatus);
	}

	public PaymentStatus getPaymentStatusByStatus(String status) {
		TypedQuery<PaymentStatus> q = em.createQuery(
				"select c from PaymentStatus c Where c.status=:status",
				PaymentStatus.class);
		q.setParameter("status", status);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public List<PaymentStatus> getAllPaymentStatus() {
		TypedQuery<PaymentStatus> q = em.createQuery(
				"select c from PaymentStatus c", PaymentStatus.class);
		return q.getResultList();
	}

	/************** for payment type ***************/
	public void setPaymentType(PaymentType paymentType) {
		em.persist(paymentType);
	}

	public PaymentType getPaymentTypeByType(String type) {
		TypedQuery<PaymentType> q = em.createQuery(
				"select c from PaymentType c Where c.Type=:type",
				PaymentType.class);
		q.setParameter("type", type);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public List<PaymentType> getAllPaymentType() {
		TypedQuery<PaymentType> q = em.createQuery(
				"select c from PaymentType c", PaymentType.class);
		return q.getResultList();
	}

	/************** for payment details ***************/
	public void setPaymentDetails(PaymentDetails paymentDetails) {
		em.persist(paymentDetails);
	}

	public PaymentDetails getPaymentDetailsById(int id) {
		return em.find(PaymentDetails.class, id);
	}

	public List<PaymentDetails> getAllPaymentDetails() {
		TypedQuery<PaymentDetails> q = em.createQuery(
				"select c from PaymentDetails c", PaymentDetails.class);
		return q.getResultList();
	}

	/************** for UOM type ***************/
	public void setQtyUnit(QtyUnit qtyUnit) {
		em.persist(qtyUnit);
	}

	public QtyUnit getQtyUnitById(int id) {
		return em.find(QtyUnit.class, id);
	}

	public List<QtyUnit> getAllQtyUnit() {
		TypedQuery<QtyUnit> q = em.createQuery("select c from QtyUnit c",
				QtyUnit.class);
		return q.getResultList();
	}

	public List<QtyUnit> getAllQtyUnitByType(int id) {
		TypedQuery<QtyUnit> q = em.createQuery(
				"select c from QtyUnit c where c.qtyUnitType.id=:id",
				QtyUnit.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<QtyUnit> getAllOthersQtyUnitForConversion(int id) {
		QtyUnit qu = new QtyUnit();
		qu = this.getQtyUnitById(id);
		TypedQuery<QtyUnit> q = em
				.createQuery(
						"select c from QtyUnit c where c.qtyUnitType.id=:id AND c.id<>:oid",
						QtyUnit.class);
		q.setParameter("id", qu.getQtyUnitType().getId());
		q.setParameter("oid", id);

		TypedQuery<QtyUnitConversion> q1 = em.createQuery(
				"select s from QtyUnitConversion s where s.qtyUnitId1.id=:id1",
				QtyUnitConversion.class);
		q1.setParameter("id1", id);

		List<QtyUnit> lst1 = new ArrayList<>();
		for (QtyUnitConversion quc : q1.getResultList()) {
			lst1.add(quc.getQtyUnitId2());
		}

		List<QtyUnit> lst = new ArrayList<>();
		for (QtyUnit qtyu : q.getResultList()) {
			if (!lst1.contains(qtyu)) {
				lst.add(qtyu);
			}
		}
		return lst;
	}

	/******************** qty Unit conversion ******************/
	public void setQtyUnitConversion(QtyUnitConversion quc) {
		em.persist(quc);
	}

	public void updateQtyUnitConversion(QtyUnitConversion quc) {
		em.merge(quc);
	}

	public QtyUnitConversion getQtyUnitConversionById(int id) {
		return em.find(QtyUnitConversion.class, id);
	}

	public List<QtyUnitConversion> getAllQtyUnitConversionByQtyUnitId(int id) {
		TypedQuery<QtyUnitConversion> q = em.createQuery(
				"select c from QtyUnitConversion c where c.qtyUnitId1.id=:id",
				QtyUnitConversion.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public QtyUnitConversion getQtyUnitConversionById(
			QtyUnitConversionPK qtyUnitConversionPK) {

		return em.find(QtyUnitConversion.class, qtyUnitConversionPK);
	}

	/******************** qty Unit conversion PK **********************/
	public void setQtyUnitConversionPK(QtyUnitConversionPK qucPK) {
		em.merge(qucPK);
	}

	/*************************** for login purpose *****************/
	public boolean getCheckLogin(String usr, String pwd) {

		TypedQuery<Users> q = em
				.createQuery(
						"select c from Users c where (c.userId=:user AND c.password=:pwd)",
						Users.class);
		q.setParameter("user", usr);
		q.setParameter("pwd", pwd);
		return q.getResultList().size() > 0;
	}

	public boolean getCheckPassword(String pwd) {
		String usr;
		TypedQuery<Users> q = em
				.createQuery(
						"select c from Users c where (c.userId=:user AND c.password=:pwd)",
						Users.class);
		usr = httpSession.getAttribute("user").toString();
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

	public List<Tax> getAllTaxByTaxTypeGroupId(int id) {
		Tax_Type_Group tg = getTax_Type_GroupById(id);
		List<Tax> taxLst = new ArrayList<>();
		for (Tax tax : getAllTax()) {
			if (tg.getTaxes().contains(tax)) {
				tax.setAvailable(true);
			} else {
				tax.setAvailable(false);
			}
			taxLst.add(tax);
		}
		return taxLst;
	}

	public List<Tax_Type_Group> getAllTax_Type_Groups() {
		TypedQuery<Tax_Type_Group> q = em.createQuery(
				"select s from Tax_Type_Group s", Tax_Type_Group.class);
		return q.getResultList();
	}

	public void deleteTax(int id) {
		em.remove(getTaxById(id));
	}

	public void deleteTaxTYpeGroupById(int id) {
		em.remove(getTax_Type_GroupById(id));
	}

	public Tax getTaxById(int id) {
		return em.find(Tax.class, id);
	}

	public Tax_Type_Group getTax_Type_GroupById(int id) {
		return em.find(Tax_Type_Group.class, id);
	}

	public void updateTax(Tax tax) {
		em.merge(tax);
	}

	public void updateTaxTypeGroup(Tax_Type_Group tax_Type_Group) {
		em.merge(tax_Type_Group);
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
		TypedQuery<Vendor> q = em.createQuery("select c from Vendor c",
				Vendor.class);
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeIdByName(int id, String nm) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.id=:Id AND UPPER(c.name) LIKE :name",
						Vendor.class);
		q.setParameter("Id", id);
		q.setParameter("name", "%" + nm.toUpperCase() + "%");
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
		TypedQuery<VendorType> q = em.createQuery("select c from VendorType c",
				VendorType.class);
		return q.getResultList();
	}

	/******************* foe account details ***************************/
	public void setAccountDetails(AccountDetails accountDetails) {
		em.persist(accountDetails);
	}

	public AccountDetails getAccountDetailsByVendorId(int id) {
		TypedQuery<AccountDetails> q = em
				.createQuery(
						"select c from AccountDetails c WHERE c.vendor.id=:id ORDER BY c.id DESC",
						AccountDetails.class);
		q.setParameter("id", id);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}

	}
	public void updateAccountDetails(AccountDetails accountDetails) {
		em.merge(accountDetails);
	}


	/******************* for purchase entry ***************************/
	public void setPurchaseEntry(Purchase_Entry purchaseEntry) {
		em.persist(purchaseEntry);
	}

	public Purchase_Entry getPurchaseEntryById(int id) {
		return em.find(Purchase_Entry.class, id);
	}

	public List<Purchase_Entry> getPurchaseEntryByDate(Date startDate,
			Date endDate) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c WHERE c.purchase_date BETWEEN :startDate AND :endDate",
						Purchase_Entry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public int getLastPurchaseChallanNumber() {
		TypedQuery<Purchase_Entry> q = em.createQuery(
				"select c from Purchase_Entry c ORDER BY c.id DESC",
				Purchase_Entry.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallan_no();
		} else {
			return 0;
		}

	}

	public int getLastPurchaseChallanSuffix() {
		TypedQuery<Purchase_Entry> q = em.createQuery(
				"select c from Purchase_Entry c ORDER BY c.id DESC",
				Purchase_Entry.class);
		/*
		 * if(q.getResultList().size()>0){ return
		 * q.getResultList().get(0).getChallanSuffix(); } else{ return 0; }
		 */
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("PUR").equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufix("PUR").getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("PUR")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("PUR").equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("PUR")
						.getSufix());
			}
		}
	}

	/***************** for purchase product details ***********************/

	public void setPurchaseProductDetails(
			Purchase_Product_Details purchaseProductDetails) {
		em.persist(purchaseProductDetails);
	}

	public ProductDetail getProductDetailsById(int id) {
		return em.find(ProductDetail.class, id);
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
		TypedQuery<City> q = em.createQuery(
				"select c from City c where UPPER(c.cityName) like :nm",
				City.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<City> getCityByState(int id) {
		TypedQuery<City> q = em.createQuery(
				"select c from City c where c.state.id = :id", City.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/******************** for State *******************************/
	public void setState(State state) {
		em.persist(state);
	}

	public State getStateById(int id) {
		return em.find(State.class, id);
	}

	public void deleteStateById(int id) {
		em.remove(getStateById(id));
	}

	public void updateState(State state) {
		em.merge(state);
	}

	public List<State> getAllState() {
		TypedQuery<State> q = em.createQuery("select c from State c",
				State.class);
		return q.getResultList();
	}

	public List<State> getStateByName(String name, int countryId) {

		TypedQuery<State> q = em
				.createQuery(
						"select c from State c where c.country.id=:cid AND UPPER(c.stateName) like :nm",
						State.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		q.setParameter("cid", countryId);
		return q.getResultList();

	}

	public List<State> getAllStatesByCountryId(int id) {
		TypedQuery<State> q = em.createQuery(
				"select c from State c where c.country.id=:Id", State.class);
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
		TypedQuery<Country> q = em.createQuery("select c from Country c",
				Country.class);
		return q.getResultList();
	}

	public List<Country> getCountryByName(String name) {
		TypedQuery<Country> q = em.createQuery(
				"select c from Country c where UPPER(c.countryName) like :nm",
				Country.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	/************************* for Department *********************/
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
		TypedQuery<Department> q = em.createQuery("select s from Department s",
				Department.class);
		return q.getResultList();
	}

	public List<Department> getAllDepartmentsByName(String name) {
		TypedQuery<Department> q = em.createQuery(
				"select s from Department s where UPPER(s.name) LIKE :name",
				Department.class);
		q.setParameter("name", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	/****************** for Sub Department **************************/
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
		TypedQuery<SubDepartment> q = em.createQuery(
				"select s from SubDepartment s", SubDepartment.class);
		return q.getResultList();
	}

	public List<SubDepartment> getAllSubDepartmentsByDepartmentId(int id) {
		TypedQuery<SubDepartment> q = em.createQuery(
				"select s from SubDepartment s where s.department.id=:Id",
				SubDepartment.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<SubDepartment> getAllSubDepartmentsByName(String name) {
		TypedQuery<SubDepartment> q = em.createQuery(
				"select s from SubDepartment s where UPPER(s.name) LIKE :name",
				SubDepartment.class);
		q.setParameter("name", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	/************************** for Category *****************************/
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
		TypedQuery<Category> q = em.createQuery("select s from Category s",
				Category.class);
		return q.getResultList();
	}

	public List<Category> getAllCategoryBySubDepartmentId(int id) {
		TypedQuery<Category> q = em.createQuery(
				"select s from Category s where s.subDepartment.id=:Id",
				Category.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/********************* for Product ************************/
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
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c", ProductDetail.class);
		return q.getResultList();
	}

	public List<ProductDetail> getAllProductDetailByCategoryId(int id) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select s from ProductDetail s where s.category.id=:Id",
				ProductDetail.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/********************** for serial number ********************/
	public void setSerialNumber(SerialNumber serialNumber) {
		em.persist(serialNumber);
	}

	/******************* for bill setup **************************/

	public void setBillSetup(Bill_setup billSetup) {
		em.persist(billSetup);
	}

	public Bill_setup getLastBillSetupBySufix(String billType) {
		TypedQuery<Bill_setup> q = em
				.createQuery(
						"select s from Bill_setup s where s.billType=:btype order by s.id DESC",
						Bill_setup.class);
		q.setParameter("btype", billType);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	/*********************** for company info *********************/

	public void setCompanyInfo(CompanyInfo companyInfo) {
		em.persist(companyInfo);
	}

	public void updateCompanyInfo(CompanyInfo companyInfo) {
		em.merge(companyInfo);

	}

	public boolean isCompanyInfoExist() {
		TypedQuery<CompanyInfo> q = em.createQuery(
				"Select c from CompanyInfo c", CompanyInfo.class);
		return q.getResultList().size() > 0;
	}

	public CompanyInfo getCompanyInfo() {
		TypedQuery<CompanyInfo> q = em.createQuery(
				"Select c from CompanyInfo c order by c.id DESC",
				CompanyInfo.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}

	}

	public CompanyInfo getCompanyInfoById(int id) {
		return em.find(CompanyInfo.class, id);
	}

	/********************* for RawMaterial Stock ************************/

	public void setRawMaterialsStocktDetail(RawMaterialsStock rawMaterialsStock) {
		em.persist(rawMaterialsStock);
	}

	public RawMaterialsStock getRawMaterialStocktDetailById(int id) {
		return em.find(RawMaterialsStock.class, id);
	}
	
	public RawMaterialsStock getRawMaterialStocktDetailByProductId(int id) {
		TypedQuery<RawMaterialsStock> q=em.createQuery("select c from RawMaterialsStock c where c.productDetail.id=:ID",RawMaterialsStock.class);
		q.setParameter("ID", id);
		return q.getResultList().size()>0?q.getResultList().get(0):null;
	}

	public void deleteRawMaterialStockDetailById(int id) {
		em.remove(getProductDetailById(id));
	}

	public void updateRawMaterialStockDetail(RawMaterialsStock rawMaterialsStock) {
		em.merge(rawMaterialsStock);
	}

	public List<RawMaterialsStock> getAllRawMaterialStockDetail() {
		TypedQuery<RawMaterialsStock> q = em.createQuery(
				"select c from RawMaterialsStock c", RawMaterialsStock.class);
		return q.getResultList();
	}

	public RawMaterialsStock getRawMeterialStoctByProductId(int id) {
		TypedQuery<RawMaterialsStock> q = em
				.createQuery(
						"select s from RawMaterialsStock s where s.productDetail.id=:id",
						RawMaterialsStock.class);
		q.setParameter("id", id);
		return q.getResultList().get(0);
	}

	/********************* for ReadyGood Stock ************************/

	public void setReadyGoodsStockDetail(ReadyGoodsStock readyGoodsStock) {
		em.persist(readyGoodsStock);
	}

	public ReadyGoodsStock getReadyGoodsStocktDetailById(int id) {
		return em.find(ReadyGoodsStock.class, id);
	}

	public void deleteReadyGoodsStockDetailById(int id) {
		em.remove(getReadyGoodsStocktDetailById(id));
	}

	public void updateReadyGoodsStockDetail(ReadyGoodsStock readyGoodsStock) {
		em.merge(readyGoodsStock);
	}

	public List<ReadyGoodsStock> getAllRawMaterialsStockDetail() {
		TypedQuery<ReadyGoodsStock> q = em.createQuery(
				"select c from ReadyGoodsStock c", ReadyGoodsStock.class);
		return q.getResultList();
	}

	public ReadyGoodsStock getReadyGoodsStoctByProductId(int id) {
		TypedQuery<ReadyGoodsStock> q = em.createQuery(
				"select s from ReadyGoodsStock s where s.productDetail.id=:id",
				ReadyGoodsStock.class);
		q.setParameter("id", id);
		return q.getResultList().get(0);
	}

}
