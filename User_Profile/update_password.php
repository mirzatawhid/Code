<?php

include '../connection.php';
session_start();
$user_id = $_SESSION['user'];

if (!isset($user_id)) {
    header("Location: ../login.php");
};

if (isset($_POST['update_password'])) {

    $old_pass = $_POST['old_pass'];
    $update_pass = mysqli_real_escape_string($conn, ($_POST['update_pass']));
    $new_pass = mysqli_real_escape_string($conn, ($_POST['new_pass']));
    $confirm_pass = mysqli_real_escape_string($conn, ($_POST['confirm_pass']));

    if (!empty($update_pass) || !empty($new_pass) || !empty($confirm_pass)) {
        if ($update_pass != $old_pass) {
            $message[] = 'Old Password not Matched!';
        } elseif ($new_pass != $confirm_pass) {
            $message[] = 'Confirm Password not Matched!';
        } else {
            mysqli_query($conn, "UPDATE `user_details` SET password = '$confirm_pass' WHERE user_id = '$user_id'") or die('query failed');
            $message[] = 'Password Updated Successfully!';
        }
    }
}

?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../side_bar.css">
    <link rel="stylesheet" href="user.css">
    <link rel="stylesheet" href="../corner.css">
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <title>Change Password</title>
</head>

<body>
    <!-- side nav bar -->
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
                <li><a href="user_profile.php">
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

    <?php
    $select = mysqli_query($conn, "SELECT * FROM `user_details` WHERE user_id = '$user_id'") or die('query failed');
    if (mysqli_num_rows($select) > 0) {
        $fetch = mysqli_fetch_assoc($select);
    }
    if ($fetch['user_medianame'] == '') {
        $user_dp = "../User_DP/user.png";
    } else {
        $user_dp = "../User_DP/" . $fetch['user_medianame'];
    }

    ?>


    <div class="space">
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
         let subMenu = document.getElementById("subMenu");

         function toggleMenu() {
            subMenu.classList.toggle("open-menu");
         }
      </script>

        <div class="container">
            <h1 class="profile_title">Change Password</h1>


            <form action="" method="post" enctype="multipart/form-data">
                <?php
                if (isset($message)) {
                    foreach ($message as $message) {
                        echo '<div class="message">' . $message . '</div>';
                    }
                }
                ?>
                <div class="flex">
                    <div class="inputBox">
                        <input type="hidden" name="old_pass" value="<?php echo $fetch['password']; ?>">
                        <span>Old Password :</span>
                        <input type="password" name="update_pass" placeholder="Enter previous password" class="box">
                        <span>New Password :</span>
                        <input type="password" name="new_pass" placeholder="Enter new password" class="box">
                        <span>Confirm Password :</span>
                        <input type="password" name="confirm_pass" placeholder="Confirm new password" class="box">
                        <input type="submit" value="Change Password" name="update_password" class="btn">
                    </div>
                </div>
                <a href="user_profile.php" class="delete-btn">Go Back</a>
            </form>

        </div>
    </div>
</body>

</html>