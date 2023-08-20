<?php
if (isset($_POST['vote']) && isset($_POST['user_id'])) {
    $vote = $_POST['vote'];
    $prb_id = $_POST['prb_id'];
    $user_id = $_POST['user_id'];

    require "../connection.php";


    $sql = "INSERT INTO verify_vote (prb_id,user_id,vote) VALUES ('$prb_id','$user_id','$vote')";
    mysqli_query($conn, $sql);

    //Check solved or not
    $prb_sql = "SELECT * FROM complaint_list WHERE prb_id='$prb_id'";
    $prb_result = mysqli_query($conn, $prb_sql);
    if(mysqli_num_rows($prb_result)>0){
        $prb_row = mysqli_fetch_assoc($prb_result);
        $submit_date = $prb_row['submit_date'];
    }
    $check_sql = "SELECT * FROM verify_vote WHERE prb_id=$prb_id AND vote_date BETWEEN '$submit_date' AND date_add('$submit_date',interval 30 day)";
    $check_result = mysqli_query($conn, $check_sql);
    $total_vote = mysqli_num_rows($check_result);

    $check_vote_sql = "SELECT * FROM solve_vote WHERE prb_id=$prb_id AND vote='1' AND vote_date BETWEEN '$submit_date' AND date_add('$submit_date',interval 30 day)";
    $check_vote_result = mysqli_query($conn, $check_vote_sql);
    $total_solve_vote = mysqli_num_rows($check_vote_result);

    $percentage = ($total_solve_vote/$total_vote)*100;
    if(($percentage>=70) && ($total_vote>=5)){
        $update_sql = "UPDATE complaint_list SET is_valid = 1 AND approved_date = NOW() AND next_show_date = date_add(NOW(),interval 30 day) WHERE prb_id='$prb_id'";
        mysqli_query($conn, $update_sql);
    }
}
header("Location: pending_verified_list.php");
exit;
?>