<?php

include('connect.php');

    $username=$_POST['username'];

    $sql = "SELECT * FROM user_performance where user_name = '$username'";
    $result = mysqli_query($conn,$sql);
    $response = array();
    if(mysqli_num_rows($result)!=0)
    {
        while($row = mysqli_fetch_array($result))
        {
            $temp = array();
            $temp['logical_score']=$row['logical_score'];
            $temp['quantitative_score']=$row['quantitative_score'];
            $temp['aptitude_score']=$row['aptitude_score'];

            array_push($response,$temp);
  
        }
        echo json_encode($response);
    }
    else
    {
        echo "No data";
    }

    

    
       	
?>
