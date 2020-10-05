package com.gigsforgeeks.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;				// 회원아이디
	private String userEmail;			// 회원이메일
	private String userPwd;				// 회원 비밀번호
	private String enrollDate;			// 가입일
	private String outrollDate;			// 탈퇴일
	private String status;				// 탈퇴여부
	private String membership;			// 멤버십여부
	private String excellentFreelance;	// 우수 프리랜서 여부
	private String blackList;			// 신고회원
	private String identifyEmail;		// 이메일 인증 여부
	private String admin;				// 관리자 여부
	private String userType;			// 계정여부
	private String jobTitle;			// 직급명
	private String company;				// 회사명
	private String skill;				// 기술
	private int payRate;				// 희망시급
	private String profileImage;		// 프로필 이미지 (파일명)
	private String location;			// 지역
	private String selfIntroduction;	// 자기소개
	
	
	public Member() {
		
	}
	
	public Member(String userId, String userEmail, String userPwd, String enrollDate, String outrollDate,
			String status, String membership, String excellentFreelance, String blackList, String identifyEmail,
			String admin, String userType, String jobTitle, String company, String skill, int payRate,
			String profileImage, String location, String selfIntroduction) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.enrollDate = enrollDate;
		this.outrollDate = outrollDate;
		this.status = status;
		this.membership = membership;
		this.excellentFreelance = excellentFreelance;
		this.blackList = blackList;
		this.identifyEmail = identifyEmail;
		this.admin = admin;
		this.userType = userType;
		this.jobTitle = jobTitle;
		this.company = company;
		this.skill = skill;
		this.payRate = payRate;
		this.profileImage = profileImage;
		this.location = location;
		this.selfIntroduction = selfIntroduction;
		
	}
	
	/*signUp에서의 Member m*/
	public Member(String userId, String userEmail, String userPwd, String userType) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userType = userType;
	}
	
	/*updateUser에서의 Member updateMember*/
	public Member(String location, String company, String selfIntroduction, String userId, int payRate) {
		super();
		this.location =location;
		this.company= company;
		this.selfIntroduction =selfIntroduction;
		this.userId =userId;
		this.payRate =payRate;
		
		
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getOutpllDate() {
		return outrollDate;
	}

	public void setOutpllDate(String outrpllDate) {
		this.outrollDate = outrpllDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}

	public String getExcellentFreelance() {
		return excellentFreelance;
	}

	public void setExcellentFreelance(String excellentFreelance) {
		this.excellentFreelance = excellentFreelance;
	}

	public String getBlackList() {
		return blackList;
	}

	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}

	public String getIdentifyEmail() {
		return identifyEmail;
	}

	public void setIdentifyEmail(String identifyEmail) {
		this.identifyEmail = identifyEmail;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public int getPayRate() {
		return payRate;
	}

	public void setPayRate(int payRate) {
		this.payRate = payRate;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}
	
	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userEmail=" + userEmail + ", userPwd=" + userPwd
				+ ", enrollDate=" + enrollDate + ", outrollDate=" + outrollDate + ", status=" + status + ", membership="
				+ membership + ", excellentFreelance=" + excellentFreelance + ", blackList=" + blackList
				+ ", identifyEmail=" + identifyEmail + ", admin=" + admin + ", userType=" + userType + ", jobTitle="
				+ jobTitle + ", company=" + company + ", skill=" + skill + ", payRate=" + payRate + ", profileImage="
				+ profileImage + ", location=" + location + ", selfIntroduction="+selfIntroduction+"]";
	}
	
	
}
