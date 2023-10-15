<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="maven.db.DatabaseCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

	<%@ include file="css.jsp" %>
	<style type="text/css">
		<%@ include file="register.css"%>
	</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container register" style="margin-top: 5rem;">
        <div class="row">
            <div class="col-md-3 register-left">
                <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
                <h1 style="color:cyan;">Welcome</h1>
                <h6 style="color:cyan;"> TO Digital Mentor Mentee Management System</h6>                    
                <button class="btn mt-5"><a href="login.jsp" class="btn px-5 text-decoration-none" style="background-color: cyan; color: black;">Login</a></button> <br />
            </div>
            <div class="col-md-9 register-right">
                <ul class="nav nav-tabs nav-justified" style="background-color: #F8F9FA; color: black; " id="myTab"
                    role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active px-2 py-2" style="color:black" id="home-tab" data-toggle="tab" href="#home"
                            role="tab" aria-controls="home" aria-selected="true">Mentee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-2 py-2" style="color:black" id="profile-tab" data-toggle="tab" href="#profile"
                            role="tab" aria-controls="profile" aria-selected="false">Mentor</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">

                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <form action="RegisterServlet">
                            <h3 class="register-heading">Register As Mentee</h3>
                            <div class="row register-form">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control"  name="name" placeholder="Full Name *" value=""
                                            id="contact-name" onkeyup="validateName()" />
                                        <span class="span-box" id="name-error"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="roll" placeholder="Roll No *" value=""
                                            id="Id" onkeyup="validateId()" />
                                        <span class="span-box" id="id-error"></span>

                                    </div>

                                    <div class="form-group">
                                        <input type="text" class="form-control" name="username" placeholder="Username *" value=""
                                            id="username" onkeyup="validateUsername()" />
                                        <span class="span-box" id="username-error"></span>
                                    </div>

                                    <div class="form-group">
                                        <input type="text" class="form-control" name="year" placeholder="Year *" value=""
                                            id="year-name" onkeyup="validateYear()" />
                                        <span class="span-box" id="year-error"></span>

                                    </div>
                                    <div class="form-group">
                                        <div class="maxl">
                                            <label class="radio inline">
                                                <input type="radio" name="gender" value="male">
                                                <span> Male </span>
                                            </label>
                                            <label class="radio inline">
                                                <input type="radio" name="gender" value="female">
                                                <span>Female </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" placeholder="Your Email *" value=""
                                            id="contact-email" onkeyup="validateEmail()" />
                                        <span class="span-box" id="email-error"></span>

                                    </div>
                                    <div class="form-group">
                                        <input type="text" minlength="10"  name="phone" maxlength="10" 
                                            class="form-control" placeholder="Your Phone *" value="" id="contact-phone"
                                            onkeyup="validatePhone()" />
                                        <span class="span-box" id="phone-error"></span>

                                    </div>
                                    <div class="form-group">

                                        <input type="password" class="form-control" name="password" placeholder="Password *" value=""
                                            id="pass" onkeyup="validatePassword()" />
                                        <span class="span-box" id="pass-error"></span>

                                    </div>

                                    <div class="form-group">

                                        <!-- <input type="number" class="form-control" placeholder="Mentor ID *" value=""
                                            id="mId" onkeyup="validateMentorId()" />
                                        <span class="span-box" id="mid-error"></span> -->
                                        <select name="mentor" id="cars" class="dropDown">
                                        <%
                                        DatabaseCon db=new DatabaseCon();
                                        Connection con= db.myConnection();
                                        Statement state=con.createStatement();
                                        ResultSet result=state.executeQuery("select name from mentor");%>
                                        <option value="" selected disabled>--Select Your Mentor--</option>
                                       <% 	while(result.next()){ %>
                                       		<option value="<%=result.getString(1)%>"><%=result.getString(1)%></option>
                                    
                                            <%} %>
                                        </select>
	
                                    </div>

                                    <div class="form-group">
                                        <input type="submit"
                                            style="background-color: cyan; color: black; padding: 0.6vw 1vw"
                                            class="btnRegister" onclick="return validateForm()" id="submit-btn"
                                            value="Register" />

                                    </div>

                                </div>
                                <span class="span-box" id="submit-error"></span>
                            </div>
                        </form>
                    </div>

                    <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <form action="MentorServlet">
                            <h3 class="register-heading">Register as a Mentor</h3>
                            <div class="row register-form">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="name" placeholder="Full Name *" value=""
                                            id="contact-name1" onkeyup="validateName1()" />
                                        <span class="span-box" id="name-error1"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control"  name="username" placeholder="Username *" value=""
                                            id="username1" onkeyup="validateUsername1()" />
                                        <span class="span-box" id="username-error1"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" placeholder="Your Email *" value=""
                                            id="contact-email1" onkeyup="validateEmail1()" />
                                        <span class="span-box" id="email-error1"></span>

                                    </div>
                                    <div class="form-group">
                                        <input type="text" minlength="10" name="phone" maxlength="10"
                                            class="form-control" placeholder="Your Phone *" value="" id="contact-phone1"
                                            onkeyup="validatePhone1()" />
                                        <span class="span-box" id="phone-error1"></span>

                                    </div>


                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="id" placeholder="Mentor ID *" value=""
                                            id="Id1" onkeyup="validateId1()" />
                                        <span class="span-box" id="id-error1"></span>

                                    </div>
                                    <div class="form-group">

                                        <input type="password" class="form-control" name="password" placeholder="Password *" value=""
                                            id="pass1" onkeyup="validatePassword1()" />
                                        <span class="span-box" id="pass-error1"></span>

                                    </div>
                                    <div class="form-group">
                                        <label>Gender :</label>
                                        <div class="maxl">
                                            <label class="radio inline">
                                                <input type="radio" name="gender" value="male">
                                                <span> Male </span>
                                            </label>
                                            <label class="radio inline">
                                                <input type="radio" name="gender" value="female">
                                                <span>Female </span>
                                            </label>
                                        </div>
                                    </div>
                                    <!-- <div class="form-group">
                                <input type="text" class="form-control" placeholder="`Answer *" value="" />
                            </div> -->
                                    <input type="submit" class="btnRegister"
                                        style="background-color: cyan; color: black; padding: 0.6vw 1vw"
                                        onclick="return validateForm1()" id="submit-btn1" value="Register" />
                                </div>
                                <span class="span-box" id="submit-error1"></span>

                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="register.js"></script>
</body>
</html>