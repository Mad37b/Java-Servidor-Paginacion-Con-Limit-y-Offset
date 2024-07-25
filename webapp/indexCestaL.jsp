
<%@page import="clases.Carrito"%>
<%@page import="clases.ElementoDeCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="clases.Producto"%>
<%@page import="clases.CatalogoLimit"%>
<%@page import="Mensajes.Mensaje"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tienda de Productos</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap"
	rel="stylesheet">

<style>
h1 {
	font-family: 'Great Vibes', cursive;
	font-size: 6em;
}

.carrito {
	border: #ffc107 solid 2px;
	border-radius: 6px;
	padding: 4px;
}
</style>
</head>
<body>
	<%
	// 1 / Variables 
	int pagina = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
	int limite = request.getParameter("limite") != null ? Integer.parseInt(request.getParameter("limite")) : 3;
	//int limiteSeleccionado=limite + Integer.parseInt(request.getParameter("selected"));

	// 2 / Instancia

	CatalogoLimit catalogoL = new CatalogoLimit();
	catalogoL.catalogoLimitSQL(pagina, limite);

	// 3 / Obtener los productos para la página actual

	List<Producto> productosJSP = catalogoL.getProductosSQL();

	// Obtener la lista de productos SQL
	ArrayList<Producto> listaProductos = catalogoL.getProductosSQL();

	/**for (Producto producto : productosJSP) {
	   Mensaje.verMensaje("Nombre: " + producto.getNombre() + ", Precio: " + producto.getPrecio() + ", Imagen: " + producto.getImagen());
	}**/

	/////////////////////////////////////////////////////////////////////

	// Imprimir la lista para depurar
	/**for (Producto producto : listaProductos) {
		Mensaje.verMensaje("Nombre: " + producto.getNombre() + ", Precio: " + producto.getPrecio() + ", Imagen: " + producto.getImagen());
	}**/

	/**if (request.getParameter("pagina") != null) {
		pagina = Integer.parseInt(request.getParameter("pagina"));
	}
	if (request.getParameter("limite") != null) {
		limite = Integer.parseInt(request.getParameter("limite"));
	}**/

	/////////////////////////////////////////////////////////////////////

	if (session.getAttribute("carrito") == null) {
		Carrito carrito = new Carrito();
		session.setAttribute("carrito", carrito);

	}

	if (request.getParameter("carrito") != null)
		session.invalidate();
	%>
	<br>
	<h1 class="text-center">Tienda de Productos</h1>

	<!--  Session -->
	<%
	/**public int obtenerProductosTotales(){
		int total = 0;
	}**/
	%>


	<!-- HTML -->

	<div class="container">
		<div class="row">

			<!-- Colocar el Catálogo de productos -->

			<div class="col">

				<!-- Image Login -->


				<a href="LoginL.jsp"> <img class="col-sm-4" src="img/login.png"
					alt="login" width="100px"></a>

				<form name="Seleccion" method="get"
					action="indexCesta.jsp">
					<h3>Productos por página</h3>
					<select name="limite" id="nProductosVista">
						<option value="3"
							<%=(limite != 0 && limite==3) ? "selected" : ""%>>3</option>
						<option value="6"
							<%=(limite != 0 && limite == 6) ? "selected" : ""%>>6</option>
						<option value="9"
							<%=(limite != 0 && limite ==9) ? "selected" : ""%>>9</option>
						<option value="12"
							<%=(limite != 0 && limite == 12) ? "limite" : ""%>>12</option>
					</select>
					<button type="submit">Aplicar</button>
				</form>

				<!-- Botones para pasar página -->
				<div class="pagination-buttons">
					<form action="indexCesta.jsp" method="get" style="display: inline;">
						<input type="hidden" name="pagina"
							value="<%=pagina > 1 ? pagina - 1 : 1%>"> <input
							type="hidden" name="limite" value="<%=limite%>"> <input
							type="submit" name="previo" value="Previo">
					</form>
					<form action="indexCesta.jsp?pagina" method="get"
						style="display: inline;">
						<input type="hidden" name="pagina" value="<%=pagina%>"> <input
							type="hidden" name="limite" value="<%=limite%>"> <input
							type="submit" name="siguiente" value="Siguiente">
					</form>
				</div>
				<div class="row">

					<!--cambiamos el metodo getProductos por getProductosSQL para añadir a la nueva lista basada y que ingresa los datos de la base de datos-->
					<%
					for (Producto p : catalogoL.getProductosSQL()) {
					%>

					<div class="col-sm-4">
						<div class="card">
							<img src="img/<%=p.getImagen()%>"
								class="card-img-top img-fluid">
							<div class="card-body">
								<h4 class="card-title"><%=p.getNombre()%></h4>
								<h5><%=String.format("%.2f", p.getPrecio())%>€
								</h5>

								<a href="compra.jsp?codigo=<%=p.getCodigo()%>"
									class="btn btn-primary"> Añadir al carrito </a>
							</div>
						</div>

					</div>
					<%
					}
					%>

				</div>
			</div>
			<br>

			<!--  Colocar el carrito de la compra -->
			<div class="col-3">
				<div class="carrito">
					<img src="img/cart.svg" width="36px">
					<%
					for (ElementoDeCarrito e : ((Carrito) session.getAttribute("carrito")).getElementos()) {
					%>
					<div class="card">
						<img src="img/<%=e.getProducto().getImagen()%>"
							class="card-img-top img-fluid">
						<div class="card-body">
							<%=e.getProducto().getNombre()%><br>
							<%=String.format("%.2f", e.getProducto().getPrecio())%>
							€<br>
							<%=e.getCantidad()%>
							unidades<br> <a
								href="elimina.jsp?codigo=<%=e.getProducto().getCodigo()%>"
								class="btn btn-warning text-white"> Eliminar </a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
</body>
</html>