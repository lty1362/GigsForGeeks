package com.gigsforgeeks.member.model.vo;

public class Certificate {
	private int cetificateNumber;		//자격증 번호
	private String cetificateName;	    //자격증 이름
	private String cetificateAuth;	    //주최기관
	private String cetificateDate;     //취득년도
	private String userId;			    //회원아이디
	
	public Certificate() {}

	public Certificate(int cetificateNumber, String cetificateName, String cetificateAuth, String cetificateDate,
			String userId) {
		super();
		this.cetificateNumber = cetificateNumber;
		this.cetificateName = cetificateName;
		this.cetificateAuth = cetificateAuth;
		this.cetificateDate = cetificateDate;
		this.userId = userId;
	}

	public int getcetificateNumber() {
		return cetificateNumber;
	}

	public void setcetificateNumber(int cetificateNumber) {
		this.cetificateNumber = cetificateNumber;
	}

	public String getcetificateName() {
		return cetificateName;
	}

	public void setcetificateName(String cetificateName) {
		this.cetificateName = cetificateName;
	}

	public String getcetificateAuth() {
		return cetificateAuth;
	}

	public void setcetificateAuth(String cetificateAuth) {
		this.cetificateAuth = cetificateAuth;
	}

	public String getcetificateDate() {
		return cetificateDate;
	}

	public void setcetificateDate(String cetificateDate) {
		this.cetificateDate = cetificateDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Certificate [cetificateNumber=" + cetificateNumber + ", cetificateName=" + cetificateName
				+ ", cetificateAuth=" + cetificateAuth + ", cetificateDate=" + cetificateDate + ", userId=" + userId
				+ "]";
	}
	
	
	
	
}
