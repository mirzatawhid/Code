<?php

    // Update the time Cycle
    $sql = "SELECT * FROM complaint_list WHERE is_valid = 1 AND is_solved = 0 AND next_show_date<= NOW()";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_assoc($result)){
        $prb_id = $row['prb_id'];
        $next_show_date = $row['next_show_date'];
        $update_query = "UPDATE complaint_list SET next_show_date = date_add(next_show_date,interval 30 day) WHERE user_id = '$prb_id'";
        mysqli_query($conn,$update_query);
      }
    }

    // delete the complaint if not verified
    $del_sql = "SELECT * FROM complaint_list WHERE is_valid = 0 AND is_solved = 0 AND submit_date < date_sub(NOW(),interval 30 day)";
    $del_result = mysqli_query($conn, $del_sql);
    if(mysqli_num_rows($del_result) > 0){
      while($del_row = mysqli_fetch_assoc($del_result)){
        $prb_id = $del_row['prb_id'];
        $del_query = "DELETE FROM `complaint_list` WHERE prb_id = '$prb_id'";
        mysqli_query($conn,$del_query);
      }
    }

?>