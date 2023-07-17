<?php
    $sql = "SELECT * FROM complaint_list WHERE next_show_date<= NOW()";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0){
      while($row = mysqli_fetch_assoc($result)){
        $prb_id = $row['prb_id'];
        $next_show_date = $row['next_show_date'];
        $update_query = "UPDATE complaint_list SET next_show_date = date_add(next_show_date,interval 30 day) WHERE id = '$prb_id'";
        mysqli_query($conn,$update_query);
      }
    }
?>