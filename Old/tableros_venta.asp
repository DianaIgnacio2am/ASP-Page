<!--#include file="inclucion/conopensql.inc"-->
<html>
<head>
<title>Tablero de Control</title>
<link href="estilos/general.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.Estilo1 {color: #000000}
body {
	background-color: #00A800;
}
a:link {
	color: #000000;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body>
<div align="center" class="titulo02 Estilo1">Tablero de Control</div>
<hr>
<br>
<table width="90%" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td align="left"><span class="Estilo1">Ventas</span></td>
	</tr>
</table>	

<br>
<table border="1" cellpadding="0" cellspacing="0" width="40%" align="center">
  <tr>
    <td align="center"><span class="Estilo1"><b>Mes</b></span></td>
    <td align="center"><span class="Estilo1"><b>Monto</b></span></td>
  </tr>
  <%
		rs.open "select * from ventas", oConn
		rs.movefirst
		do while not rs.eof
			response.write "<tr>"
			response.write "	<td>" & rs.fields("mes") & "</td>"
			if rs.fields("monto") < 3000 then
				response.write "	<td align='right'><font color='#ff3333'>" & rs.fields("monto") & "</font></td>"
			end if
			if rs.fields("monto") >= 3000 and rs.fields("monto") <= 5000 then
				response.write "	<td align='right'>" & rs.fields("monto") & "</td>"
			end if
			if rs.fields("monto") > 5000 then
				response.write "	<td align='right'><font color='#33aa33'>" & rs.fields("monto") & "</font></td>"
			end if
			response.write "</tr>"
			rs.movenext
		loop
		rs.close
	%>
</table>
<br>
<%
	rs.open "select top 1 * from ventas order by monto asc", oConn
	response.write "<div align='center'>Mes de menor venta: " & rs.fields("mes") & "</div>"
	rs.close
%>
	<br />
	<%
	rs.open "select top 1 * from ventas order by monto desc", oConn
	response.write "<div align='center'>Mes de mayor venta: " & rs.fields("mes") & "</div>"
		rs.close
%>
<hr>
<div align="center"><a href="tableros.asp" class="Estilo1">Volver al Tablero Principal</a></div>
</body>
</html>