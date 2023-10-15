<%@page import="maven.model.ContactModel"%>
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
	
	</style>
</head>
<body>
	<%@include file="navbar.jsp" %>	
	
	<div class="container p-5 mt-5">
	<div class="card">
	<div class="card-body">
	<p class="text-center fs-1 p-3" style="color:purple;">Student Issue Details</p>
	
	<table class="table table-striped table-bordered border-success ">
	  <thead>
	    <tr style="color: purple !important;">
	      <th style="color: purple !important;" scope="col">Roll no</th>
	      <th style="color: purple !important;" scope="col">Full Name</th>
	      <th style="color: purple !important;" scope="col">Mentor</th>
	      <th style="color: purple !important;" scope="col">Issue</th>
	      <th style="color: purple !important;" scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  
	  <%
	  	if(!session.isNew())
	  	{
		  	RegisterDao dao = new RegisterDaoImpl();
		  	 List<ContactModel> list= (List<ContactModel>) session.getAttribute("issue");
		  	 for(ContactModel cm: list){
	  %>
	  	  <tr>
	      <th style="color:purple !important;" scope="row"><%=cm.getRoll()%></th>
	      <td ><%=cm.getName()%></td>
	      <td><%=cm.getMentor() %></td>
	      <td><%= cm.getIssue() %> </td>
	      <td>
		      	<a href="deleteissue?roll=<%=cm.getRoll()%>" class="btn btn-sm btn-danger">Delete</a>
		   </td>
	    </tr>
	  <%}
	  	}
	  %>
	  </tbody>
	</table>
	</div>
	</div>
	</div>
</body>
</html>