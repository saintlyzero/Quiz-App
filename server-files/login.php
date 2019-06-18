<?php

/*
    API to validate a user
    Request Parameters: username, password
    Response: Question, JSON - status
*/

include('connect.php');

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
