<?php
    $servidor='localhost';
    $basedatos='proyecto_torrealedua';
    $usuario='root';
    $contraseña='';
    $conexion= null;

    try{
        $conexion = new PDO('mysql:host=' .$servidor. ';basededatos=' .$basedatos, $usuario, $contraseña);
    }catch(PDOException $e){
        echo "Error de conexion";
        exit;
    }
    return $conexion;
?>