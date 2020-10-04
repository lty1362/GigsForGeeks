package com.gigsforgeeks.service.model.vo;

import java.sql.Date;

public class FAQ {

	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private int faqCount;
	private String faqState;
	private Date faqRegister;
	private Date faqUpdate;
		
	public FAQ() {
		
	}

	/**
	 * 기본 FAQ
	 */
	public FAQ(int faqNo, String faqCategory, String faqTitle, String faqContent, int faqCount, String faqState,
			Date faqRegister, Date faqUpdate) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqCount = faqCount;
		this.faqState = faqState;
		this.faqRegister = faqRegister;
		this.faqUpdate = faqUpdate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public int getFaqCount() {
		return faqCount;
	}

	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}

	public String getFaqState() {
		return faqState;
	}

	public void setFaqState(String faqState) {
		this.faqState = faqState;
	}

	public Date getFaqRegister() {
		return faqRegister;
	}

	public void setFaqRegister(Date faqRegister) {
		this.faqRegister = faqRegister;
	}

	public Date getFaqUpdate() {
		return faqUpdate;
	}

	public void setFaqUpdate(Date faqUpdate) {
		this.faqUpdate = faqUpdate;
	}

	
	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqCategory=" + faqCategory + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqCount=" + faqCount + ", faqState=" + faqState + ", faqRegister=" + faqRegister
				+ ", faqUpdate=" + faqUpdate + "]";
	}
	
}
