<?php

include('connect.php');

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
        echo "Updated Record Successfully!";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }    
    	
?>
