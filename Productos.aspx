<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MyAPIPayPal.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tienda Online</title>

        <!-- Style pagina productos-->
        <style>
        body {
            font-family: Arial, sans-serif;
        }
        .product-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
        }
        .product {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product h3 {
            font-size: 1.5em;
        }
        .product p {
            font-size: 1em;
            color: #666;
        }
        .product button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
   <h1>Nuestros productos</h1>
    <div class="product-container">
        <!--PRODUCTO 1 -->
        <div class="product">
            <h3>Camiseta Nike</h3>
            <p>Materiales: Algodón, etc</p>
            <p>Precio: $300.00</p>
            <p>Dscripción: Camiseta de alta calidad</p>
            <!--En esta línea de código le estamos enviando los valores del producto y precio a una tabla que veremos más adelante y el precio tambien lo enviamos a nuestra API -->
            <button onclick="location.href='Carrito.aspx?prod=Camiseta Nike&precio=300'">Agregar al carrito</button>
        </div>

        <!--PRODUCTO 2 -->
        <div class="product">
            <h3>Bolso</h3>
            <p>Materiales: Algodón</p>
            <p>Precio: $400.00</p>
            <p>Dscripción: Alta calidad</p>
            <!--Hay que modificar tambien la linea donde se envian los arametros con la informacion de cada productos -->
            <button onclick="location.href='Carrito.aspx?prod=Bolso&precio=400'">Agregar al carrito</button>
        </div>

        <!--PRODUCTO 3 -->
        <div class="product">
            <h3>Reloj Samsung</h3>
            <p>Materiales: Titanio, cristal</p>
            <p>Precio: $1499.00</p>
            <p>Dscripción: Alta calidad</p>
            <!--En esta línea de código le estamos enviando los valores del producto y precio a una tabla que veremos más adelante y el precio tambien lo enviamos a nuestra API -->
            <button onclick="location.href='Carrito.aspx?prod=Reloj Samsung&precio=1499'">Agregar al carrito</button>
        </div>

         <!--PRODUCTO 4 -->
         <div class="product">
             <h3>Lampara led</h3>
             <p>Materiales: Cristal</p>
             <p>Precio: $200.00</p>
             <p>Dscripción: Gran calidad</p>
             <!--En esta línea de código le estamos enviando los valores del producto y precio a una tabla que veremos más adelante y el precio tambien lo enviamos a nuestra API -->
             <button onclick="location.href='Carrito.aspx?prod=Lampara led&precio=200'">Agregar al carrito</button>
         </div>

         <!--PRODUCTO 5 -->
         <div class="product">
             <h3>Auriculares SONY</h3>
             <p>Materiales: Plastico</p>
             <p>Precio: $500.00</p>
             <p>Dscripción: Gran calidad de sonido</p>
             <!--En esta línea de código le estamos enviando los valores del producto y precio a una tabla que veremos más adelante y el precio tambien lo enviamos a nuestra API -->
             <button onclick="location.href='Carrito.aspx?prod=Auriculares SONY&precio=500'">Agregar al carrito</button>
         </div>
    </div>
    
         <!--Ahora agregaremos otro forms-->
</body>
</html>
