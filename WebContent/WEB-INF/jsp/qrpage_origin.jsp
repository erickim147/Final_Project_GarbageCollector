<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
<style> 
.div_box { 
position:relative;
 }
#cm { 
position: absolute;
    font-style: revert;
    font-weight: bold;
    font-size: 100px;
    line-height: 1.0em;
    color: navy;
    font-family: arial;
    width: 1028px;
}
.hc {
    width: 200px;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}
/* ���� �߾� ���� */ 
.vc {
    height: 40px;
    top: 0;
    bottom: 0;
    margin-top: auto;
    margin-bottom: 700px;
}
/* ���� �߾� ���� */ 
.div_qr{
    text-align: center;
    margin-top: 340px;
}

</style>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor='#f5f7ff'>
	<div class="div_box">
	 <p id="cm" class="hc vc">����Ϸ� �������ּ���</p>
	 </div> 
	 <div class="div_qr">
		<img src="resources/images/QRCode/qrcode.png">
	 <br>
	 <a href="javascript:history.back();">���ư���</a>
	 </div>
	
	

</body>
</html>