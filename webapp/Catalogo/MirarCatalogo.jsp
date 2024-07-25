<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mirar Catalogo</title>
<link rel="stylesheet" href="Catalogo.css">
<link rel="shortcut icon" href="carro.png">
</head>
<body>

	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.Statement"%>
	<%@ page import="java.sql.ResultSet"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.util.Date"%>




	<%
	// Conexion con la base de datos MySQL
	Connection conexion = null;
	Statement estado = null;
	ResultSet resultado = null;

	try {
		out.println(" Deputacion de la conexion : ");
		out.println("Estacleciendo conexion con el controlador, -->");
		String controlador = "com.mysql.cj.jdbc.Driver";
		out.println("  Conexion Estaclecida con el controlador " + controlador);
		Class.forName(controlador);
		out.println("  Iniciando sesion - 0");

		String url = "jdbc:mysql://localhost:3307/pagina";
		String usuario = "Admin";
		String pass = "1111";

		out.println(
		" ,Sesion iniciada  =" + " -- " + url + " - " + "  Usuario :" + usuario + " - " + " Contraseña : " + pass);

		conexion = DriverManager.getConnection(url, usuario, pass);
		out.println("conexion" + conexion);

		estado = conexion.createStatement();
		out.println("Conexión realizada" + estado);

	} catch (SQLException e) {
		out.print("A saltado la primera expcepcion");
	}
	%>


	<%
	// Catalogo y cesta de la compra
	%>
	<h3>Mis Productos</h3>
	<!-- Div Principal del catalogo -->
	<div class="Catalogo">
		<form name="Catalogo de compra" action="MirarCatalogo.jsp"
			method="post">
			<!-- 1º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 2º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 3º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 4º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 5º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 6º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 7º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

			<!-- 8º Producto  -->
			<div>
				<input type="submit" name="enviar" value="Comprar ">
			</div>

		</form>




	</div>

<h3>Mi Cesta</h3>

<div class="Cesta">





 <!-- Añadir jsp total -->
 
 <div class="cestaTotal">
 
 <h4>total = </h4>
 
 </div>
</div>


	<%
	// fecha y hora 
	Date newDate = new Date();
	out.print(newDate);
	%>


</body>
</html>