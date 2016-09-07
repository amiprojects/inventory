package com.kaanish.ejb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
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
import com.kaanish.model.ApprovalEntry;
import com.kaanish.model.ApprovalProductDetails;
import com.kaanish.model.ApprovalReturn;
import com.kaanish.model.ApprovalReturnProductDetails;
import com.kaanish.model.Bill_setup;
import com.kaanish.model.Category;
import com.kaanish.model.City;
import com.kaanish.model.CompanyInfo;
import com.kaanish.model.Country;
import com.kaanish.model.CustomerEntry;
import com.kaanish.model.Department;
import com.kaanish.model.DesignImage;
import com.kaanish.model.Dngr;
import com.kaanish.model.ItemDetails;
import com.kaanish.model.ItmProductsForSample;
import com.kaanish.model.JobAssignmentDetails;
import com.kaanish.model.JobAssignmentJobDetails;
import com.kaanish.model.JobAssignmentProducts;
import com.kaanish.model.JobClass;
import com.kaanish.model.JobPlan;
import com.kaanish.model.JobPlanJobStock;
import com.kaanish.model.JobPlanProductStock;
import com.kaanish.model.JobPlanProducts;
import com.kaanish.model.JobReceiveJobDetails;
import com.kaanish.model.JobRecieveProductsDetails;
import com.kaanish.model.JobRecievedDetails;
import com.kaanish.model.JobStock;
import com.kaanish.model.JobTypes;
import com.kaanish.model.JobsForDesignCostSheet;
import com.kaanish.model.Module;
import com.kaanish.model.NotificationDetails;
import com.kaanish.model.NotificationView;
import com.kaanish.model.PageList;
import com.kaanish.model.PaymentDetails;
import com.kaanish.model.PaymentDetailsForViaAgents;
import com.kaanish.model.PaymentStatus;
import com.kaanish.model.PaymentType;
import com.kaanish.model.ProductDetail;
import com.kaanish.model.ProductImage;
import com.kaanish.model.ProductsForDesignCostSheet;
import com.kaanish.model.PurchaseOrderEntry;
import com.kaanish.model.PurchaseOrderProductdetails;
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
import com.kaanish.model.SampleDesignCostSheet;
import com.kaanish.model.SecurityAnswers;
import com.kaanish.model.SecurityQuestionGroup;
import com.kaanish.model.SequrityQuestions;
import com.kaanish.model.SerialNumber;
import com.kaanish.model.State;
import com.kaanish.model.Stoct;
import com.kaanish.model.SubDepartment;
import com.kaanish.model.Tax;
import com.kaanish.model.Tax_Type_Group;
import com.kaanish.model.URL;
import com.kaanish.model.UniqueName;
import com.kaanish.model.UserGroup;
import com.kaanish.model.Users;
import com.kaanish.model.Vendor;
import com.kaanish.model.VendorType;
import com.kaanish.model.VoucherAssign;
import com.kaanish.model.VoucherDetails;
import com.kaanish.model.VoucherDetailsForViaAgents;
import com.kaanish.util.DateConverter;
import com.kaanish.util.DigitToWords;
import com.kaanish.util.MRPtoLAXMIHOUSE;
import com.kaanish.util.Notification;

@Stateless
public class Ejb {
	@PersistenceContext
	private EntityManager em;
	@Inject
	private HttpSession httpSession;
	private int cId;

	public String getMRPlh(float mrp) {
		return MRPtoLAXMIHOUSE.getLaxmiHouse(mrp);
	}

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

	public String getFinancialYearByDate(String dat) {
		Date date = DateConverter.getDate(dat);
		LocalDateTime dt = LocalDateTime.ofInstant(date.toInstant(),
				ZoneId.systemDefault());
		if (dt.getMonthValue() < 4) {
			return (dt.getYear() - 1) + "-" + dt.getYear();
		} else {
			return dt.getYear() + "-" + (dt.getYear() + 1);
		}
	}

	public String getNumberToWords(int number) {
		return DigitToWords.convertNumberToWords(number);
	}

	/*********** for dngr ***************/
	public void setDngr(Dngr dngr) {
		em.persist(dngr);
	}

	public Dngr getDngrById(int id) {
		return em.find(Dngr.class, id);
	}

	public List<Dngr> getAllDngr() {
		TypedQuery<Dngr> q = em.createQuery("select c from Dngr c", Dngr.class);
		return q.getResultList();
	}

	/*********** for dngr ***************/

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

	public void updateStoct(Stoct s) {
		em.merge(s);
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

	/***************** for url **********************/
	public void setURL(URL url) {
		em.persist(url);
	}

	public void deleteURLById(int id) {
		em.remove(getURLById(id));
	}

	public URL getURLById(int id) {
		return em.find(URL.class, id);
	}

	public List<URL> getAllURL() {
		TypedQuery<URL> q = em.createQuery("select c from URL c", URL.class);
		return q.getResultList();
	}

	public void updateURL(URL u) {
		em.merge(u);
	}

	public URL getURL() {
		TypedQuery<URL> q = em.createQuery(
				"select c from URL c order by c.id DESC", URL.class);
		return q.getResultList().get(0);
	}

	/***************** for unique **********************/
	public void setUniqueName(UniqueName u) {
		em.persist(u);
	}

	public void deleteUniqueNameById(int id) {
		em.remove(getUniqueNameById(id));
	}

	public UniqueName getUniqueNameById(int id) {
		return em.find(UniqueName.class, id);
	}

	public List<UniqueName> getAllUniqueName() {
		TypedQuery<UniqueName> q = em.createQuery("select c from UniqueName c",
				UniqueName.class);
		return q.getResultList();
	}

	public void updateUniqueName(UniqueName u) {
		em.merge(u);
	}

	/***************** for ItemDetails **********************/
	public void setItemDetails(ItemDetails itemDetails) {
		em.persist(itemDetails);
	}

	public ItemDetails getItemDetailsById(int id) {
		return em.find(ItemDetails.class, id);
	}

	public void updateItemDetails(ItemDetails itemDetails) {
		em.merge(itemDetails);
	}

	public List<ItemDetails> getAllItemDetails() {
		TypedQuery<ItemDetails> q = em.createQuery(
				"select c from ItemDetails c", ItemDetails.class);
		return q.getResultList();
	}

	public List<ItemDetails> getItemsForSampleBySampleId(int id) {
		List<ItemDetails> lst = new ArrayList<ItemDetails>();
		Set<ItemDetails> hs = new HashSet<>();
		TypedQuery<ItmProductsForSample> q = em.createQuery(
				"select c from ItmProductsForSample c where c.sampleId=:id",
				ItmProductsForSample.class);
		q.setParameter("id", id);

		for (ItmProductsForSample p : q.getResultList()) {
			lst.add(p.getItemDetails());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	/***************** for ItmProductsForSample **********************/
	public void setItmProductsForSample(
			ItmProductsForSample itmProductsForSample) {
		em.persist(itmProductsForSample);
	}

	public ItmProductsForSample getItmProductsForSample(int id) {
		return em.find(ItmProductsForSample.class, id);
	}

	public void updateItmProductsForSample(
			ItmProductsForSample itmProductsForSample) {
		em.merge(itmProductsForSample);
	}

	public List<ItmProductsForSample> getAllItmProductsForSample() {
		TypedQuery<ItmProductsForSample> q = em.createQuery(
				"select c from ItmProductsForSample c",
				ItmProductsForSample.class);
		return q.getResultList();
	}

	public ItmProductsForSample getItmProductsForSampleByProductForDesignCostSheetId(
			int id) {
		TypedQuery<ItmProductsForSample> q = em
				.createQuery(
						"select c from ItmProductsForSample c where c.productForDesignCostSheetId=:id",
						ItmProductsForSample.class);
		q.setParameter("id", id);
		return q.getResultList().get(0);
	}

	public ItmProductsForSample getItmProductsForSampleByProductId(int id) {
		TypedQuery<ItmProductsForSample> q = em.createQuery(
				"select c from ItmProductsForSample c where c.productId=:id",
				ItmProductsForSample.class);
		q.setParameter("id", id);
		return q.getResultList().get(0);
	}

	public List<ItmProductsForSample> getItmProductsForSampleBySampleId(int id) {
		TypedQuery<ItmProductsForSample> q = em.createQuery(
				"select c from ItmProductsForSample c where c.sampleId=:id",
				ItmProductsForSample.class);
		q.setParameter("id", id);
		return q.getResultList();

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

	public void deleteUserById(String id) {
		em.remove(getUserById(id));
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

	public PageList getPageByName(String name) {
		TypedQuery<PageList> q = em.createQuery(
				"select c from PageList c where c.name=:name", PageList.class);
		q.setParameter("name", name);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
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

	public Module getModuleByName(String name) {
		TypedQuery<Module> q = em.createQuery(
				"select c from Module c where c.name=:name", Module.class);
		q.setParameter("name", name);
		return q.getResultList().get(0);
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

	public List<QtyUnit> getAllUOM() {
		TypedQuery<QtyUnit> q = em.createQuery("select c from QtyUnit c",
				QtyUnit.class);
		return q.getResultList();
	}

	/************** for payment status ***************/
	public void setPaymentStatus(PaymentStatus paymentStatus) {
		em.persist(paymentStatus);
	}

	public PaymentStatus getPaymentStatusById(int id) {
		return em.find(PaymentStatus.class, id);
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

	public PaymentType getPaymentTypeById(int id) {
		return em.find(PaymentType.class, id);
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

	/************** for payment details for via agents ***************/
	public void setPaymentDetails4ViaAgent(
			PaymentDetailsForViaAgents paymentDetails) {
		em.persist(paymentDetails);
	}

	public void deletePaymentDetails4ViaAgent(int id) {
		em.remove(getPaymentDetails4ViaAgentById(id));
	}

	public PaymentDetailsForViaAgents getPaymentDetails4ViaAgentById(int id) {
		return em.find(PaymentDetailsForViaAgents.class, id);
	}

	public void updatePaymentDetails4ViaAgent(
			PaymentDetailsForViaAgents paymentDetails) {
		em.merge(paymentDetails);
	}

	public List<PaymentDetailsForViaAgents> getAllPaymentDetails4ViaAgent() {
		TypedQuery<PaymentDetailsForViaAgents> q = em.createQuery(
				"select c from PaymentDetailsForViaAgents c",
				PaymentDetailsForViaAgents.class);

		return q.getResultList();
	}

	public int getLastUniqueNoOfPayDet4ViaAgent() {
		TypedQuery<PaymentDetailsForViaAgents> q = em
				.createQuery(
						"select c from PaymentDetailsForViaAgents c order by c.id desc",
						PaymentDetailsForViaAgents.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getUniqueNo();
		} else {
			return 0;
		}
	}

	public List<PaymentDetailsForViaAgents> getPaymentDetails4ViaAgentBySalesEntryId(
			int id) {
		TypedQuery<PaymentDetailsForViaAgents> q = em
				.createQuery(
						"select c from PaymentDetailsForViaAgents c where c.salesEntryId=:id order by c.id desc",
						PaymentDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<PaymentDetailsForViaAgents> getPaymentDetails4ViaAgentBySalesReturnId(
			int id) {
		TypedQuery<PaymentDetailsForViaAgents> q = em
				.createQuery(
						"select c from PaymentDetailsForViaAgents c where c.salesReturnId=:id order by c.id desc",
						PaymentDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<PaymentDetailsForViaAgents> getPaymentDetails4ViaAgentByPurchaseEntryId(
			int id) {
		TypedQuery<PaymentDetailsForViaAgents> q = em
				.createQuery(
						"select c from PaymentDetailsForViaAgents c where c.purchaseEntryId=:id order by c.id desc",
						PaymentDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<PaymentDetailsForViaAgents> getPaymentDetails4ViaAgentByPurchaseReturnId(
			int id) {
		TypedQuery<PaymentDetailsForViaAgents> q = em
				.createQuery(
						"select c from PaymentDetailsForViaAgents c where c.purchaseReturnId=:id order by c.id desc",
						PaymentDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/************** for payment details for via agents ***************/

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

	public List<PaymentDetails> getAllPaymentDetailsAsc() {
		TypedQuery<PaymentDetails> q = em.createQuery(
				"select c from PaymentDetails c order by c.id asc",
				PaymentDetails.class);
		return q.getResultList();
	}

	public int getLastUniqueNoOfPayDet() {
		TypedQuery<PaymentDetails> q = em.createQuery(
				"select c from PaymentDetails c order by c.id desc",
				PaymentDetails.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getUniqueNo();
		} else {
			return 0;
		}
	}

	public void updatePaymentDetails(PaymentDetails paymentDetails) {
		em.merge(paymentDetails);
	}

	public List<PaymentDetails> getPaymentDetailsByJobAssignId(int id) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.jobAssignId=:id order by c.id desc",
						PaymentDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsByPurchaseReturnId(int prId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.purchaseReturn.id=:prId order by c.id ASC",
						PaymentDetails.class);
		q.setParameter("prId", prId);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsByPurchaseEntryId(int peId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.purchase_Entry.id=:peId order by c.id DESC",
						PaymentDetails.class);
		q.setParameter("peId", peId);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsByPurchaseEntryIdAsc(int peId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.purchase_Entry.id=:peId order by c.id ASC",
						PaymentDetails.class);
		q.setParameter("peId", peId);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsBySalesEntryId(int seId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.salesEntry.id=:seId order by c.id DESC",
						PaymentDetails.class);
		q.setParameter("seId", seId);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsByJobAsignId(int jaId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.jobAssignId=:jaId order by c.id DESC",
						PaymentDetails.class);
		q.setParameter("jaId", jaId);
		return q.getResultList();
	}

	public List<PaymentDetails> getPaymentDetailsBySalesReturnId(int srId) {
		TypedQuery<PaymentDetails> q = em
				.createQuery(
						"select c from PaymentDetails c where c.salesReturn.id=:srId order by c.id ASC",
						PaymentDetails.class);
		q.setParameter("srId", srId);
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

	/**********************************************
	 * search UOM by name
	 ************************************************/

	public List<QtyUnit> getAllQtyUnitByNameOrAbv(String name) {
		TypedQuery<QtyUnit> q = em
				.createQuery(
						"select c from QtyUnit c where UPPER(c.name) like :nm OR UPPER(c.abbreviation) like :av",
						QtyUnit.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		q.setParameter("av", name.toUpperCase() + "%");
		return q.getResultList();
	}

	/************************
	 * Product detail Search By Code
	 ********************************************/

	public List<ProductDetail> getAllProductByProductCode(String code) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.code) like :nm order by c.code asc",
						ProductDetail.class);
		q.setParameter("nm", code.toUpperCase() + "%");

		return q.getResultList();
	}

	/************************
	 * Product Search By Code
	 ********************************************/

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

	public ProductDetail getProductByDesignNo(String dNo) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.universalCode) = :dNo ",
						ProductDetail.class);
		q.setParameter("dNo", dNo.toUpperCase());

		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	/*****************************
	 * Product Search By Category
	 ************************************/

	public List<ProductDetail> getAllProductByCategory(String cat) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.category.name) like :nm ",
						ProductDetail.class);
		q.setParameter("nm", cat.toUpperCase() + "%");

		return q.getResultList();
	}

	/******************************
	 * Product Search By Description
	 ************************************/

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

	public List<Tax_Type_Group> getAllActiveTax_Type_Groups() {
		TypedQuery<Tax_Type_Group> q = em.createQuery(
				"select s from Tax_Type_Group s where s.isActive=true",
				Tax_Type_Group.class);
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

	public List<Vendor> getAllVendorsByType(String type) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where UPPER(c.vendorType.type)=:type",
				Vendor.class);
		q.setParameter("type", type.toUpperCase());
		return q.getResultList();
	}

	public List<Vendor> getAllVendorsByAssendingMaxPurchase(String type) {
		List<Vendor> vendors = new ArrayList<Vendor>();
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where UPPER(c.vendorType.type)=:type",
				Vendor.class);
		q.setParameter("type", type.toUpperCase());

		vendors = q.getResultList();
		vendors.sort((Vendor v2, Vendor v1) -> Float.compare(
				v1.getTotPurchase(), v2.getTotPurchase())); // sort
															// by
															// lamda
															// expression
		return vendors;
	}

	public List<Vendor> getAllAgentsByAssendingMaxSale() {
		List<Vendor> vendors = new ArrayList<Vendor>();
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type='Sales Agent'",
				Vendor.class);

		vendors = q.getResultList();
		vendors.sort((Vendor v2, Vendor v1) -> Float.compare(v1.getTotSale(),
				v2.getTotSale())); // sort
									// by
									// lamda
									// expression
		return vendors;
	}

	public List<Vendor> getVendorsByVendorTypeIdByName(int id, String nm) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.id=:Id AND UPPER(c.name) LIKE :name ORDER BY c.id ASC",
						Vendor.class);
		q.setParameter("Id", id);
		q.setParameter("name", nm.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeId(int id) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.id=:Id",
				Vendor.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<Vendor> getVendorByTypeAndName(String type, String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where UPPER(c.name) like :name and UPPER(c.vendorType.type)=:type",
						Vendor.class);
		q.setParameter("name", name.toUpperCase() + "%");
		q.setParameter("type", type.toUpperCase());
		return q.getResultList();
	}

	public Vendor getVendorByVendorTypeAndName(String type, String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where UPPER(c.name) like :name and UPPER(c.vendorType.type)=:type",
						Vendor.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("type", type.toUpperCase());
		return q.getResultList().get(0);
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
		q.setParameter("nm", name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeDesignerAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Designer' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeVendorAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Vendor' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypePurchaseAgentAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Purchase Agent' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getVendorsByVendorTypeSalesAgentAndName(String name) {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Sales Agent' and UPPER(c.name) like :nm",
						Vendor.class);
		q.setParameter("nm", name.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<Vendor> getAllAgenttypePurchaseAgent() {
		TypedQuery<Vendor> q = em
				.createQuery(
						"select c from Vendor c where c.vendorType.type='Purchase Agent'",
						Vendor.class);

		return q.getResultList();
	}

	public List<Vendor> getAllAgenttypeSalesAgent() {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type='Sales Agent'",
				Vendor.class);

		return q.getResultList();
	}

	public List<Vendor> getAllVendtypeVen() {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type='Vendor'",
				Vendor.class);

		return q.getResultList();
	}

	public List<Vendor> getVendorsWithVendorTypeJobberByProductID(String jobber) {
		TypedQuery<Vendor> q = em.createQuery(
				"select c from Vendor c where c.vendorType.type=:jobber",
				Vendor.class);
		q.setParameter("jobber", jobber);
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

	public VendorType getVendorTypeByName(String name) {
		TypedQuery<VendorType> q = em.createQuery(
				"select c from VendorType c where c.type=:name",
				VendorType.class);
		q.setParameter("name", name);
		return q.getResultList().get(0);
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

	public void updatePurchaseEntry(Purchase_Entry purchaseEntry) {
		em.merge(purchaseEntry);
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

	public List<PurchaseOrderEntry> getPurchaseOrderByChallanNo(String chNo) {
		TypedQuery<PurchaseOrderEntry> q = em
				.createQuery(
						"select c from PurchaseOrderEntry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						PurchaseOrderEntry.class);
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

	public List<Purchase_Entry> getPurchaseEntryByViaAgentId(int id) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.agentId=:id ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("id", id);
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
						"select c from Purchase_Product_Details c where c.purchase_Entry.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:name and c.purchase_Entry!=null ORDER BY c.purchase_Entry.id DESC",
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
						"select c from Purchase_Product_Details c where UPPER(c.productDetail.code)=:name and c.purchase_Entry!=null ORDER BY c.purchase_Entry.id DESC",
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

	public List<Purchase_Entry> getPurchaseEntryByProductId(int id) {
		List<Purchase_Entry> lst = new ArrayList<Purchase_Entry>();
		Set<Purchase_Entry> hs = new HashSet<>();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:id and c.purchase_Entry!=null ORDER BY c.id DESC",
						Purchase_Product_Details.class);
		q.setParameter("id", id);

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

	public int getLastPurchaseChallanNumberByFinantialYr(String fyear) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.challanNumber like :chNo order by c.id DESC ",
						Purchase_Entry.class);
		q.setParameter("chNo", "%" + fyear + "%");
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallan_no();
		} else {
			return 0;
		}

	}

	public int getLastPurchaseOrderChallanNumberByCompany(int cId) {
		TypedQuery<PurchaseOrderEntry> q = em
				.createQuery(
						"select c from PurchaseOrderEntry c WHERE c.companyInfo.id=:cId ORDER BY c.id DESC",
						PurchaseOrderEntry.class);
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
			if (getLastBillSetupBySufix("PUR") == null) {
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
			if (getLastBillSetupBySufix("PUR") == null) {
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
			if (getLastBillSetupBySufixAndCompanyId("PUR", cId) == null) {
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
			if (getLastBillSetupBySufixAndCompanyId("PUR", cId) == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"PUR", cId).getSufix());
			}
		}
	}

	public int getLastPurchaseOrderChallanSuffixByCompany(int cId) {
		TypedQuery<PurchaseOrderEntry> q = em
				.createQuery(
						"select c from PurchaseOrderEntry c WHERE c.companyInfo.id=:cId ORDER BY c.id DESC",
						PurchaseOrderEntry.class);
		q.setParameter("cId", cId);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufixAndCompanyId("PURO", cId) == null) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"PURO", cId).getSufix()) < s) {
					return s;
				} else {
					return Integer
							.parseInt((getLastBillSetupBySufixAndCompanyId(
									"PURO", cId).getSufix()));
				}
			}
		} else {
			if (getLastBillSetupBySufixAndCompanyId("PURO", cId) == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"PURO", cId).getSufix());
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
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c where c.companyInfo.id=:cId ORDER BY c.id DESC",
						Purchase_Entry.class);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

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

	public List<String> getAllFinancialForPurchaseReturn() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (PurchaseReturn pr : getAllPurchaseReturn()) {
			lst.add(pr.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public List<String> getAllFinancialForPurchaseOrder() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (PurchaseOrderEntry poe : getAllPurchaseOrderEntry()) {
			lst.add(poe.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public List<Purchase_Entry> getAllPurchaseEntryByVendorIdTypeVendor(int id) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c Where c.vendor.vendorType.type='Vendor' and c.vendor.id = :id",
						Purchase_Entry.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	public List<PurchaseReturn> getAllPurchaseReturnByVendorIdTypeVendor(int id) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c Where c.purchaseEntry.vendor.vendorType.type='Vendor' and c.purchaseEntry.vendor.id = :id",
						PurchaseReturn.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	public List<Purchase_Entry> getAllPurchaseEntryByVendorIdTypePurchaseAgent(
			int id) {
		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c Where c.vendor.vendorType.type='Purchase Agent' and c.vendor.id = :id",
						Purchase_Entry.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	public List<PurchaseReturn> getAllPurchaseReturnByVendorIdTypePurchaseAgent(
			int id) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c Where c.purchaseEntry.vendor.vendorType.type='Purchase Agent' and c.purchaseEntry.vendor.id = :id",
						PurchaseReturn.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	public List<SalesEntry> getAllSalesEntryByVendorIdTypeSalesAgent(int id) {
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c Where c.vendor.vendorType.type='Sales Agent' and c.vendor.id = :id",
						SalesEntry.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	public List<SalesReturn> getAllSalesReturnByVendorIdTypeSalesAgent(int id) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c Where c.salesEntry.vendor.vendorType.type='Sales Agent' and c.salesEntry.vendor.id = :id",
						SalesReturn.class);
		q.setParameter("id", id);
		return q.getResultList();

	}

	/***************** for Purchase Return ***********************/
	public void setPurchaseReturn(PurchaseReturn purchaseReturn) {
		em.persist(purchaseReturn);
	}

	public void updatePurchaseReturn(PurchaseReturn purchaseReturn) {
		em.merge(purchaseReturn);
	}

	public PurchaseReturn getPurchaseReturnById(int id) {
		return em.find(PurchaseReturn.class, id);
	}

	public List<PurchaseReturn> getAllPurchaseReturnDesc() {
		TypedQuery<PurchaseReturn> q = em.createQuery(
				"select c from PurchaseReturn c order by c.id desc",
				PurchaseReturn.class);
		return q.getResultList();
	}

	public int getLastPurchaseReturnChallanNumber() {
		TypedQuery<PurchaseReturn> q = em.createQuery(
				"select c from PurchaseReturn c ORDER BY c.id DESC",
				PurchaseReturn.class);
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
			if (getLastBillSetupBySufix("RPUR") == null) {
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
			if (getLastBillSetupBySufix("RPUR") == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("RPUR")
						.getSufix());
			}
		}
	}

	public List<PurchaseReturn> getPurchaseReturnByDate(Date startDate,
			Date endDate) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c WHERE c.returnDate BETWEEN :startDate AND :endDate ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByChallanNo(String chNo) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByReferenceChallanNo(
			String chNo) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c where UPPER(c.purchaseEntry.challanNumber)=:chNo ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByProductCode(String name) {
		List<PurchaseReturn> lst = new ArrayList<PurchaseReturn>();
		Set<PurchaseReturn> hs = new HashSet<>();
		TypedQuery<PurchaseReturnProductDetails> q = em
				.createQuery(
						"select c from PurchaseReturnProductDetails c where UPPER(c.purchaseProductDetails.productDetail.code)=:name ORDER BY c.purchaseReturn.id DESC",
						PurchaseReturnProductDetails.class);
		q.setParameter("name", name.toUpperCase());
		for (PurchaseReturnProductDetails p : q.getResultList()) {
			lst.add(p.getPurchaseReturn());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<PurchaseReturn> getPurchaseReturnByVendorName(String name) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c where c.purchaseEntry.vendor.vendorType.type='Vendor' and UPPER(c.purchaseEntry.vendor.name)=:name ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByAgentName(String name) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c where c.purchaseEntry.vendor.vendorType.type='Purchase Agent' and UPPER(c.purchaseEntry.vendor.name)=:name ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByViaAgentId(int id) {
		TypedQuery<PurchaseReturn> q = em
				.createQuery(
						"select c from PurchaseReturn c where c.purchaseEntry.agentId=:id ORDER BY c.id DESC",
						PurchaseReturn.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/*****************
	 * for Purchase Product Return Details
	 ***********************/
	public void setPurchaseProdReturnDetails(
			PurchaseReturnProductDetails purchaseReturnProductDetails) {
		em.persist(purchaseReturnProductDetails);
	}

	public List<PurchaseReturnProductDetails> getAllPurchaseReturnProductDetailsByPurchaseEntryId(
			int id) {
		TypedQuery<PurchaseReturnProductDetails> q = em
				.createQuery(
						"select c from PurchaseReturnProductDetails c where c.purchaseReturn.purchaseEntry.id=:id order by c.id asc",
						PurchaseReturnProductDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/***************** for Job Assignment ***********************/
	public void setJobAssignment(JobAssignmentDetails jobAssignmentDetails) {
		em.persist(jobAssignmentDetails);
	}

	public void deleteJobAssignmentDetailsById(int id) {
		em.remove(getJobAssignmentDetailsByID(id));
	}

	public JobAssignmentDetails getJobAssignmentDetailsByID(int id) {
		return em.find(JobAssignmentDetails.class, id);
	}

	public JobAssignmentDetails getOngoingJobAssignmentsByPlanId(int pid) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.jobPlan.id=:pid ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("pid", pid);
		return q.getResultList().get(0);
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
			if (getLastBillSetupBySufix("JOB") == null) {
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
			if (getLastBillSetupBySufix("JOB") == null) {
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
			if (getLastBillSetupBySufixAndCompany("JOB") == null) {
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
			if (getLastBillSetupBySufixAndCompany("JOB") == null) {
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

	public List<JobAssignmentDetails> getJobAsignmentByDate(Date startDate,
			Date endDate) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c WHERE c.assignDate BETWEEN :startDate AND :endDate",
						JobAssignmentDetails.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
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

	public List<JobAssignmentDetails> getJobAssignByJoberName(String name) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.vendor.vendorType.type='Jobber' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getJobAssignByPlanNumber(int id) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where c.jobPlan.id=:id order by c.id desc",
						JobAssignmentDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getJobAssignByProductCode(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<JobAssignmentDetails> lst = new ArrayList<JobAssignmentDetails>();
		Set<JobAssignmentDetails> hs = new HashSet<>();
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where c.jobAssignmentDetails.companyInfo.id=:cId AND UPPER(c.purchase_Product_Details.productDetail.code)=:name ORDER BY c.jobAssignmentDetails.id DESC",
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

	public List<JobAssignmentDetails> getJobAssignByProdCode(String name) {
		List<JobAssignmentDetails> lst = new ArrayList<JobAssignmentDetails>();
		Set<JobAssignmentDetails> hs = new HashSet<>();
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where UPPER(c.productsForDesignCostSheet.productDetail.code)=:name ORDER BY c.jobAssignmentDetails.id DESC",
						JobAssignmentProducts.class);
		q.setParameter("name", name.toUpperCase());
		for (JobAssignmentProducts p : q.getResultList()) {
			lst.add(p.getJobAssignmentDetails());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<JobAssignmentDetails> getJobAssignByDesignNumber(String name) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where UPPER(c.jobPlan.designCostSheet.designNumber)=:name ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<JobAssignmentDetails> getAllJobassignmentDetails() {
		TypedQuery<JobAssignmentDetails> q = em.createQuery(
				"select c from JobAssignmentDetails c order by c.id desc",
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

	/***************** for Job Assignment Job ***********************/
	public void setJobAssignmentJobDetails(
			JobAssignmentJobDetails jobAssignmentJobDetails) {
		em.persist(jobAssignmentJobDetails);
	}

	public void deleteJobAssignmentJobDetailsById(int id) {
		em.remove(getJobAssignmentJobDetailsById(id));
	}

	public List<JobAssignmentJobDetails> getAllJobAssignmentJobDetails() {
		TypedQuery<JobAssignmentJobDetails> q = em.createQuery(
				"select c from JobAssignmentJobDetails c",
				JobAssignmentJobDetails.class);
		return q.getResultList();
	}

	public JobAssignmentJobDetails getJobAssignmentJobDetailsById(int id) {
		return em.find(JobAssignmentJobDetails.class, id);
	}

	public void updateJobAssignmentJobDetails(
			JobAssignmentJobDetails jobAssignmentJobDetails) {
		em.merge(jobAssignmentJobDetails);
	}

	public JobAssignmentJobDetails getJobAssignmentJobDetailsByJobPlanJobIdAndJobAssignmentId(
			int jpjsId, int jaId) {
		TypedQuery<JobAssignmentJobDetails> q = em
				.createQuery(
						"select c from JobAssignmentJobDetails c where c.jobPlanJobStock.id=:jpjsId AND c.jobAssignmentDetails.id=:jaId",
						JobAssignmentJobDetails.class);
		q.setParameter("jpjsId", jpjsId);
		q.setParameter("jaId", jaId);
		return q.getResultList().get(0);
	}

	/***************** for Job Assignment Products ***********************/
	public void setJobAssignmentProducts(
			JobAssignmentProducts jobAssignmentProducts) {
		em.persist(jobAssignmentProducts);
	}

	public void deleteJobAssignmentProductsById(int id) {
		em.remove(getJobAssignmentProductById(id));
	}

	public void updateJobAssignmentProductDetails(
			JobAssignmentProducts jobAssignmentProducts) {
		em.merge(jobAssignmentProducts);

	}

	public JobAssignmentProducts getJobAssignmentProductById(int id) {
		return em.find(JobAssignmentProducts.class, id);
	}

	public JobAssignmentProducts getJobAssignmentProductsByJobPlanProductIdAndJobAssignmentId(
			int id, int jaId) {
		TypedQuery<JobAssignmentProducts> q = em
				.createQuery(
						"select c from JobAssignmentProducts c where c.jobPlanProducts.id=:id AND c.jobAssignmentDetails.id=:jaId",
						JobAssignmentProducts.class);
		q.setParameter("id", id);
		q.setParameter("jaId", jaId);
		return q.getResultList().get(0);
	}

	// to get last JobAssignmentProducts
	public JobAssignmentProducts getJobAssignmentProductDetailsByproductAndJobPlanId(
			int id, int jpId) {
		TypedQuery<JobPlanProductStock> q = em
				.createQuery(
						"select c from JobPlanProductStock c where c.purchase_Product_Details.productDetail.id=:id and c.jobPlan.id=:jpId",
						JobPlanProductStock.class);
		q.setParameter("id", id);
		q.setParameter("jpId", jpId);
		return q.getResultList().get(0).getJobAssignmentProducts();
	}

	public JobAssignmentJobDetails getJobAssignmentJobDetailsByJobAssignmentProductIdAndJobsForDesignCostSheetId(
			int japId, int jsId) {
		TypedQuery<JobAssignmentJobDetails> q = em
				.createQuery(
						"select c from JobAssignmentJobDetails c where c.assignmentProducts.id=:japId and c.jobPlanJobStock.jobsForDesignCostSheet.id=:jsId",
						JobAssignmentJobDetails.class);
		q.setParameter("japId", japId);
		q.setParameter("jsId", jsId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public JobAssignmentJobDetails getJobAssignmentJobDetailsByPlanIdAndJobsForDesignCostSheetId(
			int japId, int jsId) {
		TypedQuery<JobAssignmentJobDetails> q = em
				.createQuery(
						"select c from JobAssignmentJobDetails c where c.jobPlan.id=:japId and c.jobPlanJobStock.jobsForDesignCostSheet.id=:jsId order by c.id desc",
						JobAssignmentJobDetails.class);
		q.setParameter("japId", japId);
		q.setParameter("jsId", jsId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public float getTotalProductCostInJobPlanProductStockBySampleProductIdAndPlanId(
			int spId, int jpId) {
		TypedQuery<JobPlanProductStock> q = em
				.createQuery(
						"select c from JobPlanProductStock c where c.productsForDesignCostSheet.id=:spId and c.jobPlan.id=:jpId",
						JobPlanProductStock.class);
		q.setParameter("spId", spId);
		q.setParameter("jpId", jpId);
		float tot = 0;
		for (int i = 0; i < q.getResultList().size(); i++) {
			tot = tot
					+ q.getResultList().get(i).getQty()
					* q.getResultList().get(i).getPurchase_Product_Details()
							.getCost();
		}
		return tot;
	}

	public List<JobPlanProductStock> getJobPlanProductStockBySampleProductIdAndPlanId(
			int spId, int jpId) {
		TypedQuery<JobPlanProductStock> q = em
				.createQuery(
						"select c from JobPlanProductStock c where c.productsForDesignCostSheet.id=:spId and c.jobPlan.id=:jpId",
						JobPlanProductStock.class);
		q.setParameter("spId", spId);
		q.setParameter("jpId", jpId);
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

	public List<Purchase_Product_Details> getInitialPurchase_Product_DetailsByProductId(
			int id) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select s from Purchase_Product_Details s where s.productDetail.id=:Id and s.initialInventory=:initialInventory",
						Purchase_Product_Details.class);
		q.setParameter("Id", id);
		q.setParameter("initialInventory", true);
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
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:cd and c.remaining_quantity>0 and c.productDetail.isSaleble=:salable and c.purchase_Entry.purchase_date<=:date ORDER BY c.id ASC",
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

	public List<Purchase_Product_Details> getPurchaseProductDetailsByProductCode(
			String code, Date date) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<Purchase_Product_Details> lst = new ArrayList<Purchase_Product_Details>();

		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:cd and c.remaining_quantity>0 and c.purchase_Entry.purchase_date<=:date ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q.setParameter("cd", code.toUpperCase());
		q.setParameter("date", date);
		q.setParameter("cId", cId);

		lst = q.getResultList();

		TypedQuery<Purchase_Product_Details> q1 = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.companyInfo.id=:cId AND UPPER(c.productDetail.code)=:cd and c.remaining_quantity>0 and c.initialInventory=true ORDER BY c.id ASC",
						Purchase_Product_Details.class);
		q1.setParameter("cd", code.toUpperCase());
		q1.setParameter("cId", cId);

		for (Purchase_Product_Details ppd : q1.getResultList()) {
			lst.add(ppd);
		}

		return lst;
	}

	public List<ProductDetail> getProductDetailsByDesignNumberAndQuantity(
			int dId, int qty) {
		SampleDesignCostSheet sdcs = getSampleDesignCostSheetById(dId);
		List<ProductDetail> pdArr = new ArrayList<>();
		for (ProductsForDesignCostSheet pd : sdcs
				.getProductsForDesignCostSheets()) {
			pdArr.add(pd.getProductDetail());
		}

		return pdArr;
	}

	public ProductDetail getProductDetailByDesignNumber(String dNo) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.universalCode)=:dNo",
						ProductDetail.class);
		q.setParameter("dNo", dNo.toUpperCase());
		return q.getResultList().get(0);
	}

	public boolean isExistProductDetailByDesignNumber(String dNo) {
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.universalCode)=:dNo",
						ProductDetail.class);
		q.setParameter("dNo", dNo.toUpperCase());
		if (q.getResultList().size() > 0) {
			return true;
		} else {
			return false;
		}
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

	public List<Purchase_Product_Details> getPurchaseProductDetailsByProductIdAsc(
			int pId) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:pId order by c.id asc",
						Purchase_Product_Details.class);
		q.setParameter("pId", pId);
		return q.getResultList();
	}

	public Purchase_Product_Details getLastPurchaseProductDetailsByProductId(
			int pId) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:pId order by c.id desc",
						Purchase_Product_Details.class);
		q.setParameter("pId", pId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public String getLastLotNoByProductId(int pId) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:pId order by c.id desc",
						Purchase_Product_Details.class);
		q.setParameter("pId", pId);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getLotNumber();
		} else {
			return "0";
		}
	}

	public Purchase_Product_Details getPurchaseProductDetailsByLotNumber(
			String lotNo) {
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where UPPER(c.lotNumber) = :lotNo ",
						Purchase_Product_Details.class);
		q.setParameter("lotNo", lotNo.toUpperCase());
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	/********************* for job recieve *********************/
	public void setJobRecieve(JobRecievedDetails jobRecievedDetails) {
		em.persist(jobRecievedDetails);
	}

	public JobRecievedDetails getJobRecievedDetailsById(int id) {
		return em.find(JobRecievedDetails.class, id);
	}

	public List<JobRecievedDetails> getAllJobRecievedDetails() {
		TypedQuery<JobRecievedDetails> q = em.createQuery(
				"select c from JobRecievedDetails c", JobRecievedDetails.class);
		return q.getResultList();
	}

	public int getLastJobReChallanNumber() {
		TypedQuery<JobRecievedDetails> q = em.createQuery(
				"select c from JobRecievedDetails c ORDER BY c.id DESC",
				JobRecievedDetails.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallanNo();
		} else {
			return 0;
		}
	}

	public int getLastJobReChallanSuffix() {
		TypedQuery<JobRecievedDetails> q = em.createQuery(
				"select c from JobRecievedDetails c ORDER BY c.id DESC",
				JobRecievedDetails.class);
		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("JOBR") == null) {
				return s;
			} else {
				if (Integer
						.parseInt(getLastBillSetupBySufix("JOBR").getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix("JOBR")
							.getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("JOBR") == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix("JOBR")
						.getSufix());
			}
		}
	}

	/*********************
	 * for job Receive Product Details
	 *********************/
	public void setJobRecieveProductsDetails(
			JobRecieveProductsDetails jobRecieveProductsDetails) {
		em.persist(jobRecieveProductsDetails);
	}

	public List<JobRecieveProductsDetails> getAllJobRecieveProductsDetails() {
		TypedQuery<JobRecieveProductsDetails> q = em.createQuery(
				"select c from JobRecieveProductsDetails c",
				JobRecieveProductsDetails.class);
		return q.getResultList();
	}

	/********************
	 * for Job Receive Job Details
	 *******************************/
	public void setJobReceiveJobDetails(
			JobReceiveJobDetails jobReceiveJobDetails) {
		em.persist(jobReceiveJobDetails);
	}

	public JobReceiveJobDetails getJobReceiveJobDetailsById(int id) {
		return em.find(JobReceiveJobDetails.class, id);
	}

	public void deleteJobReceiveJobDetailsById(int id) {
		em.remove(getJobReceiveJobDetailsById(id));
	}

	public void updateJobReceiveJobDetails(
			JobReceiveJobDetails jobReceiveJobDetails) {
		em.merge(jobReceiveJobDetails);
	}

	public List<JobReceiveJobDetails> getAllJobReceiveJobDetails() {
		TypedQuery<JobReceiveJobDetails> q = em.createQuery(
				"select c from JobReceiveJobDetails c",
				JobReceiveJobDetails.class);
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

	public List<Category> getAllCategoryByCategoryName(String catName) {
		TypedQuery<Category> q = em.createQuery(
				"select s from Category s where upper(s.name) like :catName",
				Category.class);
		q.setParameter("catName", catName.toUpperCase() + "%");
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

	public List<ProductDetail> getAllProductDetailByAssendingProduct() {
		TypedQuery<ProductDetail> q = em.createQuery(
				"select c from ProductDetail c ORDER BY c.code ASC",
				ProductDetail.class);
		return q.getResultList();
	}

	public List<ProductDetail> getAllProductDetailByCompany() {
		Users usr = getUserById((String) httpSession.getAttribute("user"));
		// TypedQuery<ProductDetail> q =
		// em.createQuery("select c from ProductDetail c", ProductDetail.class);
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
		q.setParameter("nm", name.toUpperCase() + "%");
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
		query.setParameter("codeName", nm.toUpperCase() + "%");
		query.setParameter("sal", true);
		query.setParameter("cId", cId);
		lst = query.getResultList();
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where c.rawMaterialsStock.companyInfo.id=:cId AND c.isSaleble=:sal AND c.rawMaterialsStock.remainingQty>0 AND UPPER(c.code) like :codeName",
						ProductDetail.class);
		q.setParameter("sal", true);
		q.setParameter("cId", cId);
		q.setParameter("codeName", nm.toUpperCase() + "%");
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
		// TypedQuery<CompanyInfo> q = em.createQuery(
		// "Select c from CompanyInfo c order by c.id DESC",
		// CompanyInfo.class);
		// if (q.getResultList().size() > 0) {
		// return q.getResultList().get(0);
		// } else {
		// return null;
		// }

		CompanyInfo compInfo = getUserById(
				(String) httpSession.getAttribute("user")).getCompanyInfo();
		return compInfo;

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

	public List<ReadyGoodsStock> getAllReadyGoodStockDetails() {
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
			if (getLastBillSetupBySufix("SRINV") == null) {
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
			if (getLastBillSetupBySufix("SRINV") == null) {
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

	public int getLastApprovalChallanNumber() {
		TypedQuery<ApprovalEntry> q = em.createQuery(
				"select c from ApprovalEntry c ORDER BY c.id DESC",
				ApprovalEntry.class);
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
			if (getLastBillSetupBySufix("INV") == null) {
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
			if (getLastBillSetupBySufix("INV") == null) {
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
			if (getLastBillSetupBySufixAndCompanyId("INV", cId) == null) {
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
			if (getLastBillSetupBySufixAndCompanyId("INV", cId) == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"INV", cId).getSufix());
			}
		}
	}

	public int getLastApprovalChallanSuffix() {
		TypedQuery<ApprovalEntry> q = em.createQuery(
				"select c from ApprovalEntry c ORDER BY c.id DESC",
				ApprovalEntry.class);

		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufixAndCompanyId("APPROVAL", cId) == null) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"APPROVAL", cId).getSufix()) < s) {
					return s;
				} else {
					return Integer
							.parseInt(getLastBillSetupBySufixAndCompanyId(
									"APPROVAL", cId).getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufixAndCompanyId("APPROVAL", cId) == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufixAndCompanyId(
						"APPROVAL", cId).getSufix());
			}
		}
	}

	public List<SalesEntry> getSalesEntryByDate(Date startDate, Date endDate) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c WHERE c.companyInfo.id=:cId AND c.sales_date BETWEEN :startDate AND :endDate order by c.id desc",
						SalesEntry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getAgeingPurProductDetailsBet45and90daysbyproId(
			int id) {
		LocalDateTime dateTime = LocalDateTime.now();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:id and c.remaining_quantity>0 and c.purchase_Entry.purchase_date<:date1 and c.purchase_Entry.purchase_date>:date2 ",
						Purchase_Product_Details.class);
		q.setParameter(
				"date1",
				Date.from(dateTime.minusDays(45).toInstant(
						ZoneOffset.ofHoursMinutes(5, 30))));
		q.setParameter(
				"date2",
				Date.from(dateTime.minusDays(90).toInstant(
						ZoneOffset.ofHoursMinutes(5, 30))));
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getAgeingPurProductDetailsLes45daysbyproId(
			int id) {
		LocalDateTime dateTime = LocalDateTime.now();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:id and c.remaining_quantity>0 and c.purchase_Entry.purchase_date>:date1 ",
						Purchase_Product_Details.class);
		q.setParameter(
				"date1",
				Date.from(dateTime.minusDays(45).toInstant(
						ZoneOffset.ofHoursMinutes(5, 30))));
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<Purchase_Product_Details> getAgeingPurProductDetailsGre90daysbyproId(
			int id) {
		LocalDateTime dateTime = LocalDateTime.now();
		TypedQuery<Purchase_Product_Details> q = em
				.createQuery(
						"select c from Purchase_Product_Details c where c.productDetail.id=:id and c.remaining_quantity>0 and c.purchase_Entry.purchase_date<:date2 ",
						Purchase_Product_Details.class);
		q.setParameter(
				"date2",
				Date.from(dateTime.minusDays(90).toInstant(
						ZoneOffset.ofHoursMinutes(5, 30))));
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<VoucherDetails> getLastVoucherDetailsbyCustomerId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(

						"select s from VoucherDetails s where s.voucherAssign.customerEntry.id=:Id ORDER BY s.id ASC",
						VoucherDetails.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<VoucherDetails> getVoucherDetailsbyCustomerId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(

						"select s from VoucherDetails s where s.voucherAssign.customerEntry.id=:Id ORDER BY s.id ASC",
						VoucherDetails.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	public List<VoucherDetails> getDescendingVoucherDetailsbyCustomerId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(

						"select s from VoucherDetails s where s.voucherAssign.customerEntry.id=:Id ORDER BY s.id desc",
						VoucherDetails.class);
		q.setParameter("Id", id);
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
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c WHERE c.companyInfo.id=:cId order by c.id desc",
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
						"select c from SalesEntry c where c.companyInfo.id=:cId AND UPPER(c.vendor.name)=:name order by c.id desc",
						SalesEntry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByAgentId(int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId AND c.vendor.id=:id order by c.id desc",
						SalesEntry.class);
		q.setParameter("id", id);
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByCustomerName(String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId AND UPPER(c.customer.name)=:name order by c.id desc",
						SalesEntry.class);
		q.setParameter("name", name.toUpperCase());
		q.setParameter("cId", cId);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByCustomerId(int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where c.companyInfo.id=:cId AND c.customer.id=:id order by c.id desc",
						SalesEntry.class);
		q.setParameter("id", id);
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
						"select c from SalesProductDetails c where c.salesEntry.companyInfo.id=:cId AND UPPER(c.purchase_Product_Details.productDetail.code)=:code ORDER BY c.salesEntry.id DESC",
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

	public List<SalesEntry> getSalesEntriesByProductId(int id) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		List<SalesEntry> lst = new ArrayList<SalesEntry>();
		HashSet<SalesEntry> hs = new HashSet<SalesEntry>();
		TypedQuery<SalesProductDetails> q = em
				.createQuery(
						"select c from SalesProductDetails c where c.salesEntry.companyInfo.id=:cId AND c.purchase_Product_Details.productDetail.id=:id ORDER BY c.salesEntry.id DESC",
						SalesProductDetails.class);

		q.setParameter("id", id);
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

	public List<SalesProductDetails> getSoldOnlySalesProductDetailsBySalesEntryId(
			int id) {
		TypedQuery<SalesProductDetails> q = em
				.createQuery(
						"select s from SalesProductDetails s where s.salesEntry.id=:Id",
						SalesProductDetails.class);
		q.setParameter("Id", id);
		List<SalesProductDetails> lst = new ArrayList<SalesProductDetails>();
		for (SalesProductDetails s : q.getResultList()) {
			if (s.getQuantity() - s.getSalesReQty() > 0) {
				lst.add(s);
			}
		}
		return lst;
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

	public List<SalesEntry> getAllSalesEntrybyCustomerID(int id) {
		TypedQuery<SalesEntry> q = em.createQuery(
				"select c from SalesEntry c where c.customer.id=:id",
				SalesEntry.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<CustomerEntry> getAllCustomerEntryByAssendingMaxSale() {
		List<CustomerEntry> cList = new ArrayList<CustomerEntry>();
		TypedQuery<CustomerEntry> q = em.createQuery(
				"select c from CustomerEntry c", CustomerEntry.class);

		cList = q.getResultList();
		cList.sort((CustomerEntry v2, CustomerEntry v1) -> Float.compare(
				v1.getTotSale(), v2.getTotSale()));
		return cList;
	}

	public List<CustomerEntry> getCustomerByPh(String ph) {
		TypedQuery<CustomerEntry> q = em.createQuery(
				"select c from CustomerEntry c where c.mobile like :ph",
				CustomerEntry.class);
		q.setParameter("ph", ph + "%");
		return q.getResultList();
	}

	public List<CustomerEntry> getCustomerByName(String name) {
		TypedQuery<CustomerEntry> q = em.createQuery(
				"select c from CustomerEntry c where UPPER(c.name) like :name",
				CustomerEntry.class);
		q.setParameter("name", name.toUpperCase() + "%");
		return q.getResultList();
	}

	/******************************
	 * stock search by product code
	 ***************/

	public List<ProductDetail> getProductDetailsByCodeDescriptionCategory(
			String code, String description, String name) {
		cId = getUserById((String) httpSession.getAttribute("user"))
				.getCompanyInfo().getId();
		TypedQuery<ProductDetail> q = em
				.createQuery(
						"select c from ProductDetail c where c.code=:code OR c.description=:description OR c.category.name=:name ",
						ProductDetail.class);
		q.setParameter("code", code.toUpperCase());
		q.setParameter("description", description.toUpperCase());
		q.setParameter("name", name.toUpperCase());
		List<ProductDetail> listpro = new ArrayList<ProductDetail>();
		// HashSet<ProductDetail> hash = new HashSet<ProductDetail>();
		// for (ProductDetail pd : q.getResultList()) {
		// for (Purchase_Product_Details ppd : pd
		// .getPurchase_Product_Details()) {
		// if (ppd.getCompanyInfo().getId() == cId) {
		// listpro.add(ppd.getProductDetail());
		// }
		// }
		// }
		// hash.addAll(listpro);
		// listpro.clear();
		// listpro.addAll(hash);
		listpro.addAll(q.getResultList());
		return listpro;
	}

	/******************************
	 * Search Job Assignment Details by ChallanID
	 ****************/
	public List<JobAssignmentDetails> getJobAssignmentDetailsbyChallanNumber(
			String challanNumber) {
		TypedQuery<JobAssignmentDetails> q = em
				.createQuery(
						"select c from JobAssignmentDetails c where UPPER(c.challanNumber)=:challanNumber ORDER BY c.id DESC",
						JobAssignmentDetails.class);
		q.setParameter("challanNumber", challanNumber);
		return q.getResultList();
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

	/*****************************
	 * Search Sasles for return by ChallanID
	 ***************/

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

	public List<SalesEntry> getSalesEntryDByChallanNo(String chNo) {
		TypedQuery<SalesEntry> q = em
				.createQuery(
						"select c from SalesEntry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						SalesEntry.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	/*****************************
	 * Sasles return
	 ********************************************/

	public void setSalesReturn(SalesReturn salesReturn) {
		em.persist(salesReturn);
	}

	public SalesReturn getSalesReturnDetailsById(int id) {
		return em.find(SalesReturn.class, id);
	}

	public void updateSalesReturn(SalesReturn salesReturn) {
		em.merge(salesReturn);
	}

	public List<SalesReturn> getAllSalesReturn() {
		TypedQuery<SalesReturn> q = em.createQuery(
				"select c from SalesReturn c order by c.id desc",
				SalesReturn.class);
		return q.getResultList();
	}

	public List<SalesReturn> getAllSalesReEntrybyCustomerID(int id) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where c.salesEntry.customer.id=:id",
						SalesReturn.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByDate(Date startDate, Date endDate) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c WHERE c.returnDate BETWEEN :startDate AND :endDate order by c.id desc",
						SalesReturn.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public List<String> getAllFinancialForSalesReturn() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (SalesReturn sr : getAllSalesReturn()) {
			lst.add(sr.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public List<SalesReturn> getSalesReturnByChallanNo(String chNo) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						SalesReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByRefChallanNo(String chNo) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where UPPER(c.salesEntry.challanNumber)=:chNo ORDER BY c.id DESC",
						SalesReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnBySalesEntryId(int id) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where c.salesEntry.id=:id ORDER BY c.id DESC",
						SalesReturn.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByCustomerName(String name) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where UPPER(c.salesEntry.customer.name)=:name order by c.id desc",
						SalesReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByAgentName(String name) {
		TypedQuery<SalesReturn> q = em
				.createQuery(
						"select c from SalesReturn c where UPPER(c.salesEntry.vendor.name)=:name order by c.id desc",
						SalesReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByProductCode(String code) {
		List<SalesReturn> lst = new ArrayList<SalesReturn>();
		HashSet<SalesReturn> hs = new HashSet<SalesReturn>();
		TypedQuery<SalesProductReturnDetail> q = em
				.createQuery(
						"select c from SalesProductReturnDetail c where UPPER(c.salesProductDetails.purchase_Product_Details.productDetail.code)=:code ORDER BY c.salesReturn.id DESC",
						SalesProductReturnDetail.class);

		q.setParameter("code", code.toUpperCase());
		for (SalesProductReturnDetail s : q.getResultList()) {
			lst.add(s.getSalesReturn());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	/*********************************************************** SalesProductReturnDetails ***********************/

	public void setSalesProductReturnDetails(
			SalesProductReturnDetail salesProductReturnDetail) {
		em.persist(salesProductReturnDetail);
	}

	public SalesProductReturnDetail getSalesProductReturnDetailsById(int id) {
		return em.find(SalesProductReturnDetail.class, id);
	}

	public List<SalesProductReturnDetail> getAllSalesProductReturnDetail() {
		TypedQuery<SalesProductReturnDetail> q = em.createQuery(
				"select c from SalesProductReturnDetail c",
				SalesProductReturnDetail.class);
		return q.getResultList();
	}

	public List<SalesProductReturnDetail> getAllSalesProductReturnDetailBySalesEntryId(
			int id) {
		TypedQuery<SalesProductReturnDetail> q = em
				.createQuery(
						"select c from SalesProductReturnDetail c where c.salesReturn.salesEntry.id=:id order by c.id asc",
						SalesProductReturnDetail.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/****************
	 * VoucherDetails for via agents
	 ***************************************/
	public void setVoucherDetails4ViaAgent(
			VoucherDetailsForViaAgents voucherDetails) {
		em.persist(voucherDetails);
	}

	public void deleteVoucherDetails4ViaAgentById(int id) {
		em.remove(getVoucherDetails4ViaAgentById(id));
	}

	public VoucherDetailsForViaAgents getVoucherDetails4ViaAgentById(int id) {
		return em.find(VoucherDetailsForViaAgents.class, id);
	}

	public void updateVoucherDetails4ViaAgent(
			VoucherDetailsForViaAgents voucherd) {
		em.merge(voucherd);
	}

	public List<VoucherDetailsForViaAgents> getAllVoucherDetails4ViaAgent() {
		TypedQuery<VoucherDetailsForViaAgents> q = em.createQuery(
				"select c from VoucherDetailsForViaAgents c",
				VoucherDetailsForViaAgents.class);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getAllVoucherDetails4ViaAgentBySalesEntryId(
			int seId) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.salesEntryId=:seId order by c.id ASC",
						VoucherDetailsForViaAgents.class);
		q.setParameter("seId", seId);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getAllVoucherDetails4ViaAgentBySalesReturnId(
			int srId) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.salesReturnId=:srId order by c.id ASC",
						VoucherDetailsForViaAgents.class);
		q.setParameter("srId", srId);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getAllVoucherDetails4ViaAgentByPurchaseEntryId(
			int peId) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.purchaseEntryId=:peId order by c.id ASC",
						VoucherDetailsForViaAgents.class);
		q.setParameter("peId", peId);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getAllVoucherDetails4ViaAgentByPurchaseReturnId(
			int prId) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.purchaseReturnId=:prId order by c.id ASC",
						VoucherDetailsForViaAgents.class);
		q.setParameter("prId", prId);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getVoucherDetails4ViaAgentByAgentId(
			int id) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.agentId=:id order by c.id asc",
						VoucherDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<VoucherDetailsForViaAgents> getVoucherDetails4ViaAgentByAgentIdDesc(
			int id) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.agentId=:id order by c.id desc",
						VoucherDetailsForViaAgents.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public float getCurrentCreditNote4ViaAgentByAgentId(int id) {
		TypedQuery<VoucherDetailsForViaAgents> q = em
				.createQuery(
						"select c from VoucherDetailsForViaAgents c where c.agentId=:id order by c.id asc",
						VoucherDetailsForViaAgents.class);
		q.setParameter("id", id);
		float totCr = 0;
		float totDb = 0;
		for (VoucherDetailsForViaAgents vd : q.getResultList()) {
			if (vd.isCredit()) {
				totCr = totCr + vd.getValue();
			} else {
				totDb = totDb + vd.getValue();
			}
		}
		return (totCr - totDb);
	}

	// public List<VoucherDetailsForViaAgents>
	// getAllVoucherDetailsForViaAgentsBySalesEntryId(int seId) {
	// TypedQuery<VoucherDetailsForViaAgents> q = em.createQuery(
	// "select c from VoucherDetailsForViaAgents c where c.salesEntryId=:seId
	// order by c.id ASC",
	// VoucherDetailsForViaAgents.class);
	// q.setParameter("seId", seId);
	// return q.getResultList();
	// }

	/****************
	 * VoucherDetails for via agents
	 *****************************************/

	/**************** VoucherDetails ******************************************************************/
	public void setVoucherDetails(VoucherDetails voucherDetails) {
		em.persist(voucherDetails);
	}

	public VoucherDetails getVoucherDetailsById(int id) {
		return em.find(VoucherDetails.class, id);
	}

	public void deleteVoucherDetailsById(int id) {
		em.remove(getVoucherDetailsById(id));
	}

	public void updateVoucherDetails(VoucherDetails voucherd) {
		em.merge(voucherd);
	}

	public List<VoucherDetails> getAllVoucherDetails() {
		TypedQuery<VoucherDetails> q = em.createQuery(
				"select c from VoucherDetails c", VoucherDetails.class);
		return q.getResultList();
	}

	public List<VoucherDetails> getVoucherDetailsByVendorId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.vendor.id=:id order by c.id asc",
						VoucherDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<VoucherDetails> getDecendingVoucherDetailsByVendorId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.vendor.id=:id order by c.id desc",
						VoucherDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsByVoucherAssignId(int vaId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.id=:vaId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("vaId", vaId);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsByJobAssignId(int jaId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.jobAssignId=:jaId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("jaId", jaId);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsByPurchaseReturnId(int prId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.purchaseReturn.id=:prId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("prId", prId);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsByPurchaseEntryId(int peId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.purchase_Entry.id=:peId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("peId", peId);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsBySalesEntryId(int seId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.salesEntry.id=:seId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("seId", seId);
		return q.getResultList();
	}

	public List<VoucherDetails> getAllVoucherDetailsBySalesReturnId(int srId) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.salesReturn.id=:srId order by c.id ASC",
						VoucherDetails.class);
		q.setParameter("srId", srId);
		return q.getResultList();
	}

	public VoucherDetails getLastVoucherDetailsByVendorId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.vendor.id=:id order by c.id desc",
						VoucherDetails.class);
		q.setParameter("id", id);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public VoucherDetails getLastVoucherDetailsByCustomerId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.customerEntry.id=:id order by c.id desc",
						VoucherDetails.class);
		q.setParameter("id", id);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	public float getCurrentCreditNoteByVendorId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.vendor.id=:id order by c.id asc",
						VoucherDetails.class);
		q.setParameter("id", id);
		float totCr = 0;
		float totDb = 0;
		for (VoucherDetails vd : q.getResultList()) {
			if (vd.isCredit()) {
				totCr = totCr + vd.getValue();
			} else {
				totDb = totDb + vd.getValue();
			}
		}
		return (totCr - totDb);
	}

	public float getCurrentDebitNoteByCustomerId(int id) {
		TypedQuery<VoucherDetails> q = em
				.createQuery(
						"select c from VoucherDetails c where c.voucherAssign.customerEntry.id=:id order by c.id asc",
						VoucherDetails.class);
		q.setParameter("id", id);
		float totCr = 0;
		float totDb = 0;
		for (VoucherDetails vd : q.getResultList()) {
			if (vd.isCredit()) {
				totCr = totCr + vd.getValue();
			} else {
				totDb = totDb + vd.getValue();
			}
		}
		return (totDb - totCr);
	}

	/**************** VoucherAssign ******************************************************************/
	public void setVoucherAssign(VoucherAssign voucherAssign) {
		em.persist(voucherAssign);
	}

	public void updateVoucherAssign(VoucherAssign voucherAssign) {
		em.merge(voucherAssign);
	}

	public VoucherAssign getVoucherAssignById(int id) {
		return em.find(VoucherAssign.class, id);
	}

	public List<VoucherAssign> getAllVoucherAssign() {
		TypedQuery<VoucherAssign> q = em.createQuery(
				"select c from VoucherAssign c", VoucherAssign.class);
		return q.getResultList();
	}

	public List<VoucherAssign> getVoucherAssignByVendorId(int id) {
		TypedQuery<VoucherAssign> q = em.createQuery(
				"select c from VoucherAssign c where c.vendor.id=:id",
				VoucherAssign.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	public VoucherAssign getVoucherAssignByCustomerId(int id) {
		TypedQuery<VoucherAssign> q = em.createQuery(
				"select c from VoucherAssign c where c.customerEntry.id=:id",
				VoucherAssign.class);
		q.setParameter("id", id);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0);
		} else {
			return null;
		}
	}

	/*************************** for job_types ******************************/
	public void setJobTypes(JobTypes jobTypes) {
		em.persist(jobTypes);
	}

	public JobTypes getJobTypeById(int id) {
		return em.find(JobTypes.class, id);
	}

	public void updateJobTypes(JobTypes jobTypes) {
		em.merge(jobTypes);
	}

	public List<JobTypes> getAllJobTypes() {
		TypedQuery<JobTypes> q = em.createQuery("select c from JobTypes c",
				JobTypes.class);
		return q.getResultList();
	}

	public JobTypes getJobTypeByJobName(String jobName) {
		TypedQuery<JobTypes> q = em.createQuery(
				"select c from JobTypes c where c.jobName=:jobName",
				JobTypes.class);
		q.setParameter("jobName", jobName);
		return q.getResultList().get(0);
	}

	/***************************
	 * for SampleDesignCostSheet
	 *********************/

	public void setSampleDesignCostSheet(SampleDesignCostSheet sample) {
		em.persist(sample);
	}

	public void updateSampleDesignCostSheet(SampleDesignCostSheet sample) {
		em.merge(sample);
	}

	public SampleDesignCostSheet getSampleDesignCostSheetById(int id) {
		return em.find(SampleDesignCostSheet.class, id);
	}

	public List<SampleDesignCostSheet> getAllSampleDesignCostSheet() {
		TypedQuery<SampleDesignCostSheet> q = em.createQuery(
				"select c from SampleDesignCostSheet c order by c.id desc",
				SampleDesignCostSheet.class);
		return q.getResultList();
	}

	public List<SampleDesignCostSheet> getSampleDesignCostSheetByDesignNumber(
			String dn) {
		TypedQuery<SampleDesignCostSheet> q = em
				.createQuery(
						"select c from SampleDesignCostSheet c where UPPER(c.designNumber) like :dn order by c.id desc",
						SampleDesignCostSheet.class);
		q.setParameter("dn", dn.toUpperCase() + "%");
		return q.getResultList();
	}

	public List<SampleDesignCostSheet> getSampleCostSheetByDesignNumber(
			String dn) {
		TypedQuery<SampleDesignCostSheet> q = em
				.createQuery(
						"select c from SampleDesignCostSheet c where UPPER(c.designNumber) = :dn order by c.id desc",
						SampleDesignCostSheet.class);
		q.setParameter("dn", dn.toUpperCase());
		return q.getResultList();
	}

	public List<SampleDesignCostSheet> getSampleDesignCostSheetByDesignNumberForDuplicateCheck(
			String dn) {
		TypedQuery<SampleDesignCostSheet> q = em
				.createQuery(
						"select c from SampleDesignCostSheet c where UPPER(c.designNumber) =:dn order by c.id desc",
						SampleDesignCostSheet.class);
		q.setParameter("dn", dn.toUpperCase());
		return q.getResultList();
	}

	public List<String> getAllDesignNoFromSampleDesignCostSheetAndProductsByDesignNumberForDuplicateCheck(
			String dn) {
		List<String> dNoLst = new ArrayList<String>();

		TypedQuery<SampleDesignCostSheet> q = em
				.createQuery(
						"select c from SampleDesignCostSheet c where UPPER(c.designNumber) =:dn order by c.id desc",
						SampleDesignCostSheet.class);
		q.setParameter("dn", dn.toUpperCase());

		TypedQuery<ProductDetail> p = em
				.createQuery(
						"select c from ProductDetail c where UPPER(c.universalCode) =:dn order by c.id desc",
						ProductDetail.class);
		p.setParameter("dn", dn.toUpperCase());

		for (SampleDesignCostSheet sdcs : q.getResultList()) {
			dNoLst.add(sdcs.getDesignNumber());
		}
		for (ProductDetail pd : p.getResultList()) {
			dNoLst.add(pd.getUniversalCode());
		}

		return dNoLst;
	}

	public List<SampleDesignCostSheet> getSampleDesignCostSheetByDesignerName(
			String name) {
		TypedQuery<SampleDesignCostSheet> q = em
				.createQuery(
						"select c from SampleDesignCostSheet c where c.vendor.vendorType.type='Designer' and UPPER(c.vendor.name)=:name ORDER BY c.id DESC",
						SampleDesignCostSheet.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<SampleDesignCostSheet> getPlannedSampleDesignCostSheetByDesignNumber(
			String dn) {
		TypedQuery<JobPlan> q = em
				.createQuery(
						"select c from JobPlan c where UPPER(c.designCostSheet.designNumber) like :dn",
						JobPlan.class);
		q.setParameter("dn", dn.toUpperCase() + "%");

		List<SampleDesignCostSheet> lst = new ArrayList<>();
		for (JobPlan jp : q.getResultList()) {
			lst.add(jp.getDesignCostSheet());
		}
		return lst;
	}

	/**************************
	 * for ProductsForDesignCostSheet
	 ********************/

	public void setProductsForDesignCostSheet(ProductsForDesignCostSheet sample) {
		em.persist(sample);
	}

	public void updateProductsForDesignCostSheet(
			ProductsForDesignCostSheet sample) {
		em.merge(sample);
	}

	public ProductsForDesignCostSheet getProductsForDesignCostSheetById(int id) {
		return em.find(ProductsForDesignCostSheet.class, id);
	}

	public List<ProductsForDesignCostSheet> getAllProductsForDesignCostSheet() {
		TypedQuery<ProductsForDesignCostSheet> q = em.createQuery(
				"select c from ProductsForDesignCostSheet c",
				ProductsForDesignCostSheet.class);
		return q.getResultList();
	}

	/***************************
	 * for JobsForDesignCostSheet
	 *********************/
	public void setJobsForDesignCostSheet(JobsForDesignCostSheet sample) {
		em.persist(sample);
	}

	public void updateJobsForDesignCostSheet(JobsForDesignCostSheet sample) {
		em.merge(sample);
	}

	public JobsForDesignCostSheet getJobsForDesignCostSheetById(int id) {
		return em.find(JobsForDesignCostSheet.class, id);
	}

	public List<JobsForDesignCostSheet> getAllJobsForDesignCostSheet() {
		TypedQuery<JobsForDesignCostSheet> q = em.createQuery(
				"select c from JobsForDesignCostSheet c",
				JobsForDesignCostSheet.class);
		return q.getResultList();
	}

	/*************************** for DesignImage *********************/
	public void setDesignImage(DesignImage sample) {
		em.persist(sample);
	}

	public void updateDesignImage(DesignImage sample) {
		em.merge(sample);
	}

	public void removeSampleCostSheetImageById(int id) {
		em.remove(getDesignImageById(id));
	}

	public DesignImage getDesignImageById(int id) {
		return em.find(DesignImage.class, id);
	}

	public List<DesignImage> getAllDesignImage() {
		TypedQuery<DesignImage> q = em.createQuery(
				"select c from DesignImage c", DesignImage.class);
		return q.getResultList();
	}

	public List<DesignImage> getAllDesignImageBySampleJobId(int id) {
		TypedQuery<DesignImage> q = em.createQuery(
				"select s from DesignImage s where s.designCostSheet.id=:id",
				DesignImage.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/*************************** for JobPlan *********************/
	public void setJobPlan(JobPlan sample) {
		em.persist(sample);
	}

	public void deleteJobPlanById(int id) {
		em.remove(getJobPlanById(id));
	}

	public void updateJobPlan(JobPlan sample) {
		em.merge(sample);
	}

	public JobPlan getJobPlanById(int id) {
		return em.find(JobPlan.class, id);
	}

	public List<JobPlan> getAllJobPlan() {
		TypedQuery<JobPlan> q = em.createQuery(
				"select c from JobPlan c order by c.id desc", JobPlan.class);
		return q.getResultList();
	}

	public List<JobPlan> getAllOngoingJobPlanByDesignNumber(int dn) {
		TypedQuery<JobPlan> q = em
				.createQuery(
						"select c from JobPlan c where c.designCostSheet.id =:dn and c.isComplete=false order by c.id desc",
						JobPlan.class);
		q.setParameter("dn", dn);
		return q.getResultList();
	}

	public List<JobPlan> getAllJobPlanByDesignNumber(int dn) {
		TypedQuery<JobPlan> q = em
				.createQuery(
						"select c from JobPlan c where c.designCostSheet.id =:dn order by c.id desc",
						JobPlan.class);
		q.setParameter("dn", dn);
		return q.getResultList();
	}

	/***************************
	 * for JobPlanProductS
	 *********************/
	public void setJobPlanProducts(JobPlanProducts sample) {
		em.persist(sample);
	}

	public void deleteJobPlanProductsById(int id) {
		em.remove(getJobPlanProductsById(id));
	}

	public List<JobPlanProducts> getAllJobPlanProduct() {
		TypedQuery<JobPlanProducts> q = em.createQuery(
				"select c from JobPlanProducts c", JobPlanProducts.class);
		return q.getResultList();
	}

	public void updateJobPlanProducts(JobPlanProducts sample) {
		em.merge(sample);
	}

	public JobPlanProducts getJobPlanProductsById(int id) {
		return em.find(JobPlanProducts.class, id);
	}

	public JobPlanProducts getJobPlanProductByPlanIdAndSampleProductId(
			int jpId, int sId) {
		TypedQuery<JobPlanProducts> q = em
				.createQuery(
						"select c from JobPlanProducts c where c.jobPlan.id=:jpId AND c.productsForDesignCostSheet.id=:sId",
						JobPlanProducts.class);
		q.setParameter("jpId", jpId);
		q.setParameter("sId", sId);
		return q.getResultList().get(0);
	}

	public List<JobPlanProducts> getJobPlanProductsByPlanId(int jpId) {
		TypedQuery<JobPlanProducts> q = em.createQuery(
				"select c from JobPlanProducts c where c.jobPlan.id=:jpId",
				JobPlanProducts.class);
		q.setParameter("jpId", jpId);
		return q.getResultList();
	}

	/********************* for JobPlanJobStock ********************/
	public void setJobPlanJobStock(JobPlanJobStock sample) {
		em.persist(sample);
	}

	public void deleteJobPlanJobStockById(int id) {
		em.remove(getJobPlanJobStockById(id));
	}

	public List<JobPlanJobStock> getAllJobPlanJobStock() {
		TypedQuery<JobPlanJobStock> q = em.createQuery(
				"select c from JobPlanJobStock c", JobPlanJobStock.class);
		return q.getResultList();
	}

	public void updateJobPlanJobStock(JobPlanJobStock sample) {
		em.merge(sample);
	}

	public JobPlanJobStock getJobPlanJobStockById(int id) {
		return em.find(JobPlanJobStock.class, id);
	}

	public JobPlanJobStock getJobPlanJobStockByJobPlanProductIdAndJobForSampleId(
			int jppId, int jsId) {
		TypedQuery<JobPlanJobStock> q = em
				.createQuery(
						"select c from JobPlanJobStock c where c.jobPlanProducts.id=:jppId AND c.jobsForDesignCostSheet.id=:jsId",
						JobPlanJobStock.class);
		q.setParameter("jppId", jppId);
		q.setParameter("jsId", jsId);
		return q.getResultList().get(0);
	}

	public JobPlanJobStock getJobPlanJobStockByJobPlanProductIdAndJobTypeId(
			int jppId, int jtId) {
		TypedQuery<JobPlanJobStock> q = em
				.createQuery(
						"select c from JobPlanJobStock c where c.jobPlanProducts.id=:jppId AND c.jobsForDesignCostSheet.jobTypes.id=:jtId",
						JobPlanJobStock.class);
		q.setParameter("jppId", jppId);
		q.setParameter("jtId", jtId);
		return q.getResultList().get(0);
	}

	/***************************
	 * for JobPlanProductStockProductStock
	 *********************/
	public void setJobPlanProductStock(JobPlanProductStock sample) {
		em.persist(sample);
	}

	public void updateJobPlanProductStock(JobPlanProductStock sample) {
		em.merge(sample);
	}

	public JobPlanProductStock getJobPlanProductStockById(int id) {
		return em.find(JobPlanProductStock.class, id);
	}

	public JobPlanProductStock getJobPlanProductStockByPurchaseProductDetailsIdAndJobPlanId(
			int ppdId, int jpId) {
		TypedQuery<JobPlanProductStock> q = em
				.createQuery(
						"select c from JobPlanProductStock c where c.jobPlan.id=:jpId AND c.purchase_Product_Details.id=:ppdId",
						JobPlanProductStock.class);
		q.setParameter("jpId", jpId);
		q.setParameter("ppdId", ppdId);
		return q.getResultList().get(0);
	}

	public List<JobPlanProductStock> getAllJobPlanProductStock() {
		TypedQuery<JobPlanProductStock> q = em.createQuery(
				"select c from JobPlanProductStock c",
				JobPlanProductStock.class);
		return q.getResultList();
	}

	public List<JobPlanProductStock> getJobPlanProductStockByproductId(int id) {
		TypedQuery<JobPlanProductStock> q = em
				.createQuery(
						"select c from JobPlanProductStock c where c.purchase_Product_Details.productDetail.id=:id",
						JobPlanProductStock.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/************************** NotificationView ****************************/

	public void setNotificationDetails(NotificationDetails notificationDetails) {
		em.persist(notificationDetails);
	}

	public List<NotificationDetails> getAllNotificationDetails() {
		TypedQuery<NotificationDetails> q = em.createQuery(
				"select c from NotificationDetails  c",
				NotificationDetails.class);
		return q.getResultList();
	}

	public NotificationDetails getNotificationDetailsById(int id) {
		return em.find(NotificationDetails.class, id);
	}

	/************************** NotificationView ****************************/

	public void setNotificationView(NotificationView notificationView) {
		em.persist(notificationView);
	}

	public List<NotificationView> getAllNotificationView() {
		TypedQuery<NotificationView> q = em.createQuery(
				"select c from NotificationView  c", NotificationView.class);
		return q.getResultList();
	}

	public NotificationView getNotificationViewById(int id) {
		return em.find(NotificationView.class, id);
	}

	/***************** for ApprovalEntry **********************/
	public void setApprovalEntry(ApprovalEntry approvalEntry) {
		em.persist(approvalEntry);
	}

	public void deleteApprovalEntryById(int id) {
		em.remove(getApprovalEntryById(id));
	}

	public ApprovalEntry getApprovalEntryById(int id) {
		return em.find(ApprovalEntry.class, id);
	}

	public List<ApprovalEntry> getAllApprovalEntry() {
		TypedQuery<ApprovalEntry> q = em.createQuery(
				"select c from ApprovalEntry c", ApprovalEntry.class);
		return q.getResultList();
	}

	public void updateApprovalEntry(ApprovalEntry approvalEntry) {
		em.merge(approvalEntry);
	}

	public List<ApprovalEntry> getApprovalEntryByDate(Date startDate,
			Date endDate) {
		TypedQuery<ApprovalEntry> q = em
				.createQuery(
						"select c from ApprovalEntry c WHERE c.approvalDate BETWEEN :startDate AND :endDate order by c.id desc",
						ApprovalEntry.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public List<String> getAllFinancialForApproval() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (ApprovalEntry ae : getAllApprovalEntry()) {
			lst.add(ae.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public List<ApprovalEntry> getApprovalEntryByChallanNo(String chNo) {
		TypedQuery<ApprovalEntry> q = em
				.createQuery(
						"select c from ApprovalEntry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						ApprovalEntry.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalEntry> getApprovalEntryByAgentName(String name) {
		TypedQuery<ApprovalEntry> q = em
				.createQuery(
						"select c from ApprovalEntry c where UPPER(c.vendor.name)=:name order by c.id desc",
						ApprovalEntry.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalEntry> getApprovalEntryByCustomerName(String name) {
		TypedQuery<ApprovalEntry> q = em
				.createQuery(
						"select c from ApprovalEntry c where UPPER(c.customer.name)=:name order by c.id desc",
						ApprovalEntry.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalEntry> getApprovalEntriesByProductCode(String code) {
		List<ApprovalEntry> lst = new ArrayList<ApprovalEntry>();
		HashSet<ApprovalEntry> hs = new HashSet<ApprovalEntry>();
		TypedQuery<ApprovalProductDetails> q = em
				.createQuery(
						"select c from ApprovalProductDetails c where UPPER(c.purchase_Product_Details.productDetail.code)=:code ORDER BY c.approvalEntry.id DESC",
						ApprovalProductDetails.class);

		q.setParameter("code", code.toUpperCase());
		for (ApprovalProductDetails s : q.getResultList()) {
			lst.add(s.getApprovalEntry());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<ApprovalEntry> getApprovalEntryDByChallanNo(String chNo) {
		TypedQuery<ApprovalEntry> q = em
				.createQuery(
						"select c from ApprovalEntry c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						ApprovalEntry.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	/***************** for ApprovalProductDetails **********************/
	public void setApprovalProductDetails(
			ApprovalProductDetails approvalProductDetails) {
		em.persist(approvalProductDetails);
	}

	public void deleteApprovalProductDetailsById(int id) {
		em.remove(getApprovalProductDetailsById(id));
	}

	public ApprovalProductDetails getApprovalProductDetailsById(int id) {
		return em.find(ApprovalProductDetails.class, id);
	}

	public List<ApprovalProductDetails> getAllApprovalProductDetails() {
		TypedQuery<ApprovalProductDetails> q = em.createQuery(
				"select c from ApprovalProductDetails c",
				ApprovalProductDetails.class);
		return q.getResultList();
	}

	public void updateApprovalProductDetails(
			ApprovalProductDetails approvalProductDetails) {
		em.merge(approvalProductDetails);
	}

	public List<ApprovalProductDetails> getApprovalProductDetailsByProductId(
			int id) {
		TypedQuery<ApprovalProductDetails> q = em
				.createQuery(
						"select s from ApprovalProductDetails s where s.purchase_Product_Details.productDetail.id=:Id ORDER BY s.approvalEntry.approvalDate DESC ",
						ApprovalProductDetails.class);
		q.setParameter("Id", id);
		return q.getResultList();
	}

	/***************** for ApprovalReturn **********************/
	public void setApprovalReturn(ApprovalReturn approvalReturn) {
		em.persist(approvalReturn);
	}

	public void deleteApprovalReturnById(int id) {
		em.remove(getApprovalReturnById(id));
	}

	public ApprovalReturn getApprovalReturnById(int id) {
		return em.find(ApprovalReturn.class, id);
	}

	public List<ApprovalReturn> getAllApprovalReturn() {
		TypedQuery<ApprovalReturn> q = em.createQuery(
				"select c from ApprovalReturn c", ApprovalReturn.class);
		return q.getResultList();
	}

	public void updateApprovalReturn(ApprovalReturn approvalReturn) {
		em.merge(approvalReturn);
	}

	public List<ApprovalReturn> getApprovalReturnByDate(Date startDate,
			Date endDate) {
		TypedQuery<ApprovalReturn> q = em
				.createQuery(
						"select c from ApprovalReturn c WHERE c.returnDate BETWEEN :startDate AND :endDate order by c.id desc",
						ApprovalReturn.class);
		q.setParameter("startDate", startDate);
		q.setParameter("endDate", endDate);
		return q.getResultList();
	}

	public List<ApprovalReturn> getApprovalReturnByChallanNo(String chNo) {
		TypedQuery<ApprovalReturn> q = em
				.createQuery(
						"select c from ApprovalReturn c where UPPER(c.challanNumber)=:chNo ORDER BY c.id DESC",
						ApprovalReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalReturn> getApprovalReturnByRefChallanNo(String chNo) {
		TypedQuery<ApprovalReturn> q = em
				.createQuery(
						"select c from ApprovalReturn c where UPPER(c.approvalEntry.challanNumber)=:chNo ORDER BY c.id DESC",
						ApprovalReturn.class);
		q.setParameter("chNo", chNo.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalReturn> getApprovalReturnByAgentName(String name) {
		TypedQuery<ApprovalReturn> q = em
				.createQuery(
						"select c from ApprovalReturn c where UPPER(c.approvalEntry.vendor.name)=:name order by c.id desc",
						ApprovalReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalReturn> getApprovalReturnByCustomerName(String name) {
		TypedQuery<ApprovalReturn> q = em
				.createQuery(
						"select c from ApprovalReturn c where UPPER(c.approvalEntry.customer.name)=:name order by c.id desc",
						ApprovalReturn.class);
		q.setParameter("name", name.toUpperCase());
		return q.getResultList();
	}

	public List<ApprovalReturn> getApprovalReturnByProductCode(String code) {
		List<ApprovalReturn> lst = new ArrayList<ApprovalReturn>();
		HashSet<ApprovalReturn> hs = new HashSet<ApprovalReturn>();
		TypedQuery<ApprovalReturnProductDetails> q = em
				.createQuery(
						"select c from ApprovalReturnProductDetails c where UPPER(c.approvalProductDetails.purchase_Product_Details.productDetail.code)=:code ORDER BY c.approvalReturn.id DESC",
						ApprovalReturnProductDetails.class);

		q.setParameter("code", code.toUpperCase());
		for (ApprovalReturnProductDetails s : q.getResultList()) {
			lst.add(s.getApprovalReturn());
		}
		hs.addAll(lst);
		lst.clear();
		lst.addAll(hs);
		return lst;
	}

	public List<String> getAllFinancialForApprovalReturn() {
		List<String> lst = new ArrayList<String>();
		HashSet<String> hash = new HashSet<String>();
		for (ApprovalReturn ar : getAllApprovalReturn()) {
			lst.add(ar.getChallanNumber().split("/")[1]);
		}
		hash.addAll(lst);
		lst.clear();
		lst.addAll(hash);
		return lst;
	}

	public int getLastApprovalReturnChallanNumber() {
		TypedQuery<ApprovalReturn> q = em.createQuery(
				"select c from ApprovalReturn c ORDER BY c.id DESC",
				ApprovalReturn.class);
		if (q.getResultList().size() > 0) {
			return q.getResultList().get(0).getChallanNo();
		} else {
			return 0;
		}

	}

	public int getLastApprovalReturnChallanSuffix() {
		TypedQuery<ApprovalReturn> q = em.createQuery(
				"select c from ApprovalReturn c ORDER BY c.id DESC",
				ApprovalReturn.class);

		if (q.getResultList().size() > 0) {
			int s = q.getResultList().get(0).getChallanSuffix();
			if (getLastBillSetupBySufix("APPROVALRETURN") == null) {
				return s;
			} else {
				if (Integer.parseInt(getLastBillSetupBySufix("APPROVALRETURN")
						.getSufix()) < s) {
					return s;
				} else {
					return Integer.parseInt(getLastBillSetupBySufix(
							"APPROVALRETURN").getSufix());
				}
			}
		} else {
			if (getLastBillSetupBySufix("APPROVALRETURN") == null) {
				return 0;
			} else {
				return Integer.parseInt(getLastBillSetupBySufix(
						"APPROVALRETURN").getSufix());
			}
		}
	}

	/***************** for ApprovalReturnProductDetails **********************/
	public void setApprovalReturnProductDetails(
			ApprovalReturnProductDetails approvalReturnProductDetails) {
		em.persist(approvalReturnProductDetails);
	}

	public void deleteApprovalReturnProductDetailsById(int id) {
		em.remove(getApprovalReturnProductDetailsById(id));
	}

	public ApprovalReturnProductDetails getApprovalReturnProductDetailsById(
			int id) {
		return em.find(ApprovalReturnProductDetails.class, id);
	}

	public List<ApprovalReturnProductDetails> getAllApprovalReturnProductDetails() {
		TypedQuery<ApprovalReturnProductDetails> q = em.createQuery(
				"select c from ApprovalReturnProductDetails c",
				ApprovalReturnProductDetails.class);
		return q.getResultList();
	}

	public void updateApprovalReturnProductDetails(
			ApprovalReturnProductDetails approvalReturnProductDetails) {
		em.merge(approvalReturnProductDetails);
	}

	public List<ApprovalReturnProductDetails> getAllApprovalReturnProductDetailsByApprovalEntryId(
			int id) {
		TypedQuery<ApprovalReturnProductDetails> q = em
				.createQuery(
						"select c from ApprovalReturnProductDetails c where c.approvalReturn.approvalEntry.id=:id order by c.id asc",
						ApprovalReturnProductDetails.class);
		q.setParameter("id", id);
		return q.getResultList();
	}

	/******** alertNotificationforQuantity *******************/

	public void alertNotificationQty() {
		LocalDateTime localDateTime = LocalDateTime.now();

		for (ProductDetail pd : getAllProductDetail()) {
			if (pd.getReadyGoodsStock().getRemainingQty() < 10) {
				for (NotificationDetails notDet : pd.getNotificationDetails()) {
					if (notDet.getNotifiDate().after(
							Date.from(localDateTime.minusDays(7).toInstant(
									ZoneOffset.ofHoursMinutes(5, 30))))) {

					}

				}
			}
		}

	}

	public List<Purchase_Entry> getPurchaseEntryByDateForReport(Date pDate) {

		TypedQuery<Purchase_Entry> q = em
				.createQuery(
						"select c from Purchase_Entry c WHERE c.purchase_date = :pDate",
						Purchase_Entry.class);
		q.setParameter("pDate", pDate);
		return q.getResultList();
	}

	public List<PurchaseReturn> getPurchaseReturnByDateForReport(Date pDate) {
		TypedQuery<PurchaseReturn> q = em.createQuery(
				"select c from PurchaseReturn c WHERE c.returnDate = :pDate",
				PurchaseReturn.class);
		q.setParameter("pDate", pDate);
		return q.getResultList();
	}

	public List<SalesEntry> getSalesEntryByDateForReport(Date sDate) {

		TypedQuery<SalesEntry> q = em.createQuery(
				"select c from SalesEntry c WHERE c.sales_date = :sDate",
				SalesEntry.class);
		q.setParameter("sDate", sDate);

		return q.getResultList();
	}

	public List<SalesReturn> getSalesReturnByDateForReport(Date sDate) {

		TypedQuery<SalesReturn> q = em.createQuery(
				"select c from SalesReturn c WHERE c.returnDate = :sDate",
				SalesReturn.class);
		q.setParameter("sDate", sDate);

		return q.getResultList();
	}

	/******
	 * report for profit loss
	 *************************************************/

	public List<SalesEntry> getAllSalesEntry() {
		TypedQuery<SalesEntry> q = em.createQuery("select c from SalesEntry c",
				SalesEntry.class);
		return q.getResultList();

	}

	public List<PurchaseReturn> getAllPurchaseReturn() {
		TypedQuery<PurchaseReturn> q = em.createQuery(
				"select c from PurchaseReturn c", PurchaseReturn.class);
		return q.getResultList();
	}

	public List<SalesProductDetails> getAllSalesProductDetails() {
		TypedQuery<SalesProductDetails> q = em.createQuery(
				"select c from SalesProductDetails c",
				SalesProductDetails.class);
		return q.getResultList();
	}

	/**************** PurchaseOrder *****************/

	public void setPurchaseOrderEntry(PurchaseOrderEntry purchaseOrderEntry) {
		em.persist(purchaseOrderEntry);
	}

	public PurchaseOrderEntry getPurchaseOrderEntryById(int id) {
		return em.find(PurchaseOrderEntry.class, id);
	}

	public void deletePurchaseOrderEntryById(int id) {
		em.remove(getPurchaseOrderEntryById(id));
	}

	public void updatePurchaseOrderEntry(PurchaseOrderEntry purchaseOrderEntry) {
		em.merge(purchaseOrderEntry);
	}

	public List<PurchaseOrderEntry> getAllPurchaseOrderEntry() {
		TypedQuery<PurchaseOrderEntry> q = em.createQuery(
				"select c from PurchaseOrderEntry c", PurchaseOrderEntry.class);
		return q.getResultList();
	}

	/**************** PurchaseOrderProductdetails *****************/

	public void setPurchaseOrderProductdetails(
			PurchaseOrderProductdetails purchaseOrderProductdetails) {
		em.persist(purchaseOrderProductdetails);
	}

	public PurchaseOrderProductdetails getPurchaseOrderProductdetailsById(int id) {
		return em.find(PurchaseOrderProductdetails.class, id);
	}

	public void deletePurchaseOrderProductdetailsById(int id) {
		em.remove(getPurchaseOrderProductdetailsById(id));
	}

	public void updatePurchaseOrderProductdetails(
			PurchaseOrderProductdetails purchaseOrderProductdetails) {
		em.merge(purchaseOrderProductdetails);
	}

	public List<PurchaseOrderProductdetails> getAllPurchaseOrderProductdetails() {
		TypedQuery<PurchaseOrderProductdetails> q = em.createQuery(
				"select c from PurchaseOrderProductdetails c",
				PurchaseOrderProductdetails.class);
		return q.getResultList();
	}

	public PurchaseOrderProductdetails getPurchaseOrderProductdetailsByPurchaseOrderIdandProdctId(
			int oid, int pid) {
		TypedQuery<PurchaseOrderProductdetails> q = em
				.createQuery(
						"select c from PurchaseOrderProductdetails c where c.purchaseOrderEntry.id=:oid AND c.productDetail.id=:pid",
						PurchaseOrderProductdetails.class);
		q.setParameter("oid", oid);
		q.setParameter("pid", pid);
		return q.getResultList().get(0);

	}

	// //////////////////////////////////////////////////////////////////////////////
	// generic method
	public <T> List<T> getAllData(Class<T> cl) {
		TypedQuery<T> q = em.createQuery("select c from " + cl.getSimpleName()
				+ " c", cl);
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	public <T> void restoreData(Class<T> className, String filePath)
			throws IOException {
		FileInputStream fis = new FileInputStream(new File(filePath
				+ className.getSimpleName() + ".txt"));
		ObjectInputStream ois = new ObjectInputStream(fis);

		List<T> lstInDb = getAllData(className);
		List<T> lstInFile = new ArrayList<>();

		try {
			lstInFile = (List<T>) ois.readObject();
			fis.close();
			ois.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		if (lstInFile.size() > 0) {
			if (lstInDb.size() > 0) {
				for (T obj : lstInFile) {
					em.merge(obj);
				}
			} else {
				for (T obj : lstInFile) {
					em.persist(obj);
				}
			}
		}
		System.out.println("Done.");
	}

	public List<Notification> getNotifications() {
		LocalDateTime dateTime = LocalDateTime.now();
		List<Notification> details = new ArrayList<>();

		List<Purchase_Entry> purchase_Entries = getAllPurchaseEntry();
		for (Purchase_Entry pe : purchase_Entries) {
			if (pe.getPurchase_date().before(
					Date.from(LocalDateTime.now().minusMonths(3)
							.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
				for (Purchase_Product_Details ppd : pe
						.getPurchase_Product_Details()) {
					if (ppd.getRemaining_quantity() > 0) {
						Notification n = new Notification();
						int days = (int) ChronoUnit.DAYS.between(LocalDateTime
								.ofInstant(pe.getPurchase_date().toInstant(),
										ZoneId.systemDefault()), dateTime);

						float f = ppd.getRemaining_quantity()
								- ((int) ppd.getRemaining_quantity());
						String qt = new String();
						if (f > 0) {
							qt = String.valueOf(ppd.getRemaining_quantity());
						} else {
							qt = String.valueOf((int) ppd
									.getRemaining_quantity());
						}
						n.setDescription(qt + " "
								+ ppd.getProductDetail().getQtyUnit().getName()
								+ " of product code "
								+ ppd.getProductDetail().getCode()
								+ " of lot number " + ppd.getLotNumber()
								+ " is in stock more than " + days + " days.");
						n.setLink("stockDetailShow?proId="
								+ ppd.getProductDetail().getId());
						n.setNotificationName("Stock");
						details.add(n);
						n = null;
					}
				}
			}
		}

		for (JobAssignmentDetails jad : getAllJobassignmentDetails()) {
			for (JobAssignmentProducts jap : jad.getJobAssignmentProducts()) {
				for (JobAssignmentJobDetails jaj : jap
						.getJobAssignmentJobDetails()) {
					if (jaj.getEstimatedCompletionDate().before(
							Date.from(LocalDateTime.now().toInstant(
									ZoneOffset.ofHoursMinutes(5, 30))))
							&& jap.getRemaninQty() > 0) {
						Notification n = new Notification();
						int days = (int) ChronoUnit.DAYS.between(LocalDateTime
								.ofInstant(jaj.getEstimatedCompletionDate()
										.toInstant(), ZoneId.systemDefault()),
								dateTime);
						n.setDescription("Submission date of job "
								+ jaj.getJobType().getJobName()
								+ " of job challan number "
								+ jad.getChallanNumber()
								+ " on product of code "
								+ jap.getProductsForDesignCostSheet()
										.getProductDetail().getCode() + " is "
								+ days + " days over. " + jap.getRemaninQty()
								+ " qty is remaing.");
						n.setLink("jobReceiveFromSearch?joChallan="
								+ jad.getChallanNumber());
						n.setNotificationName("Pending Job Receive");
						details.add(n);
						n = null;
					}
				}
			}
		}

		for (SalesEntry se : getAllSalesEntries()) {
			PaymentDetails pd = getPaymentDetailsBySalesEntryId(se.getId())
					.get(0);
			if (se.getSales_date().before(
					Date.from(LocalDateTime.now().minusDays(30)
							.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))
					&& (pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
				Notification n = new Notification();
				int days = (int) ChronoUnit.DAYS.between(LocalDateTime
						.ofInstant(se.getSales_date().toInstant(),
								ZoneId.systemDefault()), dateTime);
				n.setDescription("Sales payment due for sales challan number "
						+ se.getChallanNumber() + " and amount is "
						+ (pd.getTotalAmount() - pd.getPaidAmount())
						+ " since " + days + " days.");
				n.setLink("salesView?sId=" + se.getId());
				n.setNotificationName("Sales payment due");
				details.add(n);
				n = null;
			}

		}

		// for (Purchase_Entry pe : getAllPurchaseEntry()) {
		// PaymentDetails pd = getPaymentDetailsByPurchaseEntryId(pe.getId())
		// .get(0);
		// if (!pe.getVendor().getName().equals("Production Vendor")
		// && pe.getPurchase_date()
		// .before(Date.from(LocalDateTime
		// .now()
		// .minusDays(90)
		// .toInstant(ZoneOffset.ofHoursMinutes(5, 30))))
		// && (pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
		// Notification n = new Notification();
		// int days = (int) ChronoUnit.DAYS.between(LocalDateTime
		// .ofInstant(pe.getPurchase_date().toInstant(),
		// ZoneId.systemDefault()), dateTime);
		// n.setDescription("Purchase payment due for purchase challan number "
		// + pe.getChallanNumber()
		// + " and amount is "
		// + (pd.getTotalAmount() - pd.getPaidAmount())
		// + " since " + days + " days.");
		// n.setLink("purchaseView?pId=" + pe.getId());
		// n.setNotificationName("Purchase payment due");
		// details.add(n);
		// n = null;
		// }
		// }

		// for (JobAssignmentDetails ja : getAllJobassignmentDetails()) {
		// List<PaymentDetails> pdLst = getPaymentDetailsByJobAsignId(ja
		// .getId());
		// if (ja.getAssignDate().before(
		// Date.from(LocalDateTime.now().minusDays(90)
		// .toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
		// if (pdLst.size() > 0) {
		// PaymentDetails pd = getPaymentDetailsByJobAsignId(
		// ja.getId()).get(0);
		// if ((pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
		// Notification n = new Notification();
		// int days = (int) ChronoUnit.DAYS.between(LocalDateTime
		// .ofInstant(ja.getAssignDate().toInstant(),
		// ZoneId.systemDefault()), dateTime);
		// n.setDescription("Job payment due for challan number "
		// + ja.getChallanNumber() + " and amount is "
		// + (pd.getTotalAmount() - pd.getPaidAmount())
		// + " since " + days + " days.");
		// n.setLink("jobSearchByJobChallanNoForPayment?companyInitial="
		// + (ja.getChallanNumber().split("/")[0])
		// + "&fynYear="
		// + (ja.getChallanNumber().split("/")[1])
		// + "&month="
		// + (ja.getChallanNumber().split("/")[2])
		// + "&billType="
		// + (ja.getChallanNumber().split("/")[3])
		// + "&autoNum="
		// + (ja.getChallanNumber().split("/")[4])
		// + "&suffix="
		// + (ja.getChallanNumber().split("/")[5]));
		// n.setNotificationName("Job payment due");
		// details.add(n);
		// n = null;
		// }
		// } else {
		// Notification n = new Notification();
		// int days = (int) ChronoUnit.DAYS.between(LocalDateTime
		// .ofInstant(ja.getAssignDate().toInstant(),
		// ZoneId.systemDefault()), dateTime);
		// float totJobCost = 0;
		// for (JobAssignmentProducts jp : ja
		// .getJobAssignmentProducts()) {
		// totJobCost = totJobCost + jp.getTotalJobCost();
		// }
		// n.setDescription("Job payment due for challan number "
		// + ja.getChallanNumber() + " and amount is "
		// + totJobCost + " since " + days + " days.");
		// n.setLink("jobSearchByJobChallanNoForPayment?companyInitial="
		// + (ja.getChallanNumber().split("/")[0])
		// + "&fynYear="
		// + (ja.getChallanNumber().split("/")[1])
		// + "&month="
		// + (ja.getChallanNumber().split("/")[2])
		// + "&billType="
		// + (ja.getChallanNumber().split("/")[3])
		// + "&autoNum="
		// + (ja.getChallanNumber().split("/")[4])
		// + "&suffix="
		// + (ja.getChallanNumber().split("/")[5]));
		// n.setNotificationName("Job payment due");
		// details.add(n);
		// n = null;
		// }
		// }
		// }

		// for (SalesEntry se : getAllSalesEntries()) {
		// if (se.getVendor() != null) {
		// if (se.getSales_date().before(
		// Date.from(LocalDateTime.now().minusDays(90)
		// .toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
		// List<PaymentDetailsForViaAgents> pdLst =
		// getPaymentDetails4ViaAgentBySalesEntryId(se
		// .getId());
		//
		// float totPaybleCost = se.getAgentProfitTotal();
		// for (SalesReturn sr : se.getSalesReturn()) {
		// totPaybleCost = totPaybleCost
		// - sr.getRetAgentProfitTotal();
		// }
		// if (pdLst.size() > 0) {
		// for (PaymentDetailsForViaAgents pd :
		// getPaymentDetails4ViaAgentBySalesEntryId(se
		// .getId())) {
		// totPaybleCost = totPaybleCost - pd.getPaidAmount();
		// }
		// }
		// totPaybleCost = Math.round(totPaybleCost * 100) / 100;
		// if (totPaybleCost != 0) {
		// Notification n = new Notification();
		// int days = (int) ChronoUnit.DAYS.between(LocalDateTime
		// .ofInstant(se.getSales_date().toInstant(),
		// ZoneId.systemDefault()), dateTime);
		// n.setDescription("Sales Agent payment due for challan number "
		// + se.getChallanNumber()
		// + " and amount is "
		// + totPaybleCost + " since " + days + " days.");
		// n.setLink("salesSearchBySalesChallanNoForAgent?companyInitial="
		// + (se.getChallanNumber().split("/")[0])
		// + "&fynYear="
		// + (se.getChallanNumber().split("/")[1])
		// + "&month="
		// + (se.getChallanNumber().split("/")[2])
		// + "&billType="
		// + (se.getChallanNumber().split("/")[3])
		// + "&autoNum="
		// + (se.getChallanNumber().split("/")[4])
		// + "&suffix="
		// + (se.getChallanNumber().split("/")[5]));
		// n.setNotificationName("Sales agent payment due");
		// details.add(n);
		// n = null;
		// }
		// }
		// }
		// }

		// for (Purchase_Entry se : getAllPurchaseEntry()) {
		// if (se.getAgentId() != 0) {
		// if (se.getPurchase_date().before(
		// Date.from(LocalDateTime.now().minusDays(90)
		// .toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
		// List<PaymentDetailsForViaAgents> pdLst =
		// getPaymentDetails4ViaAgentByPurchaseEntryId(se
		// .getId());
		//
		// float totPaybleCost = se.getAgentProfitTotal();
		// for (PurchaseReturn sr : se.getPurchaseReturn()) {
		// totPaybleCost = totPaybleCost
		// - sr.getRetAgentProfitTotal();
		// }
		// if (pdLst.size() > 0) {
		// for (PaymentDetailsForViaAgents pd :
		// getPaymentDetails4ViaAgentByPurchaseEntryId(se
		// .getId())) {
		// totPaybleCost = totPaybleCost - pd.getPaidAmount();
		// }
		// }
		// totPaybleCost = Math.round(totPaybleCost * 100) / 100;
		// if (totPaybleCost != 0) {
		// Notification n = new Notification();
		// int days = (int) ChronoUnit.DAYS.between(LocalDateTime
		// .ofInstant(se.getPurchase_date().toInstant(),
		// ZoneId.systemDefault()), dateTime);
		// n.setDescription("Purchase Agent (via) payment due for challan number "
		// + se.getChallanNumber()
		// + " and amount is "
		// + totPaybleCost + " since " + days + " days.");
		// n.setLink("purchaseSearchByPurchaseChallanNoForViaPurchaseAgent?companyInitial="
		// + (se.getChallanNumber().split("/")[0])
		// + "&fynYear="
		// + (se.getChallanNumber().split("/")[1])
		// + "&month="
		// + (se.getChallanNumber().split("/")[2])
		// + "&billType="
		// + (se.getChallanNumber().split("/")[3])
		// + "&autoNum="
		// + (se.getChallanNumber().split("/")[4])
		// + "&suffix="
		// + (se.getChallanNumber().split("/")[5]));
		// n.setNotificationName("Purchase agent (via) payment due");
		// details.add(n);
		// n = null;
		// }
		// }
		// }
		// }
		return details;
	}

	public int getNotificationsCount() {
		int i = 0;

		List<Purchase_Entry> purchase_Entries = getAllPurchaseEntry();
		for (Purchase_Entry pe : purchase_Entries) {
			if (pe.getPurchase_date().before(
					Date.from(LocalDateTime.now().minusMonths(3)
							.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
				for (Purchase_Product_Details ppd : pe
						.getPurchase_Product_Details()) {
					if (ppd.getRemaining_quantity() > 0) {
						i++;
					}
				}
			}
		}

		for (JobAssignmentDetails jad : getAllJobassignmentDetails()) {
			for (JobAssignmentProducts jap : jad.getJobAssignmentProducts()) {
				for (JobAssignmentJobDetails jaj : jap
						.getJobAssignmentJobDetails()) {
					if (jaj.getEstimatedCompletionDate().before(
							Date.from(LocalDateTime.now().toInstant(
									ZoneOffset.ofHoursMinutes(5, 30))))
							&& jap.getRemaninQty() > 0) {
						i++;
					}
				}
			}
		}

		for (SalesEntry se : getAllSalesEntries()) {
			PaymentDetails pd = getPaymentDetailsBySalesEntryId(se.getId())
					.get(0);
			if (se.getSales_date().before(
					Date.from(LocalDateTime.now().minusDays(90)
							.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))
					&& (pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
				i++;
			}

		}

		for (Purchase_Entry pe : getAllPurchaseEntry()) {
			PaymentDetails pd = getPaymentDetailsByPurchaseEntryId(pe.getId())
					.get(0);
			if (!pe.getVendor().getName().equals("Production Vendor")
					&& pe.getPurchase_date()
							.before(Date.from(LocalDateTime
									.now()
									.minusDays(90)
									.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))
					&& (pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
				i++;
			}
		}

		for (JobAssignmentDetails ja : getAllJobassignmentDetails()) {
			List<PaymentDetails> pdLst = getPaymentDetailsByJobAsignId(ja
					.getId());
			if (ja.getAssignDate().before(
					Date.from(LocalDateTime.now().minusDays(90)
							.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
				if (pdLst.size() > 0) {
					PaymentDetails pd = getPaymentDetailsByJobAsignId(
							ja.getId()).get(0);
					if ((pd.getTotalAmount() - pd.getPaidAmount()) > 0) {
						i++;
					}
				} else {
					i++;
				}
			}
		}

		for (SalesEntry se : getAllSalesEntries()) {
			if (se.getVendor() != null) {
				if (se.getSales_date().before(
						Date.from(LocalDateTime.now().minusDays(90)
								.toInstant(ZoneOffset.ofHoursMinutes(5, 30))))) {
					List<PaymentDetailsForViaAgents> pdLst = getPaymentDetails4ViaAgentBySalesEntryId(se
							.getId());

					float totPaybleCost = se.getAgentProfitTotal();
					for (SalesReturn sr : se.getSalesReturn()) {
						totPaybleCost = totPaybleCost
								- sr.getRetAgentProfitTotal();
					}
					if (pdLst.size() > 0) {
						for (PaymentDetailsForViaAgents pd : getPaymentDetails4ViaAgentBySalesEntryId(se
								.getId())) {
							totPaybleCost = totPaybleCost - pd.getPaidAmount();
						}
					}
					if (totPaybleCost != 0) {
						i++;
					}
				}
			}
		}
		return i;
	}
}
