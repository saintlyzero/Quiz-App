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
        
        $sql2 = "INSERT INTO user_performance(user_name, logical_qno,logical_score, 
        quantitative_qno, quantitative_score, aptitude_qno, aptitude_score)
        VALUES ('$username',1,0,1,0,1,0)";

        if ($conn->query($sql) === TRUE && $conn->query($sql2) === TRUE) 
        {
            echo "Registerd Successfully!";
        } 
        else 
        {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }    
    }
    	
?>
