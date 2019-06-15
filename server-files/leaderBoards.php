<?php

include('connect.php');


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
        echo "No data";
    }
?>