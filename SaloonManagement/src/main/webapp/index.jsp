<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Pimpri Chinchwad Salons | Book Appointment</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background: #f4f6f9; }
    .salon-card {
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.08);
      transition: transform 0.3s ease;
    }
    .salon-card:hover { transform: translateY(-6px); }
    .rating { color: #ffc107; font-size: 1.1rem; }
    .location { font-size: 0.9rem; color: #6c757d; }
    .btn-book {
      background-color: #e83e8c;
      border: none;
    }
    .btn-book:hover { background-color: #d63384; }
  </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark mb-4">
  <div class="container">
    <span class="navbar-brand">Salons in Pimpri Chinchwad</span>
  </div>
</nav>

<div class="container">
  <h3 class="text-center mb-4">Choose Your Salon</h3>

  <div class="row g-4">

    <!-- Salon Card 1 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 1">
        <div class="card-body">
          <h5 class="card-title">Lakmé Salon</h5>
          <p class="location"> Pimpri, Pune</p>
          <p class="rating">***** <span class="text-dark">4.8</span></p>
          <p class="card-text">Premium beauty & hair services by certified professionals.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Lakme Salon Pimpri">
            <button type="submit" class="btn btn-book text-white w-100 ">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>

    <!-- Salon Card 2 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 2">
        <div class="card-body">
          <h5 class="card-title">Jawed Habib Salon</h5>
          <p class="location">Chinchwad, Pune</p>
          <p class="rating">**** <span class="text-dark">4.5</span></p>
          <p class="card-text">Trendy haircuts & grooming with modern techniques.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Jawed Habib Chinchwad">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
            </form>
          
        </div>
      </div>
    </div>

    <!-- Salon Card 3 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 3">
        <div class="card-body">
          <h5 class="card-title">Naturals Salon</h5>
          <p class="location"> Akurdi, Pune</p>
          <p class="rating">***** <span class="text-dark">4.6</span></p>
          <p class="card-text">Affordable beauty & wellness services for everyone.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Naturals Salon Akurdi">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>
    
    <!-- Salon Card 4 -->
    <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 3">
        <div class="card-body">
          <h5 class="card-title">Lakme Salon For Him and Her</h5>
          <p class="location">📍 Morewadi, Pimpri-Chinchwade</p>
          <p class="rating">***** <span class="text-dark">4.9</span></p>
          <p class="card-text">Affordable beauty & wellness services for everyone.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Naturals Salon Akurdi">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>
    
     <!-- Salon Card 5 -->
     <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 3">
        <div class="card-body">
          <h5 class="card-title">CARE UNISEX SALON PIMPRI</h5>
          <p class="location">Pimpri, Pune</p>
          <p class="rating">***** <span class="text-dark">4.9</span></p>
          <p class="card-text">Affordable beauty & wellness services for everyone.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Naturals Salon Akurdi">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>
    
     <!-- Salon Card 6 -->
     <div class="col-md-4">
      <div class="card salon-card h-100">
        <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Salon 3">
        <div class="card-body">
          <h5 class="card-title">S7 Professional Ladies Beauty Salonr</h5>
          <p class="location">Pimpri Colony, Pune</p>
          <p class="rating">***** <span class="text-dark">4.9</span></p>
          <p class="card-text">Affordable beauty & wellness services for everyone.</p>
          <form action="bookAppointment.jsp" method="post">
            <input type="hidden" name="salon" value="Naturals Salon Akurdi">
            <button type="submit" class="btn btn-book text-white w-100">Book Appointment</button>
          </form>
        </div>
      </div>
    </div>

  </div>
</div>

<footer class="text-center mt-5 py-3 bg-light">
  <small>© 2026 Salon Management System | Pimpri Chinchwad</small>
</footer>

</body>
</html>
