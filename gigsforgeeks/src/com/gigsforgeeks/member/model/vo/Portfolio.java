package com.gigsforgeeks.member.model.vo;

import java.sql.Date;

public class Portfolio {
	private int portfolioNumber;      //포트폴리오 번소
	private String portfolioTitle;    //포트폴리오 제목
	private String portfolioContent;  //포트폴리오 내용
	private String portfolioLink;     //포트폴리오 링크
	private String portfolioSkill;    //포트폴리오 사용기술
	private String portfolioStart;      //포트폴리오 시작일
	private String portfolioEnd;        //포트폴리오 완료일
	private String userId;		      //회원아이디
	private String portfolioFile;     //포트폴리오 파일
	
	
	public Portfolio() {}


	public Portfolio(int portfolioNumber, String portfolioTitle, String portfolioContent, String portfolioLink,
			String portfolioSkill, String portfolioStart, String portfolioEnd, String userId, String portfolioFile) {
		super();
		this.portfolioNumber = portfolioNumber;
		this.portfolioTitle = portfolioTitle;
		this.portfolioContent = portfolioContent;
		this.portfolioLink = portfolioLink;
		this.portfolioSkill = portfolioSkill;
		this.portfolioStart = portfolioStart;
		this.portfolioEnd = portfolioEnd;
		this.userId = userId;
		this.portfolioFile = portfolioFile;
	}

	/*updateUser에서의 Portfolio updatePortfolio*/
	public Portfolio(String PortTitle,String PortLink, String portConent, String PortStart, String PortEnd, String portpolyoSkill) {
		super();
		this.portfolioTitle=PortTitle;
		this.portfolioLink=PortLink;
		this.portfolioContent=portConent;
		this.portfolioStart=PortStart;
		this.portfolioEnd=PortEnd;
		this.portfolioSkill=portpolyoSkill;
		
	}


	public int getPortfolioNumber() {
		return portfolioNumber;
	}


	public void setPortfolioNumber(int portfolioNumber) {
		this.portfolioNumber = portfolioNumber;
	}


	public String getPortfolioTitle() {
		return portfolioTitle;
	}


	public void setPortfolioTitle(String portfolioTitle) {
		this.portfolioTitle = portfolioTitle;
	}


	public String getPortfolioContent() {
		return portfolioContent;
	}


	public void setPortfolioContent(String portfolioContent) {
		this.portfolioContent = portfolioContent;
	}


	public String getPortfolioLink() {
		return portfolioLink;
	}


	public void setPortfolioLink(String portfolioLink) {
		this.portfolioLink = portfolioLink;
	}


	public String getPortfolioSkill() {
		return portfolioSkill;
	}


	public void setPortfolioSkill(String portfolioSkill) {
		this.portfolioSkill = portfolioSkill;
	}


	public String getPortfolioStart() {
		return portfolioStart;
	}


	public void setPortfolioStart(String portfolioStart) {
		this.portfolioStart = portfolioStart;
	}


	public String getPortfolioEnd() {
		return portfolioEnd;
	}


	public void setPortfolioEnd(String portfolioEnd) {
		this.portfolioEnd = portfolioEnd;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPortfolioFile() {
		return portfolioFile;
	}


	public void setPortfolioFile(String portfolioFile) {
		this.portfolioFile = portfolioFile;
	}


	@Override
	public String toString() {
		return "Portfolio [portfolioNumber=" + portfolioNumber + ", portfolioTitle=" + portfolioTitle
				+ ", portfolioContent=" + portfolioContent + ", portfolioLink=" + portfolioLink + ", portfolioSkill="
				+ portfolioSkill + ", portfolioStart=" + portfolioStart + ", portfolioEnd=" + portfolioEnd + ", userId="
				+ userId + ", portfolioFile=" + portfolioFile + "]";
	}
	
	

}
