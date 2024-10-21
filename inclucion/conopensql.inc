<%
  dim oConn
  dim rs
  dim path

  path=server.mappath(".")
  
  set oConn=server.createobject ("adodb.connection")
  set rs=server.createobject ("adodb.recordset")
  strConn = "Provider=SQLOLEDB;Data Source=DESKTOP-9PN0SS6;Initial Catalog=pruebabd;User ID=sa;Password=123456;"

   oConn.open strConn
%>