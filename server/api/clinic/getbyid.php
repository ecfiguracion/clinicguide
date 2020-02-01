<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
include_once '../../config/database.php';
include_once '../model/clinic.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();

// initialize object
$clinic = new Clinic($db);

// Get Id 
$clinic->id = isset($_GET['id']) ? $_GET['id'] : die();

// query clinics
$stmt = $clinic->getById();
 
// clinic array
$clinic_arr=array(
    "id" => $clinic->id,
    "name" => $clinic->name,
    "address" => $clinic->address,
    "maplatitude" => $clinic->maplatitude,
    "maplongitude" => $clinic->maplongitude,
    "officehours" => $clinic->officehours,
    "status" => $clinic->status,
    "image" => $clinic->image
);

// set response code - 200 OK
http_response_code(200);

// show products data in json format
echo json_encode($clinic_arr);