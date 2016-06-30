<?php

require_once '../dao/UPAODao.php';

// Parámetros
$nombre = $_REQUEST["nombre"];
$ciudad=$_REQUEST["ciudad"];
$direccion=$_REQUEST["direccion"];

// Proceso
$dao = new UPAODao();
$rec = $dao->registrarSucursal($nombre,$ciudad,$direccion);

if ($rec) {
    $rec["estado"] = 1; // Existe
} else {
    $rec["estado"] = 0; // No existe
}
$data = json_encode($rec);
// Retorno
echo $data;
?>