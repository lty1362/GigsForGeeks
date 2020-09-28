package com.gigsforgeeks.message.model.vo;

import java.sql.Date;

/**
 * @author HaEun
 *
 */
public class Message {

	private int messageNo;				//메세지 번호
	private String messageReceiver;		//회원아이디
	private String messageRecepient;	//상대아이디
	private String messageTitle;		//메세지 제목
	private String messageContent;		//메세지 내용
	private Date messageReceiveTime;	//받은 날짜
	private Date messageSendTime;		//보낸 날짜
	private String messageRead;			//읽지않은메세지 상태
	private String messageKeep;			//보관메세지 상태
	private String messageAdmin;		//고객지원메세지 상태
	private String status;				// 
	
	public Message() {
		
	}

	public Message(int messageNo, String messageReceiver, String messageRecepient, String messageTitle,
			String messageContent, Date messageReceiveTime, Date messageSendTime, String messageRead,
			String messageKeep, String messageAdmin, String status) {
		super();
		this.messageNo = messageNo;
		this.messageReceiver = messageReceiver;
		this.messageRecepient = messageRecepient;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.messageReceiveTime = messageReceiveTime;
		this.messageSendTime = messageSendTime;
		this.messageRead = messageRead;
		this.messageKeep = messageKeep;
		this.messageAdmin = messageAdmin;
		this.status = status;
	}

	public Message(int messageNo, String messageReceiver, String messageRecepient, String messageTitle,
			Date messageReceiveTime) {
		super();
		this.messageNo = messageNo;
		this.messageReceiver = messageReceiver;
		this.messageRecepient = messageRecepient;
		this.messageTitle = messageTitle;
		this.messageReceiveTime = messageReceiveTime;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessageReceiver() {
		return messageReceiver;
	}

	public void setMessageReceiver(String messageReceiver) {
		this.messageReceiver = messageReceiver;
	}

	public String getMessageRecepient() {
		return messageRecepient;
	}

	public void setMessageRecepient(String messageRecepient) {
		this.messageRecepient = messageRecepient;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getMessageReceiveTime() {
		return messageReceiveTime;
	}

	public void setMessageReceiveTime(Date messageReceiveTime) {
		this.messageReceiveTime = messageReceiveTime;
	}

	public Date getMessageSendTime() {
		return messageSendTime;
	}

	public void setMessageSendTime(Date messageSendTime) {
		this.messageSendTime = messageSendTime;
	}

	public String getMessageRead() {
		return messageRead;
	}

	public void setMessageRead(String messageRead) {
		this.messageRead = messageRead;
	}

	public String getMessageKeep() {
		return messageKeep;
	}

	public void setMessageKeep(String messageKeep) {
		this.messageKeep = messageKeep;
	}

	public String getMessageAdmin() {
		return messageAdmin;
	}

	public void setMessageAdmin(String messageAdmin) {
		this.messageAdmin = messageAdmin;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageReceiver=" + messageReceiver + ", messageRecepient="
				+ messageRecepient + ", messageTitle=" + messageTitle + ", messageContent=" + messageContent
				+ ", messageReceiveTime=" + messageReceiveTime + ", messageSendTime=" + messageSendTime
				+ ", messageRead=" + messageRead + ", messageKeep=" + messageKeep + ", messageAdmin=" + messageAdmin
				+ ", status=" + status + "]";
	}
	

	
}
