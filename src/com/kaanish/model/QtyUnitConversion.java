package com.kaanish.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class QtyUnitConversion {

	@EmbeddedId
	private QtyUnitConversionPK conversionPK;
	private float conversion;

	@ManyToOne
	@JoinColumn(name = "qtyUnitId2")
	private QtyUnit qtyUnitId2;

	@ManyToOne
	@JoinColumn(name = "qtyUnitId1")
	private QtyUnit qtyUnitId1;

	public QtyUnitConversionPK getConversionPK() {
		return conversionPK;
	}

	public void setConversionPK(QtyUnitConversionPK conversionPK) {
		this.conversionPK = conversionPK;
	}

	public float getConversion() {
		return conversion;
	}

	public void setConversion(float conversion) {
		this.conversion = conversion;
	}

	public QtyUnit getQtyUnitId2() {
		return qtyUnitId2;
	}

	public void setQtyUnitId2(QtyUnit qtyUnitId2) {
		this.qtyUnitId2 = qtyUnitId2;
	}

	public QtyUnit getQtyUnitId1() {
		return qtyUnitId1;
	}

	public void setQtyUnitId1(QtyUnit qtyUnitId1) {
		this.qtyUnitId1 = qtyUnitId1;
	}
	
	@Override
	public String toString() {
		return "{\"qtyUnitId1\":\""+qtyUnitId1.getId()+"\", "+"\"qtyUnitId2\":\""+qtyUnitId2.getId()+"\", \"qtyUnit1Name\":\""+qtyUnitId1.getName()+"\", \"qtyUnit2Name\":\""+qtyUnitId2.getName()+"\", "+"\"conversion\":\""+conversion+"\"}"; 
	}
}
