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

            </div>
        </div>



    </section>

</body>

</html>