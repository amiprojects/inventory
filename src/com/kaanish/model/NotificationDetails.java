package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
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
public class NotificationDetails implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String details;
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date notifiDate;

	@ManyToOne
	@JoinColumn(name = "purchase_EntryId")
	private Purchase_Entry purchase_Entry;
	
	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;
	
	@ManyToOne
	@JoinColumn(name = "productDetailId")
	private ProductDetail productDetail;
	
	@OneToMany(mappedBy = "notificationDetails")
	private List<NotificationView> notificationView;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getNotifiDate() {
		return notifiDate;
	}

	public void setNotifiDate(Date notifiDate) {
		this.notifiDate = notifiDate;
	}

	public Purchase_Entry getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(Purchase_Entry purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public ProductDetail getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

	public List<NotificationView> getNotificationView() {
		return notificationView;
	}

	public void setNotificationView(List<NotificationView> notificationView) {
		this.notificationView = notificationView;
	}


	
}
