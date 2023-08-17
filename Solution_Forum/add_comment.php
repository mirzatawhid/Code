<?php

session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
}
$user_id = $_SESSION["user"];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['post_id']) && isset($_POST['comment'])) {
        $post_id = $_POST['post_id'];
        $comment = $_POST['comment'];

        require_once "../connection.php";

        $insert_comment_query = "INSERT INTO forum_comment (prb_id, user_id, comment, likes, dislikes) VALUES ($post_id, $user_id , '$comment', 0, 0)";
        
        if (mysqli_query($conn, $insert_comment_query)) {
            header("Location: problem_details.php?id=".$post_id);
            exit;
        } else {
            echo "Error: " . mysqli_error($conn);
        }

        mysqli_close($conn);
    }
}
?>
