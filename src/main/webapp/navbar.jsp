<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
<link href="navcss.css" rel="stylesheet">
</head>
<body>
	<header class="header fixed-top border-bottom">
       <h2 class="logo"><span>M M M</span></h2>
       <nav class="navbar ">
            <ul class="navbar-list">
                <li><a href="index.jsp" id="Home" class="navbar-link">Home</a></li>
                <li><a href="#" class="navbar-link">About</a></li>
                <li><a href="displayAll.jsp" class="navbar-link">Display All</a></li>
                <li><a href="register.jsp" class="navbar-link">Sign Up</a></li>
                <li><a href="login.jsp" class="navbar-link">Sign In</a></li>
            </ul>
       </nav>
       <div class="mobile-navbar-btn text-light ">
            <i class="ri-menu-3-line menu-icon "></i>
            <i class="ri-close-line close-icon"></i>

       </div>
    </header>
    <Script >
      const btn=document.querySelector('.mobile-navbar-btn');

      const header=document.querySelector('.header');
      btn.addEventListener('click',function()
      {
          header.classList.toggle('active');
      
      })
    </Script>
</body>
</html>