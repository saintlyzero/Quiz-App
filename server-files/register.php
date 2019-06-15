<?php

include('connect.php');

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');


    $email=$_POST['email'];
    $username=$_POST['username'];
    $password=$_POST['password'];
   
    $sql = "SELECT user_email from user_detail where user_name = '$username'";

    if($conn->query($sql)->num_rows > 0)
    {   
        echo json_encode(array('status' => 0,'message' => 'User Already Exists.'));
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
            echo json_encode(array('status' => 1));
        } 
        else 
        {
            echo json_encode(array('status' => 0,'message' =>'Error is DB '.$sql));
        }    
    }
    	
?>
