<%@page import="java.util.ArrayList"%>
<%@page import="maven.model.Register"%>
<%@page import="java.util.List"%>
<%@page import="maven.dao.RegisterDaoImpl"%>
<%@page import="maven.dao.RegisterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style type="text/css">
		nav a{
		color: white !important;}
		body{
			background: #C04848; 
			background: -webkit-linear-gradient(to right, #480048, #C04848); 
			background: linear-gradient(to right, #480048, #C04848); 
		}
			
		.card{
			box-shadow: 5px 5px 10px black;
			border-radius:20px;
			background: #dcdde1;
		}
		@import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");


       body{
        background-color:#eee;
        font-family: "Poppins", sans-serif;
        font-weight: 300;
       }

       

       .search{
       position: relative;
       box-shadow: 0 0 40px rgba(51, 51, 51, .1);
         
       }

       .search input{

        height: 50px;
        text-indent: 25px;
        border: 2px solid #d6d4d4;
        


       }


       .search input:focus{

        box-shadow: none;
        border: 2px solid blue;


       }

       .search .fa-search{

        position: absolute;
        top: 20px;
        left: 16px;

       }

       .search button{

        position: absolute;
        top: 5px;
        right: 5px;
        height: 40px;
        width: 110px;
        background: #C04848; 
			background: -webkit-linear-gradient(to right, #480048, #C04848); 
			background: linear-gradient(to right, #480048, #C04848);

       }
	
	</style>
</head>
<body>
	<%@include file="navbar.jsp" %>	
	
	<div class="container p-5 mt-5">
	<div class="card">
	<div class="card-body">
	<p class="text-center fs-1 p-3" style="color:purple;">Student Details</p>
	
	<form action="SearchServlet">
	<div class="container mb-2">
        <div class="row height d-flex justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="search">
                    <i class="fa fa-search"></i>
                    
                    <input type="number"  name="roll" class="form-control" placeholder="Enter the Roll No to Search Student">
                    <button class="btn border-none text-light" >Search</button>
                </div>
            </div>
            
            <c:if test="${not empty mssg}">
							<p class="text-center text-danger">${mssg}<p>
							<c:remove var="mssg"/>
						</c:if>	
						<c:if test="${empty mssg}">
							<p class="text-center text-danger">${mssg}<p>
							<c:remove var="mssg"/>
						</c:if>

        </div>
    </div>
    
	<table class="table table-striped table-bordered border-success ">
	  <thead>
	    <tr style="color: purple !important;">
	      <th style="color: purple !important;" scope="col">Roll no</th>
	      <th style="color: purple !important;" scope="col">Full Name</th>
	      <th style="color: purple !important;" scope="col">Phone</th>
	      <th style="color: purple !important;" scope="col">Gender</th>
	      <th style="color: purple !important;" scope="col">Year</th>
	      <th style="color: purple !important;" scope="col">Email</th>
	      <th style="color: purple !important;" scope="col">Mentor</th>
	       <th style="color: purple !important;" scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  
	  <%
	  	if(!session.isNew())
	  	{
		  	RegisterDao dao = new RegisterDaoImpl();
		  	List<Register> list= (List<Register>) session.getAttribute("data");
		  	 for(Register s: list){
	  %>
	  	  <tr>
	      <th style="color:purple !important;" scope="row"><%= s.getRoll() %></th>
	      <td ><%= s.getName() %></td>
	      <td><%= s.getPhone() %></td>
	      <td><%= s.getGender() %> </td>
	      <td><%= s.getYear() %> </td>
	      <td><%= s.getEmail()%> </td>
	      <td><%= s.getMentor()%> </td>
	   
	        <td>
		      		<a href="delete?roll=<%=s.getRoll()%>" class="btn btn-sm btn-danger">Delete</a>
		      	</td>
	    </tr>
	    <input name="mentor" type="text" value="<%=s.getMentor()%>" style="display:none;">
	  <%}
		  	 
	  	}
	  %>
	  

	  </tbody>
	</table>
	</form>
		 
	</div>
	</div>
	</div>
</body>
</html>