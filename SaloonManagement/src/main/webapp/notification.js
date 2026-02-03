/* Notification Functions */

// Mark notification as read
function markAsRead(notificationId) 
{

    if (!confirm("Mark this notification as read?"))
    {
        return;
    }

    // Redirect to servlet
    window.location.href = "NotificationServlet?action=read&id=" + notificationId;
}

// Clear all notifications
function clearAllNotifications() 
{

    if (!confirm("Clear all notifications?"))
    {
        return;
    }

    window.location.href = "NotificationServlet?action=clear";
}
