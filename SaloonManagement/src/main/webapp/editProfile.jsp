<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="test.User" %>


<%
    //Get user object from profile servlet
    User user = (User) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<link rel="stylesheet" href="common.css">
<link rel="stylesheet" href="profile.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("../images/salon-bg.jpg") no-repeat center;
    background-size: cover;
}

.edit-box {
    width: 400px;
    margin: 80px auto;
    background: rgba(255,255,255,0.9);
    padding: 20px;
    border-radius: 10px;
}

.edit-box h2 {
    text-align: center;
}

.edit-box label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}

.edit-box input, 
.edit-box textarea {
    width: 100%;
    padding: 7px;
    margin-top: 5px;
}

.actions {
    text-align: center;
    margin-top: 15px;
}

.actions button, 
.actions a {
    padding: 8px 14px;
    margin: 5px;
    border: none;
    background: #c2185b;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
}
</style>

<script>
function validateProfile() {
    let phone = document.getElementById("phone").value;

    if (phone.length != 10) {
        alert("Phone number must be 10 digits");
        return false;
    }
    return true;
}
</script>

</head>

<body>

<jsp:include page="header.jsp" />

<div class="edit-box">

    <h2>Edit Profile</h2>

    <form action="UpdateProfileServlet" method="post" onsubmit="return validateProfile()">

        <label>Name</label>
        <input type="text" name="name" value="<%= user.getName() %>" required>

        <label>Email</label>
        <input type="email" value="<%= user.getEmail() %>" readonly>

        <label>Phone</label>
        <input type="text" name="phone" id="phone" value="<%= user.getPhone() %>" required>

        <label>Address</label>
        <textarea name="address" rows="3"><%= user.getAddress() %></textarea>

        <div class="actions">
            <button type="submit">Update Profile</button>
            <a href="ProfileServlet">Cancel</a>
        </div>

    </form>

</div>


<jsp:include page="footer.jsp" />

</body>
</html>
