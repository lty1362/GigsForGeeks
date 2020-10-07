package com.gigsforgeeks.member.model.vo;



public class Education {

	private int educationNumber;		//교육번호
	private String university;		    //대학명
	private String major;				//전공
	private String degree;				//학위
	private String enrollDate;			//입학날짜
	private String grauatedDate;		//졸업날짜
	private String userId;				//회원아이디
	
	public Education() {}

	public Education(int educationNumber, String university, String major, String degree, String enrollDate,
			String grauatedDate, String userId) {
		super();
		this.educationNumber = educationNumber;
		this.university = university;
		this.major = major;
		this.degree = degree;
		this.enrollDate = enrollDate;
		this.grauatedDate = grauatedDate;
		this.userId = userId;
	}
	
	
	/*updateUser에서의 Education updateEducation*/
	public Education(String University, String Major, String Degree, String EnrollDate, String GrauateDate ) {
		super();
		this.university=University;
		this.major=Major;
		this.degree=Degree;
		this.enrollDate=EnrollDate;
		this.grauatedDate=GrauateDate;
		
	}
	

	public int getEducationNumber() {
		return educationNumber;
	}

	public void setEducationNumber(int educationNumber) {
		this.educationNumber = educationNumber;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGrauatedDate() {
		return grauatedDate;
	}

	public void setGrauatedDate(String grauatedDate) {
		this.grauatedDate = grauatedDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Education [educationNumber=" + educationNumber + ", university=" + university + ", major=" + major
				+ ", degree=" + degree + ", enrollDate=" + enrollDate + ", grauatedDate=" + grauatedDate + ", userId="
				+ userId + "]";
	}
	
	
	
	
}
