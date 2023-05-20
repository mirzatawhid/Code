<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet"href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"/>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="style/swiper-bundle.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="style.css" />
    <title>Prokash</title>
  </head>
  <body>
    <!--Navigation Bar-->

    <header>
      <img
        class="logo"
        src="images/logo.png"
        alt="logo"
        width="141px"
        height="57px"
      />
      <nav class="nav_bar">
        <ul class="nav_links">
          <li class="home"><a href="#">Home</a></li>
          <li class="features"><a href="#feature">Features</a></li>
          <li class="about_us"><a href="#about_sec">About Us</a></li>
          <li class="faq"><a href="#faq_sec">FAQ</a></li>
          <li class="contact"><a href="#contact">Contact</a></li>
        </ul>
      </nav>
      <div class="btn">
        <a class="login" href="login.php"><button>Login</button></a>
        <a class="register" href="register.php"><button>Register</button></a>
      </div>
    </header>

    <main>
      <!--Banner-->

      <div class="banner" style="min-height: 960px">
        <div>
          <img class="banner_logo" src="images/banner_logo.png" alt="logo" />
          <p class="banner_txt">
            Collaboration and Co-Ordination<br />with Mass People
          </p>
        </div>
      </div>
      <!-- Features -->

      <div class="features_section" id="feature">
        <h1>Features</h1>
        <div class="features_container">
          <div class="box complaint">
            <img
              class="box_img"
              src="images/complaint.png"
              style="width: 60%; height: auto"
            />
            <p class="box_title">Complaints Submission</p>
            <p class="box_desc">
              User-friendly platform to Submit any social complaint easily in
              one place
            </p>
          </div>

          <div class="box mapping">
            <img
              class="box_img"
              src="images/mapping.png"
              style="width: 50%; height: auto"
            />
            <p class="box_title">Complaints Mapping</p>
            <p class="box_desc">
              Gives transparency of social problems and track the complaints
            </p>
          </div>

          <div class="box forum">
            <img
              class="box_img"
              src="images/forum.png"
              style="width: 60%; height: auto"
            />
            <p class="box_title">Discussion Forum</p>
            <p class="box_desc">
              Gives a room for discussion about solving the social problems
            </p>
          </div>
        </div>
      </div>
    </div>

      <!--About us-->
      <section class="about_sec" id="about_sec">
        <h1>About Us</h1>
        <div class="wrapper">
          <img src="images/about.png" alt="about logo">
          <div class="text_box">
            <h2>The PROKASH Platform</h2>
            <p>
              This is a social or community based problem solving platform.This
              Platform helps communities turn information into action with an
              intuitive and accessible crowdsourcing and mapping tool. By
              enabling collection, management and analysis of crowdsourced
              information, 'প্রকাশ' empowers everyone—individuals, community
              groups, organizations—to create meaningful change.
            </p>
          </div>
        </div>
      </section>


      <!-- Case Studies Section -->

      <div class="case_main">
  <h1>Case Studies</h1>
  <div class="description">
  <p>'There are so may example of how our platform 'প্রকাশ' <br>has been used to
     help the communities to solve their social problems.<br>Few of them are given below
     that show the greater impact this technology can have promptly'</p>
  </div>
</div>

    <div class="case_container">
    <div class="card">
          <div class="image">
            <img
              src="images/imagess/river.jpg"
              style="width: 80%; height: auto"
          />
          </div>
           <div class="title">
            <h1>Pollution in Buriganga </h1>
           </div>
           <div class="text">
            <p>
                February 5,2022<br>
                'Buriganga river is highly susceptible to extreme pollution.In this project in response of local community
                 who rely on the river water and are in great risk,we gathered public opinion and sought the problem with youths
                 ,school,college,universities's students and succesfully raised awarness.It was published on a famous news article also'
            </p>
            <button>Read more..</button>
          </div>
          </div>

          <div class="card">
            <div class="image">
              <img
                src="images/imagess/vehicles.jpg"
                style="width: 80%; height: auto"
              />
            </div>
            <div class="title">
              <h1>Damaged Vehicle Recycle Project</h1>
            </div>
            <div class="text">
              <p>
                July 15,2022<br>
                  'In the basis of a statistics of problems in Gulisthan area a great number of damaged vehicle use has been seen.
                  we have able to draw the attention of the authority to recycle those vehicle and also gathered public opinion 
                  on this problem'
                  
              </p>
              <button>Read more..</button>
            </div>
            </div>

            <div class="card">
                <div class="image">
                  <img
                    src="images/imagess/structure.jpg"
                    style="width: 70%; height: auto"
                  />
                </div>
                <div class="title">
                  <h1>Poor School infrastructure</h1>
                </div>
                <div class="text">
                  <p>
                    May 1,2020<br>
                    'From this platform's data we have seen that the infrastructure of some school and colleges in old Dhaka
                    are very poor and risky.we have successfully solve the problem by presenting them to the 
                    authority.Now a large number of development project are going on.Specially 
                    an Japanese company is workingin this project.'
                  </p>
                  <button>Read more..</button>
                </div>
                </div>

              </div>



    <!-- Comments Section -->

    <section class="comment_container">
      <div class="testimonial mySwiper">
        <div class="testi-content swiper-wrapper">


          <div class="slide swiper-slide">
            <img src="images/homepageImages/sajeebsir.jpg" alt="" class="image" />
            <p>
              A great platform to observe the problem of our society.<br>
              Specially the mapping system is wonderful.
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Sajeeb Shaha</span>
              <span class="job">lecturer,CSE Department</span>
            </div>
          </div>


          <div class="slide swiper-slide">
            <img src="images/homepageImages/uzzalsirr.jpg" alt="" class="image" />
            <p>
              This is a very powerful platform by which we can solve many social problem<br>
               we can gather  public opinion easily,it will helps the authority too.
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Pr.Uzzal Acharjee</span>
              <span class="job">Chairman,CSE Department</span>
       </div>
          </div>


          <div class="slide swiper-slide">
           
            <img src="images/homepageImages/layeksir.jpg" alt="" class="image" />
            <p>
              Such a useful website 'প্রকাশ' is,It will provide a great impact<br>
                 on the issue that our people are facing in day to day life.It is very user
                 friendly and easy to use that anyone can submit problem that are verified.<br>
                 
            </p>
            <i class="bx bxs-quote-alt-left quote-icon"></i>
            <div class="details">
              <span class="name">Abu Layek</span>
              <span class="job">lecturer,CSE Department</span>
            </div>
          </div>
        </div>

        <div class="swiper-button-next nav-btn"></div>
        <div class="swiper-button-prev nav-btn"></div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
    <!-- Swiper JS -->
    <script src="JS/swiper-bundle.min.js"></script>
    <!-- JavaScript -->
    <script src="JS/script.js"></script>



      <!--FAQ Section -->
      <section class="faq_section" id="faq_sec">
        <h1>FAQs</h1>
        <div class="faq_container">
          <div class="faq_box">
            <p class="ques">What is the website about?</p>
            <p class="icon">+</p>
          </div>
          <div class="faq_box">
            <p class="ques">What is the mapping system in "Prokash"?</p>
            <p class="icon">+</p>
          </div>
          <div class="faq_box">
            <p class="ques">What is the benefit of this platform?</p>
            <p class="icon">+</p>
          </div>
          <div class="faq_box">
            <p class="ques">How to use this platform?</p>
            <p class="icon">+</p>
          </div>
        </div>
      </section>
    </main>

    <footer>
      <section class="footer" id="contact">
        <div class="footer_logo">
          <img
            src="images/footer_logo.png"
            alt="footer logo"
            width="141px"
            height="57px"
          />
        </div>

        <ul class="list">
          <li>
            <a href="#">HOME</a>
          </li>
          <li>
            <a href="#feature">FEATURES</a>
          </li>
          <li>
            <a href="#about_sec">ABOUT</a>
          </li>
          <li>
            <a href="#faq_sec">FAQ</a>
          </li>
        </ul>
        <br />
        <div class="social">
          <a href="#"><i class="fa fa-instagram"></i></a>
          <a href="#"><i class="fa fa-twitter"></i></a>
          <a href="#"><i class="fa fa-facebook-f"></i></a>
          <a href="#"><i class="fa fa-snapchat"></i></a>
        </div>

        <p class="copyright">
          Terms & condition Privacy Policy
          <br />
          copyright@2022 প্রকাশ All Right reseved Site credit
        </p>
      </section>
    </footer>
  </body>
</html>
