<%@page import="java.io.IOException"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Execute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Date"%>
<%@ page import="Mensajes.*"%>


<html>
<head>
<meta charset="UTF-8">
<title>Entrada de datos del cliente</title>
<link href="css/mi.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	// Conexion 

	Connection conexion = null;
	Statement estado = null;
	ResultSet resultado = null;

	// Controlador 
	String url = "jdbc:mysql://localhost:3307/pagina";
	String controlador = "com.mysql.cj.jdbc.Driver";

	String usuario = "Admin";
	String pass = "1111";

	// obtengo los valores de la base de datos 

	String nombreLoginL = request.getParameter("Nombre");
	String nifLoginL = request.getParameter("Nif");

	// establezco la sesion en Login y le paso la variable nombreLogin y el parametro nombre

	session.setAttribute("miSesion", nombreLoginL);
	%>

	<%
	Mensaje.verMensaje("test nombre formulario = " + nombreLoginL);
	%>

	<div class="contenedor">
		<div class="centro">

			<!--  FORMULARIO -->
			<form action="indexCestaL.jsp" method="post" name="Login" id="Login">
				<table border="1">
					<tr>

						<td colspan="2"><b>Identificaci&oacute;n</b></td>
					</tr>
					<tr>
						<td class="columna">Usuario:</td>
						<td class="columna"><input type="text" name="Nombre"
							id="usuario"></td>

					</tr>
					<tr>
						<td class="columna">Contraseña:</td>
						<td class="columna"><input type="password" name="Nif"
							id="pass"></td>


					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="Enviar" id="Enviar" value="Entrar"></td>

					</tr>
				</table>
			</form>

		</div>

	</div>

	<%
	out.print(nombreLoginL);
	out.print(nifLoginL);
	%>

	<%
	try {
		Class.forName(controlador);
		conexion = DriverManager.getConnection(url, usuario, pass);
		estado = conexion.createStatement();

		// si resultado encuentra los datos 
		Mensaje.verMensaje("Nombre introducido = " + nombreLoginL);

		if (nombreLoginL != null) {
			if (nifLoginL != null) {

		String query = "SELECT * FROM clientes WHERE nombre = '" + nombreLoginL + "' AND Nif = '" + nifLoginL + "'";
		resultado = estado.executeQuery(query);
		Mensaje.verMensaje("El nombre Introducido a sido = " + nombreLoginL);
		
		// comprueba si hay resultado en la base de datos , si es asi , pasamos al siguiente jps
		
		if (resultado.next()) {
			response.sendRedirect("indexCestaIniciada.jsp");

		}
			}
		} else {

			Mensaje.verMensaje("Aun no se ha introducido el nombre del usuario o no es correcto");
		}

	} catch (ClassCastException e) {

		Mensaje.verMensaje("algo no esta correctamente = " + e);
	} finally {

		try {

			if (resultado != null)
		resultado.close();
			if (estado != null)
		estado.close();
			if (conexion != null)
		conexion.close();

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
	%>
</body>
</html>