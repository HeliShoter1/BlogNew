<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="Model.User"%>

<% User user = null;
if(request.getAttribute("user") != null){
	user = (User)request.getAttribute("user");
}
ArrayList<User> allUser = user.GetAllUser();
 %>
<!DOCTYPE html>

<!--

=========================================================
* Now UI Dashboard - v1.5.0
=========================================================

* Product Page: https://www.creative-tim.com/product/now-ui-dashboard
* Copyright 2019 Creative Tim (http://www.creative-tim.com)

* Designed by www.invisionapp.com Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-->
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  
  <title>
  
  <%if(user != null){
	  Cookie[] logined = request.getCookies();
		String[] cookie = new String[5];
		if(logined != null){
		for(int i = 0;i<logined.length;i++){
				System.out.println(logined[i].getName() + " " + logined[i].getValue());
		}}
  %>
    Account-<%= user.getFullName()%>
    <%} %>
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="user-profile">
  <div class="wrapper ">
    <div class="sidebar" data-color="orange">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="/BTL/View/Homepage/" class="simple-text logo-mini">
         	Home
        </a>
        <a href="/BTL/View/Homepage/" class="simple-text logo-normal">
          Page
        </a>
      </div>
     <%if(user != null){ %>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
        <ul class="nav">
          <li class="active">
            <a href="/BTL/View/Userpage/user?user_id=<%=user.getUserId() %>">
              <i class="now-ui-icons users_single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
           <li >
            <a href="/BTL/View/Postmanapage/Post?user_id=<%=user.getUserId() %>">
              <i class="now-ui-icons media-1_camera-compact"></i>
              <p>Posts manage</p>
            </a>
          </li>
          <%if(user.getRole().equals("admin")){%>
          <li >
            <a>
              <i class="now-ui-icons media-1_camera-compact"></i>
              <p>User manager</p>
            </a>
          </li>
          <%} %>
          </ul>
      </div>
      <%} %>
    </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">User Profile</a>
          </div>
          
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Edit Profile</h5>
              </div>
               <%if(user != null){%>
              <div class="card-body">
              
                <form>
                  <div class="row">
                    <div class="col-md-5">
                      <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" placeholder="Username" id="user_field" value="<%= user.getFullName()%>">
                      	<input type="hidden" id="username_field_hide" value="<%= user.getFullName()%>"/>
                      </div>
                    </div>
                    <div class="col-md-5">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address (disabled)</label>
                        <input type="email" class="form-control" disabled="true" value="<%=user.getEmail() %>" placeholder="Email">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>About Me</label>
                        <textarea rows="4" cols="80" class="form-control" placeholder="Here can be your description" id = "des_field">123</textarea>
                      	<input type="hidden" id="user_des_field" value="123"/>
                      
                      </div>
                    </div>
                  </div>
                </form>
                
                <button class="btn btn-primary btn-block" id="save_btn_user" onclick="submit_save(<%=user.getUserId()%>)">Save</button>
                <%} %>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-user">
              <div class="image">
                <img src="../assets/img/bg5.jpg" alt="...">
              </div>
               <%if(user != null){
  %>
              <div class="card-body">
                <div class="author">
                  <a href="#">
                    <img class="avatar border-gray" src="https://s.pro.vn/3Eeg" alt="...">
                    <h5 class="title" id= "name_tt_text"></h5>
                  </a>
                  <p class="description" id="name_text">
                    <%=user.getFullName() %>
                  </p>
                </div>
                <p class="description text-center" id="des_text">
                  "<%=123 %>"
                </p>
              </div>
              <%} %>
              <hr>
              <div class="button-container">
                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                  <i class="fab fa-facebook-f"></i>
                </button>
                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                  <i class="fab fa-twitter"></i>
                </button>
                <button href="#" class="btn btn-neutral btn-icon btn-round btn-lg">
                  <i class="fab fa-google-plus-g"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <%if(user.getRole().equals("admin")){ %>
        <table class="table">
                    <thead class=" text-primary">
                      <th>
                        Image
                      </th>
                      <th>
                        user_id
                      </th>
                      <th>
                      	name
                      </th>
                      <th>
                        role
                      </th>
                      <th>
                        email
                      </th>
                      <th>
                        Action
                      </th>
                    </thead>
                    <tbody id = "wrap_post_tab">
                    
                    	
					<%for(int i = 0;i<allUser.size();i++){
					%>
                      <tr class="user">
                        <td>
                          <img style="width:150px; height:150px; object-fit:center" src="https://images.spiderum.com/sp-thumbnails/defaultthumbnail.png"/>
                        </td>
                        <td>
                          <%=allUser.get(i).getUserId() %>
                        </td>
                        <td>
                          <%=allUser.get(i).getFullName() %>
                        </td>
                        <td id="role_<%=allUser.get(i).getUserId()%>">
                          <%=allUser.get(i).getRole()%>
                        </td>
                        <td>
		                   <%=allUser.get(i).getEmail()%>
                        </td>
                        <td >
                           <button class="btn btn-primary btn-block action" id="edit_user" onclick="editUserRole(<%=allUser.get(i).getUserId()%>,'admin')">Level up</button>
                           <br>
                           <button class="btn btn-primary btn-block action" onclick="editUserRole(<%=allUser.get(i).getUserId()%>,'user')">Level down</button>
                           <br>
                           <button class="btn btn-primary btn-block action" id="delete_post" onclick="DeleteUser(<%=allUser.get(i).getUserId()%>)">Delete</button>
                        </td>
                      </tr>
                      <%}
					 %>
                    </tbody>
                  </table>
                  <%} %>
      </div>
      
      <footer class="footer">
        <div class=" container-fluid ">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy; <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  <script src="./userpage.js" type="text/javascript"></script>

</body>
</html>