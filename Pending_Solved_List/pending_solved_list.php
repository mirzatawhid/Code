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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pending Solved List</title>
  
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

  <link rel="stylesheet" href="pending_solved_list.css">
  <link rel="stylesheet" href="../side_bar.css">
  <link rel="stylesheet" href="../corner.css">
  <!----===== Iconscout CSS ===== -->
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
</head>

<!-- JS code for submit vote and remove row -->
<script>
  function castVote(vote) {
    var tableRow = $(event.target).closest('tr');
    var id = tableRow.find('input[type="hidden"]').val();

    // Send the vote and id to the server using AJAX
    $.ajax({
      url: 'submit_vote.php',
      type: 'POST',
      data: {
        vote: vote,
        id: id
      },
      success: function(response) {
        console.log(response); // Log the response from the server
        tableRow.remove(); // Remove the table row from the DOM
      },
      error: function(xhr, status, error) {
        console.log(error); // Log any errors
      }
    });
  }
</script>

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
        <li><a href="../User_Profile/user_profile.php">
            <i class="uil uil-user"></i>
            <span class="link-name">User Profile</span>
          </a></li>
        <li><a href="../pending_verification_list/pending_verified_list.php">
            <i class="uil uil-file-check"></i>
            <span class="link-name">Pending Verification List</span>
          </a></li>
        <li><a href="#">
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

    <div class="list_content">
      <h1 class="list_title">Pending Solved List</h1>

      <div class="table-responsive table_container">
        <table class="table table-bordered table-hover table-fixed">
          <thead class="thead-dark">
            <tr>
              <th scope='col'>SL No.</th>
              <th scope="col">Title</th>
              <th scope="col">Category</th>
              <th scope="col">Sub-Category</th>
              <th scope="col">Address</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>

            <?php
            $user_result = mysqli_query($conn, "SELECT state,district,area FROM user_details WHERE user_id = '$user_id'");

            $user_row = mysqli_fetch_assoc($user_result);
            $user_area = $user_row['area'];
            $user_state = $user_row['state'];
            $user_district = $user_row['district'];
            $all_prb_sql = "SELECT * FROM complaint_list WHERE is_valid = 1 AND is_solved = 0 AND prb_area = '$user_area' AND prb_state = '$user_state' AND prb_district = '$user_district' AND next_show_date > NOW()";
            $prb_result = mysqli_query($conn, $all_prb_sql);
            if (mysqli_num_rows($prb_result) > 0) {
              $serial = 1;
              while ($prb_row = mysqli_fetch_assoc($prb_result)) {
                $prb_id = $prb_row['prb_id'];
                $next_sh_date = $prb_row['next_show_date'];
                $vote_check_sql = "SELECT * FROM solve_vote WHERE prb_id='$prb_id' AND user_id='$user_id' AND vote_date BETWEEN date_sub('$next_sh_date',interval 30 day) AND NOW()";
                $vote_result = mysqli_query($conn, $vote_check_sql);
                if (mysqli_num_rows($vote_result) <= 0) {

                  $prb_title = $prb_row['prb_title'];
                  $prb_category = $prb_row['category'];
                  $prb_sub_category = $prb_row['sub_category'];
                  $prb_address = $prb_row['prb_address'];
                  $prb_desc = $prb_row['prb_desc'];

                  //Get category name
                  $category_result = mysqli_query($conn, "SELECT `name` FROM `category` WHERE id='$prb_category'");
                  if (mysqli_num_rows($category_result) > 0) {
                    while ($category_row = mysqli_fetch_assoc($category_result)) {
                      $categoryName = $category_row['name'];
                    }
                  }

                  //Get Sub-category name
                  $sub_category_result = mysqli_query($conn, "SELECT `name` FROM `sub_category` WHERE id='$prb_sub_category' AND category_id='$prb_category'");
                  if (mysqli_num_rows($sub_category_result) > 0) {
                    while ($sub_category_row = mysqli_fetch_assoc($sub_category_result)) {
                      $sub_categoryName = $sub_category_row['name'];
                    }
                  }

                  //Show all prb here
                  echo "<tr>";
                  echo "<th scope='row'>$serial</th>";
                  echo "<td>$prb_title</td>";
                  echo "<td>$categoryName</td>";
                  echo "<td>$sub_categoryName</td>";
                  echo "<td>$prb_address</td>";
                  echo "<td>";
                  echo '<form method="post" action="solve_vote.php">
                  <input type="hidden" name="user_id" value= ' . $user_id;
                  echo '>
                  <input type="hidden" name="prb_id" value=' . $prb_id;
                  echo '>
                  <button type="submit" class="btn btn-success" name="vote" value="1"><i class="uil uil-check icon_action_btn"></i></button>
                  <button type="submit" class="btn btn-danger" name="vote" value="0"><i class="uil uil-times icon_action_btn"></i></button>
                  </form>';
                  echo "</td>";
                  echo "</tr>";

                  $serial++;
                }
              }
            }
            ?>

          </tbody>
        </table>





      </div>
    </div>

  </section>

</body>

</html>