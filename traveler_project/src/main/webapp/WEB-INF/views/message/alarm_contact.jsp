<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>

<script language="javascript">      
    //실시간알람  
    function alarm_access(){  
        var xmlhttp = getXmlHttpRequest();  
        var url = '/ajax/alarm_access.jsp';  
        if(url){  
            xmlhttp.open("GET", url, true);  
            xmlhttp.onreadystatechange = function() {  
                if(xmlhttp.readyState == 4) {  
                    if(xmlhttp.status == 200) {  
                        var alarm_msg = trim(xmlhttp.responseText);  
                        if(alarm_msg!=''){  
                            view_msg(alarm_msg);  
                        }  
                    } else {  
                        //alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");  
                    }  
                }  
            }  
            xmlhttp.send(null);  
        }  
        setTimeout("alarm_access()", 3000);//3초 마다 서버와 통신함  
        return false;  
    }  
    
    function view_msg(msg){  
        var width = 350;  
        var height = 150;  
        var left = (document.body.clientWidth-width)/2;  
        var top = (document.body.clientHeight-height)/2;  
        var alarm_win = window.open('/message/alarm_view.jsp?msg='+msg, '', 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar=no ,directories=no,menubar=no,location=no,scrollbars=no,resizable=yes,status=no');  
    }

</script>
</head>

<body>

	<script language="javascript">      
	alarm_access();  
	</script>

</body>

</html>
