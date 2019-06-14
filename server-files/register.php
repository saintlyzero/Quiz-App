<?php

include('connect.php');

    $email=$_POST['email'];
    $username=$_POST['username'];
    $password=$_POST['password'];
   
    $sql = "SELECT user_email from user_detail where user_name = '$username'";

    if($conn->query($sql)->num_rows > 0)
    {   
        echo "User already Exists";
    }
    else
    {
        $sql = "INSERT INTO user_detail (user_name, user_email ,user_password)
        VALUES ('$username','$email','$password')";
        
        if ($conn->query($sql) === TRUE) 
        {
            echo "Registerd Successfully!";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
    }
    	
?>
