package com.gigsforgeeks.member.model.vo;

public class Publication {
	private int bookNumber;			//출판물 번호
	private String bookName;		//출판물 제목
	private String bookInfo;		//출판물 내용
	private String publisher;		//출판사
	private String bookDate;		//풀판 날짜
	private String userId;			//회원아이디
	
	
	public Publication() {}


	public Publication(int bookNumber, String bookName, String bookInfo, String publisher, String bookDate,
			String userId) {
		super();
		this.bookNumber = bookNumber;
		this.bookName = bookName;
		this.bookInfo = bookInfo;
		this.publisher = publisher;
		this.bookDate = bookDate;
		this.userId = userId;
	}


	public int getBookNumber() {
		return bookNumber;
	}


	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getBookInfo() {
		return bookInfo;
	}


	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getBookDate() {
		return bookDate;
	}


	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Publication [bookNumber=" + bookNumber + ", bookName=" + bookName + ", bookInfo=" + bookInfo
				+ ", publisher=" + publisher + ", bookDate=" + bookDate + ", userId=" + userId + "]";
	}
	
	
	
	
	
}
