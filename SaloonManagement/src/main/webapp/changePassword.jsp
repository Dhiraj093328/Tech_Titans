<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel="stylesheet" href="common.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: url("../images/salon-bg.jpg") no-repeat center;
    background-size: cover;
}

.password-box {
    width: 380px;
    margin: 100px auto;
    background: rgba(255,255,255,0.9);
    padding: 20px;
    border-radius: 10px;
}

.password-box h2 {
    text-align: center;
}

.password-box label {
    display: block;
    margin-top: 12px;
    font-weight: bold;
}

.password-box input {
    width: 100%;
    padding: 8px;
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
    background: #6a1b9a;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
}
</style>

<script>
function validatePassword() {

    let newPass = document.getElementById("newPassword").value;
    let confirmPass = document.getElementById("confirmPassword").value;

    if (newPass.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }

    if (newPass !== confirmPass) {
        alert("Passwords do not match");
        return false;
    }

    return true;
}
</script>

</head>

<body>

<jsp:include page="header.jsp" />

<div class="password-box">

    <h2>Change Password</h2>

    <form action="ChangePasswordServlet" method="post"
          onsubmit="return validatePassword()">

        <label>Old Password</label>
        <input type="password" name="oldPassword" required>

        <label>New Password</label>
        <input type="password" id="newPassword" name="newPassword" required>

        <label>Confirm New Password</label>
        <input type="password" id="confirmPassword" required>

        <div class="actions">
            <button type="submit">Update Password</button>
            <a href="ProfileServlet">Cancel</a>
        </div>

    </form>

</div>


<jsp:include page="footer.jsp" />

</body>
</html>
