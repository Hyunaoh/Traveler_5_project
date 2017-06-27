package com.traveler.model;

import java.sql.Date;

public class MessageVO {

	private String message_send;
	private String message_get;
	private String message_message;
	private Date message_date;

	public MessageVO() {

	}

	public String getMessage_send() {
		return message_send;
	}

	public void setMessage_send(String message_send) {
		this.message_send = message_send;
	}

	public String getMessage_get() {
		return message_get;
	}

	public void setMessage_get(String message_get) {
		this.message_get = message_get;
	}

	public String getMessage_message() {
		return message_message;
	}

	public void setMessage_message(String message_message) {
		this.message_message = message_message;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	@Override
	public String toString() {
		return "MessageVO [message_send=" + message_send + ", message_get=" + message_get + ", message_message="
				+ message_message + ", message_date=" + message_date + "]";
	}

}
