//package com.traveler.commons;
//
//import java.util.HashMap;
//import java.util.Map;
//
//public class Commons_msg {
//
//	public void msg_alert(){
//		
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append("<b>새로운 쪽지가 작성 되었습니다.</b><br>");  
//		sb.append("<br>");  
//		sb.append("보낸사람: <b>디비툴</b><br>");  
//		sb.append("보낸시간: <b>"+Helper.getToday("yyyy-MM-dd HH:mm:ss")+"</b><br>");  
//		sb.append("<br>");  
//		sb.append("확인 하시겠습니까?<br>");  
//		sb.append("<input type=button value=\" 확  인 \" onclick=\"Set('/board/board_view.jsp?topmenu="+topmenu+"&leftmenu="+leftmenu+"&no="+no+"');\">");  
//		sb.append("<input type=button value=\" 취  소 \" onclick=\"window.close();\">");  
//		sb.append("");  
//		String msg = sb.toString();  
//		
//		//접속중인자 전체  
//		for(int i=0;i<access_list.size();i++){  
//		    Map map = (Map)access_list.get(i);  
//		    String session_id = map.get("session_id")+"";  
//		    if(!session_id.equals(session.getId()+"")){//나는 제외  
//		        HashMap alram_info = new HashMap();  
//		        alram_info.put("who",session_id);  
//		        alram_info.put("msg",msg);  
//		        alram_info.put("msg_time",System.currentTimeMillis()+"");  
//		        alram_list.add(alram_info);  
//		    }  
//		}  
//	}
//}
