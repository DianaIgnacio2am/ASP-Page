<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
    <title>Listado de Productos</title>
    <link href="estilos/general.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            background-color: #808080; /* Fondo gris */
            color: #000000; /* Color de texto blanco */
        }
        .titulo {
            text-align: center;
            font-size: 28px;
            margin-top: 20px;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #111; /* Negro más oscuro */
            color: #FFF;
        }
        td {
            background-color: #222; /* Color de fondo para las celdas */
            color: #FFF; /* Color de texto para las celdas */
        }
        .volver {
            font-size: 20px; /* Tamaño más grande para el enlace */
            color: #000000; /* Color negro */
            text-decoration: none; /* Sin subrayado */
        }
    </style>
</head>
<body>
    <div class="titulo">Listado de Productos</div>
    <hr>

    <%
        ' Obtener los productos
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT producto_id, nombre, precio FROM producto", oConn

        Response.Write "<table>"
        Response.Write "<tr><th>Producto</th><th>Precio</th></tr>"

        ' Mostrar los productos
        Do While Not rs.EOF
            Response.Write "<tr>"
            ' Mostrar el nombre del producto como texto fijo
            Response.Write "<td>" & rs.fields("nombre") & "</td>"
            Response.Write "<td>$" & FormatNumber(rs.fields("precio"), 2) & "</td>"
            Response.Write "</tr>"
            rs.MoveNext
        Loop
        rs.Close
        Response.Write "</table>"
    %>

    <hr>
    <div align="center">
        <a class="volver" href="tableros.asp">Volver al Tablero Principal</a>
    </div>
</body>
</html>
