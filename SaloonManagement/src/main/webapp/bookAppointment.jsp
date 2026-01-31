<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <title>Book Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<body>

<div class="container mt-5">
    <div class="card p-4 shadow col-md-6 mx-auto">

        <h4 class="text-center mb-3">Book Appointment</h4>

        <form action="BookAppointmentServlet" method="post">

            <!-- Salon name coming from card -->
            <input type="hidden" name="salon"
                   value="<%= request.getParameter("salon") %>">

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="customerName" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Service</label>
                <select name="service" class="form-control">
                    <option>Haircut</option>
                    <option>Facial</option>
                    <option>Massage</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Date</label>
                <input type="date" name="date" class="form-control" required>
            </div>

            <button class="btn btn-success w-100">
                Confirm Appointment
            </button>

        </form>

    </div>
</div>

</body>
</html>
</body>
</html>