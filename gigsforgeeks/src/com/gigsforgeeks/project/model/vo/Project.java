package com.gigsforgeeks.project.model.vo;

import java.sql.Date;

public class Project {
	
	// Fields
	private String projectId;
	/*private String clientId;*/
	private String requiredSkill;
	private String projectName;
	private String description;
	private String projectStatus;
	private Date expectStart;
	private Date expectEnd;
	private String meansOfPayment;
	private int minBid;
	private int MaxBid;
	private Date startBid;
	private Date endBid;
	private int countBid;
	private int averageBid;
	private String winnerId;
	private String winningBid;
	private Date startDate;
	private Date endDate;
	
	// Constructors
	public Project() {}
	public Project(String projectId, /* String clientId,*/String requiredSkill, String projectName, String description,
			String projectStatus, Date expectStart, Date expectEnd, String meansOfPayment, int minBid, int maxBid,
			Date startBid, Date endBid, int countBid, int averageBid, String winnerId, String winningBid,
			Date startDate, Date endDate) {
		super();
		this.projectId = projectId;
		/*this.clientId = clientId;*/
		this.requiredSkill = requiredSkill;
		this.projectName = projectName;
		this.description = description;
		this.projectStatus = projectStatus;
		this.expectStart = expectStart;
		this.expectEnd = expectEnd;
		this.meansOfPayment = meansOfPayment;
		this.minBid = minBid;
		MaxBid = maxBid;
		this.startBid = startBid;
		this.endBid = endBid;
		this.countBid = countBid;
		this.averageBid = averageBid;
		this.winnerId = winnerId;
		this.winningBid = winningBid;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	// to call insertProject method
	public Project(String requiredSkill, String projectName, String description, 
			Date expectStart, Date expectEnd, String meansOfPayment, int minBid, int maxBid, Date endBid) {
		super();
		this.requiredSkill = requiredSkill;
		this.projectName = projectName;
		this.description = description;
		this.expectStart = expectStart;
		this.expectEnd = expectEnd;
		this.meansOfPayment = meansOfPayment;
		this.minBid = minBid;
		this.MaxBid = maxBid;
		this.endBid = endBid;
	}
	
	// Getters and Setters
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getRequiredSkill() {
		return requiredSkill;
	}
	public void setRequiredSkill(String requiredSkill) {
		this.requiredSkill = requiredSkill;
	}
	/*public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}*/
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public Date getExpectStart() {
		return expectStart;
	}
	public void setExpectStart(Date expectStart) {
		this.expectStart = expectStart;
	}
	public Date getExpectEnd() {
		return expectEnd;
	}
	public void setExpectEnd(Date expectEnd) {
		this.expectEnd = expectEnd;
	}
	public String getMeansOfPayment() {
		return meansOfPayment;
	}
	public void setMeansOfPayment(String meansOfPayment) {
		this.meansOfPayment = meansOfPayment;
	}
	public int getMinBid() {
		return minBid;
	}
	public void setMinBid(int minBid) {
		this.minBid = minBid;
	}
	public int getMaxBid() {
		return MaxBid;
	}
	public void setMaxBid(int maxBid) {
		MaxBid = maxBid;
	}
	public Date getStartBid() {
		return startBid;
	}
	public void setStartBid(Date startBid) {
		this.startBid = startBid;
	}
	public Date getEndBid() {
		return endBid;
	}
	public void setEndBid(Date endBid) {
		this.endBid = endBid;
	}
	public int getCountBid() {
		return countBid;
	}
	public void setCountBid(int countBid) {
		this.countBid = countBid;
	}
	public int getAverageBid() {
		return averageBid;
	}
	public void setAverageBid(int averageBid) {
		this.averageBid = averageBid;
	}
	public String getWinnerId() {
		return winnerId;
	}
	public void setWinnerId(String winnerId) {
		this.winnerId = winnerId;
	}
	public String getWinningBid() {
		return winningBid;
	}
	public void setWinningBid(String winningBid) {
		this.winningBid = winningBid;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	// toString method
	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", requiredSkill=" + requiredSkill/* + ", clientId=" + clientId*/
				+ ", projectName=" + projectName + ", description=" + description + ", projectStatus=" + projectStatus
				+ ", expectStart=" + expectStart + ", expectEnd=" + expectEnd + ", meansOfPayment=" + meansOfPayment
				+ ", minBid=" + minBid + ", MaxBid=" + MaxBid + ", startBid=" + startBid + ", endBid=" + endBid
				+ ", countBid=" + countBid + ", averageBid=" + averageBid + ", winnerId=" + winnerId + ", winningBid="
				+ winningBid + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
