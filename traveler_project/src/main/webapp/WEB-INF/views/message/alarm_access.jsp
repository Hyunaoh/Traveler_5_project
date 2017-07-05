<%@page import="java.util.logging.Logger"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="alarm_list" class="java.util.ArrayList" scope="application" />

	<%
		//실시간 알람기능 : application에서 가져와 해당자에게 뿌려주고 제거한다.  

		String access_session = "" + Principal.class.getName();
		int remove_alram_no = -1;
		out.print("현재접속자수 : " + alarm_list.size());

		for (int i = 0; i < alarm_list.size(); i++) {
			Map map = (Map) alarm_list.get(i);
			String message_get = map.get("message_get") == null ? "" : map.get("message_get") + "";
			String message_message = map.get("message_message") == null ? "" : map.get("message_message") + "";

			long message_date = map.get("message_date") == null ? System.currentTimeMillis()
					: Long.parseLong(map.get("message_date") + "");

			out.println(message_get + " : " + message_message + " : " + message_date);

			if (access_session.equals(message_get)) {
				out.print(java.net.URLEncoder.encode(message_message, "UTF-8"));//알람전송  
				remove_alram_no = i;//전송후 제거  
			} else if ((System.currentTimeMillis() - message_date) > 10 * 1000) {
				remove_alram_no = i;//10초 지난메세지 제거  
			} else {//아무것도하지않음  
			}
		}
		//알람을 읽었으면 제거  
		if (remove_alram_no > -1) {
			alarm_list.remove(remove_alram_no);
		}
		//실시간 알람기능 : application에서 가져와 해당자에게 뿌려주고 제거한다.
	%>
