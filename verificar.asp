<!--#include file="inclucion/conopensql.inc"-->
<%
' Función para codificar en Base64
Function Base64Encode(data)
    Dim xml, node
    Set xml = CreateObject("MSXml2.DOMDocument.3.0")
    Set node = xml.createElement("b64")
    node.dataType = "bin.base64"
    node.nodeTypedValue = data
    Base64Encode = node.text
    Set node = Nothing
    Set xml = Nothing
End Function

' Abrir el recordset de usuarios
rs.Open "SELECT * FROM usuarios", oConn

' Obtener los datos del formulario
nom = LCase(Trim(request.form("nombre"))) ' Convertir el nombre a minúsculas para una comparación insensible a mayúsculas
pass = request.form("contra") ' Obtener la contraseña ingresada por el usuario

' Codificar la contraseña ingresada en Base64
pass_encoded = Base64Encode(pass)

' Inicializar la variable de control
user_found = False

' Recorrer el recordset para buscar el usuario
do while not rs.eof
    ' Comparar el nombre en minúsculas
    if LCase(Trim(rs.fields("nombre"))) = nom then
        user_found = True
        ' Comparar la contraseña en Base64 con la contraseña almacenada en texto plano en la base de datos
        if rs.fields("contrasena") = pass then
            response.redirect "tableros.asp" ' Redirigir si la contraseña es correcta
        else
            response.redirect "index.asp?error=1" ' Contraseña incorrecta
        end if
        exit do
    end if
    rs.movenext
loop

' Si no se encontró el usuario
if not user_found then
    response.redirect "index.asp?error=2" ' Usuario no encontrado
end if

' Cerrar el recordset y la conexión
rs.Close
Set rs = Nothing
oConn.Close
%>

