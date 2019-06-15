<?php

include('connect.php');

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');


    $username=$_POST['username'];
    $category=$_POST['category'];
    $questionNo=$_POST['question_no'];
    $score=$_POST['score'];

    $sql = "UPDATE user_performance
            SET "
            .$category."_qno = '$questionNo', "
            .$category."_score= '$score'"
            ."WHERE user_name = '$username'";


    if ($conn->query($sql) === TRUE) 
    {
        json_encode(array('status' => 1,'message' => "Updated Record Successfully!"));
    } 
    else 
    {
        echo json_encode(array('status' => 0,'message' => 'Error occured.'.$sql));
    }    
    	
?>
