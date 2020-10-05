package com.gigsforgeeks.member.model.vo;

import java.sql.Date;

public class Career {

	private int careerNumber;     // 경력 번호
	private String userId;        // 회원 아이디
	private String companyInfo;   // 회사
	private String careerTitle;   // 직급
	private Date retireDate;      // 퇴직날짜
	private Date hireDate;        // 고용날짜
	private String careerInfo;    // 회사 설명
	private String careerStatus;  // 재직여부
	
	
	public Career() {}
	



	public Career(int careerNumber, String userId, String companyInfo, String careerTitle, Date retireDate,
			Date hireDate, String careerInfo, String careerStatus) {
		super();
		this.careerNumber = careerNumber;
		this.userId = userId;
		this.companyInfo = companyInfo;
		this.careerTitle = careerTitle;
		this.retireDate = retireDate;
		this.hireDate = hireDate;
		this.careerInfo = careerInfo;
		this.careerStatus = careerStatus;
	}
	
	/*updateUser에서의 Career updateCareer*/
	public Career(String companyInfo,String CareerTitle, String CareerContent, Date CareerHire, Date CareerRetire) {
		super();
		this.companyInfo=companyInfo;
		this.careerTitle=CareerTitle;
		this.companyInfo=CareerContent;
		this.hireDate=CareerHire;
		this.retireDate=CareerRetire;
		
	}




	public int getCareerNumber() {
		return careerNumber;
	}

	public void setCareerNumber(int careerNumber) {
		this.careerNumber = careerNumber;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public String getCareerTitle() {
		return careerTitle;
	}

	public void setCareerTitle(String careerTitle) {
		this.careerTitle = careerTitle;
	}

	public String getCareerInfo() {
		return careerInfo;
	}

	public void setCareerInfo(String careerInfo) {
		this.careerInfo = careerInfo;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}

	public String isCareerStatus() {
		return careerStatus;
	}

	public void setCareerStatus(String careerStatus) {
		this.careerStatus = careerStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Career [careerNumber=" + careerNumber + ", companyInfo=" + companyInfo + ", careerTitle=" + careerTitle
				+ ", careerInfo=" + careerInfo + ", hireDate=" + hireDate + ", retireDate=" + retireDate
				+ ", careerStatus=" + careerStatus + ", userId=" + userId + "]";
	}
	
	

}
