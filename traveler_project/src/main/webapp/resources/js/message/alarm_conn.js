// 크롬 인코딩을 위한 function

function urlencode(str) {
	str = (str + '').toString();
	return encodeURIComponent(str).replace(/!/g, '%21').replace(/'/g, '%27')
			.replace(/\(/g, '%28').replace(/\)/g, '%29').replace(/\*/g, '%2A')
			.replace(/%20/g, '+');
}

function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

// 실시간알람
function alarm_access() {
	var xmlhttp = getXMLHttpRequest();
	var url = '/message/messageAlarmAjax.go';
	if (url) {
		xmlhttp.open("GET", url, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					if(xmlhttp.responseText != ''){

					var alarm_msg = JSON.parse(xmlhttp.responseText);

					if (alarm_msg != 'null' && alarm_msg != null && alarm_msg != '' && alarm_msg != ' ') {
						   view_msg("[ 쪽지가 도착하였습니다 ]<br/>보낸사람 : "
						 + alarm_msg.message_send 
						 + "<br/>메세지 내용 : "
						 + alarm_msg.message_message, alarm_msg.message_send);
						   
					}
				} else {
					
				}
			} else {
					// alert("Error loading "+url+",
					// "+xmlhttp.status+"("+xmlhttp.statusText+")");
				}
			}
		}
		xmlhttp.send(null);
	}
	setTimeout("alarm_access()", 3000);// 3초 마다 서버와 통신함
	return false;

}

function view_msg(msg, message_send) {
	var width = 400;
	var height = 300;
	var left = (document.body.clientWidth - width) / 2;
	var top = (document.body.clientHeight - height) / 2;
	
	var alarm_win = window
			.open('/message/alarm_view.go?msg=' + msg + '&message_send=' + message_send , "쪽지도착",
					"width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +", toolbar=no, menubar=no, scrollbars=no, resizable=yes");

}
