<?php

/*
    API to get total scores of all the users from the database
    Request Parameters: none
    Response: username, total score
*/

include('connect.php');

header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true"); 
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS'); 
header('Access-Control-Max-Age: 1000'); 
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');


    $subset = 5;
    $sql = "select 
            user_name ,(logical_score + quantitative_score + aptitude_score) 
            AS score 
            FROM user_performance  
            ORDER BY score DESC
            LIMIT ".$subset;

    $result = mysqli_query($conn,$sql);
    
    $response = array();

    if(mysqli_num_rows($result)!=0)
    {

        while($row = mysqli_fetch_array($result))
            {
                $temp = array(); 
                $temp['username']=$row['user_name'];
                $temp['score']=$row['score'];
                               
                array_push($response,$temp);
            }
            echo json_encode($response);
    }
    else
    {
        json_encode(array('status' => 0,'message' => 'No data available'));
    }
?>
