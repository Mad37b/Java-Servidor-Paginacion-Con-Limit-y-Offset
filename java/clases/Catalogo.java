package clases;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class Catalogo {

	// lista de productos en el catalogo
	ArrayList<Producto> productos = new ArrayList<>();
	ArrayList<Producto>productosSQL = new ArrayList<>();
	ResultSet resultado =null;
	Statement estado=null;;
	Connection conexion= null ;
	
	int nPaginas;
	int productoPorPagina;
	String nombre;
	double precio;
	String imagen;
	
	/** SQL **/
	
	public void cargarDatosSQL() {
		
		try { 
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
			String query = "Select * From productos ";
		
			resultado = estado.executeQuery(query);
			productos.clear(); /** Opcional **/
			while(resultado.next()) {
				 nombre=resultado.getString("Nombre");
				 precio = resultado.getDouble("Precio");
				 imagen = resultado.getString("Imagen");
				 //intento de añadir a una arrayList por hacer un getAll
				productosSQL.add(new Producto(nombre,precio,imagen));
				//System.out.println("Nombre: " + nombre + ", Precio: " + precio + ", Imagen: " + imagen);
			}
			
			//System.out.println(resultado.toString());
			
		// fin del Primer try 	
		}catch(SQLException e) {
			System.out.println("la conexion no ha sido realizada");
			 e.printStackTrace();
		}
		
		
	}

	/** Local **/
	public void cargarDatos() {

		// metemos 8 datos
		
		productos.clear();
		/** 1 **/ productos.add(new Producto(1, "Curso java", 10, "java.png"));
		/** 2 **/ productos.add(new Producto(2, "Curso Aeromodelismo", 20, "avion.jpg"));
		/** 3 **/ productos.add(new Producto(3, "Curso Motor grafico", 30, "motorGrafico.png"));
		/** 4 **/ productos.add(new Producto(4, "Curso CSS", 40, "CSS.jpg"));
		/** 5 **/ productos.add(new Producto(5, "Curso historia", 50, "historia.jpg"));
		/** 6 **/ productos.add(new Producto(6, "Curso Arte", 60, "Arte.png"));

	}
	
	public ArrayList<Producto> getProductosSQL(){
		//System.out.println("\n"+"Depurar lista ;" + productosSQL);
		
		return productosSQL;
	}
	// metemos 8 datos
	public  ArrayList<Producto> getProductos() {
		
		return productos;
	}

	public Producto productoConCodigo(int codigo) {

		for (Producto productos : productos) {
			if (productos.getCodigo() == codigo) {
				return productos;
			}
		}
		return null;
	}
	
	public  String toString (String nombre,double precio , String imagen) {
		nombre = this.nombre;
		precio = this.precio;
		imagen = this.imagen;
		System.out.printf(nombre,precio,imagen);
		return toString();
	}
	
}


