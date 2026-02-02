<%@ page import="test.User" %>
<%
    User user = (User) request.getAttribute("user");
%>

<jsp:include page="header.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="profile.css">
<a href = "changePassword.jsp"></a>

<style>
.profile-container 
{
    max-width: 700px;
    margin: 40px auto;
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.profile-container h2 
{
    margin-bottom: 20px;
    color: #6a1b9a;
}

.profile-row 
{
    margin: 10px 0;
    font-size: 17px;
}

.profile-row span 
{
    font-weight: bold;
    width: 120px;
    display: inline-block;
}

.profile-actions 
{
    margin-top: 25px;
}

.profile-actions a 
{
    display: inline-block;
    margin-right: 10px;
    padding: 10px 18px;
    background: linear-gradient(135deg,#8e24aa,#c2185b);
    color: white;
    text-decoration: none;
    border-radius: 25px;
    font-weight: bold;
}
</style>

<div class="profile-container">

    <h2>My Profile</h2>

    <div class="profile-row">
        <span>Name:</span> <%= user.getName() %>
    </div>

    <div class="profile-row">
        <span>Email:</span> <%= user.getEmail() %>
    </div>

    <div class="profile-row">
        <span>Phone:</span> <%= user.getPhone() %>
    </div>

    <div class="profile-row">
        <span>Address:</span> <%= user.getAddress() %>
    </div>

    <div class="profile-actions">
        <a href="EditProfileServlet">Edit Profile</a>
        <a href="ChangePasswordServlet">Change Password</a>
        <a href="AppointmentHistoryServlet">Appointments</a>
    </div>

</div>
<%
    String success = request.getParameter("success");
    if ("updated".equals(success)) {
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Profile Updated!',
        text: 'Your profile has been updated successfully.',
        confirmButtonColor: '#7b1fa2',
        timer: 2500,
        showConfirmButton: true
    });
</script>
<%
    }
%>

<jsp:include page="footer.jsp" />
