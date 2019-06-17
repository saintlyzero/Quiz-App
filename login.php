<?php
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
                    echo $row["user_name"];
                }
            }
            else 
            {
                echo "-1"; // Indicates invalid details
            } 
        }
?>
