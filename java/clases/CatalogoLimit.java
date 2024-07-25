
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoLimit {

	ArrayList<Producto> productos = new ArrayList<>();
	ArrayList<Producto> productosSQL = new ArrayList<>();
	ResultSet resultado = null;
	Statement estado = null;;
	Connection conexion = null;

	int nPaginas;
	int productoPorPagina;
	String nombre;
	double precio;
	String imagen;

	public void catalogoLimitSQL(int pagina, int limite) {
		int limites = limite;
		int paginas = limites * (pagina - 1);
		
		try {
			// Iniciar BD
			String url = "jdbc:mysql://localhost:3307/pagina";
			String controlador = "com.mysql.cj.jdbc.Driver";
			String usuario = "Admin";
			String pass = "1111";

			try {
				Class.forName(controlador);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			conexion = DriverManager.getConnection(url, usuario, pass);
			estado = conexion.createStatement();

			String queryLimit = "Select * From productos LIMIT " + limites + " OFFSET " + paginas;
			String query = "Select * From productos";
			resultado = estado.executeQuery(queryLimit);
			System.out.println(queryLimit);
			productos.clear();
			
			while (resultado.next()) {
				nombre = resultado.getString("Nombre");
				precio = resultado.getDouble("Precio");
				imagen = resultado.getString("Imagen");
				
				productosSQL.add(new Producto(nombre, precio, imagen));
				
			
			}

			// System.out.println(resultado.toString());

			// fin del Primer try
		} catch (SQLException e) {
			System.out.println("la conexion no ha sido realizada");
			e.printStackTrace();
		}

	}

	public ArrayList<Producto> getProductosSQL() {
		// System.out.println("\n"+"Depurar lista ;" + productosSQL);

		return productosSQL;
	}

	public Producto productoConCodigo(int codigo) {

		for (Producto productos : productos) {
			if (productos.getCodigo() == codigo) {
				return productos;
			}
		}
		return null;
	}
}
