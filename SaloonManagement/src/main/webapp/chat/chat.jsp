<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
if(request.getAttribute("messages") == null){
    response.sendRedirect("ChatHistoryServlet?userId=" 
        + request.getParameter("userId")
        + "&therapistId=" + request.getParameter("therapistId")
        + "&role=" + request.getParameter("role"));
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Live Chat</title>

<style>
body{
    font-family: Arial;
    background:#f4f6f9;
}

#chatBox{
    width:400px;
    height:450px;
    border:1px solid #ccc;
    background:white;
    overflow-y:auto;
    padding:10px;
    margin-bottom:10px;
}

.me{
    background:#4CAF50;
    color:white;
    padding:6px 10px;
    margin:6px 0;
    border-radius:10px;
    width:fit-content;
    margin-left:auto;
}

.other{
    background:#e4e6eb;
    padding:6px 10px;
    margin:6px 0;
    border-radius:10px;
    width:fit-content;
}

#msg{
    width:300px;
    padding:8px;
}
button{
    padding:8px 15px;
}
</style>
</head>

<body>

<h2>Live Chat</h2>

<div id="chatBox">
<%
List<String[]> oldMsgs = (List<String[]>) request.getAttribute("messages");
String role = request.getParameter("role");

if(oldMsgs != null){
    for(String[] m : oldMsgs){
%>
    <div class="<%= m[0].equals(role) ? "me" : "other" %>">
        <%= m[2] %>
    </div>
<%
    }
}
%>

</div>

<input type="text" id="msg" placeholder="Type message">
<button id="sendBtn">Send</button>


<script>
document.addEventListener("DOMContentLoaded", () => {

const userId = "<%=request.getParameter("userId")%>";
const therapistId = "<%=request.getParameter("therapistId")%>";
const role = "<%=request.getParameter("role")%>";

const myId = (role === "user") ? userId : therapistId;

// same conversation id for both users
const conversationId = (userId < therapistId)
        ? userId + "_" + therapistId
        : therapistId + "_" + userId;

// websocket
const socket = new WebSocket(
"ws://localhost:8080/TestProject/chat/" +
conversationId + "/" + role + "/" + myId
);

const box = document.getElementById("chatBox");
const input = document.getElementById("msg");

socket.onopen = () => console.log("CONNECTED");

socket.onmessage = e => {

    const data = JSON.parse(e.data);

    const div = document.createElement("div");
    div.className = (data.sender === role) ? "me" : "other";
    div.textContent = data.message;

    box.appendChild(div);
    box.scrollTop = box.scrollHeight;
};

socket.onerror = () => console.log("Socket error");
socket.onclose = () => console.log("Disconnected");

// send button
document.getElementById("sendBtn").onclick = sendMessage;

// press enter to send
input.addEventListener("keypress", e=>{
    if(e.key === "Enter") sendMessage();
});

function sendMessage(){
    if(input.value.trim() === "" || socket.readyState !== 1) return;

    socket.send(input.value);
    input.value="";
}
});
</script>

</body>
</html>
