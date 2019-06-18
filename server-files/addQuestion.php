<?php
/*
    Admin side API to add a question to the database
    Request Parameters: Question, option1, option2, option3, option4,
                        answer, category of the question
    Response: Success of the request
*/
include('connect.php');

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
