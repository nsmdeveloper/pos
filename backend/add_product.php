<?php

require '../backend/config/db.php';


//$codigo = $_POST["codigo"];

//$query = "SELECT * FROM inventario WHERE codigo = $codigo";

$categoria = $_POST["categoria"];


$query = "SELECT * FROM inventario WHERE categoria = '$categoria' ";
$result = mysql_query($query);

$out = "";

while($datos = mysql_fetch_array($result)){

	
	$nombre = $datos["nombre"];
	$codigo = $datos["codigo"];


	$out .= "<a class='btn btn-info' style='width: 150px; height:40px;margin: 5px; padding-top: 20px;' id='$codigo' onclick='addProduct(this.id);'>" . $nombre . "</a>";

}

echo $out;