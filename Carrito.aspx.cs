using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyAPIPayPal
{
    public partial class Carrito : System.Web.UI.Page
    {
        //Crearemos la clase con la cual vamos a representar el producto, es debido a esto que tenemos los errores
        public List<Producto> CarritoItems{ get; set; }
        public decimal TotalCarrito { get; set; }
        public string PayPalUrl { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carrito"] == null)
            {
                //El error es que puse doble igual ---------------
                Session["Carrito"] = new List<Producto>();
            }

            //Aqui obtenemos el carrito de nuestra sesion actual
            CarritoItems = Session["Carrito"] as List<Producto>;

            //En caso de haber un nuevo producto para agregar

            //Estos son los parametros que mandamos desde productos 
            if (!string.IsNullOrEmpty(Request.QueryString["prod"]) && !string.IsNullOrEmpty(Request.QueryString["precio"]))
            {
                string nombreProducto = Request.QueryString["prod"];
                decimal precioProducto = Convert.ToDecimal(Request.QueryString["precio"]);

                //EN ESTE ERROR ME EQUIVOQUÉ Y NO PUSE DENTRO DEL IF ESTAS DOS LINEAS
                //Agregaremos el producto a nuestro carrito
                CarritoItems.Add(new Producto { Nombre = nombreProducto, Precio = precioProducto });

                Session["Carrito"] = CarritoItems; //Esto actualizara la sesion
            }

            //Si hay productos para eliminar 
            if (!string.IsNullOrEmpty(Request.QueryString["eliminar"]))
            {
                string nombreEliminar = Request.QueryString["eliminar"];
                CarritoItems.RemoveAll(item => item.Nombre == nombreEliminar); //Esto eliminara el producto por su nombre
            }

            //Para calcular el total 
            TotalCarrito = 0;
            foreach (var item in CarritoItems)
            {
                TotalCarrito += item.Precio;
            }

            // URL de PayPal para pagos, esta URL es la que nos permite hacer la compra ya que envia el monto
            PayPalUrl = $"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=tu-email@paypal.com&item_name=Compra&amount={TotalCarrito}&currency_code=USD";
        }

            public class Producto
            {
            public string Nombre { get; set; }
            public decimal Precio { get; set; }
            }
        
    }
}