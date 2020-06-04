<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/master.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        
    </head>
    
    <body id='body'>
        <script type="text/javascript">
            function register(){
                var nombre = document.getElementsByName("nombre")[0].value;
                var paterno = document.getElementsByName("paterno")[0].value;
                var materno = document.getElementsByName("materno")[0].value;
                var correo = document.getElementsByName("correo")[0].value;
                var contrasena = document.getElementsByName("contrasena")[0].value;
                var cumpleanos = document.getElementsByName("cumpleanos")[0].value;
                var telefono = document.getElementsByName("telefono")[0].value;
                var celular = document.getElementsByName("celular")[0].value;
                 if (/^[A-Z]+$/i.test(nombre) && /^[A-Z]+$/i.test(paterno) && /^[A-Z]+$/i.test(materno) && contrasena!==null && /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(correo) && cumpleanos !== null && /^[0-9]+$/.test(telefono) && /^[0-9]+$/.test(celular)) {
                    document.getElementById("formularioreg").submit();
                }else{
                    alert("Datos invalidos, vuelva a intentar");
                }
              }
        </script>
        <section class="fondo" id="fondo">
            <header class="cabecera" id="cabecera">
                <h1>TACO MASTER®</h1>
            </header>
                <nav class="navegacion" id="navegacion">
                    <ul>
                        <li><a href="index.jsp"><img src="multimedia/logo.png" heigth="40" width="160"></a></li>
                        <li><a href="registro.jsp">Registrarse</a></li>
                    </ul>
                </nav>
        </section> 
        
        <center>
            <div id='log' style='margin:200px'>
                REGISTRATE <br><br><br>
                <form action='UserRegister' method="post" id="formularioreg">
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
                            <td><input type='button' onclick="register()" value='Registrarse'></td>
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
