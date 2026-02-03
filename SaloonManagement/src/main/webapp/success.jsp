<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
String successMsg = (String) session.getAttribute("successMsg");
if (successMsg == null) return;

session.removeAttribute("successMsg");
%>

<style>
#successPopup {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
    min-width: 280px;
    padding: 14px 18px;
    background: linear-gradient(135deg, #38ef7d, #11998e);
    color: #fff;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    font-weight: 500;
    opacity: 0;
    transform: translateY(-10px);
    transition: opacity 0.5s ease, transform 0.5s ease;
}

#successPopup.show {
    opacity: 1;
    transform: translateY(0);
}
</style>

<div id="successPopup">
    ✅ <%= successMsg %>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {
    const popup = document.getElementById("successPopup");
    if (!popup) return;

    popup.classList.add("show");

    setTimeout(() => {
        popup.classList.remove("show");
        setTimeout(() => popup.remove(), 500);
    }, 3000);
});
</script>
