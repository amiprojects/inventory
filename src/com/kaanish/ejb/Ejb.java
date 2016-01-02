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
import com.kaanish.model.CustomerEntry;
import com.kaanish.model.Department;
import com.kaanish.model.JobAssignmentDetails;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.Purchase_Entry;
import com.kaanish.model.Purchase_Product_Details;
import com.kaanish.model.QtyUnit;
import com.kaanish.model.QtyUnitConversion;
import com.kaanish.model.QtyUnitConversionPK;
import com.kaanish.model.QtyUnitType;
import com.kaanish.model.RawMaterialsStock;
import com.kaanish.model.ReadyGoodsStock;
import com.kaanish.model.SalesEntry;
import com.kaanish.model.SalesProductDetails;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DigitToWords;

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

	public String getNumberToWords(int number) {
		return DigitToWords.convertNumberToWords(number);
	}

	public void backup() {

	}

	/***************** for user **********************/
	public void setUser(Users users) {
		em.merge(users);
	}

	public Users getUserById(String id) {
		return em.find(Users.class, id);
	}

	public List<Users> getAllUsers() {
		TypedQuery<Users> q = em.createQuery("select c from Users c",
				Users.class);
		return q.getResultList();
	}

	public void updateUser(Users u) {
		em.merge(u);
	}

	/********************* for user group ****************/
	public void setUserGroup(UserGroup ug) {
		em.persist(ug);
	}

	public void updateUserGroup(UserGroup ug) {
		em.merge(ug);
	}

	public UserGroup getUserGroupById(int id) {
		return em.find(UserGroup.class, id);
	}

	public void deleteUserGroupById(int id) {
		em.remove(getUserGroupById(id));
	}

	public List<UserGroup> getAllUserGroup() {
		TypedQuery<UserGroup> q = em.createQuery("select c from UserGroup c",
				UserGroup.class);
		return q.getResultList();
	}

	/********************* for Page List ****************/
	public void setPageList(PageList pl) {
		em.persist(pl);
	}

	public void updatePageList(PageList pl) {
		em.merge(pl);
	}

	public PageList getPageListById(int id) {
		return em.find(PageList.class, id);
	}

	public void deletePageListById(int id) {
		em.remove(getPageListById(id));
	}

	public List<PageList> getAllPageList() {
		TypedQuery<PageList> q = em.createQuery("select c from PageList c",
				PageList.class);
		return q.getResultList();
	}

	public List<Module> getAllModuleListAccordingUserGroupId(int id) {
		List<PageList> pglst = getUserGroupById(id).getPageLists();
		List<Module> modules = getAllModule();
		List<Module> mlist = new ArrayList<>();
		for (Module m : modules) {
			List<PageList> list = new ArrayList<>();
			for (PageList p : m.getPageLists()) {
				if (pglst.contains(p)) {
					p.setContains(true);
					list.add(p);
				} else {
					p.setContains(false);
					list.add(p);
				}
			}
			m.setPageLists(list);
			mlist.add(m);
			list = null;
		}
		return mlist;
	}

	/********************* for User Module ****************/
	public void setModule(Module m) {
		em.persist(m);
	}

	public void updateModule(Module m) {
		em.merge(m);
	}

	public Module getModuleById(int id) {
		return em.find(Module.class, id);
	}

	public void deleteModuleById(int id) {
		em.remove(getModuleById(id));
	}

	public List<Module> getAllModule() {
		TypedQuery<Module> q = em.createQuery("select c from Module c",
				Module.class);
		return q.getResultList();
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
				"select c from PaymentType c Where c.type=:type",
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

	public void deleteUOMById(int id) {
		em.remove(getQtyUnitById(id));
	}

	public List<QtyUnit> getAllQtyUnitByType(int id) {
		TypedQuery<QtyUnit> q = em.createQuery(
				"select c from QtyUnit c where c.qtyUnitType.id=:id",
				QtyUnit.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/************************************************
	 * AVIK for search UOM by name
	 **************************************************/

	public List<QtyUnit> getAllQtyUnitByNameOrAbv(String name) {
		TypedQuery<QtyUnit> q = em
				.createQuery(
						"select c from QtyUnit c where UPPER(c.name) like :nm OR UPPER(c.abbreviation) like :av",
						QtyUnit.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		q.setParameter("av", name.toUpperCase() + "%");
		return q.getResultList();
	}

	/****************************************
	 * * Product Search By Code
	 *********************************************/

	public List<ProductDetail> getAllProductByProductCode(String code) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c where UPPER(c.code) like :nm ",
				ProductDetail.class);
		q.setParameter("nm", code.toUpperCase() + "%");

		return q.getResultList();
	}

	/******************************
	 * * Product Search By Category
	 *************************************/

	public List<ProductDetail> getAllProductByCategory(String cat) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.category.name) like :nm ",
						ProductDetail.class);
		q.setParameter("nm", cat.toUpperCase() + "%");

		return q.getResultList();
	}

	/******************************
	 * * Product Search By Description
	 *************************************/

	public List<ProductDetail> getAllProductByProductDescription(String des) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.description) like :nm ",
						ProductDetail.class);
		q.setParameter("nm", des.toUpperCase() + "%");

		return q.getResultList();
	}

	/*************************************************************************************************************************/

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

	public List<Tax> getAllActiveTax() {
		TypedQuery<Tax> q = em.createQuery(
				"select c from Tax c where c.isActive=true", Tax.class);
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

	public List<Purchase_Entry> getAllPurchaseEntry() {
		TypedQuery<Purchase_Entry> q = em.createQuery(
				"select c from Purchase_Entry c", Purchase_Entry.class);
		return q.getResultList();
	}

	/*
	 * public List<String> getAllVendorBillNumber() { TypedQuery<String> q =
	 * em.createQuery( "select c.vendor_bill_no from Purchase_Entry c",
	 * String.class); return q.getResultList(); }
	 */

	/***************** for Job Assignment ***********************/
	public void setJobAssignment(JobAssignmentDetails jobAssignmentDetails) {
		em.persist(jobAssignmentDetails);
	}

	public JobAssignmentDetails getJobAssignmentDetailsByID(int id) {
		return em.find(JobAssignmentDetails.class, id);
	}

	public List<Vendor> getVendorsByVendorTypeJobber(String jobber) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type=:jobber",
				Vendor.class);
		q.setParameter("jobber", jobber);
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeJobberAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Jobber' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeSalesAgentAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Sales Agent' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsWithVendorTypeJobberByProductID(String jobber) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type=:jobber",
				Vendor.class);
		q.setParameter("jobber", jobber);
		return q.getResultList();
	}

	public int getLastJobChallanNumber() {
		TypedQuery<JobAssignmentDetails> q = em.createQuery(
				"select c from JobAssignmentDetails c ORDER BY c.id DESC",
				JobAssignmentDetails.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallan_no();
		} else {
			return 0;
		}

	}

	public int getLastJobChallanSuffix() {
		TypedQuery<JobAssignmentDetails> q = em.createQuery(
				"select c from JobAssignmentDetails c ORDER BY c.id DESC",
				JobAssignmentDetails.class);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("JOB").equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufix("JOB").getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("PUR")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("JOB").equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("JOB")
						.getSufix());
			}
		}
	}

	public List<JobAssignmentDetails> getJobAssignmentByDate(Date startDate,
			Date endDate) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c WHERE c.assignDate BETWEEN :startDate AND :endDate",
						JobAssignmentDetails.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	/***************** for Job Assignment Products ***********************/
	public void setJobAssignmentProducts(
			JobAssignmentProducts jobAssignmentProducts) {
		em.persist(jobAssignmentProducts);
	}

	public void updateJobAssignmentProductDetails(
			JobAssignmentProducts jobAssignmentProducts) {
		em.merge(jobAssignmentProducts);

	}

	public List<JobAssignmentProducts> getJobAssignmentProductDetailsByproductId(
			int id) {
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where c.purchase_Product_Details.productDetail.id=:id",
						JobAssignmentProducts.class);
		q.setParameter("id", id);
		return q.getResultList();
	}
	

	public JobAssignmentDetails getJobAssignmentById(
			int id) {
		
		return em.find(JobAssignmentDetails.class, id);
	}
	

	public List<JobAssignmentProducts> getAllJobAssignmentProductDetails() {
		TypedQuery<JobAssignmentProducts> q = em.createQuery(
				"select c from JobAssignmentProducts c ",
				JobAssignmentProducts.class);
		return q.getResultList();
	}

	/***************** for Job AStock ***********************/
	public void setJobStock(JobStock jobStock) {
		em.persist(jobStock);
	}

	/***************** for purchase product details ***********************/

	public void setPurchaseProductDetails(
			Purchase_Product_Details purchaseProductDetails) {
		em.persist(purchaseProductDetails);
	}

	public ProductDetail getProductDetailsById(int id) {
		return em.find(ProductDetail.class, id);
	}

	public List<Purchase_Product_Details> getPurchase_Product_DetailsByProId(
			int id) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.productDetail.id=:Id ORDER BY s.purchase_Entry.purchase_date DESC",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getPurchase_Product_DetailsByPurchaseEntryId(
			int id) throws Throwable {
		finalize();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.purchase_Entry.id=:Id",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public void updatePurchaseProductDetails(
			Purchase_Product_Details purchase_Product_Details) {
		em.merge(purchase_Product_Details);
	}

	public List<Purchase_Product_Details> getPurchaseProductDetailsByQty() {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.remaining_quantity>0 and c.productDetail.isSaleble=:salable ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("salable", false);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getSaleblePurchaseProductDetailsByProductCodeAndQuantity(
			String code, Date date) {
		List<Purchase_Product_Details> lst = new ArrayList<Purchase_Product_Details>();

		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where  UPPER(c.productDetail.code) like :cd and c.remaining_quantity>0 and c.productDetail.isSaleble=:salable and c.purchase_Entry.purchase_date<:date ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("salable", true);
		q.setParameter("cd", "%" + code.toUpperCase() + "%");
		q.setParameter("date", date);

		lst = q.getResultList();

		TypedQuery<Purchase_Product_Details> q1 = em
				.createQuery(
						"select c from Purchase_Product_Details c where  UPPER(c.productDetail.code) like :cd and c.remaining_quantity>0 and c.productDetail.isSaleble=:salable and c.initialInventory=true ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q1.setParameter("salable", true);
		q1.setParameter("cd", "%" + code.toUpperCase() + "%");

		for (Purchase_Product_Details ppd : q1.getResultList()) {
			lst.add(ppd);
		}

		return lst;
	}

	public List<Purchase_Product_Details> getReadyPurchaseProductDetailsByQty() {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.remaining_quantity>0 and c.productDetail.isSaleble=:salable ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("salable", true);
		return q.getResultList();
	}

	public Purchase_Product_Details getPurchaseProductDetailsById(int id) {
		return em.find(Purchase_Product_Details.class, id);
	}

	public Purchase_Product_Details getPurchaseProductDetailsByIdForSale(
			int id, String date) {

		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.id=:id and c.remaining_quantity>0 and c.productDetail.isSaleble=true and c.purchase_Entry.purchase_date<:date",
						Purchase_Product_Details.class);
		q.setParameter("id", id);
		q.setParameter("date", DateConverter.getDate(date));

		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			TypedQuery<Purchase_Product_Details> q1 = em
					.createQuery(
							"select c from Purchase_Product_Details c where c.id=:id and c.remaining_quantity>0 and c.productDetail.isSaleble=true and c.initialInventory=true",
							Purchase_Product_Details.class);
			q1.setParameter("id", id);
			if (q1.getResultList().size() > 0) {
				return q1.getResultList().get(0);
			} else {
				return null;
			}
		}

	}

	/********************* for job recieve *********************/
	public void setJobRecieve(JobRecievedDetails jobRecievedDetails) {
		em.persist(jobRecievedDetails);
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

	public List<City> getCityByNameAjax(String name, int Stateid) {

		TypedQuery<City> q = em
				.createQuery(
						"select c from City c where c.state.id=:cid AND UPPER(c.cityName) like :nm",
						City.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		q.setParameter("cid", Stateid);
		return q.getResultList();

	}

	public List<State> getAllStatesByCountryId(int id) {
		TypedQuery<State> q = em.createQuery(
				"select c from State c where c.country.id=:Id", State.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<State> getStateByCityName(String nm) {
		TypedQuery<State> q = em.createQuery("select c from State c",
				State.class);
		List<State> stList = new ArrayList<>();
		for (State s : q.getResultList()) {
			for (City c : s.getCities()) {
				if (c.getCityName().equals(nm)) {
					stList.add(s);
				}
			}
		}
		return stList;
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

	public List<ProductDetail> getAllActiveProductDetail() {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c where c.isActive=true",
				ProductDetail.class);
		return q.getResultList();
	}

	public List<ProductDetail> getAllProductDetailByCategoryId(int id) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select s from ProductDetail s where s.category.id=:Id",
				ProductDetail.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<ProductDetail> getProductDetailByCode(String name) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c where UPPER(c.code) like :nm",
				ProductDetail.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<ProductDetail> getSalebleProductsByQtyAndCode(String nm) {
		TypedQuery<ProductDetail> query = em
				.createQuery(
						"select c from ProductDetail c where c.isSaleble=:sal AND c.readyGoodsStock.remainingQty>0 AND UPPER(c.code) like :codeName",
						ProductDetail.class);
		query.setParameter("codeName", "%" + nm.toUpperCase() + "%");
		query.setParameter("sal", true);
		return query.getResultList();
	}

	public List<ProductDetail> getProductDetailBydescription(String name) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.description) like :nm",
						ProductDetail.class);
		q.setParameter("nm", "%" + name.toUpperCase() + "%");
		return q.getResultList();
	}

	/******************** for product Image ************************/
	public void setProductImage(ProductImage productImage) {
		em.persist(productImage);
	}

	public ProductImage getProductImageById(int id) {
		return em.find(ProductImage.class, id);
	}

	public void removeImageById(int id) {
		em.remove(getProductImageById(id));
	}

	public List<ProductImage> getAllProductImageByProductId(int id) {
		TypedQuery<ProductImage> q = em.createQuery(
				"select s from ProductImage s where s.productDetail.id=:id",
				ProductImage.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/********************** for serial number ********************/
	public void setSerialNumber(SerialNumber serialNumber) {
		em.persist(serialNumber);
	}

	public List<SerialNumber> getSerialNumberByPurchaseEntryId(int id) {
		TypedQuery<SerialNumber> q = em
				.createQuery(
						"select c from SerialNumber c where c.purchase_Product_Details.purchase_Entry.id=:id",
						SerialNumber.class);
		q.setParameter("id", id);
		return q.getResultList();
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
		TypedQuery<RawMaterialsStock> q = em
				.createQuery(
						"select c from RawMaterialsStock c where c.productDetail.id=:ID",
						RawMaterialsStock.class);
		q.setParameter("ID", id);
		return q.getResultList().size() > 0 ? q.getResultList().get(0) : null;
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

	public ReadyGoodsStock getReadyGoodsStocktDetailByProductId(int id) {
		TypedQuery<ReadyGoodsStock> q = em.createQuery(
				"select c from ReadyGoodsStock c where c.productDetail.id=:ID",
				ReadyGoodsStock.class);
		q.setParameter("ID", id);
		return q.getResultList().size() > 0 ? q.getResultList().get(0) : null;
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

	/**************** SalesEntry *****************/

	public void setSalesEntry(SalesEntry salesEntry) {
		em.persist(salesEntry);
	}

	public SalesEntry getSalesEntryById(int id) {
		return em.find(SalesEntry.class, id);
	}

	public void deleteSalesEntryById(int id) {
		em.remove(getSalesEntryById(id));
	}

	public void updateSalesEntry(SalesEntry salesEntry) {
		em.merge(salesEntry);
	}

	public int getLastSalesChallanNumber() {
		TypedQuery<SalesEntry> q = em.createQuery(
				"select c from SalesEntry c ORDER BY c.id DESC",
				SalesEntry.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallanNo();
		} else {
			return 0;
		}

	}

	public int getLastSalesChallanSuffix() {
		TypedQuery<SalesEntry> q = em.createQuery(
				"select c from SalesEntry c ORDER BY c.id DESC",
				SalesEntry.class);

		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("INV").equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufix("INV").getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("INV")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("INV").equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("INV")
						.getSufix());
			}
		}
	}

	/**************** SalesProductDetails *****************/

	public void setSalesProductDetails(SalesProductDetails salesProductDetails) {
		em.persist(salesProductDetails);
	}

	public SalesProductDetails getSalesProductDetailsById(int id) {
		return em.find(SalesProductDetails.class, id);
	}

	public void deleteSalesProductDetailsById(int id) {
		em.remove(getSalesProductDetailsById(id));
	}

	public void updateSalesProductDetails(
			SalesProductDetails salesProductDetails) {
		em.merge(salesProductDetails);
	}

	public List<SalesProductDetails> getSales_Product_DetailsByProId(int id) {
		TypedQuery<SalesProductDetails> q = em
				.createQuery(
						"select s from SalesProductDetails s where s.purchase_Product_Details.productDetail.id=:Id ORDER BY s.salesEntry.sales_date DESC ",
						SalesProductDetails.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/**************** Customer *****************/

	public void setCustomerEntry(CustomerEntry customerEntry) {
		em.persist(customerEntry);
	}

	public CustomerEntry getCustomerEntryById(int id) {
		return em.find(CustomerEntry.class, id);
	}

	public void deleteCustomerEntryById(int id) {
		em.remove(getCustomerEntryById(id));
	}

	public void updateCustomer(CustomerEntry customerEntry) {
		em.merge(customerEntry);
	}

	public List<CustomerEntry> getCustomerByPh(String ph) {
		TypedQuery<CustomerEntry> q = em.createQuery(
				"select c from CustomerEntry c where c.mobile like :ph",
				CustomerEntry.class);
		q.setParameter("ph", "%" + ph + "%");
		return q.getResultList();
	}

	/******************************
	 * stock search by product code
	 ****************/

	public List<ProductDetail> getProductDetailsByCodeDescriptionCategory(
			String code, String description, String name) {

		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where c.code=:code OR c.description=:description OR c.category.name=:name ",
						ProductDetail.class);
		q.setParameter("code", code);
		q.setParameter("description", description);
		q.setParameter("name", name);
		return q.getResultList();
	}

	/******************************
	 * Search Job Assignment Details by ChallanID
	 ****************/
	/*
	 * public JobAssignmentDetails getJobAssignmentDetailsbyChallanNumber(String
	 * challanNumber){ TypedQuery<JobAssignmentDetails> q = em .createQuery(
	 * "select c from JobAssignmentDetails c where c.challanNumber=:challanNumber "
	 * , JobAssignmentDetails.class); return q.getResultList(); /
	 * ******************************************
	 */// // *************find only use
		// // fo4r
		// // id**************////////////*****/
	/*
	 * public JobAssignmentDetails getJobAssignmentDetailsbyChallanNumber(String
	 * challanNumber) { return em.find(JobAssignmentDetails.class,
	 * challanNumber); }
	 */
	public JobAssignmentDetails getJobAssignmentDetailsbyChallanNumber(
			String challanNumber) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.challanNumber=:challanNumber",
						JobAssignmentDetails.class);
		q.setParameter("challanNumber", challanNumber);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}

	}

}
