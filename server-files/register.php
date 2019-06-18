<?php
/*
    API to register a user
    Request Parameters: username, password, email
    Response: Question, JSON - status
*/
include('connect.php');

    $email=$_POST['email'];
    $username=$_POST['username'];
    $password=$_POST['password'];
   
    $sql = "SELECT user_email from user_detail where user_name = '$username'";

    // checks is username already exists
    if($conn->query($sql)->num_rows > 0)
    {   
        echo json_encode(array('status' => 0,'message' => 'User Already Exists.'));
    }
    else
    {
        //Adds new record in the database
        $sql = "INSERT INTO user_detail (user_name, user_email ,user_password)
        VALUES ('$username','$email','$password')";
        
        //Adds a  record to update initial score and question number of all the categories
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
