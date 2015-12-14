<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">#rcorners3 {
   border-radius: 25px;
    border: 2px solid black;
    padding: 9px; 
    width: 110px;
    height: 50px;    
}
</style>
</head>
<body>
<div id="rcorners3">
<span style="font-weight: bold; font-size: 9px">Kaanish Kouture</span><br>
<span style="font-size: 9px">Pcode:123</span><br>
<span style="font-size: 9px">MRP:123</span><br>
<img src="http://localhost:8080/barbecue/BarcodeServlet?data=12345&drawText=true&width=2&height=30" width="110"/><br>
<span style="font-size: 5px">12345</span><br>
</div>
<div id="rcorners3">
<span style="font-weight: bold; font-size: 9px">Kaanish Kouture</span><br>
<span style="font-size: 9px">Pcode:123</span><br>
<span style="font-size: 9px">MRP:123</span><br>
<img src="http://localhost:8080/barbecue/BarcodeServlet?data=12345&drawText=true&width=2&height=30" width="110"/><br>
<span style="font-size: 5px">12345</span><br>
</div>
<div id="rcorners3">
<span style="font-weight: bold; font-size: 9px">Kaanish Kouture</span><br>
<span style="font-size: 9px">Pcode:123</span><br>
<span style="font-size: 9px">MRP:123</span><br>
<img src="http://localhost:8080/barbecue/BarcodeServlet?data=12345&drawText=true&width=2&height=30" width="110"/><br>
<span style="font-size: 5px">12345</span><br>
</div>
<div id="rcorners3">
<span style="font-weight: bold; font-size: 9px">Kaanish Kouture</span><br>
<span style="font-size: 9px">Pcode:123</span><br>
<span style="font-size: 9px">MRP:123</span><br>
<img src="http://localhost:8080/barbecue/BarcodeServlet?data=12345&drawText=true&width=2&height=30" width="110"/><br>
<span style="font-size: 5px">12345</span><br>
</div>
<div id="rcorners3">
<span style="font-weight: bold; font-size: 9px">Kaanish Kouture</span><br>
<span style="font-size: 9px">Pcode:123</span><br>
<span style="font-size: 9px">MRP:123</span><br>
<img src="http://localhost:8080/barbecue/BarcodeServlet?data=12345&drawText=true&width=2&height=30" width="110"/><br>
<span style="font-size: 5px; text-align: center;">12345</span><br>
</div>



<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(window.print()){
		window.close();
	}
	
});
</script>

</body>
</html>