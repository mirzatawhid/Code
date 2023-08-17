<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
}
$user_id = $_SESSION["user"];
require "../connection.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="problem_details.css">

    <link rel="stylesheet" href="../side_bar.css">
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>Problem Details</title>
</head>

<body>

    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="../images/footer_logo.png" alt="logo">
            </div>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="../dashboard.php">
                        <i class="uil uil-estate"></i>
                        <span class="link-name">Dahsboard</span>
                    </a></li>
                <li><a href="../User_Profile/user_profile.php">
                        <i class="uil uil-user"></i>
                        <span class="link-name">User Profile</span>
                    </a></li>
                <li><a href="../pending_verification_list/pending_verified_list.php">
                        <i class="uil uil-file-check"></i>
                        <span class="link-name">Pending Verification List</span>
                    </a></li>
                <li><a href="../Pending_Solved_List/pending_solved_list.php">
                        <i class="uil uil-file-check-alt"></i>
                        <span class="link-name">Pending Solved List</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-paperclip"></i>
                        <span class="link-name">Submission List</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-check-circle"></i>
                        <span class="link-name">Verification List</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-file-search-alt"></i>
                        <span class="link-name">Reviewed List</span>
                    </a></li>
                <li><a href="#">
                        <i class="uil uil-share"></i>
                        <span class="link-name">Share</span>
                    </a></li>
            </ul>

            <ul class="logout-mode">
                <li><a href="../logout.php">
                        <i class="uil uil-signout"></i>
                        <span class="link-name">Logout</span>
                    </a></li>
                </li>
            </ul>
        </div>
    </nav>

    <section class="space">
        <div class="top">
            <img src="../images/user.png" alt="">
        </div>
        <div class="content">
            <h1 class="list_title">Solution Forum</h1>
            <div class="container">
                <div class="home_button">
                    <a href="forum_main.php"><i class="fa fa-home"></i> Return to the Forum</a>
                </div>
                <div class="post-card">
                    <div class="user-info">
                        <!-- ... (user info) ... -->


                        <?php

                        if (isset($_GET['id'])) {
                            $post_id = $_GET['id'];
                        }


                        $post_query = "SELECT * FROM complaint_list WHERE prb_id = $post_id";
                        $post_result = mysqli_query($conn, $post_query);
                        if (mysqli_num_rows($post_result) > 0) {
                            while ($post_row = mysqli_fetch_assoc($post_result)) {
                                $post_user_id = $post_row['user_id'];
                                $post_title = $post_row['prb_title'];
                                $post_desc = $post_row['prb_desc'];
                                $post_date = $post_row['approved_date'];
                                $post_pic = $post_row['prb_mediapath'];
                            }
                        }

                        if ($post_user_id == NULL) {
                            $user_pic = "../User_DP/user.png";
                            $post_fullname = "Anonymous";
                        } else {

                            $post_user_query = "SELECT * FROM user_details WHERE user_id = $user_id";
                            $post_user_result = mysqli_query($conn, $post_user_query);
                            if (mysqli_num_rows($post_user_result) > 0) {
                                while ($post_user_row = mysqli_fetch_assoc($post_user_result)) {
                                    $post_fullname = $post_user_row['full_name'];
                                    $user_pic = $post_user_row['user_medianame'];
                                    if ($user_pic == NULL) {
                                        $user_pic = "../User_DP/user.png";
                                    } else {
                                        $user_pic = "../User_DP/" . $user_pic;
                                    }
                                }
                            }
                        }

                        ?>


                        <img src="<?php echo $user_pic; ?>" alt="User Profile Picture" class="profile-picture">
                        <div class="user-details">
                            <h2><?php echo $post_fullname; ?></h2>
                            <p>Posted on: <?php echo $post_date; ?></p>
                        </div>
                    </div>
                    <div class="post-content">
                        <!-- ... (post content) ... -->
                        <p><?php echo $post_desc; ?></p>
                        <img src="../<?php echo $post_pic; ?>" alt="Post Image">
                    </div>
                    <div class="post-comments">
                        <h3>Comments</h3>
                        <?php

                        // Retrieve comments for the current post
                        $comments_query = "SELECT * FROM forum_comment WHERE prb_id = $post_id";
                        $comments_result = mysqli_query($conn, $comments_query);

                        if (mysqli_num_rows($comments_result) > 0) {
                            while ($comment_row = mysqli_fetch_assoc($comments_result)) {
                                $comment_id = $comment_row['comment_id'];
                                $user_id = $comment_row['user_id'];
                                $comment_date = $comment_row['comment_date'];
                                $comment_content = $comment_row['comment'];
                                $likes = $comment_row['likes'];
                                $dislikes = $comment_row['dislikes'];

                                $user_query = "SELECT * FROM user_details WHERE user_id = $user_id";
                                $user_result = mysqli_query($conn, $user_query);
                                if (mysqli_num_rows($user_result) > 0) {
                                    while ($user_row = mysqli_fetch_assoc($user_result)) {
                                        $user_fullname = $user_row['full_name'];
                                    }
                                }

                                echo "<div class='comment'>";
                                echo "<h5>$user_fullname</h5>";
                                echo "<p>Commented at:</p>";
                                echo "<p>$comment_date</p>";
                                echo "<p>$comment_content</p>";
                                echo "<div class='comment-actions'>";
                                echo "<a href='like_comment.php?id=$comment_id&post_id=$post_id'>Like ($likes)</a>";
                                echo "<a href='dislike_comment.php?id=$comment_id&post_id=$post_id'>Dislike ($dislikes)</a>";
                                echo "</div>";
                                echo "</div>";
                            }
                        } else {
                            echo "<p>No comments yet.</p>";
                        }

                        mysqli_close($conn);
                        ?>
                        <h3>Add a Comment</h3>
                        <form method="post" action="add_comment.php">
                            <input type="hidden" name="post_id" value="<?php echo $post_id; ?>">
                            <textarea class="comment_box" name="comment" placeholder="Write a comment"></textarea>
                            <input class="submit_button" type="submit" value="Submit" name="submit" />
                        </form>
                    </div>

                </div>
            </div>
        </div>



    </section>

</body>

</html>