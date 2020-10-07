package com.gigsforgeeks.project.model.vo;

import java.time.LocalDate;

public class Project {
	
	// Fields
	private int projectId;
	private String clientId;
	private String requiredSkill;
	private String projectName;
	private String description;
	private String projectStatus;
	private LocalDate expectStart;
	private LocalDate expectEnd;
	private String meansOfPayment;
	private int minBid;
	private int MaxBid;
	private LocalDate startBid;
	private LocalDate endBid;
	private int countBid;
	private int averageBid;
	private String winnerId;
	private int winningBid;
	private LocalDate startDate;
	private LocalDate endDate;

	
	// Constructors
	public Project() {}
	public Project(int projectId, String clientId, String requiredSkill, String projectName, String description,
			String projectStatus, LocalDate expectStart, LocalDate expectEnd, String meansOfPayment, int minBid, int maxBid,
			LocalDate startBid, LocalDate endBid, int countBid, int averageBid, String winnerId, int winningBid,
			LocalDate startDate, LocalDate endDate) {
		super();
		this.projectId = projectId;
		this.clientId = clientId;
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
	
	// to use in insertProject method
	public Project(String clientId, String requiredSkill, String projectName, String description, 
			LocalDate expectStart, LocalDate expectEnd, String meansOfPayment, int minBid, int maxBid, LocalDate endBid) {
		super();
		this.clientId = clientId;
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
	
	// to use in searcListProject method
	public Project(int projectId, String projectName, String description, String projectStatus, int minBid, int maxBid,
			LocalDate endBid, int countBid, String requiredSkill) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.description = description;
		this.projectStatus = projectStatus;
		this.minBid = minBid;
		this.MaxBid = maxBid;
		this.endBid = endBid;
		this.countBid = countBid;
		this.requiredSkill = requiredSkill;
	}
	
	// Getters and Setters
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getRequiredSkill() {
		return requiredSkill;
	}
	public void setRequiredSkill(String requiredSkill) {
		this.requiredSkill = requiredSkill;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
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
	public LocalDate getExpectStart() {
		return expectStart;
	}
	public void setExpectStart(LocalDate expectStart) {
		this.expectStart = expectStart;
	}
	public LocalDate getExpectEnd() {
		return expectEnd;
	}
	public void setExpectEnd(LocalDate expectEnd) {
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
	public LocalDate getStartBid() {
		return startBid;
	}
	public void setStartBid(LocalDate startBid) {
		this.startBid = startBid;
	}
	public LocalDate getEndBid() {
		return endBid;
	}
	public void setEndBid(LocalDate endBid) {
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
	public int getWinningBid() {
		return winningBid;
	}
	public void setWinningBid(int winningBid) {
		this.winningBid = winningBid;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	
	// toString method
	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", requiredSkill=" + requiredSkill + ", clientId=" + clientId
				+ ", projectName=" + projectName + ", description=" + description + ", projectStatus=" + projectStatus
				+ ", expectStart=" + expectStart + ", expectEnd=" + expectEnd + ", meansOfPayment=" + meansOfPayment
				+ ", minBid=" + minBid + ", MaxBid=" + MaxBid + ", startBid=" + startBid + ", endBid=" + endBid
				+ ", countBid=" + countBid + ", averageBid=" + averageBid + ", winnerId=" + winnerId + ", winningBid="
				+ winningBid + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
