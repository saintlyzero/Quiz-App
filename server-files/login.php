<?php
include('connect.php');

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');

	$username=$_POST['username'];
	$password=$_POST['password'];
	$sql = "SELECT user_name FROM user_detail WHERE user_name = '$username' and user_password = '$password'";
	$result = $conn->query($sql);
        if($result)
        {
            if ($result->num_rows > 0) 
            {
                while($row = $result->fetch_assoc()) 
                {
                    echo json_encode(array('status' => 1,'username' => $row["user_name"]));
                }
            }
            else 
            {
                echo json_encode(array('status' => 0));
            } 
        }
?>
