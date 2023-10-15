<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="maven.model.Mentor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style type="text/css">
	.gradient-custom {
        background: #f6d365;
        background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
        background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
    }
    body {
        background-color: #111827;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%! Mentor ment=null;%>
	<% 
		if(!session.isNew()){
			List<Mentor> list=new ArrayList<Mentor>();
			 list = (List<Mentor>) session.getAttribute("ment");
			 ment = list.get(0);
		}
	%>
	<section class="h-100" style="display: flex; align-items: center; justify-content: center;">
      <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
          <div class="col col-lg-8 mb-4 mb-lg-0">
           <div class="card mb-3" style="border-radius: .5rem;">
            <div class="row g-0">
                <div class="col-md-4 gradient-custom text-center text-white"
                    style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJFiKHbkBQTYhaU1x1TGreeVViDrWp3pPQEf-zcX9Smb80kGgEUkTPeGp95adj2PrIYSI&usqp=CAU"
                        alt="Avatar" class="img-fluid mt-5 mb-4" style="width: 90px; border-radius: 50%;" />
                    <h4 class="text-light mt-2">Profile</h4>
                    <div class="d-flex justify-content-center">
                    <input  value="<%= ment.getName() %>" class="text-light mb-5 text-center fs-3" disabled="disabled" style="color: purple !important;border:none;outline:none; background: transparent;">
                    </div>
                    <!-- <p class="fs-4">Web Designer</p> -->
                    <button name="update" class="btn text-light fs-5 px-4 "  style="background-color: #7E22CE; outline: none; border: none; font-weight: 500; box-shadow: 5px 5px 8px black;"><a href="update.jsp" class="text-decoration-none text-light">Edit</a></button>
                   
                    <div>
                    	<button class="btn text-light mt-4 mb-2 px-4 " style="background-color: red; outline: none; border: none; font-weight: 500; box-shadow: 5px 5px 8px black;"><a class="text-light text-decoration-none" href="index.jsp">Log Out</a></button>
                    </div>
                </div>
                <div class="col-md-8" style="color: #7E22CE;">
                <form action="">
                <input type="hidden" name="name" value="<%= ment.getName() %>" class="text-light mb-5 text-center fs-3" disabled="disabled" style="color: purple !important;border:none;outline:none; background: transparent;">
                    <div class="card-body p-4">
                        <h6 class="fs-2 text-dark">Information</h6>
                        
                        <c:if test="${not empty susmsg}">
							<p class="text-center text-danger">${susmsg}<p>
							<c:remove var="susmsg"/>
						</c:if>	
						<c:if test="${empty errmsg}">
							<p class="text-center text-danger">${errmsg}<p>
							<c:remove var="errmsg"/>
						</c:if>
                        
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h5>Id :</h5>
                                <h6 class="text-muted "><%= ment.getId() %></h6>
                            </div>
                            <div class="col-6 mb-3">
                                <h5>Phone :</h5>
                                <h6 class="text-muted"><%= ment.getPhone() %></h6>
                            </div>
                        </div>
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h5>Username :</h5>
                                <h6 class="text-muted "><%= ment.getUsername() %></h6>
                            </div>
                            <div class="col-6 mb-3">
                                <h5>Email :</h5>
                                <h6 class="text-muted "><%= ment.getEmail() %></h6>
                            </div>
                        </div>
                        <div class="row pt-1">                            
                            <div class="col-6 mb-3">
                                <h4>Password :</h4>
                                <h6 class="text-muted "><%= ment.getPassword() %></h6>
                            </div>
                             <div class="col-6 mb-3">
                                <h5>Gender:</h5>
                                <h6 class="text-muted"><%= ment.getGender() %></h6>
                            </div>
                            <div class="col-6 mb-3">
                             
                               <a class="btn btn-primary text-light " href="IssueServlet?name=<%= ment.getName() %>">Display Students issues</a>
                            </div>
                            <div class="col-6 mb-3">
                    		<a class="btn btn-warning text-light " href="noaction?name=<%= ment.getName() %>">Display Students</a>
                    		</div>
                        </div>
                    </div>
                    <div class="row">
    
                    </div>
				  </form>
                </div>
             </div>
           </div>
          </div>
        </div>
      </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>