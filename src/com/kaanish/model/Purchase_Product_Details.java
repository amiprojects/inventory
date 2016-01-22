package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

@Entity
@Cacheable(false)
public class Purchase_Product_Details implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private float cost;
	private int remaining_quantity;
	private int quantity;
	private int totalReturningQty;
	private float mrp;
	private float wsp;
	private String attrValue1;
	private String attrValue2;
	private String attrValue3;
	private String attrValue4;
	private String attrValue5;
	private String attrValue6;
	private String lotNumber;
	private boolean initialInventory;
	@Transient
	private int numberForBarcodePrint;

	@OneToMany(mappedBy = "purchaseProductDetails")
	private List<PurchaseReturnProductDetails> purchaseReturnProductDetails;

	@ManyToOne
	@JoinColumn(name = "purchaseReturnId")
	private PurchaseReturn purchaseReturn;

	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;

	@OneToMany(mappedBy = "purchase_Product_Details")
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@OneToMany(mappedBy = "purchase_Product_Details", cascade = CascadeType.ALL)
	private List<SerialNumber> serialNumbers;

	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDetail productDetail;

	@ManyToOne
	@JoinColumn(name = "purchaseEntryId")
	private Purchase_Entry purchase_Entry;

	@OneToOne
	@JoinColumn(name = "jobRecievedDetailsId")
	private JobRecievedDetails recievedDetails;

	@OneToMany(mappedBy = "purchase_Product_Details", cascade = CascadeType.PERSIST)
	private List<SalesProductDetails> salesProductDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public int getRemaining_quantity() {
		return remaining_quantity;
	}

	public void setRemaining_quantity(int remaining_quantity) {
		this.remaining_quantity = remaining_quantity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getMrp() {
		return mrp;
	}

	public void setMrp(float f) {
		this.mrp = f;
	}

	public float getWsp() {
		return wsp;
	}

	public void setWsp(float f) {
		this.wsp = f;
	}

	public String getAttrValue1() {
		return attrValue1;
	}

	public void setAttrValue1(String attrValue1) {
		this.attrValue1 = attrValue1;
	}

	public String getAttrValue2() {
		return attrValue2;
	}

	public void setAttrValue2(String attrValue2) {
		this.attrValue2 = attrValue2;
	}

	public String getAttrValue3() {
		return attrValue3;
	}

	public void setAttrValue3(String attrValue3) {
		this.attrValue3 = attrValue3;
	}

	public String getAttrValue4() {
		return attrValue4;
	}

	public void setAttrValue4(String attrValue4) {
		this.attrValue4 = attrValue4;
	}

	public String getAttrValue5() {
		return attrValue5;
	}

	public void setAttrValue5(String attrValue5) {
		this.attrValue5 = attrValue5;
	}

	public String getAttrValue6() {
		return attrValue6;
	}

	public void setAttrValue6(String attrValue6) {
		this.attrValue6 = attrValue6;
	}

	public boolean isInitialInventory() {
		return initialInventory;
	}

	public void setInitialInventory(boolean initialInventory) {
		this.initialInventory = initialInventory;
	}

	public List<SerialNumber> getSerialNumbers() {
		return serialNumbers;
	}

	public void setSerialNumbers(List<SerialNumber> serialNumbers) {
		this.serialNumbers = serialNumbers;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public Purchase_Entry getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(Purchase_Entry purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	@Override
	public String toString() {
		String str;
		if (isInitialInventory()) {
			str = "{\"id\":\"" + id + "\"," + "\"mrp\":\"" + mrp + "\","
					+ "\"uom\":\"" + productDetail.getQtyUnit().getName()
					+ "\"," + "\"wsp\":\"" + wsp + "\"," + "\"lotNumber\":\""
					+ lotNumber + "\"," + "\"remaining_quantity\":\""
					+ remaining_quantity + "\"," + "\"quantity\":\"" + quantity
					+ "\"," + "\"cost\":\"" + cost + "\","
					+ "\"productCode\":\"" + productDetail.getCode() + "\","
					+ "\"productId\":\"" + productDetail.getId() + "\","
					+ "\"productDesc\":\"" + productDetail.getDescription()
					+ "\"," + "\"isRaw\":\"" + productDetail.isRaw() + "\","
					+ "\"purchaseDate\":\"" + "Initial Inventory" + "\","
					+ "\"purchaseVendorName\":\"" + "Initial Inventory" + "\","
					+ "\"attrName1\":\""
					+ productDetail.getCategory().getAttrNmae1() + "\","
					+ "\"attrName2\":\""
					+ productDetail.getCategory().getAttrNmae2() + "\","
					+ "\"attrName3\":\""
					+ productDetail.getCategory().getAttrNmae3() + "\","
					+ "\"attrName4\":\""
					+ productDetail.getCategory().getAttrNmae4() + "\","
					+ "\"attrName5\":\""
					+ productDetail.getCategory().getAttrNmae5() + "\","
					+ "\"attrName6\":\""
					+ productDetail.getCategory().getAttrNmae6() + "\","
					+ "\"attrValue1\":\"" + attrValue1 + "\","
					+ "\"attrValue2\":\"" + attrValue2 + "\","
					+ "\"attrValue3\":\"" + attrValue3 + "\","
					+ "\"attrValue4\":\"" + attrValue4 + "\","
					+ "\"attrValue5\":\"" + attrValue5 + "\","
					+ "\"attrValue6\":\"" + attrValue6 + "\"}";
		} else {
			str = "{\"id\":\"" + id + "\"," + "\"mrp\":\"" + mrp + "\","
					+ "\"isRaw\":\"" + productDetail.isRaw() + "\","
					+ "\"wsp\":\"" + wsp + "\"," + "\"lotNumber\":\""
					+ lotNumber + "\"," + "\"remaining_quantity\":\""
					+ remaining_quantity + "\"," + "\"quantity\":\"" + quantity
					+ "\"," + "\"cost\":\"" + cost + "\"," + "\"attrName1\":\""
					+ productDetail.getCategory().getAttrNmae1() + "\","
					+ "\"attrName2\":\""
					+ productDetail.getCategory().getAttrNmae2() + "\","
					+ "\"attrName3\":\""
					+ productDetail.getCategory().getAttrNmae3() + "\","
					+ "\"attrName4\":\""
					+ productDetail.getCategory().getAttrNmae4() + "\","
					+ "\"attrName5\":\""
					+ productDetail.getCategory().getAttrNmae5() + "\","
					+ "\"attrName6\":\""
					+ productDetail.getCategory().getAttrNmae6() + "\","
					+ "\"attrValue1\":\"" + attrValue1 + "\","
					+ "\"attrValue2\":\"" + attrValue2 + "\","
					+ "\"attrValue3\":\"" + attrValue3 + "\","
					+ "\"attrValue4\":\"" + attrValue4 + "\","
					+ "\"attrValue5\":\"" + attrValue5 + "\","
					+ "\"attrValue6\":\"" + attrValue6 + "\","
					+ "\"purchaseVendorName\":\""
					+ purchase_Entry.getVendor().getName() + "\","
					+ "\"purchaseDate\":\"" + purchase_Entry.getPurchase_date()
					+ "\"," + "\"uom\":\""
					+ productDetail.getQtyUnit().getName() + "\","
					+ "\"productCode\":\"" + productDetail.getCode() + "\","
					+ "\"productId\":\"" + productDetail.getId() + "\","
					+ "\"productDesc\":\"" + productDetail.getDescription()
					+ "\"," + "\"purchaseVendorAddress\":\""
					+ purchase_Entry.getVendor().getAddress() + "\","
					+ "\"purchaseVendorCompanyName\":\""
					+ purchase_Entry.getVendor().getCompanyName() + "\","
					+ "\"purchaseVendorPhoneNumber\":\""
					+ purchase_Entry.getVendor().getPh1() + "\"}";
		}
		return str;

	}

	public JobRecievedDetails getRecievedDetails() {
		return recievedDetails;
	}

	public void setRecievedDetails(JobRecievedDetails recievedDetails) {
		this.recievedDetails = recievedDetails;
	}

	public String getLotNumber() {
		return lotNumber;
	}

	public void setLotNumber(String lotNumber) {
		this.lotNumber = lotNumber;
	}

	public List<SalesProductDetails> getSalesProductDetails() {
		return salesProductDetails;
	}

	public void setSalesProductDetails(
			List<SalesProductDetails> salesProductDetails) {
		this.salesProductDetails = salesProductDetails;
	}

	public int getNumberForBarcodePrint() {
		return numberForBarcodePrint;
	}

	public void setNumberForBarcodePrint(int numberForBarcodePrint) {
		this.numberForBarcodePrint = numberForBarcodePrint;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public int getTotalReturningQty() {
		return totalReturningQty;
	}

	public void setTotalReturningQty(int totalReturningQty) {
		this.totalReturningQty = totalReturningQty;
	}

}
