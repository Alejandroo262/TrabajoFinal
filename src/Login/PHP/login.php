<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de usuarios</title>
</head>
<body>
    <form action="login.php" method="POST">
        <h3>LOGIN</h3>
        <label for="usuario">Usuario:</label>
            <input type="text" name="usuario"><br><br>
        <label for="contraseña">Contraseña:</label>
            <input type="text" name="contraseña"><br><br>
        <input type="submit" name="enviar" value="Acceder">
</body>

<?php
    if($_POST){
        session_start();
        require('conexion.php');
        $usuario = $_POST('nombre');
        $contraseña = $_POST('contraseña');
        $conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $query = $conexion -> prepare("SELECT * FROM usuarios WHERE nombre= $usuario AND password= $contraseña");
        $query->execute();
        $usuario = $query->fetch(PDO::FETCH_ASSOC);
        if($usuario){
            $_SESSION['usuario'] = $usuario["nombre"];
            header("location:Inicio.php");
        }else{
            echo "El usuario o la contraseña son incorrectos. Inténtelo de nuevo";
        }
    }

?>
</html>