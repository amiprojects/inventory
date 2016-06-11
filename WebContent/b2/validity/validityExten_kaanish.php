<?php
header("Access-Control-Allow-Origin: *");
header('content-type: application/json; charset=utf-8');
echo json_encode(array("validityMonth"=>-1,"key"=>"b"));//key must be unique for uniqueness maintain a serial of key.
?>