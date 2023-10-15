<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>

<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="UTF-8">

<title>Login</title>

<%@include file="css.jsp" %>

</head>

<style type="text/css">

	body,html{
	
		/*background: #ff00cc !important;
	    background: -webkit-linear-gradient(to right, #333399, #ff00cc) !important;
	    background: linear-gradient(to right, #333399, #ff00cc) !important;*/
	    background: cyan;
	}

	*{
	
		padding: 0;
		
		margin: 0;
		
	}
	
	.gradient-custom-2 {
	
		
		background: #fccb90;
		
		
		background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
		
		
		background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
		
		border-radius:8px;
		
	}
	.gradient-form{
		margin-top:6.5rem !important;
	}
	
	@media (min-width: 769px) {
	
	.gradient-custom-2 {
	
		border-top-right-radius: .3rem;
		
		border-bottom-right-radius: .3rem;
	
	}
	
	</style>

<body>
	<%@ include file="navbar.jsp" %>
<section class="gradient-form ">

    <div class="container" style="border-radius: 15px">

        <div class="row d-flex justify-content-center align-items-center">

            <div class="col-lg-10">

                <div class="card rounded-3 text-black">

                    <div class="row g-0">

                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">

                            <div class="text-white text-center px-3 py-4 p-md-5 mx-md-4">

                                <h4 class="mb-4"></h4>

                                <p class="small mb-0" style="text-align: center;font-size: xx-large;font-weight: 800;">

                                    Welcome To

                                </p>

                                <p style="text-align: center;font-size: x-large;font-weight: 500;">

                                    Progressive Education Society's MODERN COLLEGE OF

                                    ENGINEERING, PUNE

                                </p>

                                <a href="https://moderncoe.edu.in/" target="_blank"
                                    style="text-align: center;color: #273c75;font-size: larger;font-weight: 600;">www.moderncoe.edu.in</a>

                            </div>

                        </div>

                        <div class="col-lg-6">

                            <div class="card-body ">

                                <div class="text-center">

                                    <img src="logo.png" style="width: 150px" alt="logo" />

                                    <h4 class="mt-1 mb-4 pb-1"></h4>

                                </div>
                                

                                <form action="loginServlet">
                                <c:if test="${not empty updatemsgsuccess }">
                                	<p class="text-center text-success">${updatemsgsuccess}</p>
                                	<c:remove var="updatemsgsuccess"/>
                               		 </c:if>

                                    <p style="text-align: center;font-size: x-large;font-weight: 700;">

                                        Please login to your account

                                    </p>
                                    <c:if test="${not empty loginerror }">
                                	<p class="text-center text-danger">${loginerror}</p>
                                	<c:remove var="loginerror"/>
                               		 </c:if>

                                    <div class="form-outline mb-4">

                                        <input type="username" name="username" id="form2Example11" class="form-control"
                                            placeholder="Username" required="true" />

                                    </div>

                                    <div class="form-outline mb-4">

                                        <input data-toggle="password" type="password" id="form2Example22"
                                            class="form-control" name="password" placeholder="Password" required="true" />


                                    </div>

                                    <div class="form-check form-check-inline" style="cursor: pointer">

                                        <input class="form-check-input" type="radio" name="type"
                                            id="inlineRadio1" value="Mentor" />

                                        <label class="form-check-label" for="inlineRadio1"
                                            required="true">Mentor</label>

                                    </div>

                                    <div class="form-check form-check-inline" style="cursor: pointer">

                                        <input class="form-check-input" type="radio" name="type"
                                            id="inlineRadio2" value="Mentee" checked />

                                        <label class="form-check-label" for="inlineRadio2"
                                            required="true">Mentee</label>

                                    </div>

                                    <div class="text-center pt-4 mb-5">

                                        <input class="gradient-custom-2 py-2 text-light" type="submit" value="login"
                                            style="padding: 3px 15px;border-radius: 5px;border: 1px solid white;" />

                                        <a class="text-muted link-secondary p-3" href="forgotten.jsp"
                                            style="text-align: end">Forgot password?</a>

                                    </div>

                                    <div class="d-flex flex-column align-items-center justify-content-center pb-4">

                                        <p class="mb-1 me-2">Don't have an account?</p>

                                        <button type="button" class="btn btn-outline-danger">

                                            <a href="register.jsp" class="text-decoration-none font-weight-bold">Create new</a> 

                                        </button>

                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>
</body>

</html>