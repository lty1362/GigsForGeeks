package com.gigsforgeeks.service.model.vo;

import java.sql.Date;

public class Enquiry {

	private int enquiryNo;
	private String userId;
	private String enquiryType;
	private String enquiryTitle;
	private Date enquiryDate;
	private String enquiryContent;
	private String answerContent;
	private String enquiryState;
	private Date answerDate;
	
	public Enquiry() {
		
	}
	

	// 관리자 문의조회
	public Enquiry(int enquiryNo, String userId, String enquiryType, String enquiryTitle, Date enquiryDate,
			String enquiryState, Date answerDate) {
		super();
		this.enquiryNo = enquiryNo;
		this.userId = userId;
		this.enquiryType = enquiryType;
		this.enquiryTitle = enquiryTitle;
		this.enquiryDate = enquiryDate;
		this.enquiryState = enquiryState;
		this.answerDate = answerDate;
	}



	// 회원 문의등록 : insertEnquiry
	public Enquiry(int enquiryNo, String userId, String enquiryType, String enquiryTitle, String enquiryContent, Date enquiryDate) {
		super();
		this.enquiryType = enquiryType;
		this.enquiryTitle = enquiryTitle;
		this.enquiryContent = enquiryContent;
	}
	
	public Enquiry(int enquiryNo, String userId, String enquiryType, String enquiryTitle, Date enquiryDate,
			String enquiryContent, String answerContent, String enquiryState, Date answerDate) {
		super();
		this.enquiryNo = enquiryNo;
		this.userId = userId;
		this.enquiryType = enquiryType;
		this.enquiryTitle = enquiryTitle;
		this.enquiryDate = enquiryDate;
		this.enquiryContent = enquiryContent;
		this.answerContent = answerContent;
		this.enquiryState = enquiryState;
		this.answerDate = answerDate;
	}


	public int getEnquiryNo() {
		return enquiryNo;
	}

	public void setEnquiryNo(int enquiryNo) {
		this.enquiryNo = enquiryNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}

	public String getEnquiryTitle() {
		return enquiryTitle;
	}

	public void setEnquiryTitle(String enquiryTitle) {
		this.enquiryTitle = enquiryTitle;
	}

	public Date getEnquiryDate() {
		return enquiryDate;
	}

	public void setEnquiryDate(Date enquiryDate) {
		this.enquiryDate = enquiryDate;
	}

	public String getEnquiryContent() {
		return enquiryContent;
	}

	public void setEnquiryContent(String enquiryContent) {
		this.enquiryContent = enquiryContent;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getEnquiryState() {
		return enquiryState;
	}

	public void setEnquiryState(String enquiryState) {
		this.enquiryState = enquiryState;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}



	@Override
	public String toString() {
		return "Enquiry [enquiryNo=" + enquiryNo + ", userId=" + userId + ", enquiryType=" + enquiryType
				+ ", enquiryTitle=" + enquiryTitle + ", enquiryDate=" + enquiryDate + ", enquiryContent="
				+ enquiryContent + ", answerContent=" + answerContent + ", enquiryState=" + enquiryState
				+ ", answerDate=" + answerDate + "]";
	}
	
	
	
}
