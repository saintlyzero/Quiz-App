<?php
/*
    API to get score of all topics of a user from the database
    Request Parameters: username
    Response: Question, JSON - all three scores of the user
*/

include('connect.php');


    $username=$_POST['username'];

    $sql = "SELECT * FROM user_performance where user_name = '$username'";
    $result = mysqli_query($conn,$sql);
   // $response = array();
    if(mysqli_num_rows($result)!=0)
    {
        while($row = mysqli_fetch_array($result))
        {
            $temp = array();
            $temp['logical_score']=$row['logical_score'];
            $temp['quantitative_score']=$row['quantitative_score'];
            $temp['aptitude_score']=$row['aptitude_score'];
            $temp['status']=1;
            //array_push($temp);
  
        }
        echo json_encode($temp);
    }
    else
    {
        echo json_encode(array('status' => 0,'message' => 'No user data available.'));
    }      	
?>
