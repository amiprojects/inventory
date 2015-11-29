package com.kaanish.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class QtyUnitConversionPK implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(insertable = false, updatable = false)
	private int qtyUnitId1;
	@Column(insertable = false, updatable = false)
	private int qtyUnitId2;

	public int getQtyUnitId1() {
		return qtyUnitId1;
	}

	public void setQtyUnitId1(int qtyUnitId1) {
		this.qtyUnitId1 = qtyUnitId1;
	}

	public int getQtyUnitId2() {
		return qtyUnitId2;
	}

	public void setQtyUnitId2(int qtyUnitId2) {
		this.qtyUnitId2 = qtyUnitId2;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + ((int) (this.getQtyUnitId1() ^ (this.getQtyUnitId1() >>> 32)));
		hash = hash * prime + ((Integer)this.getQtyUnitId2()).hashCode();

		return hash;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof QtyUnitConversionPK)) {
			return false;
		}
		QtyUnitConversionPK castOther = (QtyUnitConversionPK) obj;
		return (this.getQtyUnitId1() == castOther.getQtyUnitId1())
				&& this.getQtyUnitId2()==castOther.getQtyUnitId2();
	}

}
