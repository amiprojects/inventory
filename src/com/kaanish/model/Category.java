package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String attrNmae1;
	private String attrNmae2;
	private String attrNmae3;
	private String attrNmae4;
	private String attrNmae5;
	private String attrNmae6;

	@ManyToOne
	@JoinColumn(name = "subDepartmentId")
	private SubDepartment subDepartment;
	@OneToMany(mappedBy = "category")
	private List<ProductDetail> productDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttrNmae1() {
		return attrNmae1;
	}

	public void setAttrNmae1(String attrNmae1) {
		this.attrNmae1 = attrNmae1;
	}

	public String getAttrNmae2() {
		return attrNmae2;
	}

	public void setAttrNmae2(String attrNmae2) {
		this.attrNmae2 = attrNmae2;
	}

	public String getAttrNmae3() {
		return attrNmae3;
	}

	public void setAttrNmae3(String attrNmae3) {
		this.attrNmae3 = attrNmae3;
	}

	public String getAttrNmae4() {
		return attrNmae4;
	}

	public void setAttrNmae4(String attrNmae4) {
		this.attrNmae4 = attrNmae4;
	}

	public String getAttrNmae5() {
		return attrNmae5;
	}

	public void setAttrNmae5(String attrNmae5) {
		this.attrNmae5 = attrNmae5;
	}

	public String getAttrNmae6() {
		return attrNmae6;
	}

	public void setAttrNmae6(String attrNmae6) {
		this.attrNmae6 = attrNmae6;
	}

	public SubDepartment getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(SubDepartment subDepartment) {
		this.subDepartment = subDepartment;
	}

	public List<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(List<ProductDetail> productDetails) {
		this.productDetails = productDetails;
	}

	@Override
	public String toString() {
		return "{\"name\":\"" + name + "\", " + "\"id\":\"" + id + "\", "
				+ "\"attrNmae1\":\"" + attrNmae1 + "\", " + "\"attrNmae2\":\""
				+ attrNmae2 + "\", " + "\"attrNmae3\":\"" + attrNmae3 + "\", "
				+ "\"attrNmae4\":\"" + attrNmae4 + "\", " + "\"attrNmae5\":\""
				+ attrNmae5 + "\", " + "\"attrNmae6\":\"" + attrNmae6 + "\"}";
	}

}