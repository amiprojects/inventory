package com.kaanish.ejb;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.kaanish.model.JobClass;
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.Module;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.PurchaseReturn;
import com.kaanish.model.PurchaseReturnProductDetails;
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
import com.kaanish.model.SalesProductReturnDetail;
import com.kaanish.model.SalesReturn;
import com.kaanish.model.SecurityAnswers;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.Stoct;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DigitToWords;

@Stateless
public class Ejb {
	@PersistenceContext
	private EntityManager em;
	@Inject
	private HttpSession httpSession;
	private int cId;

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

	/****************** for security *********************/
	public List<JobClass> getAllJobClasses() {
		TypedQuery<JobClass> q = em.createQuery("select c from JobClass c",
				JobClass.class);
		return q.getResultList();
	}

	public void setJobClass(JobClass jobClass) {
		em.persist(jobClass);
	}

	public List<JobClass> getLastJobClass() {
		TypedQuery<JobClass> q = em.createQuery(
				"select c from JobClass c order by c.assignDate DESC",
				JobClass.class);

		return q.getResultList();
	}

	public void setStoct(Stoct s) {
		em.persist(s);
	}

	public List<Stoct> getAllStoct() {
		TypedQuery<Stoct> q = em.createQuery(
				"select c from Stoct c ORDER BY c.id DESC", Stoct.class);
		return q.getResultList();
	}

	public boolean is21Days() {
		Date date = new Date();
		LocalDateTime afterThreeMonths = LocalDateTime.ofInstant(getAllStoct()
				.get(0).getEndDate().toInstant(), ZoneId.systemDefault());
		LocalDateTime before21Days = afterThreeMonths.minusDays(21);
		if (date.after(Date.from(before21Days.toInstant(ZoneOffset
				.ofHoursMinutes(5, 30))))) {
			return true;
		} else {
			return false;
		}

	}

	/***************** for Security Questions group **********************/
	public void setSecurityQueGroup(SecurityQuestionGroup questionGroup) {
		em.persist(questionGroup);
	}

	public void updateSecurityQuestionsGroup(SecurityQuestionGroup questionGroup) {
		em.merge(questionGroup);
	}

	public SecurityQuestionGroup getSecurityQuestionGroupById(int id) {
		return em.find(SecurityQuestionGroup.class, id);
	}

	public List<SecurityQuestionGroup> getAllSecurityQuestionGroups() {
		TypedQuery<SecurityQuestionGroup> q = em.createQuery(
				"select c from SecurityQuestionGroup c",
				SecurityQuestionGroup.class);
		return q.getResultList();
	}

	public SecurityQuestionGroup getSecurityQueGroupByGroupName(String name) {
		TypedQuery<SecurityQuestionGroup> q = em.createQuery(
				"select c from SecurityQuestionGroup c where c.name=:name",
				SecurityQuestionGroup.class);
		q.setParameter("name", name);
		return q.getResultList().get(0);
	}

	public void deleteSecurityQuestionGroup(int id) {
		em.remove(getSecurityQuestionGroupById(id));
	}

	/***************** for Security Questions **********************/
	public void setSecurityQue(SequrityQuestions question) {
		em.persist(question);
	}

	public void updateSecurityQuestion(SequrityQuestions question) {
		em.merge(question);
	}

	public SequrityQuestions getSecurityQuestionById(int id) {
		return em.find(SequrityQuestions.class, id);
	}

	public List<SequrityQuestions> getAllSecurityQuestions() {
		TypedQuery<SequrityQuestions> q = em.createQuery(
				"select c from SequrityQuestions c", SequrityQuestions.class);
		return q.getResultList();
	}

	public List<SequrityQuestions> getSecurityQuestionsByGroup(String name) {
		TypedQuery<SequrityQuestions> q = em
				.createQuery(
						"select c from SequrityQuestions c where c.securityQuestionGroup.name=:name",
						SequrityQuestions.class);
		q.setParameter("name", name);
		return q.getResultList();
	}

	/***************** for Security Answers **********************/
	public void setSecurityAns(SecurityAnswers securityAnswers) {
		em.persist(securityAnswers);
	}

	public void updateSecurityAns(SecurityAnswers securityAnswers) {
		em.merge(securityAnswers);
	}

	public SecurityAnswers getSecurityAnsById(int id) {
		return em.find(SecurityAnswers.class, id);
	}

	public List<SecurityAnswers> getAllSecurityAnswers() {
		TypedQuery<SecurityAnswers> q = em.createQuery(
				"select c from SecurityAnswers c", SecurityAnswers.class);
		return q.getResultList();
	}

	public List<SecurityAnswers> getAllSecurityAnswerByUserId(String usrId) {
		TypedQuery<SecurityAnswers> q = em.createQuery(
				"select c from SecurityAnswers c where c.users.userId=:usrId",
				SecurityAnswers.class);
		q.setParameter("usrId", usrId);
		return q.getResultList();
	}

	/***************** for user **********************/
	public void setUser(Users users) {
		em.persist(users);
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

	public List<UserGroup> getAllUserGroupByCompany(int cId) {
		TypedQuery<UserGroup> q = em.createQuery(
				"select c from UserGroup c WHERE c.companyInfo.id=:cId",
				UserGroup.class);
		q.setParameter("cId", cId);
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

	public List<QtyUnit> getUOMByUOMTypeId(int id) {
		TypedQuery<QtyUnit> q = em
				.createQuery("select c from QtyUnit c where c.QtyUnit.id=:Id",
						QtyUnit.class);
		q.setParameter("Id", id);
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

	/********************************************** search UOM by name ************************************************/

	public List<QtyUnit> getAllQtyUnitByNameOrAbv(String name) {
		TypedQuery<QtyUnit> q = em
				.createQuery(
						"select c from QtyUnit c where UPPER(c.name) like :nm OR UPPER(c.abbreviation) like :av",
						QtyUnit.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		q.setParameter("av", name.toUpperCase() + "%");
		return q.getResultList();
	}

	/************************ Product detail Search By Code ********************************************/

	public List<ProductDetail> getAllProductByProductCode(String code) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c where UPPER(c.code) like :nm ",
				ProductDetail.class);
		q.setParameter("nm", code.toUpperCase() + "%");

		return q.getResultList();
	}

	/************************ Product Search By Code ********************************************/

	public ProductDetail getProductByProductCode(String code) {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c where UPPER(c.code) = :nm ",
				ProductDetail.class);
		q.setParameter("nm", code.toUpperCase());

		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;

		}
	}

	/***************************** Product Search By Category ************************************/

	public List<ProductDetail> getAllProductByCategory(String cat) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.category.name) like :nm ",
						ProductDetail.class);
		q.setParameter("nm", cat.toUpperCase() + "%");

		return q.getResultList();
	}

	/****************************** Product Search By Description ************************************/

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

	public List<QtyUnitConversionPK> getAllQtyUnitConversionPK() {
		TypedQuery<QtyUnitConversionPK> q = em.createQuery(
				"select c from QtyUnitConversionPK c",
				QtyUnitConversionPK.class);
		return q.getResultList();
	}

	public List<QtyUnitConversion> getAllQtyUnitConversion() {
		TypedQuery<QtyUnitConversion> q = em.createQuery(
				"select c from QtyUnitConversion c", QtyUnitConversion.class);
		return q.getResultList();
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

	public List<Vendor> getVendorsByVendorTypeId(int id) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.id=:Id",
				Vendor.class);
		q.setParameter("Id", id);
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

	public List<AccountDetails> getAllAccountDetails() {
		TypedQuery<AccountDetails> q = em.createQuery(
				"select c from AccountDetails c", AccountDetails.class);
		return q.getResultList();
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
						"select c from Purchase_Entry c WHERE c.purchase_date BETWEEN :startDate AND :endDate ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByDateAndCompany(
			Date startDate, Date endDate, int cId) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c WHERE c.companyInfo.id=:cId AND c.purchase_date BETWEEN :startDate AND :endDate ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByChallanNo(String chNo) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByVendorName(String name) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.vendor.vendorType.type='Vendor' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByVendorNameAndCompany(
			String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.companyInfo.id=:cId AND c.vendor.vendorType.type='Vendor' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByAgentName(String name) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.vendor.vendorType.type='Purchase Agent' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByAgentNameAndCompany(
			String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.companyInfo.id=:cId AND c.vendor.vendorType.type='Purchase Agent' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<Purchase_Entry> getPurchaseEntryByProductCodeAndCompany(
			String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<Purchase_Entry> lst = new ArrayList<Purchase_Entry>();
		Set<Purchase_Entry> hs = new HashSet<>();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.purchase_Entry.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:name and c.purchase_Entry!=null ORDER BY c.id DESC",
						Purchase_Product_Details.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);

		for (Purchase_Product_Details p : q.getResultList()) {
			lst.add(p.getPurchase_Entry());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<Purchase_Entry> getPurchaseEntryByProductCode(String name) {
		List<Purchase_Entry> lst = new ArrayList<Purchase_Entry>();
		Set<Purchase_Entry> hs = new HashSet<>();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where UPPER(c.productDetail.code)=:name and c.purchase_Entry!=null ORDER BY c.id DESC",
						Purchase_Product_Details.class);
		q.setParameter("name", name.toUpperCase());

		for (Purchase_Product_Details p : q.getResultList()) {
			lst.add(p.getPurchase_Entry());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
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

	public int getLastPurchaseChallanNumberByCompany(int cId) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c WHERE c.companyInfo.id=:cId ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("cId", cId);
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

	public int getLastPurchaseChallanSuffixByCompany(int cId) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c WHERE c.companyInfo.id=:cId ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufixAndCompanyId("PUR", cId).equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufixAndCompanyId("PUR",
						cId).getSufix()) < s) {
					return s;
				} else {
					return Integer
							.parseInt((getLastBillSetupBySufixAndCompanyId(
									"PUR", cId).getSufix()));
				}
			}
		} else {
			if (getLastBillSetupBySufixAndCompanyId("PUR", cId).equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"PUR", cId).getSufix());
			}
		}
	}

	public List<Purchase_Entry> getAllPurchaseEntry() {
		TypedQuery<Purchase_Entry> q = em.createQuery(
				"select c from Purchase_Entry c", Purchase_Entry.class);
		return q.getResultList();
	}

	public List<Purchase_Entry> getAllPurchaseEntryByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Entry> q = em.createQuery(
				"select c from Purchase_Entry c where c.companyInfo.id=:cId",
				Purchase_Entry.class);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	/*
	 * public List<String> getAllVendorBillNumber() { TypedQuery<String> q =
	 * em.createQuery( "select c.vendor_bill_no from Purchase_Entry c",
	 * String.class); return q.getResultList(); }
	 */

	public List<String> getAllFinancialForPurchase() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (Purchase_Entry pe : getAllPurchaseEntry()) {
			lst.add(pe.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	/***************** for Purchase Return ***********************/
	public void setPurchaseReturn(PurchaseReturn purchaseReturn) {
		em.persist(purchaseReturn);
	}

	public PurchaseReturn getPurchaseReturnById(int id) {
		return em.find(PurchaseReturn.class, id);
	}

	public int getLastPurchaseReturnChallanNumberByCompany(int cId) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c WHERE c.companyInfo.id=:cId ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallanNo();
		} else {
			return 0;
		}

	}

	public int getLastPurchaseReturnChallanSuffix() {
		TypedQuery<PurchaseReturn> q = em.createQuery(
				"select c from PurchaseReturn c ORDER BY c.id DESC",
				PurchaseReturn.class);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("RPUR").equals(null)) {
				return s;
			} else {
				if (Integer
						.parseInt(getLastBillSetupBySufix("RPUR").getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("RPUR")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("RPUR").equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("RPUR")
						.getSufix());
			}
		}
	}

	/***************** for Purchase Product Return Details ***********************/
	public void setPurchaseProdReturnDetails(
			PurchaseReturnProductDetails purchaseReturnProductDetails) {
		em.persist(purchaseReturnProductDetails);
	}

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

	public int getLastJobChallanNumberByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.companyInfo.id=:cId ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("cId", cId);
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
					return Integer.parseInt(getLastBillSetupBySufix("JOB")
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

	public int getLastJobChallanSuffixByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.companyInfo.id=:cId ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufixAndCompany("JOB").equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufixAndCompany("JOB")
						.getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufixAndCompany(
							"JOB").getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufixAndCompany("JOB").equals(null)) {
				return 0;
			} else {
				return Integer
						.parseInt(getLastBillSetupBySufixAndCompany("JOB")
								.getSufix());
			}
		}
	}

	public List<JobAssignmentDetails> getJobAssignmentByDate(Date startDate,
			Date endDate) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c WHERE c.companyInfo.id=:cId AND c.assignDate BETWEEN :startDate AND :endDate",
						JobAssignmentDetails.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getJobAssignByChallanNo(String chNo) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getJobAssignByJobberName(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.companyInfo.id=:cId AND c.vendor.vendorType.type='Jobber' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getJobAssignByProductCode(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<JobAssignmentDetails> lst = new ArrayList<JobAssignmentDetails>();
		Set<JobAssignmentDetails> hs = new HashSet<>();
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where c.jobAssignmentDetails.companyInfo.id=:cId AND UPPER(c.purchase_Product_Details.productDetail.code)=:name ORDER BY c.id DESC",
						JobAssignmentProducts.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		for (JobAssignmentProducts p : q.getResultList()) {
			lst.add(p.getJobAssignmentDetails());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<JobAssignmentDetails> getAllJobassignmentDetails() {
		TypedQuery<JobAssignmentDetails> q = em.createQuery(
				"select c from JobAssignmentDetails c",
				JobAssignmentDetails.class);
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getAllJobassignmentDetailsByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c WHERE c.companyInfo.id=:cId",
						JobAssignmentDetails.class);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<String> getAllFinancialForJob() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (JobAssignmentDetails jad : getAllJobassignmentDetails()) {
			lst.add(jad.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
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

	public List<JobAssignmentProducts> getJobAssignmentProductDetailsByproductIdAndCompany(
			int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where c.jobAssignmentDetails.companyInfo.id=:cId AND c.purchase_Product_Details.productDetail.id=:id",
						JobAssignmentProducts.class);
		q.setParameter("id", id);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public JobAssignmentDetails getJobAssignmentById(int id) {

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

	public List<JobStock> getAllJobStock() {
		TypedQuery<JobStock> q = em.createQuery("select c from JobStock c",
				JobStock.class);
		return q.getResultList();
	}

	/***************** for purchase product details ***********************/

	public void setPurchaseProductDetails(
			Purchase_Product_Details purchaseProductDetails) {
		em.persist(purchaseProductDetails);
	}

	public List<Purchase_Product_Details> getAllPurchase_Product_Details() {
		TypedQuery<Purchase_Product_Details> q = em.createQuery(
				"select c from Purchase_Product_Details c",
				Purchase_Product_Details.class);
		return q.getResultList();
	}

	public ProductDetail getProductDetailsById(int id) {
		return em.find(ProductDetail.class, id);
	}

	public List<Purchase_Product_Details> getPurchase_Product_DetailsByProId(
			int id) {
		List<Purchase_Product_Details> lst = new ArrayList<>();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.productDetail.id=:Id and s.initialInventory=:initialInventory",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		q.setParameter("initialInventory", true);
		lst = q.getResultList();

		TypedQuery<Purchase_Product_Details> q1 = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.productDetail.id=:Id and s.initialInventory=:initialInventory ORDER BY s.purchase_Entry.purchase_date DESC",
						Purchase_Product_Details.class);
		q1.setParameter("Id", id);
		q1.setParameter("initialInventory", false);
		lst.addAll(q1.getResultList());

		return lst;
	}

	public List<Purchase_Product_Details> getPurchase_Product_DetailsByProductIdAndCompany(
			int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<Purchase_Product_Details> lst = new ArrayList<>();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.companyInfo.id=:cId AND s.productDetail.id=:Id and s.initialInventory=:initialInventory",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		q.setParameter("initialInventory", true);
		q.setParameter("cId", cId);
		lst = q.getResultList();

		TypedQuery<Purchase_Product_Details> q1 = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.companyInfo.id=:cId AND s.productDetail.id=:Id and s.initialInventory=:initialInventory ORDER BY s.purchase_Entry.purchase_date DESC",
						Purchase_Product_Details.class);
		q1.setParameter("Id", id);
		q1.setParameter("initialInventory", false);
		q1.setParameter("cId", cId);
		lst.addAll(q1.getResultList());

		return lst;
	}

	public List<Purchase_Product_Details> getInitialPurchase_Product_DetailsByProductIdAndCompany(
			int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.companyInfo.id=:cId AND s.productDetail.id=:Id and s.initialInventory=:initialInventory",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		q.setParameter("initialInventory", true);
		q.setParameter("cId", cId);
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
						"select c from Purchase_Product_Details c where c.remaining_quantity>0 and c.productDetail.isRaw=:raw ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("raw", true);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getPurchaseProductDetailsByQtyAndCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND c.remaining_quantity>0 and c.productDetail.isRaw=:raw ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("raw", true);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getSaleblePurchaseProductDetailsByProductCodeAndQuantity(
			String code, Date date) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<Purchase_Product_Details> lst = new ArrayList<Purchase_Product_Details>();

		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:cd and c.remaining_quantity>0 and c.productDetail.isSaleble=:salable and c.purchase_Entry.purchase_date<:date ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("salable", true);
		q.setParameter("cd", code.toUpperCase());
		q.setParameter("date", date);
		q.setParameter("cId", cId);

		lst = q.getResultList();

		TypedQuery<Purchase_Product_Details> q1 = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:cd and c.remaining_quantity>0 and c.productDetail.isSaleble=:salable and c.initialInventory=true ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q1.setParameter("salable", true);
		q1.setParameter("cd", code.toUpperCase());
		q1.setParameter("cId", cId);

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

	public List<Purchase_Product_Details> getPurchaseProductDetailsByProductIdAndCompany(
			int pId) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND c.productDetail.id=:pId",
						Purchase_Product_Details.class);
		q.setParameter("cId", cId);
		q.setParameter("pId", pId);
		return q.getResultList();
	}

	/********************* for job recieve *********************/
	public void setJobRecieve(JobRecievedDetails jobRecievedDetails) {
		em.persist(jobRecievedDetails);
	}

	public List<JobRecievedDetails> getAllJobRecievedDetails() {
		TypedQuery<JobRecievedDetails> q = em.createQuery(
				"select c from JobRecievedDetails c", JobRecievedDetails.class);
		return q.getResultList();
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

	public List<ProductDetail> getAllProductDetailByCompany() {
		Users usr = getUserById((String) httpSession.getAttribute("user"));
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c", ProductDetail.class);
		List<ProductDetail> listpro = new ArrayList<ProductDetail>();
		HashSet<ProductDetail> hash = new HashSet<ProductDetail>();
		for (ProductDetail pd : getAllProductDetail()) {
			for (Purchase_Product_Details ppd : pd
					.getPurchase_Product_Details()) {
				if (ppd.getCompanyInfo().equals(usr.getCompanyInfo())) {
					listpro.add(ppd.getProductDetail());
				}
			}
		}
		hash.addAll(listpro);
		listpro.clear();
		listpro.addAll(hash);
		return listpro;
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

	public List<ProductDetail> getSalebleProductsByQtyAndCodeAndCompany(
			String nm) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<ProductDetail> lst = new ArrayList<ProductDetail>();
		TypedQuery<ProductDetail> query = em
				.createQuery(
						"select c from ProductDetail c where c.readyGoodsStock.companyInfo.id=:cId AND c.isSaleble=:sal AND c.readyGoodsStock.remainingQty>0 AND UPPER(c.code) like :codeName",
						ProductDetail.class);
		query.setParameter("codeName", "%" + nm.toUpperCase() + "%");
		query.setParameter("sal", true);
		query.setParameter("cId", cId);
		lst = query.getResultList();
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where c.rawMaterialsStock.companyInfo.id=:cId AND c.isSaleble=:sal AND c.rawMaterialsStock.remainingQty>0 AND UPPER(c.code) like :codeName",
						ProductDetail.class);
		q.setParameter("sal", true);
		q.setParameter("cId", cId);
		q.setParameter("codeName", "%" + nm.toUpperCase() + "%");
		lst.addAll(q.getResultList());
		return lst;
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

	public List<ProductImage> getAllProductImage() {
		TypedQuery<ProductImage> q = em.createQuery(
				"select c from ProductImage c", ProductImage.class);
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

	public List<Bill_setup> getAllBillSetup() {
		TypedQuery<Bill_setup> q = em.createQuery("select c from Bill_setup c",
				Bill_setup.class);
		return q.getResultList();
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

	public Bill_setup getLastBillSetupBySufixAndCompanyId(String billType,
			int cId) {
		TypedQuery<Bill_setup> q = em
				.createQuery(
						"select s from Bill_setup s where s.billType=:btype AND s.companyInfo.id=:cId order by s.id DESC",
						Bill_setup.class);
		q.setParameter("btype", billType);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public Bill_setup getLastBillSetupBySufixAndCompany(String billType) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<Bill_setup> q = em
				.createQuery(
						"select s from Bill_setup s where s.billType=:btype AND s.companyInfo.id=:cId order by s.id DESC",
						Bill_setup.class);
		q.setParameter("btype", billType);
		q.setParameter("cId", cId);
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

	public List<CompanyInfo> getAllCompanyInfo() {
		TypedQuery<CompanyInfo> q = em.createQuery(
				"select c from CompanyInfo c", CompanyInfo.class);
		return q.getResultList();
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

	public RawMaterialsStock getRawMaterialStocktDetailByProductIdAndCompany(
			int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<RawMaterialsStock> q = em
				.createQuery(
						"select c from RawMaterialsStock c where c.companyInfo.id=:cId AND c.productDetail.id=:ID",
						RawMaterialsStock.class);
		q.setParameter("ID", id);
		q.setParameter("cId", cId);
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

	public RawMaterialsStock getRawMeterialStoctByProductAndCompanyId(int pId,
			int cId) {
		TypedQuery<RawMaterialsStock> q = em
				.createQuery(
						"select s from RawMaterialsStock s where s.productDetail.id=:pId AND s.companyInfo.id=:cId",
						RawMaterialsStock.class);
		q.setParameter("pId", pId);
		q.setParameter("cId", cId);
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

	public ReadyGoodsStock getReadyGoodsStocktDetailByProductIdAndCompany(int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<ReadyGoodsStock> q = em
				.createQuery(
						"select c from ReadyGoodsStock c where c.companyInfo.id=:cId AND c.productDetail.id=:ID",
						ReadyGoodsStock.class);
		q.setParameter("ID", id);
		q.setParameter("cId", cId);
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

	public ReadyGoodsStock getReadyGoodStoctByProductAndCompanyId(int pId,
			int cId) {
		TypedQuery<ReadyGoodsStock> q = em
				.createQuery(
						"select s from ReadyGoodsStock s where s.productDetail.id=:pId AND s.companyInfo.id=:cId",
						ReadyGoodsStock.class);
		q.setParameter("pId", pId);
		q.setParameter("cId", cId);
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

	public int getLastSalesReturnChallanNumber() {
		TypedQuery<SalesReturn> q = em.createQuery(
				"select c from SalesReturn c ORDER BY c.id DESC",
				SalesReturn.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallanNo();
		} else {
			return 0;
		}

	}

	public int getLastSalesRChallanSuffix() {
		TypedQuery<SalesReturn> q = em.createQuery(
				"select c from SalesReturn c ORDER BY c.id DESC",
				SalesReturn.class);

		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("SRINV").equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufix("SRINV")
						.getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("SRINV")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("SRINV").equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("SRINV")
						.getSufix());
			}
		}
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

	public int getLastSalesChallanNumberByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId ORDER BY c.id DESC",
						SalesEntry.class);
		q.setParameter("cId", cId);
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

	public int getLastSalesChallanSuffixByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId ORDER BY c.id DESC",
						SalesEntry.class);
		q.setParameter("cId", cId);

		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufixAndCompanyId("INV", cId).equals(null)) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufixAndCompanyId("INV",
						cId).getSufix()) < s) {
					return s;
				} else {
					return Integer
							.parseInt(getLastBillSetupBySufixAndCompanyId(
									"INV", cId).getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufixAndCompanyId("INV", cId).equals(null)) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"INV", cId).getSufix());
			}
		}
	}

	public List<SalesEntry> getSalesEntryByDate(Date startDate, Date endDate) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c WHERE c.companyInfo.id=:cId AND c.sales_date BETWEEN :startDate AND :endDate",
						SalesEntry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getAllSalesEntries() {
		TypedQuery<SalesEntry> q = em.createQuery("select c from SalesEntry c",
				SalesEntry.class);
		return q.getResultList();
	}

	public List<SalesEntry> getAllSalesEntriesByCompany() {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em.createQuery(
				"select c from SalesEntry c WHERE c.companyInfo.id=:cId",
				SalesEntry.class);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<String> getAllFinancialForSales() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (SalesEntry se : getAllSalesEntries()) {
			lst.add(se.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public List<SalesEntry> getSalesEntryByChallanNo(String chNo) {
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						SalesEntry.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByAgentName(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId AND UPPER(c.vendor.name)=:name",
						SalesEntry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByCustomerName(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId AND UPPER(c.customer.name)=:name",
						SalesEntry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntriesByProductCode(String code) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<SalesEntry> lst = new ArrayList<SalesEntry>();
		HashSet<SalesEntry> hs = new HashSet<SalesEntry>();
		TypedQuery<SalesProductDetails> q = em
				.createQuery(
						"select c from SalesProductDetails c where c.salesEntry.companyInfo.id=:cId AND UPPER(c.purchase_Product_Details.productDetail.code)=:code ORDER BY c.id DESC",
						SalesProductDetails.class);

		q.setParameter("code", code.toUpperCase());
		q.setParameter("cId", cId);
		for (SalesProductDetails s : q.getResultList()) {
			lst.add(s.getSalesEntry());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
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

	public List<SalesProductDetails> getSales_Product_DetailsByProductIdAndCompany(
			int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesProductDetails> q = em
				.createQuery(
						"select s from SalesProductDetails s where s.salesEntry.companyInfo.id=:cId AND s.purchase_Product_Details.productDetail.id=:Id ORDER BY s.salesEntry.sales_date DESC ",
						SalesProductDetails.class);
		q.setParameter("Id", id);
		q.setParameter("cId", cId);
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

	public List<CustomerEntry> getAllCustomerEntry() {
		TypedQuery<CustomerEntry> q = em.createQuery(
				"select c from CustomerEntry c", CustomerEntry.class);
		return q.getResultList();
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
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where c.code=:code OR c.description=:description OR c.category.name=:name ",
						ProductDetail.class);
		q.setParameter("code", code);
		q.setParameter("description", description);
		q.setParameter("name", name);
		List<ProductDetail> listpro = new ArrayList<ProductDetail>();
		HashSet<ProductDetail> hash = new HashSet<ProductDetail>();
		for (ProductDetail pd : q.getResultList()) {
			for (Purchase_Product_Details ppd : pd
					.getPurchase_Product_Details()) {
				if (ppd.getCompanyInfo().getId() == cId) {
					listpro.add(ppd.getProductDetail());
				}
			}
		}
		hash.addAll(listpro);
		listpro.clear();
		listpro.addAll(hash);
		return listpro;
	}

	/******************************
	 * Search Job Assignment Details by ChallanID
	 ****************/

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

	public JobAssignmentDetails getJobAssignmentDetailsbyChallanNumberAndCompany(
			String challanNumber) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.companyInfo.id=:cId AND c.challanNumber=:challanNumber",
						JobAssignmentDetails.class);
		q.setParameter("challanNumber", challanNumber);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	/***************************** Search Sasles for return by ChallanID ****************/

	public SalesEntry getSalestDetailsbyChallanNumber(String challanNumber) {
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.challanNumber=:challanNumber",
						SalesEntry.class);
		q.setParameter("challanNumber", challanNumber);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}

	}

	/***************************** Sasles return ********************************************************/

	public void setSalesReturn(SalesReturn salesReturn) {
		em.persist(salesReturn);
	}

	public SalesReturn getSalesReturnDetailsById(int id) {
		return em.find(SalesReturn.class, id);
	}

	/*********************************************************** SalesProductReturnDetails ***********************/

	public void setSalesProductReturnDetails(
			SalesProductReturnDetail salesProductReturnDetail) {
		em.persist(salesProductReturnDetail);
	}

	public SalesProductReturnDetail getSalesProductReturnDetailsById(int id) {
		return em.find(SalesProductReturnDetail.class, id);
	}

	/**************** VoucherDetails ******************************************************************/
	public void setVoucherDetails(VoucherDetails voucherDetails) {
		em.persist(voucherDetails);
	}

	public VoucherDetails getVoucherDetailsById(int id) {
		return em.find(VoucherDetails.class, id);
	}

	/**************** VoucherAssign ******************************************************************/
	public void setVoucherAssign(VoucherAssign voucherAssign) {
		em.persist(voucherAssign);
	}

	public VoucherAssign getVoucherAssignById(int id) {
		return em.find(VoucherAssign.class, id);
	}

	public VoucherAssign getVoucherAssignByVendorId(int id) {
		TypedQuery<VoucherAssign> q = em.createQuery(
				"select c from VoucherAssign c where c.vendor.id=:id",
				VoucherAssign.class);
		q.setParameter("id", id);
		return q.getResultList().get(0);
	}

}
