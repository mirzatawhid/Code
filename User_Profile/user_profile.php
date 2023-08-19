<?php

require_once '../connection.php';
session_start();
$user_id = $_SESSION["user"];

if (!isset($user_id)) {
   header("Location: ../login.php");
};

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>User Profile</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="user.css">
   <link rel="stylesheet" href="../side_bar.css">
   <link rel="stylesheet" href="../corner.css">
   <!----===== Iconscout CSS ===== -->
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

</head>

<body>


   <!-- Side bar -->
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

   <section class="space">
      <div class="top">
         <img src="<?php echo $user_dp; ?>" alt="" onclick="toggleMenu()">

         <div class="sub-menu-wrap" id="subMenu">
            <div class="sub-menu">
               <div class="user-info">
                  <img src="<?php echo $user_dp; ?>">
                  <h2><?php echo $fetch['full_name']; ?></h2>
               </div>
               <hr>

               <a href="update_profile.php" class="sub-menu-link">
                  <i class="uil uil-user"></i>
                  <h5>Edit Profile</h5>
                  <span>></span>
               </a>

               <a href="../logout.php" class="sub-menu-link">
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
         <h1 class="profile_title">User Profile</h1>
         <div class="profile">
            <?php

            if ($fetch['user_medianame'] == '') {
               echo '<img src="../images/user.png">';
            } else {
               echo '<img src="../User_DP/' . $fetch['user_medianame'] . '">';
            }
            ?>
            <h2><?php echo $fetch['full_name']; ?></h2>
         </div>
         <div class="details">
            <p class="row"><span class="attr">User Name: </span><?php echo $fetch['user_name']; ?></p>
            <p class="row"><span class="attr">Email: </span><?php echo $fetch['email']; ?></p>
            <p class="row"><span class="attr">Mobile No: </span><?php echo $fetch['mobile_no']; ?></p>
            <p class="row"><span class="attr">Address: </span><?php echo $fetch['address']; ?></p>
         </div>
         <div class="change">
            <a class="button" href="update_profile.php">Update Profile</a>
            <a class="button" href="update_password.php">Change Password</a>
         </div>
      </div>
   </section>



</body>

</html>