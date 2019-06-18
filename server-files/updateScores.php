<?php
/*
    API to update scores after a user attempts a quiz
    Request Parameters: username, score, last questionNumber attempted by user, category of the test
    Response: Question, JSON - status
*/
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
        json_encode(array('status' => 1,'message' => "Updated Record Successfully!"));
    } 
    else 
    {
        echo json_encode(array('status' => 0,'message' => 'Error occured.'.$sql));
    }    
    	
?>
