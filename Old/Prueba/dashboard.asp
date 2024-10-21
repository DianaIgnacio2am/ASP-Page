<%
<!--#include file="db_connection.asp" -->
if session("username") = "" then
    response.redirect "login.asp"
end if

set rsSucursal = oConn.execute("SELECT s.nombre AS Sucursal, SUM(v.cantidad * p.precio) AS Ventas_Totales FROM Venta v JOIN Sucursal s ON v.id_sucursal = s.id JOIN Producto p ON v.id_producto = p.id GROUP BY s.nombre")
set rsProducto = oConn.execute("SELECT p.nombre AS Producto, SUM(v.cantidad) AS Cantidad_Vendida FROM Venta v JOIN Producto p ON v.id_producto = p.id GROUP BY p.nombre ORDER BY Cantidad_Vendida DESC")
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard de Ventas</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #4CAF50; color: white; }
        .logout { float: right; }
    </style>
</head>
<body>
    <h1>Bienvenido, <%= session("username") %></h1>
    <a class="logout" href="logout.asp">Cerrar Sesión</a>
    
    <h2>Ventas Totales por Sucursal</h2>
    <table>
        <tr>
            <th>Sucursal</th>
            <th>Ventas Totales</th>
        </tr>
        <%
        while not rsSucursal.eof
        %>
        <tr>
            <td><%= rsSucursal("Sucursal") %></td>
            <td><%= rsSucursal("Ventas_Totales") %></td>
        </tr>
        <%
            rsSucursal.movenext
        wend
        %>
    </table>
    
    <h2>Productos Más Vendidos</h2>
    <table>
        <tr>
            <th>Producto</th>
            <th>Cantidad Vendida</th>
        </tr>
        <%
        while not rsProducto.eof
        %>
        <tr>
            <td><%= rsProducto("Producto") %></td>
            <td><%= rsProducto("Cantidad_Vendida") %></td>
        </tr>
        <%
            rsProducto.movenext
        wend
        %>
    </table>
</body>
</html>

