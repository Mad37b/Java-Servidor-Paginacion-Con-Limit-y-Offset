package clases;

public class Producto {
	
	
	//  Atributos de la clase 

	private int codigo ;
	private String nombre;
	private double precio;
	private String imagen;
	
	// constructor de la clase
	
	public Producto( int codigo, String nombre ,  double precio ,  String imagen ){
		this.codigo = codigo ;
		this.nombre = nombre;
		this.precio = precio ;
		this.imagen = imagen;
		
	}
// borrar , creado desde catalogo
	public Producto(String nombre2, double precio2, String imagen2) {
		
		this.nombre = nombre2;
		this.precio = precio2 ;
		this.imagen = imagen2;
		// TODO Auto-generated constructor stub
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen2) {
		this.imagen = imagen2;
	}
	
	
	//Metodos de la clase
	

	
}
