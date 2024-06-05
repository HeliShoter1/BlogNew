<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Pages"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
 <% ArrayList<Pages> arr = (ArrayList<Pages>) request.getAttribute("Page"); %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <link rel="stylesheet" href="style.css">
  
  
  
  <script type="text/javascript">

</script>

	<style type="text/css">
	.Cate-Select{
		background-color: #d1360e !important;
	}
	.Color_text{
		Color :#d1360e !important;
	}
	.bgcolor{
	}
	</style>


  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" >
  
  <title>
    Components Documentation - Now UI Dashboard by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"  >
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>


<nav
  class="navbar navbar-expand-sm navbar-dark bg-primary"
>
  <a class="navbar-brand" href="#">Navbar</a>
  <button
    class="navbar-toggler d-lg-none"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target="#collapsibleNavId"
    aria-controls="collapsibleNavId"
    aria-expanded="false"
    aria-label="Toggle navigation"
  ></button>

</nav>

<body class="offline-doc">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
    <div class="container" style="margin-right:0%;">
      <div class="navbar-wrapper">
        <div class="navbar-toggle">
          <button type="button" class="navbar-toggler">
          </button>
        </div>
      </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
        <span class="navbar-toggler-bar navbar-kebab"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end bg-primary" id="navigation">
       
        <form class="d-flex my-2 my-lg-0">
      <input class="form-control me-sm-2" type="text" placeholder="Search"/>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
        Search
      </button>
    </form>
        <%
			        Cookie[] logined = request.getCookies();
        			String[] cookie = new String[5];
        			if(logined != null){
        			for(int i = 0;i<logined.length;i++){
        					cookie[i] = logined[i].getValue();
        			}}
        			
			        if (logined == null ||logined.length <= 1) {
			    %>
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link" href="./Login">
                        Đăng Nhập
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./register"
                        target="_blank">
                        Đăng kí
                      </a>
                    </li>
                    <li class="nav-item">
               
              </li>
			    <%
			        }else{
			    %>
			    
			    <form class="d-flex my-2 my-lg-0" action="/BTL/View/Userpage/user" method="Get">
			    <input value="<%=cookie[0] %>" name="user_id" class="hide">
			    <button type="submit" class="btn btn-second">
			    <a>
			     <i class="now-ui-icons users_single-02"></i>
                  <p> <%= cookie[2].replaceAll("_", " ") %> </p>
			    </a>
			    </button>
			      </form>
               
			    <form class="d-flex my-2 my-lg-0" action="./" method="GET">
			    <button type="submit" class="btn btn-secondary" id="logout">log out</button>
			      </form>
              <%} %>
                  </ul>
    
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
  <%ArrayList<Pages> Earliest = (ArrayList<Pages>) request.getAttribute("EarliestPost"); %>
    <div class="carousel-item active">
     <div class="page-header clear-filter">
    <div class="page-header-image " style="background-image: url('<%=Earliest.get(0).getImg() %>');  background-size: cover;"></div>
    <div class="container text-center">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand">
          <h1 class="title">
            <%=Earliest.get(0).getTitle() %>
          </h1>
          <h3 class="description"><%=Earliest.get(0).getDescription() %></h3>
          <br />
          <a href="./Page?id=<%=Earliest.get(0).getId() %>" class="btn btn-primary btn-round btn-lg">Đọc bài  viết</a>
        </div>
      </div>
    </div>
  </div>
    </div>
    <%
    for(int i = 1;i<Earliest.size();i++){
    	%>
    <div class="carousel-item">
      <div class="page-header clear-filter">
    <div class="page-header-image" style="background-image: url(<%=Earliest.get(i).getImg() %>);"></div>
    <div class="container text-center">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand">
          <h1 class="title">
            <%= Earliest.get(i).getTitle() %>
          </h1>
          <h3 class="description"><%=Earliest.get(i).getDescription() %></h3>
          <br />
          <a href="./Page?id=<%=Earliest.get(i).getId() %>" class="btn btn-primary btn-round btn-lg">Đọc bài viết</a>
        </div>
      </div>
    </div>
  </div>
    </div>
    <%} %>

  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  
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





  <div class="blog-section paddingTB60 ">
    <div class="container">
      <div class="row">
        <div class="site-heading text-center">
                <h3>Our Portfolio</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt <br> ut labore et dolore magna aliqua. Ut enim ad minim </p>
                <div class="border"></div>
              </div>
      </div>
      <div class="row text-center">
      <% ArrayList<Pages> most = (ArrayList<Pages>) request.getAttribute("Most_View");
      		for(Pages i : most){ 
      %>
             <div class="col-sm-6 col-md-4">
                  <div class="blog-box">
                    <div class="blog-box-image">
                      <img src="<%=i.getImg() %>" class="img-responsive" alt="">
                    </div>
                    <div class="blog-box-content">
                      <h4><%=i.getTitle() %></h4>
                      <p><%=i.getDescription() %></p>
                      <a href="./Page?id=<%=i.getId() %>" class="btn btn-default site-btn">Read More</a>
                      <i style="left: 0%;">view: <%=i.getView() %></i>
                    </div>
                  </div>
                </div> <!-- End Col -->
        <%} %>					
        </div>
    </div>
    </div>





    <section id="blog">
      <div class="container">
           <div class="row">
               <div class="col-lg-6 col-lg-offset-3 text-center">  
                   <h2>
                       <span class="ion-minus"></span>Dành cho bạn<span class="ion-minus"></span>
                   </h2>
                   <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis  dis parturient montes, nascetur ridiculus </p><br>
               </div> 
            </div>  
            <div>
	        <div class="row">
	        	<div class="text-center">    
		            <form method="post" action="./">
			            <button type="submit" class="btn btn-light Cate-Select" value="%">ALL</button>
			            <% ArrayList<String> category = (ArrayList<String>) request.getAttribute("Category"); 
			            for(String cate : category){ %>
			            <button type="submit" class="btn btn-light" value="<%=cate %>"><%=cate %></button>
			            <%} %>
		            </form>
             </div>
            </div>
           	<div class="row">
		            <div class="text-center">
		            <form action="./Index" method="POST">
		            <button type="button" class="refresh" value=" " style="border:none;"  ><i class="now-ui-icons arrows-1_refresh-69" ></i></button>
		            	<button type="button" class="btn btn-secondary index Color_text " >1</button>
		            <%Object obj = request.getAttribute("Number");
		            	int  number = (Integer) obj;
		            	for(int i = 1;i<=number/8;i++){
		            %>
		            <button type="button" class="btn btn-secondary index" ><%=i +1%></button><%} %>
		            </form>
            		
            	</div>
            </div>
            </div>
                   
           <div class="row">
         <div id="slider" class="carousel slide" data-ride="carousel">

  				<div class="carousel-indicators" style="margin-top: 10px;">
    				<button type="button" class="btn btn-secondary Button pre" id="prev" onclick="Prev()">Prev</button>
    				<button type="button" class="btn btn-secondary Button next" id="next" onclick="Next()">Next</button>
  					</div>
                <!-- Carousel items -->
                <div class="carousel-inner">
                   <div class="item ">
                     <div class="row">
                    <% 
             for(int i = 0 ;i< (arr.size() < 8 ? arr.size() : 8);i++){
            	 
            	 %>
             	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
        		<div class="card text-center">
            	<img class="card-img-top" id="img-<%=i%>" src="<%=arr.get(i).getImg() %>" alt="" width="100%">
            	<div class="card-block">
                	<h4 id="title-<%=i%>" class="card-title"><%=arr.get(i).getTitle() %></h4>
                	<p id="description-<%=i%>" class="card-text"><%=arr.get(i).getDescription() %></p>
                	<a class="btn btn-default" id="link-<%=i%>" href="./Page?id=<%=arr.get(i).getId() %>">Read More</a>
	               <%if(cookie[1]!= null){
	               if(cookie[1].equals("admin")){
	            	   %>
	            	   <form action="./Page" method="POST">
	            	   <input type='text' name='parhodemsv' value='<%=arr.get(i).getId() %>' id="hide id-post-<%=i%>" id="formGroupExampleInput" placeholder="Họ đệm SV"> 
	            	   <input class="btn btn-primary abc" type="submit" value='DELETE' name='action'/>
	            	   </form>
	               <%}}%>
            	</div>
        </div>
    </div>  
               
               <%} %>   
                     </div> <!-- row -->
                   </div> <!-- item -->
				
           </div>
         </div>
       </div>
     </div>   
   </section>
  <script src="./script.js"  >	</script>
</body>

</html>