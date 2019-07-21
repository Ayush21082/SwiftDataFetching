<?php
    
    include_once('./connection.php');
    $output = array();
    
    $sql = "select * from MyTable";
    $result=$myconn->query($sql);
    if($result->num_rows > 0){
        $row = $result->fetch_assoc();
        $output['username'] = $row['username'];
    }
    echo json_encode($output);

    ?>
