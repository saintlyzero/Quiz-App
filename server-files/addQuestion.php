<?php

include('connect.php');

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');


    $question=$_POST['question'];
    $op1=$_POST['opt1'];
    $op2=$_POST['opt2'];
    $op3=$_POST['opt3'];
    $op4=$_POST['opt4'];
    $ans=$_POST['answer'];
    $category=$_POST['category'];

    $sql = "INSERT INTO ".$category."(question, opt1 ,opt2, opt3, opt4, answer)
    VALUES ('$question','$op1','$op2','$op3','$op4','$ans')";

    if ($conn->query($sql) === TRUE) 
    {
        echo "Added new Question";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }    
       	
?>
