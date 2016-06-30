<?php

require_once '../dao/UPAODao.php';

// Parámetros
$paterno = $_REQUEST["paterno"];
$materno= $_REQUEST["materno"];
$nombres = $_REQUEST["nombres"];
$dni=$_REQUEST["dni"];
$ciudad=$_REQUEST["ciudad"];
$direccion=$_REQUEST["direccion"];

// Proceso
$dao = new UPAODao();
$rec = $dao->registrarCliente($paterno,$materno,$nombres,$dni,$ciudad,$direccion);

if ($rec) {
    $rec["estado"] = 1; // Existe
} else {
    $rec["estado"] = 0; // No existe
}
$data = json_encode($rec);
// Retorno
echo $data;
?>