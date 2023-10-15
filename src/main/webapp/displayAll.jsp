<%@page import="java.util.List"%>
<%@page import="maven.model.Register"%>
<%@page import="maven.dao.RegisterDaoImpl"%>
<%@page import="maven.dao.RegisterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Display Students</title>
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
		
	</style>
</head>
<body>
	<%@include file="navbar.jsp" %>	
	<div class="container p-5 mt-5">
	<div class="card">
	<div class="card-body">	
	<h1 class="text-center py-2" style="font-weight: bold; color: purple;">All Students</h1>
	<table class="table table-striped table-bordered border-success table-sm">
	  <thead>
	    <tr style="color: purple !important;">
	      <th style="color: purple !important;" scope="col">Roll no</th>
	      <th style="color: purple !important;" scope="col">Full Name</th>
	      <th style="color: purple !important;" scope="col">Phone</th>
	      <th style="color: purple !important;" scope="col">Gender</th>
	      <th style="color: purple !important;" scope="col">Year</th>
	      <th style="color: purple !important;" scope="col">Email</th>
	      <th style="color: purple !important;" scope="col">Mentor</th>
	    </tr>
	  </thead>
	  <tbody>
	  
	  <% RegisterDao dao = new RegisterDaoImpl();
	  	 List<Register> list = dao.displayAll();
	  	 for(Register s: list){
	  %>
	  	 <tr>
	      <th style="color: purple !important;" scope="row"><%= s.getRoll() %></th>
	      <td ><%= s.getName() %></td>
	      <td><%= s.getPhone() %></td>
	      <td><%= s.getGender() %> </td>
	      <td><%= s.getYear() %> </td>
	      <td><%= s.getEmail()%> </td>
	      <td><%= s.getMentor()%> </td>
	    </tr>
	  <%}
	  %>
	  </tbody>
	</table>
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
</body>
</html>