<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
            min-height: 100vh;
        }
        .booking-card {
            border-radius: 18px;
            overflow: hidden;
        }
        .booking-header {
            background: linear-gradient(135deg, #e83e8c, #ff6f91);
            color: white;
            padding: 20px;
            text-align: center;
        }
        .form-control, .form-select {
            border-radius: 10px;
        }
        .btn-confirm {
            background: linear-gradient(135deg, #28a745, #20c997);
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
        }
        .btn-confirm:hover {
            opacity: 0.9;
        }
        .salon-name {
            font-weight: 600;
            color: #e83e8c;
        }
    </style>
</head>

<body>

<div class="container d-flex align-items-center justify-content-center mt-5">
    <div class="card booking-card shadow col-md-6">

        <!-- Header -->
        <div class="booking-header">
            <h4><i class="fa-solid fa-calendar-check"></i> Book Appointment</h4>
            <p class="mb-0">Quick & Easy Booking</p>
        </div>

        <!-- Body -->
        <div class="card-body p-4">

            <!-- Selected Salon -->
            <p class="text-center mb-4">
                Salon:
                <span class="salon-name">
                    <%= request.getParameter("salon") %>
                </span>
            </p>

            <form action="BookAppointmentServlet" method="post">

                <!-- Hidden Salon -->
                <input type="hidden" name="salon"
                       value="<%= request.getParameter("salon") %>">

               

                <!-- Service -->
                <div class="mb-3">
                    <label class="form-label">
                        <i class="fa-solid fa-scissors"></i> Select Service
                    </label>
                    <select name="service" class="form-select" required>
                        <option value="">-- Choose Service --</option>
                        <option>Haircut</option>
                        <option>Facial</option>
                        <option>Hair Spa</option>
                        <option>Massage</option>
                        <option>Makeup</option>
                    </select>
                </div>

                <!-- Date -->
                <div class="mb-4">
                    <label class="form-label">
                        <i class="fa-solid fa-calendar-days"></i> Appointment Date
                    </label>
                    <input type="date" name="date"
                           class="form-control" required>
                </div>
                
                <!-- Time -->
                 <div class="mb-4">
                  <label class="form-label">
                  <i class="fa-solid fa-clock"></i> Appointment Time
                  </label>
                  <input type="time" name="time"   class="form-control" required>
</div>
                

                <!-- Button -->
                <button type="submit" class="btn btn-confirm w-100 text-white">
                    <i class="fa-solid fa-check"></i> Confirm Appointment
                </button>

            </form>
        </div>
    </div>
</div>

</body>
</html>
