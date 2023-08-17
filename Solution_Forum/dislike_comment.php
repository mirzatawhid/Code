<?php
if (isset($_GET['id'])) {
    $comment_id = $_GET['id'];
    $post_id = $_GET['post_id'];

    
    require_once "../connection.php";


    $update_likes_query = "UPDATE forum_comment SET dislikes = dislikes + 1 WHERE comment_id = $comment_id";
    mysqli_query($conn, $update_likes_query);

    mysqli_close($conn);

    header("Location: problem_details.php?id=".$post_id);
    exit;
}
?>