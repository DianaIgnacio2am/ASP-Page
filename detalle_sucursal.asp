<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
    <title>Detalle de la Sucursal</title>
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
        .verde {
            background-color: #0f0;
        }
        .amarillo {
            background-color: #ff0;
        }
        .rojo {
            background-color: #f00;
        }
        .volver {
            font-size: 20px;
            color: #000000;
            text-decoration: none;
        }
        .metricas {

    top: 20px;
    left: 20px;
    width: 200px;  /* Ancho del cuadrito */
    font-size: 12px;  /* Tamaño de fuente más pequeño */
    background-color: #f2f2f2;
    padding: 5px;  /* Espaciado reducido */
    border: 1px solid #000;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);  /* Añade una pequeña sombra */
        }
    </style>
</head>
<body>
    <div class="titulo">Ventas de la Sucursal - Detalles por Mes</div>
    <hr>

    <%
        ' Incluir la conexión a la base de datos
        ' Esto viene de tu archivo de inclusión conopensql.inc

        ' Obtener el ID de la sucursal desde la URL
        dim sucursalId
        sucursalId = CInt(Request.QueryString("id")) ' Asegurarse de que sea un entero

        ' Definir el umbral de ventas
        const meta_ventas = 5200

        ' Obtener las ventas por mes
        Set rsVentas = Server.CreateObject("ADODB.Recordset")
        rsVentas.Open "SELECT MONTH(fecha_venta) AS mes, DATENAME(MONTH, fecha_venta) AS nombre_mes, SUM(total) AS total_ventas FROM Venta WHERE sucursal_id = " & sucursalId & " GROUP BY MONTH(fecha_venta), DATENAME(MONTH, fecha_venta)", oConn

        Response.Write "<table>"
        Response.Write "<tr><th>Mes</th><th>Total Ventas</th></tr>"

        ' Mostrar las ventas con el color basado en el umbral
        Do While Not rsVentas.EOF
            dim total_ventas, color_clase, nombre_mes
            total_ventas = CDBL(rsVentas.fields("total_ventas")) ' Asegurarse de que sea un número
            nombre_mes = rsVentas.fields("nombre_mes")

            ' Determinar el color
            if total_ventas >= meta_ventas then
                color_clase = "verde"
            elseif total_ventas >= (meta_ventas * 0.8) then
                color_clase = "amarillo"
            else
                color_clase = "rojo"
            end if

            ' Hacer que el nombre del mes sea un enlace
            Response.Write "<tr class='" & color_clase & "'>"
            Response.Write "<td><a href='detalle_ventas.asp?id=" & sucursalId & "&mes=" & rsVentas.fields("mes") & "' style='color: #000;'>" & nombre_mes & "</a></td>"
            Response.Write "<td>" & total_ventas & "</td>"
            Response.Write "</tr>"
            rsVentas.MoveNext
        Loop
        rsVentas.Close
        Response.Write "</table>"
    %>

    <hr>
    <div class="metricas">
        <strong>Explicacion de metricas:</strong><br>
        <ul>
            <li><strong style="color: #f00;">Rojo:</strong> Ventas menores  de <%= meta_ventas * 0.8 %>.</li>
            <li><strong style="color: #ff0;">Amarillo:</strong> Ventas entre <%= meta_ventas * 0.8 %> y <%= meta_ventas %>.</li>
            <li><strong style="color: #0f0;">Verde:</strong> Ventas que igualan o superan de <%= meta_ventas %>.</li>
        </ul>
    </div>

    <hr>
    <div align="center">
        <a class="volver" href="sucursales.asp">Volver al Listado de Sucursales</a>
    </div>
</body>
</html>
