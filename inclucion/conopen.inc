<%
  dim oConn
  dim rs
  dim path

  path=server.mappath(".")
  
  set oConn=server.createobject ("adodb.connection")
  set rs=server.createobject ("adodb.recordset")

  oConn.open "driver={microsoft access driver (*.mdb)}; dbq=" & path & "/bd/empresa.mdb"
%>