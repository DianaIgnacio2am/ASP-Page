<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
    <title>Sucursales</title>
    <link href="estilos/general.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            background-color: #808080; /* Fondo gris */
            color: #000000; 
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
        .linkSucursal {
            color: #00f; /* Color azul para enlaces */
            text-decoration: none; /* Sin subrayado */
            font-size: 18px; /* Tamaño del texto */
        }
        .linkSucursal:hover {
            text-decoration: underline; /* Subrayar al pasar el ratón */
        }
        .volver {
            font-size: 20px; /* Tamaño más grande para el enlace */
            color: #000000; 
            text-decoration: none; /* Sin subrayado */
        }
    </style>
</head>
<body>
    <div class="titulo">Listado de Sucursales</div>
    <hr>

    <%
        ' Obtener las sucursales
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT sucursal_id, nombre, direccion FROM sucursal", oConn

        Response.Write "<table>"
        Response.Write "<tr><th>Sucursal</th><th>Direccion</th></tr>"

        ' Mostrar las sucursales
        Do While Not rs.EOF
            Response.Write "<tr>"
            Response.Write "<td><a class='linkSucursal' href='detalle_sucursal.asp?id=" & rs.fields("sucursal_id") & "'>" & rs.fields("nombre") & "</a></td>"
            Response.Write "<td>" & rs.fields("direccion") & "</td>"
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

