/* Profile Form Validation */

function validateProfileForm()
 {

    // Get form values
    let name = document.forms["profileForm"]["name"].value;
    let email = document.forms["profileForm"]["email"].value;
    let phone = document.forms["profileForm"]["phone"].value;

    // Name validation
    if (name === "") 
	{
        alert("Name cannot be empty");
        return false;
    }

    // Email validation
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") 
	{
        alert("Email cannot be empty");
        return false;
    }
    if (!emailPattern.test(email)) 
	{
        alert("Please enter a valid email address");
        return false;
    }

    // Phone validation
    if (phone === "") 
	{
        alert("Phone number cannot be empty");
        return false;
    }
    if (phone.length !== 10 || isNaN(phone)) 
	{
        alert("Phone number must be 10 digits");
        return false;
    }

    // If all validations pass
    return true;
}
