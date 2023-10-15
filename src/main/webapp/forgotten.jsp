<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="css.jsp" %>
<style type="text/css">
	body {
    background: #ff00cc;
    background: -webkit-linear-gradient(to right, #333399, #ff00cc);
    background: linear-gradient(to right, #333399, #ff00cc);
}
</style>
</head>

<body>

	<main>
            <section class="container d-flex flex-column">

                <div class="row align-items-center justify-content-center g-0 min-vh-100">

                    <div class="col-lg-5 col-md-8 py-8 py-xl-0">

                        <!-- Card -->

                        <div class="card shadow">

                            <!-- Card body -->

                            <div class="card-body p-6">

                                <div class="mb-4">

                                    <img src="password.svg" class="mb-4" alt="logo-icon" />

                                    <h1 class="mb-1 fw-bold">Forgot Password</h1>

                                    <p>Fill the form to reset your password.</p>

                                </div>
									<c:if test="${not empty updatePasswordError }">
                                	<p class="text-center text-danger">${updatePasswordError}</p>
                                	<c:remove var="updatePasswordError"/>
                                </c:if>
                                <!-- Form -->

                                <form action="ForgotPasswordServlet">

                                    <!-- Email -->

                                    <div class="mb-3">

                                        <input type="text" class="form-control" name="username" placeholder="Username"
                                            required="" />

                                    </div>

                                    <div class="form-outline mb-4">

                                        <input type="password" id="form2Example22" class="form-control"
                                            placeholder="New Password" required="true" name="password" />

                                        <i class="bi bi-eye-slash" id="togglePassword"></i>

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

                                    <!-- Button -->

                                    <div class="m-3 text-center">

                                        <button type="submit" class="btn"
                                            style="background-color: #2f3542; color: white">

                                            Resest Password

                                        </button>

                                    </div>

                                    <span style="font-size: large">Return to<a href="login.jsp" class="p-2"
                                            style="color: #1e3799">Sign in</a></span>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </section>

        </main>

</body>
</html>