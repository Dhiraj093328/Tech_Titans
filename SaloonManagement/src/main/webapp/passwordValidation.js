/* Change Password Validation*/

function validatePasswordForm() 
{

    let oldPassword = document.forms["passwordForm"]["oldPassword"].value;
    let newPassword = document.forms["passwordForm"]["newPassword"].value;
    let confirmPassword = document.forms["passwordForm"]["confirmPassword"].value;

    // Old password
    if (oldPassword === "") 
	{
        alert("Old password cannot be empty");
        return false;
    }

    // New password
    if (newPassword === "") 
	{
        alert("New password cannot be empty");
        return false;
    }

    if (newPassword.length < 6) 
	{
        alert("Password must be at least 6 characters long");
        return false;
    }

    // Confirm password
    if (confirmPassword === "") 
	{
        alert("Please confirm your password");
        return false;
    }

    if (newPassword !== confirmPassword) 
	{
        alert("New password and confirm password do not match");
        return false;
    }

    // If everything is valid
    return true;
}
