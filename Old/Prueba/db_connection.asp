<%
dim oConn
set oConn = server.createobject("adodb.connection")

' Configuración de la conexión
strConn = "Provider=SQLOLEDB;Data Source=DESKTOP-9PN0SS6;Initial Catalog=pruebabd2;User ID=sa;Password=123456;"
oConn.open strConn
%>
