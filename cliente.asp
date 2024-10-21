<%@ Language="VBScript" %>
<!--#include file="inclucion/conopensql.inc"-->

<html>
<head>
    <title>Listado de Clientes</title>
    <link href="estilos/general.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            background-color: #808080; /* Fondo gris */
            color: #000000; /* Color de texto */
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
        .titulo02 {
            font-size: 28px; /* Tamaño más grande para el título */
            color: #000; /* Color negro */
        }
        .volver {
            font-size: 20px; /* Tamaño más grande para el enlace */
            color: #000; /* Color negro */
            text-decoration: none; /* Sin subrayado */
        }
    </style>
</head>
<body>
    <div align="center" class="titulo02">Listado de Clientes</div>
    <hr>
    <table>
        <tr>
            <th>Cliente ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Direccion</th>
            <th>Tele	fono</th>
        </tr>
        <%
        ' Obtener todos los registros de clientes
        Set rs = Server.CreateObject("ADODB.Recordset")
        rs.Open "SELECT * FROM cliente ORDER BY cliente_id", oConn

        ' Mostrar los registros en la tabla
        Do While Not rs.EOF
            Response.Write "<tr>"
            Response.Write "<td>" & rs("cliente_id") & "</td>"
            Response.Write "<td>" & rs("nombre") & "</td>"
            Response.Write "<td>" & rs("apellido") & "</td>"
            Response.Write "<td>" & rs("direccion") & "</td>"
            Response.Write "<td>" & rs("telefono") & "</td>"
            Response.Write "</tr>"
            rs.MoveNext
        Loop
        rs.Close
        %>
    </table>

    <div align="center"><a class="volver" href="tableros.asp">Volver al Tablero Principal</a></div>
</body>
</html>

