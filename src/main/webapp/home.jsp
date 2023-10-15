<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.row-right{
            transform: translateY(-3%);
            animation: floater 3s infinite;
            transition: ease 0.5s;
        }
        @keyframes floater {
            0%{
                transform: translateY(-3%);
                transition: ease 0.5s;
            }
            50%{
                transform: translateY(3%);
                transition: ease 1s;
            }
        }
        
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
</style>
</head>
<body>
	<header class="mt-5">
        <div class="container header-container">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-lg-5 row-left text-light text-justify">
                    <p class="fw-semibold fs-2">Welcome to <span class="heading fs-1"
                            style="color: cyan;">Mentor Mentee Management System</span></p>
                    <p class="justify">
                        A mentor-mentee management system is a application that helps organizations to manage their
                        mentoring programs. It can be used to match mentors and mentees, track their progress, and
                        facilitate communication between them.
                    </p>
                    <button class="btn text-light px-3 py-2" style="background-color: cyan;"><a
                            class="text-decoration-none text-dark" href="login.jsp">Get Started</a></button>
                </div>
                <div class="col-lg-7 row-right">
                    <img class="mt-5 h-100 img-fluid" src="https://bootstrapmade.com/demo/templates/Arsha/assets/img/hero-img.png"
                        alt="#">
                </div>
            </div>
        </div>
    </header>
</body>
</html>