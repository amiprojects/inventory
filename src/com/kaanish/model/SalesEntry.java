package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class SalesEntry implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private int challanNo;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_Date;
	@Temporal(TemporalType.TIMESTAMP)
	private Date sales_date;
	private float surcharge;
	private float transportcCharge;
	private float totalCost;
	private float roundOf;
	private String saleType;
	private String challanNumber;
	private int challanSuffix;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private CustomerEntry customer;

	@OneToMany(mappedBy = "salesEntry", cascade = CascadeType.ALL)
	private List<SalesProductDetails> salesProductDetails;

	@OneToMany(mappedBy = "salesEntry")
	private List<PaymentDetails> paymentDetails;

	@ManyToOne
	@JoinColumn(name = "taxtypeId")
	private Tax_Type_Group tax_Type_Group;

	public Date getEntry_Date() {
		return entry_Date;
	}

	public void setEntry_Date(Date entry_Date) {
		this.entry_Date = entry_Date;
	}

	@ManyToOne
	@JoinColumn(name = "bill_setupId")
	private Bill_setup bill_setup;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getChallanNo() {
		return challanNo;
	}

	public void setChallanNo(int challanNo) {
		this.challanNo = challanNo;
	}

	/*public Date getEntry_Date() {
		return Entry_Date;
	}

	public void setEntry_Date(Date entry_Date) {
		Entry_Date = entry_Date;
	}*/

	public Date getSales_date() {
		return sales_date;
	}

	public void setSales_date(Date sales_date) {
		this.sales_date = sales_date;
	}

	public float getSurcharge() {
		return surcharge;
	}

	public void setSurcharge(float surcharge) {
		this.surcharge = surcharge;
	}

	public float getTransportcCharge() {
		return transportcCharge;
	}

	public void setTransportcCharge(float transportcCharge) {
		this.transportcCharge = transportcCharge;
	}

	public float getRoundOf() {
		return roundOf;
	}

	public void setRoundOf(float roundOf) {
		this.roundOf = roundOf;
	}

	public String getSaleType() {
		return saleType;
	}

	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}

	public CustomerEntry getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerEntry customer) {
		this.customer = customer;
	}

	public List<SalesProductDetails> getSalesProductDetails() {
		return salesProductDetails;
	}

	public void setSalesProductDetails(List<SalesProductDetails> salesProductDetails) {
		this.salesProductDetails = salesProductDetails;
	}

	public Tax_Type_Group getTax_Type_Group() {
		return tax_Type_Group;
	}

	public void setTax_Type_Group(Tax_Type_Group tax_Type_Group) {
		this.tax_Type_Group = tax_Type_Group;
	}

	public Bill_setup getBill_setup() {
		return bill_setup;
	}

	public void setBill_setup(Bill_setup bill_setup) {
		this.bill_setup = bill_setup;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public int getChallanSuffix() {
		return challanSuffix;
	}

	public void setChallanSuffix(int challanSuffix) {
		this.challanSuffix = challanSuffix;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

}
