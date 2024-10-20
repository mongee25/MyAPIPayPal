<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="MyAPIPayPal.Carrito" %>

<!-- Este es el script que contiene nuestra API key-->
<script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>

<!DOCTYPE html>

<html>
<head>
    <title>Carrito de compras</title>

    <!-- Volvemos a copiar el script pero en el HEAD-->
    <script src="https://www.paypal.com/sdk/js?client-id=Af6_NajPxmzcmIkbdHLiURfyJL52ARkIFaerE7FdPWDifAz4hvkHmRwWuHWOZItpIeNX7KzNbvfmyzHl"></script>


    <!-- Style pagina carrito-->
     <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .total {
            text-align: right;
            padding: 20px;
        }
        .btn-pagar {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-eliminar {
            padding: 5px 10px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #paypal-button-container {
            display: flex;
            justify-content: center; /* Centra el botón de PayPal */
            margin: 20px 0; /* Espaciado alrededor del botón */
        }
    </style>

</head>
<body>
   <!-- Esta sera nuestra interfaz de carrito donde nos mostrara el precio y la API-->
    <h1>Carrito de Compras</h1>

    <!-- Aquí aparecera el precio y el producto seleccionado-->
    <table>
        <thead>
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <!-- Aqui iteramos para ontener cada item que agregamos a nuestro carrito, MARCA ERROR PORQUE HACE FALTA CREAR EL .CS-->
        <tbody id="carritoItems">
            <%foreach (var item in CarritoItems)
                {%>
            <tr>
                <td><%= item.Nombre %></td>
                <td>$<%= item.Precio %></td>
                <!-- Boton para eliminar el producto-->
                <td>
                    <button class="btn-eliminar" onclick="eliminarProducto('<%=item.Nombre %>')">Eliminar</button>
                </td>
            </tr>
           <% } %> 
        </tbody>
    </table>

    <div class="total">
        <h2>Total: $<%= TotalCarrito %></h2>
    </div>

    <!--Esto es para el boton de Paypal-->
    <div id="paypal-button-container"></div>

    <!--Copien el siguiente script-->

    <!--Esta fucion nos permite eliminar del carrito el producto que ue seleecionado y que se actualice en nuestra API-->
    <script>
        function eliminarProducto(nombre) {
            // Redirige a una URL con el producto a eliminar (ajusta según tu lógica)
            window.location.href = 'Carrito.aspx?eliminar=' + encodeURIComponent(nombre);
        }

        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= TotalCarrito %>' // Usa el total del carrito como monto a pagar
                        }
                    }]
                });
            },
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    alert('Pago realizado por ' + details.payer.name.given_name);
                    // Aquí puedes redirigir al usuario o realizar otras acciones
                });
            },
            onError: function (err) {
                console.error(err);
                alert('Ocurrió un error durante el pago. Por favor, inténtalo de nuevo.');
            }
        }).render('#paypal-button-container'); // Renderiza el botón en el contenedor
    </script>
      
</body>
</html>
