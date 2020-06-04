//poner nombre a formularios

//cambiar input a button
function log(){
  var correo = document.getElementsByName("correo")[0].value;
  var password = document.getElementsByName("password")[0].value;
  console.log("correo"+correo+password);
   if (/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(correo) && password != null) {
      document.getElementById("formulariolog").submit();
  }else{
      alert("Datos invalidos, vuelva a intentar");
  }
}

function register(){
  var nombre = document.getElementsByName("nombre")[0].value;
  var paterno = document.getElementsByName("paterno")[0].value;
  var materno = document.getElementsByName("materno")[0].value;
  var correo = document.getElementsByName("correo")[0].value;
  var contrasena = document.getElementsByName("contrasena")[0].value;
  var cumpleanos = document.getElementsByName("cumpleanos")[0].value;
  var telefono = document.getElementsByName("telefono")[0].value;
  var celular = document.getElementsByName("celular")[0].value;
   if (/^[A-Z]+$/i.test(nombre) && /^[A-Z]+$/i.test(paterno) && /^[A-Z]+$/i.test(materno) && contrasena!=null && /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(correo) && cumpleanos=!null && /^[1-9]\d$/.test(telefono) && /^[1-9]\d$/.test(celular)) {
    document.getElementById("formularioreg").submit();
  }else{
      alert("Datos invalidos, vuelva a intentar");
  }
}

function cambiarpass(){
  var pass_a = document.getElementsByName("pass_a")[0].value;
  var pass_n = document.getElementsByName("pass_n")[0].value;
  if (pass_a != null && pass_n != null) {
    document.getElementById("formulariocampass").submit();
  }else{
      alert("Datos invalidos, vuelva a intentar");
  }
}

function nuevadireccion(){
  var ciudad = document.getElementsByName("ciudad")[0].value;
  var colonia = document.getElementsByName("colonia")[0].value;
  var cp = document.getElementsByName("cp")[0].value;
  var calle = document.getElementsByName("calle")[0].value;
  var int = document.getElementsByName("int")[0].value;
  var ext = document.getElementsByName("ext")[0].value;
  if (/^[A-Z]+$/i.test(ciudad) && /^[A-Z]+$/i.test(colonia) && /^[A-Z]+$/i.test(calle) &&
  /^[A-z0-9]+$/.test(ext) && /^[0-9]+$/.test(int) /^[0-9]+$/.test(cp) && cp.length == 5) {
    document.getElementById("formularionewdir").submit();
  }else{
      alert("Datos invalidos, vuelva a intentar");
  }
}
