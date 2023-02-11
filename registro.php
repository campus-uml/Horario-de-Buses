<?php 

include_once('db.php');

$nombres=$_POST['nombres'];
$apellidos=$_POST['apellidos'];
$correo=$_POST['correo'];
$contrasena=$_POST['contraseña'];



//Conexion al servidor

echo "Los datos son los siguientes: <br>";

echo "$nombres, $apellidos, $correo y $contrasena";

$conectar=conn();//ejecuta las conexiones a la b.d 
$sql="INSERT INTO registro (nombres, apellidos, correo, contraseña)
VALUES ('$nombres' ,'$apellidos' ,'$correo' , '$contrasena')";
$resul= mysqli_query($conectar, $sql)or trigger_error("Query Failed! SQL-Error: ".mysqli_error($conectar),
E_USER_ERROR);
echo "$sql";

?>
