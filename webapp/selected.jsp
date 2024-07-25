<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="Mensajes.Mensaje"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<% 
int limite = 3 ; 
String limiteNuevo=request.getParameter("limite");


if (limite ==3){
Mensaje.verMensaje("El mensaje es" +limite);	
}


%>
<h1>Tema Select</h1>
<form action="selected.jsp" method ="POST">
<select id="productos" name=limite>

<option value = "3">3</option>
<option value = "6">6</option>
<option value = "9">9</option>
<option value = "12">12</option>
</select>
<input type="submit">
</form>
<%Mensaje.verMensaje("El mensaje es" +limiteNuevo); %>

</body>
</html>