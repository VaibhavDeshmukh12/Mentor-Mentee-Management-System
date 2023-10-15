<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="maven.db.DatabaseCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<meta charset="UTF-8">
<link href="navcss.css" rel="stylesheets">

<title>Contact</title>
<style>
<%@ include file="register.css"%>
        body {
            
        }
		
        h1 {
            margin-bottom: 40px;
        }

        label {
            color: #333;
        }

        .btn-send {
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            width: 80%;
            margin-left: 3px;
        }

        .help-block.with-errors {
            color: #ff5050;
            margin-top: 5px;

        }

        .card {
            margin-left: 10px;
            margin-right: 10px;
        }
        #submit-btn{
        	 background: #ff00cc;
    		background: -webkit-linear-gradient(to right, #333399, #ff00cc);
    		background: linear-gradient(to right, #333399, #ff00cc);
        }
        
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
    <div class="container py-5">
        
        <div class="row ">
            <div class="col-lg-7 mx-auto mt-5">
                <div class="card mt-2 mx-auto p-1 bg-light">
                <div class=" text-center mt-5 ">
            			<h1 class="" style="color:purple;"> Contact Form</h1>
       					 </div>
                    <div class="card-body bg-light">
                        <div class="container">
                            <form id="contact-form" role="form" action="ContactServlet">
                                <div class="controls">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="form_name">Name *</label>
                                                <input  type="text" name="name" class="form-control"
                                                    placeholder="Please enter your name *"
                                                    id="contact-name" onkeyup="validateName()">
                                                    <span class="span-box" id="name-error"></span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="form_lastname">Roll No *</label>
                                                <input type="number" name="roll"
                                                    class="form-control" placeholder="Please enter your Roll No *"
                                                    id="Id" onkeyup="validateId()">
                                                    <span class="span-box" id="id-error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label >Mentor Name *</label>
                                                <select name="mentor" id="cars" class="form-control"required="required" >
                                        <%
                                        DatabaseCon db=new DatabaseCon();
                                        Connection con= db.myConnection();
                                        Statement state=con.createStatement();
                                        ResultSet result=state.executeQuery("select name from mentor");%>
                                        <option value="" selected disabled>--Select Your Mentor--</option>

                                    <%    	while(result.next()){ %>
                                       		<option value="<%=result.getString(1)%>"><%=result.getString(1)%></option>
                                    
                                            <%} %>
                                        </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="form_need">Please specify your issue *</label>
                                                <select id="form_need" name="" class="form-control"
                                                    required="required" data-error="Please specify your need.">
                                                    <option value="" selected disabled>--Select Your Issue--</option>
                                                    <option>Problems During Identifying Goals</option>
                                                    <option>About the Teachers's Behaviour</option>
                                                    <option>Lack Of Guidance </option>
                                                    <option>Other</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="form_message">Message *</label>
                                                <textarea id="form_message" name="issue" class="form-control"
                                                    placeholder="Write your message here." rows="4" required="required"
                                                    data-error="Please, leave us a message." maxlength="500"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">

                                            <input id="submit-btn" type="submit" class="btn btn-success btn-send  pt-2 btn-block
                            " value="Send Message">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.8 -->
            </div>
            <!-- /.row-->
        </div>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="register.js"></script>
</body>
</html>