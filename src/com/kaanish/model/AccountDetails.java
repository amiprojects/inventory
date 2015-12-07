package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class AccountDetails {
	@Id
	@GeneratedValue
	private int id;
	private String bankName;
	private String bankAccountNumber;
	private String branch;
	private String vatNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date vatRegistrationDate;
	private String cstNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date cstRegistrationDate;
	private String panNumber;
	private String exciseRegistrationNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date exciseRegistrationDate;
	private String serviceTaxRegistrationNumber;
	@Temporal(TemporalType.TIMESTAMP)
	private Date serviceTaxRegistrationDate;
	private String bankIFSCnumber;
	private String bankMICRnumber;
	private String bankRTGCnumber;
	private String bankChequeLable;

	@ManyToOne
	@JoinColumn(name = "cityId")
	private City city;

	@ManyToOne
	@JoinColumn(name = "vendorId")
	private Vendor vendor;

	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;

	@ManyToOne
	@JoinColumn(name = "taxTypeGroupId")
	private Tax_Type_Group tax_Type_Group;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccountNumber() {
		return bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getVatNumber() {
		return vatNumber;
	}

	public void setVatNumber(String vatNumber) {
		this.vatNumber = vatNumber;
	}

	public Date getVatRegistrationDate() {
		return vatRegistrationDate;
	}

	public void setVatRegistrationDate(Date vatRegistrationDate) {
		this.vatRegistrationDate = vatRegistrationDate;
	}

	public String getCstNumber() {
		return cstNumber;
	}

	public void setCstNumber(String cstNumber) {
		this.cstNumber = cstNumber;
	}

	public Date getCstRegistrationDate() {
		return cstRegistrationDate;
	}

	public void setCstRegistrationDate(Date cstRegistrationDate) {
		this.cstRegistrationDate = cstRegistrationDate;
	}

	public String getPanNumber() {
		return panNumber;
	}

	public void setPanNumber(String panNumber) {
		this.panNumber = panNumber;
	}

	public String getExciseRegistrationNumber() {
		return exciseRegistrationNumber;
	}

	public void setExciseRegistrationNumber(String exciseRegistrationNumber) {
		this.exciseRegistrationNumber = exciseRegistrationNumber;
	}

	public Date getExciseRegistrationDate() {
		return exciseRegistrationDate;
	}

	public void setExciseRegistrationDate(Date exciseRegistrationDate) {
		this.exciseRegistrationDate = exciseRegistrationDate;
	}

	public String getServiceTaxRegistrationNumber() {
		return serviceTaxRegistrationNumber;
	}

	public void setServiceTaxRegistrationNumber(
			String serviceTaxRegistrationNumber) {
		this.serviceTaxRegistrationNumber = serviceTaxRegistrationNumber;
	}

	public Date getServiceTaxRegistrationDate() {
		return serviceTaxRegistrationDate;
	}

	public void setServiceTaxRegistrationDate(Date serviceTaxRegistrationDate) {
		this.serviceTaxRegistrationDate = serviceTaxRegistrationDate;
	}

	public String getBankIFSCnumber() {
		return bankIFSCnumber;
	}

	public void setBankIFSCnumber(String bankIFSCnumber) {
		this.bankIFSCnumber = bankIFSCnumber;
	}

	public String getBankMICRnumber() {
		return bankMICRnumber;
	}

	public void setBankMICRnumber(String bankMICRnumber) {
		this.bankMICRnumber = bankMICRnumber;
	}

	public String getBankRTGCnumber() {
		return bankRTGCnumber;
	}

	public void setBankRTGCnumber(String bankRTGCnumber) {
		this.bankRTGCnumber = bankRTGCnumber;
	}

	public String getBankChequeLable() {
		return bankChequeLable;
	}

	public void setBankChequeLable(String bankChequeLable) {
		this.bankChequeLable = bankChequeLable;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public Tax_Type_Group getTax_Type_Group() {
		return tax_Type_Group;
	}

	public void setTax_Type_Group(Tax_Type_Group tax_Type_Group) {
		this.tax_Type_Group = tax_Type_Group;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

}
