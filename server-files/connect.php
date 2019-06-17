<?php 
/*
    Common connection API to connect to the database.
    Called by every other API
    Request Parameters: none
    Response: Success of the request
*/

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "quiz_app";
$conn = new mysqli($servername, $username, $password, $dbname);
if (mysqli_connect_errno())
{
    echo "Failed to connect to database: " . mysqli_connect_error();
    
}
/*else
{
	echo "Connection Established";
}*/
?> 
