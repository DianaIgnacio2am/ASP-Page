<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
    <title>Detalles de Ventas - Mes</title>
    <link href="estilos/general.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        body {
            background-color: #808080;
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
            background-color: #111;
            color: #FFF;
        }
        td {
            color: #FFF;
        }
        .volver {
            font-size: 20px;
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="titulo">Detalles de Ventas</div>
    <hr>

    <%
        ' Obtener el ID de la sucursal y el mes desde la URL
        dim sucursalId, mes
        
        If IsNumeric(Request.QueryString("id")) Then
            sucursalId = CInt(Request.QueryString("id"))
        Else
            Response.Write("Error: ID de sucursal no válido.")
            Response.End
        End If

        If IsNumeric(Request.QueryString("mes")) Then
            mes = CInt(Request.QueryString("mes"))
        Else
            Response.Write("Error: Mes no válido.")
            Response.End
        End If

        ' Obtener los detalles de las ventas para el mes seleccionado
        Set rsDetalles = Server.CreateObject("ADODB.Recordset")
        ' Modificar la consulta para incluir el nombre del cliente
rsDetalles.Open "SELECT v.venta_id, CONCAT(c.nombre, ' ', c.apellido) AS cliente_nombre, v.fecha_venta, v.total " & _
                "FROM Venta v JOIN Cliente c ON v.cliente_id = c.cliente_id " & _
                "WHERE v.sucursal_id = " & sucursalId & " AND MONTH(v.fecha_venta) = " & mes, oConn


        Response.Write "<table>"
        Response.Write "<tr><th>ID Venta</th><th>Cliente</th><th>Fecha Venta</th><th>Total</th><th>Acciones</th></tr>"

        ' Mostrar los detalles de las ventas
        Do While Not rsDetalles.EOF
            Response.Write "<tr>"
            Response.Write "<td>" & rsDetalles.fields("venta_id") & "</td>"
            Response.Write "<td>" & rsDetalles.fields("cliente_nombre") & "</td>" ' Mostrar nombre del cliente
            Response.Write "<td>" & rsDetalles.fields("fecha_venta") & "</td>"
Response.Write "<td>$" & FormatNumber(CDBL(rsDetalles.fields("total")), 2) & "</td>"

            ' Agregar el enlace "Ver Detalles"
            Response.Write "<td><a href='detalle_producto.asp?venta_id=" & rsDetalles.fields("venta_id") & "'>Ver Detalles</a></td>"
            Response.Write "</tr>"
            rsDetalles.MoveNext
        Loop
        rsDetalles.Close
        Response.Write "</table>"
    %>

    <hr>
    <div align="center">
        <a class="volver" href="detalle_sucursal.asp?id=<%=sucursalId%>">Volver a los Detalles de la Sucursal</a>
    </div>
</body>
</html>
