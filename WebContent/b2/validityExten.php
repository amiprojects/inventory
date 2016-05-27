<?php
header("Access-Control-Allow-Origin: *");
header('content-type: application/json; charset=utf-8');
echo json_encode(array("validityMonth"=>36,"key"=>"f"));//key must be unique for uniqueness maintain a serian of key.
?>