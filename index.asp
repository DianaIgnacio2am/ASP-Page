<html>
<head>
<title>Login</title>
<link href="estilos/general.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
    background-color: #808080; /* Fondo gris */
}

hr {
    border: 0;
    height: 1px;
    background-color: #808080; /* Cambiado a gris para las líneas */
}

table {
    border-color: #000000; /* Borde del marco negro */
}

input {
    border: 1px solid #000000; /* Bordes de los campos de entrada en negro */
}

.Estilo1 { 
    color: #000000; /* Negro fuerte para "Ingreso al Sistema" */
}

.Estilo2 { 
    color: #333333; /* Un negro más claro para "Usuario" y "Contraseña" */
}

</style>

<!-- Script para mostrar el mensaje de error -->
<script type="text/javascript">
function mostrarError() {
    var error = "<%= Request.QueryString("error") %>"; // Obtiene el parámetro de error de la URL
    if (error == "1") {
        alert("Contraseña incorrecta. Inténtelo de nuevo."); // Mensaje de contraseña incorrecta
    } else if (error == "2") {
        alert("Usuario no encontrado. Inténtelo de nuevo."); // Mensaje de usuario no encontrado
    }
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onload="mostrarError();"> <!-- Llama al script al cargar la página -->
<br><br><br>
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#808080">
    <tr>
        <td height="120" align="center" bordercolor="#C0C0C0" bgcolor="#808080">
            <div class="titulo02 Estilo1">Login</div>
            <div class="titulo01 Estilo1">Sistema de Distribuidora</div>
            <hr width="300">
            <table width="292" height="115" border="1" bordercolor="#000000" bgcolor="#808080" class="tabla_login">
                <form name="login" method="post" action="verificar.asp">
                    <tr>
                        <td colspan="2" align="center" bgcolor="#808080"><span class="Estilo1"><b>Ingreso al Sistema</b></span></td>
                    </tr>
                    <tr>
                        <td width="84" bgcolor="#808080"><span class="Estilo2">Usuario</span></td>
                        <td width="196" bgcolor="#808080"><input type="text" name="nombre" style="border-color: #000000;"></td>
                    </tr>
                    <tr>
                        <td bgcolor="#808080"><span class="Estilo2">Contraseña</span></td>
                        <td bgcolor="#808080"><input type="password" name="contra" style="border-color: #000000;"></td>
                    </tr>
                    <tr>
                        <td height="30" colspan="2" align="center" bordercolor="#C0C0C0" bgcolor="#808080"><p>
                            <input type="submit" value="Ingresar" class="boton_formulario" style="border-color: #000000;">
                        </p>
                </form>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
