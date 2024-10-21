<%
<!--#include file="db_connection.asp" -->
dim username, password, rs
username = ""
password = ""

if request.method = "post" then
    username = request.form("username")
    password = request.form("password")

    ' Consulta para verificar el usuario
    set rs = oConn.execute("SELECT * FROM Usuario WHERE nombre='" & username & "' AND password='" & password & "'")

    if not rs.eof then
        session("username") = username
        response.redirect "dashboard.asp"
    else
        response.write "<p style='color:red;'>Usuario o contraseña incorrectos.</p>"
    end if
end if
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .login-container { width: 300px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        input[type=text], input[type=password] { width: 100%; padding: 10px; margin: 5px 0; }
        input[type=submit] { background-color: #4CAF50; color: white; border: none; padding: 10px; }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <form method="post" action="login.asp">
            <input type="text" name="username" placeholder="Usuario" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <input type="submit" value="Entrar">
        </form>
    </div>
</body>
</html>
