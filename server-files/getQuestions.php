<?php

/*
    API to get questions from the database
    Request Parameters: username, category of the question
    Response: Question, JSON - option1, option2, option3, option4,
                        answer, category of the question, questionID
*/

include('connect.php');


    $username=$_POST['username'];
    $category=$_POST['topic'];
    $subset  = 5;

    $sql = "SELECT * from ".$category." where qid > 
    (SELECT qno from up where user_name = '$username' and category = '$category') 
    limit ".$subset;

    $result = mysqli_query($conn,$sql);
    
    $response = array();

    if(mysqli_num_rows($result)!=0)
    {

        while($row = mysqli_fetch_array($result))
            {
                $temp = array(); 
                $temp['qid']=$row['qid'];
                $temp['question']=$row['question'];
                $temp['opt1']=$row['opt1'];
                $temp['opt2']=$row['opt2'];
                $temp['opt3']=$row['opt3'];
                $temp['opt4']=$row['opt4'];
                $temp['answer']=$row['answer'];
                
                array_push($response,$temp);
            }
            echo json_encode($response);
    }
    else
    {
        echo "No data";
    }
?>
