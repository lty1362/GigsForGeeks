package com.gigsforgeeks.project.model.vo;

import java.sql.Date;

public class Proposal {
	
	private int proposalNo;			// 작업제안번호
	private String proposalStatus;	// 입찰승락여부(Y/N)
	private String proposalInfo;	// 작업제안내용
	private int proposalPrice;		// 작업제안가
	private Date proposalStart;		// 입찰작업시작일
	private Date proposalEnd;		// 입찰작업마감일
	
	
	public Proposal() {
		
	}


	public Proposal(int proposalNo, String proposalStatus, String proposalInfo, int proposalPrice, Date proposalStart,
			Date proposalEnd) {
		super();
		this.proposalNo = proposalNo;
		this.proposalStatus = proposalStatus;
		this.proposalInfo = proposalInfo;
		this.proposalPrice = proposalPrice;
		this.proposalStart = proposalStart;
		this.proposalEnd = proposalEnd;
	}

	

	public Proposal(String proposalInfo, int proposalPrice, Date proposalStart, Date proposalEnd) {
		super();
		this.proposalInfo = proposalInfo;
		this.proposalPrice = proposalPrice;
		this.proposalStart = proposalStart;
		this.proposalEnd = proposalEnd;
	}


	public int getProposalNo() {
		return proposalNo;
	}


	public void setProposalNo(int proposalNo) {
		this.proposalNo = proposalNo;
	}


	public String getProposalStatus() {
		return proposalStatus;
	}


	public void setProposalStatus(String proposalStatus) {
		this.proposalStatus = proposalStatus;
	}


	public String getProposalInfo() {
		return proposalInfo;
	}


	public void setProposalInfo(String proposalInfo) {
		this.proposalInfo = proposalInfo;
	}


	public int getProposalPrice() {
		return proposalPrice;
	}


	public void setProposalPrice(int proposalPrice) {
		this.proposalPrice = proposalPrice;
	}


	public Date getProposalStart() {
		return proposalStart;
	}


	public void setProposalStart(Date proposalStart) {
		this.proposalStart = proposalStart;
	}


	public Date getProposalEnd() {
		return proposalEnd;
	}


	public void setProposalEnd(Date proposalEnd) {
		this.proposalEnd = proposalEnd;
	}


	@Override
	public String toString() {
		return "Proposal [proposalNo=" + proposalNo + ", proposalStatus=" + proposalStatus + ", proposalInfo="
				+ proposalInfo + ", proposalPrice=" + proposalPrice + ", proposalStart=" + proposalStart
				+ ", proposalEnd=" + proposalEnd + "]";
	}

	

}
