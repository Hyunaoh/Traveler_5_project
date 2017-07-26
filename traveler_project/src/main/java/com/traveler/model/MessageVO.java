package com.traveler.model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @author OHHYUNA
 *
 */
public class MessageVO {

	private String message_seq;
	private String message_send;
	private String message_get;
	private String message_message;
	private String message_date;
	private String message_read;
	
	public MessageVO() {

	}
	
	public String getMessage_seq() {
		return message_seq;
	}

	public void setMessage_seq(String message_seq) {
		this.message_seq = message_seq;
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

	public String getMessage_date() {
		
		return message_date;
	}

	public void setMessage_date(Date message_date) throws ParseException {
		
		Calendar calendar = Calendar.getInstance();
        java.util.Date today = calendar.getTime();
        
        // 받아온 날짜 및 시간
        String res = "";
        
        // 데이터 형태
        SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("a HH:mm");
		
		String form1 = sdf.format(message_date);
		String form2 = sdf.format(today);

		// 받아온 날짜가 오늘 날짜라면,
		if(form1.equals(form2)){
			
			res = sdf2.format(message_date);

		// 받아온 날짜가 다른 날이라면,
		} else {
			
			res = sdf.format(message_date);
		
		}
		
		this.message_date = res;
	}
	
	
	public String getMessage_read() {
		return message_read;
	}

	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}

	
	@Override
	public String toString() {
		return "MessageVO [message_seq=" + message_seq + ", message_send=" + message_send + ", message_get="
				+ message_get + ", message_message=" + message_message + ", message_date=" + message_date
				+ ", message_read=" + message_read +  "]";
	}

}
