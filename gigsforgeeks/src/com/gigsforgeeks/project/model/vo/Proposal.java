package com.gigsforgeeks.project.model.vo;

import java.time.LocalDate;

public class Proposal {
	
	private int proposalNo;					// 작업제안번호
	private String proposalProjectId;		// 입찰제안한 프로젝트아이디
	private String proposalUserId;			// 사용자 회원아이디
	private String proposalStatus;			// 입찰승락여부(Y/N)
	private String proposalInfo;			// 작업제안내용
	private int proposalPrice;				// 작업제안가
	private LocalDate proposalStart;				// 입찰작업시작일
	private LocalDate proposalEnd;				// 입찰작업마감일
	
	
	public Proposal() {
		
	}

	
	public Proposal(int proposalNo, String proposalProjectId, String proposalUserId, String proposalStatus,
			String proposalInfo, int proposalPrice, LocalDate proposalStart, LocalDate proposalEnd) {
		super();
		this.proposalNo = proposalNo;
		this.proposalProjectId = proposalProjectId;
		this.proposalUserId = proposalUserId;
		this.proposalStatus = proposalStatus;
		this.proposalInfo = proposalInfo;
		this.proposalPrice = proposalPrice;
		this.proposalStart = proposalStart;
		this.proposalEnd = proposalEnd;
	}


	public Proposal(String proposalProjectId, String proposalUserId, String proposalInfo, int proposalPrice,
			LocalDate proposalStart, LocalDate proposalEnd) {
		super();
		this.proposalProjectId = proposalProjectId;
		this.proposalUserId = proposalUserId;
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


	public String getProposalProjectId() {
		return proposalProjectId;
	}


	public void setProposalProjectId(String proposalProjectId) {
		this.proposalProjectId = proposalProjectId;
	}


	public String getProposalUserId() {
		return proposalUserId;
	}


	public void setProposalUserId(String proposalUserId) {
		this.proposalUserId = proposalUserId;
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


	public LocalDate getProposalStart() {
		return proposalStart;
	}


	public void setProposalStart(LocalDate proposalStart) {
		this.proposalStart = proposalStart;
	}


	public LocalDate getProposalEnd() {
		return proposalEnd;
	}


	public void setProposalEnd(LocalDate proposalEnd) {
		this.proposalEnd = proposalEnd;
	}


	@Override
	public String toString() {
		return "Proposal [proposalNo=" + proposalNo + ", proposalProjectId=" + proposalProjectId + ", proposalUserId="
				+ proposalUserId + ", proposalStatus=" + proposalStatus + ", proposalInfo=" + proposalInfo
				+ ", proposalPrice=" + proposalPrice + ", proposalStart=" + proposalStart + ", proposalEnd="
				+ proposalEnd + "]";
	}


	

}
