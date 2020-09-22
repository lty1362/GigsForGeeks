package com.gigsforgeeks.member.model.vo;

public class Certificate {
	private int cartificateNumber;		//자격증 번호
	private String cartificateName;	    //자격증 이름
	private String cartificateAuth;	    //주최기관
	private String cartificateDate;     //취득년도
	private String userId;			    //회원아이디
	
	public Certificate() {}

	public Certificate(int cartificateNumber, String cartificateName, String cartificateAuth, String cartificateDate,
			String userId) {
		super();
		this.cartificateNumber = cartificateNumber;
		this.cartificateName = cartificateName;
		this.cartificateAuth = cartificateAuth;
		this.cartificateDate = cartificateDate;
		this.userId = userId;
	}

	public int getCartificateNumber() {
		return cartificateNumber;
	}

	public void setCartificateNumber(int cartificateNumber) {
		this.cartificateNumber = cartificateNumber;
	}

	public String getCartificateName() {
		return cartificateName;
	}

	public void setCartificateName(String cartificateName) {
		this.cartificateName = cartificateName;
	}

	public String getCartificateAuth() {
		return cartificateAuth;
	}

	public void setCartificateAuth(String cartificateAuth) {
		this.cartificateAuth = cartificateAuth;
	}

	public String getCartificateDate() {
		return cartificateDate;
	}

	public void setCartificateDate(String cartificateDate) {
		this.cartificateDate = cartificateDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Certificate [cartificateNumber=" + cartificateNumber + ", cartificateName=" + cartificateName
				+ ", cartificateAuth=" + cartificateAuth + ", cartificateDate=" + cartificateDate + ", userId=" + userId
				+ "]";
	}
	
	
	
	
}
