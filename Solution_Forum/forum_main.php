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
  <title>Solution Forum</title>
  <link rel="stylesheet" href="forum_main.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


  <link rel="stylesheet" href="../side_bar.css">
  <link rel="stylesheet" href="../corner.css">

  <!----===== Iconscout CSS ===== -->
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      // Load states on page load
      $.ajax({
        url: '../get_states.php',
        type: 'POST',
        success: function(data) {
          $('#state').html(data);
        }
      });

      // Load districts on state change
      $('#state').on('change', function() {
        var stateId = $(this).val();
        if (stateId) {
          $.ajax({
            url: '../get_districts.php',
            type: 'POST',
            data: {
              state_id: stateId
            },
            success: function(data) {
              $('#district').html(data);
              $('#city').html('<option value="">Select City</option>');
            }
          });
        } else {
          $('#district').html('<option value="">Select District</option>');
          $('#city').html('<option value="">Select City</option>');
        }
      });

      // Load cities on district change
      $('#district').on('change', function() {
        var districtId = $(this).val();
        if (districtId) {
          $.ajax({
            url: '../get_cities.php',
            type: 'POST',
            data: {
              district_id: districtId
            },
            success: function(data) {
              $('#city').html(data);
            }
          });
        } else {
          $('#city').html('<option value="">Select City</option>');
        }
      });
    });
  </script>


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


  <?php
  if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST["submit"])) {
    $state = $_POST["state"];
    $district = $_POST["district"];
    $city = $_POST["city"];
  }
  ?>

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

      <h1 class="list_title">Solution Forum</h1>

      <div class="scontainer">
        <form action="forum_main.php" method="post" enctype="multipart/form-data">
          <div class="form_content">
            <div class="input_box">

              <select class="state" name="state" id="state">
                <option value="">Select State</option>
              </select>
            </div>
            <div class="input_box">

              <select class="district" name="district" id="district">
                <option value="">Select District</option>
              </select>
            </div>
            <div class="input_box">

              <select class="city" name="city" id="city">
                <option value="">Select Area</option>
              </select>
            </div>
            <!-- search button -->
            <div class="button">
              <input type="submit" value="Search" name="submit" />
            </div>
          </div>
        </form>
      </div>

      <div class="table-responsive table_container">
        <table class="table table-bordered table-hover table-fixed">
          <thead>
            <tr>
              <th scope='col'>SL No.</th>
              <th class="w-25" scope="col">Title</th>
              <th scope="col">Category</th>
              <th class="w-auto" scope="col">Sub-Category</th>
              <th scope="col">Date</th>
              <th class="w-25" scope="col">Address</th>
            </tr>
          </thead>
          <tbody>

            <?php
            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST["submit"])) {
              $state = $_POST["state"];
              $district = $_POST["district"];
              $city = $_POST["city"];

              $all_prb_sql = "SELECT * FROM complaint_list WHERE is_valid = 1  AND prb_area = '$city' AND prb_state = '$state' AND prb_district = '$district'";
              $prb_result = mysqli_query($conn, $all_prb_sql);
              if (mysqli_num_rows($prb_result) > 0) {
                $serial = 1;
                while ($prb_row = mysqli_fetch_assoc($prb_result)) {


                  $prb_id = $prb_row['prb_id'];
                  $prb_title = $prb_row['prb_title'];
                  $prb_category = $prb_row['category'];
                  $prb_sub_category = $prb_row['sub_category'];
                  $prb_address = $prb_row['prb_address'];
                  $prb_date = $prb_row['approved_date'];

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

                  echo '<tr class="table-row-clickable" data-href="problem_details.php?id=' . $prb_id . '">';
                  echo "<th scope='row'>$serial</th>";
                  echo "<td>$prb_title</td>";
                  echo "<td>$categoryName</td>";
                  echo "<td>$sub_categoryName</td>";
                  echo "<td>$prb_date</td>";
                  echo "<td>$prb_address</td>";
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

<script>
  document.addEventListener("DOMContentLoaded", function() {
    const tableRows = document.querySelectorAll(".table-row-clickable");
    tableRows.forEach(function(row) {
      row.addEventListener("click", function() {
        const href = this.getAttribute("data-href");
        if (href) {
          window.location.href = href;
        }
      });
    });
  });
</script>


</html>