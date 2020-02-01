<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With");
 
// include database and object files
include_once '../../config/database.php';
include_once '../model/clinic.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$clinic = new Clinic($db);
 
// get raw posted data
$data = json_decode(file_get_contents("php://input"));

$clinic->id = $data->id;
$clinic->name = $data->name;
$clinic->address = $data->address;
$clinic->maplatitude = $data->maplatitude;
$clinic->maplongitude = $data->maplongitude;
$clinic->officehours = $data->officehours;
$clinic->status = $data->status;
$clinic->image = $data->image;

// create clinic
if($clinic->update()) {
    echo json_encode(
        array('message' =>  'record updated')
    );
} else {
    echo json_encode(
        array('message' => 'record not updated')
    );
}