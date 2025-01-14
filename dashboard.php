<?php
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: login.php");
}
$user_id = $_SESSION["user"];
require "connection.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="x-icon" href="images/icon.png">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="dashboard.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Dashboard</title>
</head>

<body>
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="images/footer_logo.png" alt="logo">
            </div>
        </div>
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                        <i class="uil uil-estate"></i>
                        <span class="link-name">Dahsboard</span>
                    </a></li>
                <li><a href="User_profile/user_profile.php">
                        <i class="uil uil-user"></i>
                        <span class="link-name">User Profile</span>
                    </a></li>
                    <li><a href="pending_verification_list/pending_verified_list.php">
                        <i class="uil uil-file-check"></i>
                        <span class="link-name">Pending Verification List</span>
                    </a></li>
                    <li><a href="Pending_Solved_List/pending_solved_list.php">
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
                <li><a href="logout.php">
                        <i class="uil uil-signout"></i>
                        <span class="link-name">Logout</span>
                    </a></li>
                </li>
            </ul>
        </div>
    </nav>

    <?php
    $select = mysqli_query($conn, "SELECT * FROM `user_details` WHERE user_id = '$user_id'") or die('query failed');
            if (mysqli_num_rows($select) > 0) {
               $fetch = mysqli_fetch_assoc($select);
            }
            if ($fetch['user_medianame'] == '') {
                $user_dp = "User_DP/user.png";
             } else {
                $user_dp = "User_DP/".$fetch['user_medianame'];
             }
    
    ?>

    <section class="dashboard">
        <div class="top">
            <img src="<?php echo $user_dp; ?>" alt="" onclick="toggleMenu()">

            <div class="sub-menu-wrap" id="subMenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img src="<?php echo $user_dp; ?>">
                        <h2><?php echo $fetch['full_name']; ?></h2>
                    </div>
                    <hr>

                    <a href="User_Profile/update_profile.php" class="sub-menu-link">
                    <i class="uil uil-user"></i>
                    <h5>Edit Profile</h5>
                    <span>></span>
                    </a>

                    <a href="logout.php" class="sub-menu-link">
                    <i class="uil uil-signout"></i>
                    <h5>Log Out</h5>
                    <span>></span>
                    </a>
                </div>
            </div>

        </div>


    <script>
        let subMenu =document.getElementById("subMenu");
        function toggleMenu(){
            subMenu.classList.toggle("open-menu");
        }
    </script>


        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-paperclip"></i>
                        <span class="text">Total Submission</span>
                        <?php
                        $sql = "SELECT * FROM complaint_list WHERE user_id = '$user_id'";
                        $result = mysqli_query($conn, $sql);
                        if ($result) {
                            $row = mysqli_num_rows($result);
                            echo "<span class='number'>$row</span>";
                        }
                        mysqli_free_result($result);
                        ?>

                    </div>
                    <div class="box box2">
                        <i class="uil uil-check-circle"></i>
                        <span class="text">Total Verified</span>
                        <?php
                        $sql = "SELECT * FROM verified_list WHERE user_id = '$user_id'";
                        $result = mysqli_query($conn, $sql);
                        if ($result) {
                            $row = mysqli_num_rows($result);
                            echo "<span class='number'>$row</span>";
                        }
                        mysqli_free_result($result);
                        ?>

                    </div>
                    <div class="box box3">
                        <i class="uil uil-file-search-alt"></i>
                        <span class="text">Total Reviewed</span>
                        <?php
                        $sql = "SELECT * FROM reviewed_list WHERE user_id = '$user_id'";
                        $result = mysqli_query($conn, $sql);
                        if ($result) {
                            $row = mysqli_num_rows($result);
                            echo "<span class='number'>$row</span>";
                        }
                        mysqli_free_result($result);
                        ?>

                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-lottiefiles-alt"></i>
                    <span class="text">Features</span>
                </div>
                <div class="boxes">
                    <a href="complaint_submission.php">
                        <i class="uil uil-file-plus"></i>
                        <span class="text">Complaint<br>Submission</span>
                    </a>
                    <a href="Complaint_Mapping/complaint_mapping.php">
                        <i class="uil uil-map-marker"></i>
                        <span class="text">Complaint<br>Mapping</span>
                    </a>
                    <a href="Solution_Forum/forum_main.php">
                        <i class="uil uil-users-alt"></i>
                        <span class="text">Solution<br>Forum</span>
                    </a>
                </div>
            </div>
    </section>

    <!--<script src="script.js"></script>-->
</body>

</html>