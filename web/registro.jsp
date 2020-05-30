<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/master.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body id='body'>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="">Logo</a></li>
                        <li><a href="registro.jsp">Registrarse</a></li>
                    </ul>
                </nav>
        </section> 
        
        <center>
            <div id='log' style='margin:200px'>
                REGISTRATE <br><br><br>
                <form action='UserRegister' method="post">
                    <table>
                        <tr>
                            <td>Nombre:</td>
                            <td><input type='text' name='nombre' class='text' placeholder='Nombre'></td>
                        </tr>
                        <tr>
                            <td>Apellido Paterno:</td>
                            <td><input type='text' name='paterno' class='text' placeholder='Apellido paterno'></td>
                        </tr>
                        <tr>
                            <td>Apellido Materno:</td>
                            <td><input type='text' name='materno' class='text' placeholder='Apellido materno'></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type='text' name='correo' class='text' placeholder='Correo electronico'></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type='password' name='contrasena' class='text' placeholder='Contraseña'></td>
                        </tr>
                        <tr>
                            <td>Fecha de nacimiento:</td>
                            <td><input type='date' name='cumpleanos' class='text' placeholder='Cumpleaños'></td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td><input type='number' name='telefono' class='text' placeholder='Telefono'></td>
                        </tr>
                        <tr>
                            <td>Celular:</td>
                            <td><input type='number' name='celular' class='text' placeholder='Celular'></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type='submit' value='Registrarse' id='boton'></td>
                        </tr>
                    </table>
                </form>
            </div>
        </center>
        
        <footer>
            <div>
                <p>Terminos y condiciones</p>
            </div>
        </footer>
    </body>
</html>
