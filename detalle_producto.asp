<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
    <title>Detalles de Productos Vendidos</title>
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
            color: #000;
        }
        .volver {
            font-size: 20px;
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="titulo">Detalles de Productos Vendidos</div>
    <hr>

    <%
    ' Obtener el ID de la venta desde la URL
    Dim ventaId, sucursalId, mes, totalGeneral
    totalGeneral = 0
    ventaId = Request.QueryString("venta_id")
    sucursalId = Request.QueryString("sucursal_id")
    mes = Request.QueryString("mes")

    ' Verificar que el ID de venta sea numérico
    If IsNumeric(ventaId) Then
        ventaId = CInt(ventaId)
    Else
        Response.Write("Error: ID de venta no válido.")
        Response.End
    End If

    ' Verificar que el ID de sucursal sea numérico
    If IsNumeric(sucursalId) Then
        sucursalId = CInt(sucursalId)
    Else
        Response.Write("Error: ID de sucursal no válido.")
        Response.End
    End If

    ' Verificar que el mes sea numérico
    If IsNumeric(mes) Then
        mes = CInt(mes)
    Else
        Response.Write("Error: Mes no válido.")
        Response.End
    End If

    ' Obtener los productos vendidos para la venta seleccionada
    Set rsProductos = Server.CreateObject("ADODB.Recordset")
    rsProductos.Open "SELECT vp.producto_id, vp.cantidad, vp.precio_unitario, vp.subtotal, p.nombre " & _
                     "FROM VentaProducto vp " & _
                     "JOIN Producto p ON vp.producto_id = p.producto_id " & _
                     "WHERE vp.venta_id = " & ventaId, oConn

    Response.Write "<table>"
    Response.Write "<tr><th>Producto ID</th><th>Nombre del Producto</th><th>Cantidad</th><th>Precio Unitario</th><th>Subtotal</th></tr>"

    ' Mostrar los productos vendidos
    Do While Not rsProductos.EOF
        Response.Write "<tr>"
        Response.Write "<td>" & rsProductos.fields("producto_id") & "</td>" ' ID del producto
        Response.Write "<td>" & rsProductos.fields("nombre") & "</td>" ' Nombre del producto
        Response.Write "<td>" & rsProductos.fields("cantidad") & "</td>"
Response.Write "<td>$" & FormatNumber(CDBL(rsProductos.fields("precio_unitario")), 2) & "</td>"
Response.Write "<td>$" & FormatNumber(CDBL(rsProductos.fields("subtotal")), 2) & "</td>"

        Response.Write "</tr>"

        ' Sumar los subtotales, asegurándose de que sea numérico
        totalGeneral = totalGeneral + CDbl(rsProductos.fields("subtotal"))
        
        rsProductos.MoveNext
    Loop

    rsProductos.Close

    ' Mostrar el total al final de la tabla
    Response.Write "<tr>"
    Response.Write "<td colspan='4' style='text-align: right; font-weight: bold;'>Total:</td>"
Response.Write "<td>$" & FormatNumber(CDBL(totalGeneral), 2) & "</td>"

    Response.Write "</tr>"
    
    Response.Write "</table>"
    %>

    <hr>
    <div align="center">
        <a class="volver" href="javascript:history.back()">Volver a Detalles</a>
    </div>
</body>
</html>
